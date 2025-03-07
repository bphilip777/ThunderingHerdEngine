const std = @import("std");
const cc = @import("..\\helpers\\codingCase.zig");

const ExtensionName = struct {
    name: []const u8,
    value: []const u8,
};

pub const TextData = struct {
    pub const Self = @This();

    allo: std.mem.Allocator,
    text: std.ArrayList([]const u8),

    write_filename: []const u8,
    write_file: ?std.fs.File = null,

    extension_names: std.ArrayList(ExtensionName),
    unique_titles: [26]std.StringHashMap(void), // hashmap for each letter

    pub fn init(
        allo: std.mem.Allocator,
        read_filename: []const u8,
        write_filename: []const u8,
    ) !Self {
        var file = try std.fs.cwd().openFile(read_filename, .{});
        defer file.close();

        var buffer: [1024]u8 = undefined;
        var reader = std.io.bufferedReader(file.reader());
        var in_stream = reader.reader();

        var text = try std.ArrayList([]const u8).initCapacity(allo, 1024);
        while (try in_stream.readUntilDelimiterOrEof(&buffer, '\n')) |item| {
            const line = if (@import("builtin").os.tag == .windows) std.mem.trimRight(u8, item, "\r") else item;
            const new_line = try allo.dupe(u8, line);
            try text.append(new_line);
        }

        const extension_names = try std.ArrayList(ExtensionName).initCapacity(allo, 128);

        var unique_titles: [26]std.StringHashMap(void) = undefined;
        for (0..26) |i| {
            unique_titles[i] = std.StringHashMap(void).init(allo);
        }

        return Self{
            .allo = allo,
            .text = text,
            .write_filename = write_filename,
            .extension_names = extension_names,
            .unique_titles = unique_titles,
        };
    }

    pub fn deinit(self: *Self) void {
        for (self.text.items) |text| self.allo.free(text);
        self.text.deinit();
        for (self.extension_names.items) |item| {
            self.allo.free(item.name);
            self.allo.free(item.value);
        }
        self.extension_names.deinit();
        for (0..self.unique_titles.len) |i| {
            var ut = self.unique_titles[i];
            var kit = ut.keyIterator();
            while (kit.next()) |key| {
                self.allo.free(key.*);
            }
            self.unique_titles[i].deinit();
        }

        // var kit = self.unique_titles.keyIterator();
        // while (kit.next()) |key| self.allo.free(key.*);
        // self.unique_titles.deinit();
    }

    pub fn parse(self: *Self) !void {
        self.write_file = try std.fs.cwd().createFile(self.write_filename, .{});
        defer self.write_file.?.close();

        const skip_strs = [_][]const u8{ "pub ", "const " };
        const limit: usize = self.text.items.len;
        var i: u16 = 0;
        while (i < limit) : (i += 1) {
            const txt = self.text.items[i];
            if (!std.mem.startsWith(u8, txt, skip_strs[0])) continue;
            var text: []const u8 = txt[skip_strs[0].len..txt.len];

            // if (skip(text, &.{"extern fn vkCreateMicromapEXT"})) continue;

            if (isInlineFn(text)) {
                i = try self.processInlineFn(@truncate(i));
            }

            if (isExternFn(text)) {
                try self.processExternFn(@truncate(i));
                continue;
            }

            if (!std.mem.startsWith(u8, text, skip_strs[1])) continue;
            text = text[skip_strs[1].len..text.len];

            // if (skip(text, &.{ "VkSemaphoreImportFlagsKHR", "VkSemaphoreImportFlagBitsKHR" })) continue;

            if (isPFN(text)) {
                try self.processPFN(@truncate(i));
                continue;
            }

            if (isExtensionName(text)) {
                try self.appendExtensionName(@truncate(i));
                continue;
            }

            if (isOpaque(text)) {
                try self.processOpaque(@truncate(i));
                continue;
            }

            if (isExternStruct(text)) {
                i = try self.processExternStruct(@truncate(i));
                continue;
            }

            if (isExternUnion(text)) {
                i = try self.processExternUnion(@truncate(i));
                continue;
            }

            if (isEnum(text)) {
                // std.debug.print("Enum: {s}\n", .{text});
                try self.processEnum(@truncate(i));
                continue;
            }

            if (isFlagBits2(text)) {
                i = try self.processFlagBits2(@truncate(i));
                continue;
            }

            if (isAnyopaque(text)) {
                // std.debug.print("Anyopaque: {s}\n", .{text});
                try self.processAnyopaque(@truncate(i));
                continue;
            }

            if (isVersion(text)) {
                // std.debug.print("Version: {s}\n", .{text});
                try self.processVersion(@truncate(i));
                continue;
            }

            // std.debug.print("Is Type? {s}: {}\n", .{ getName(text, &.{""}, &.{"Vk"}, &.{" "}), try self.isType(@truncate(i)) });
            if (try self.isType(@truncate(i))) {
                try self.processType(@truncate(i));
                continue;
            }
        }

        try self.processExtensionNames();
    }

    fn isInlineFn(text: []const u8) bool {
        const prefix = "inline fn ";
        return std.mem.startsWith(u8, text, prefix);
    }

    fn isExternFn(text: []const u8) bool {
        const prefix = "extern fn vk";
        return std.mem.startsWith(u8, text, prefix);
    }

    fn isPFN(text: []const u8) bool {
        return std.mem.startsWith(u8, text, "PFN_vk");
    }

    fn isExtensionName(text: []const u8) bool {
        const var_name = text[0..std.mem.indexOfScalar(u8, text, ' ').?];
        return std.mem.endsWith(u8, var_name, "EXTENSION_NAME") and text[text.len - 2] == '"';
    }

    fn isOpaque(text: []const u8) bool {
        return std.mem.endsWith(u8, text, "= opaque {};");
    }

    fn isExternStruct(text: []const u8) bool {
        return std.mem.endsWith(u8, text, "extern struct {");
    }

    fn isExternUnion(text: []const u8) bool {
        return std.mem.endsWith(u8, text, "extern union {");
    }

    fn isEnum(text: []const u8) bool {
        return std.mem.startsWith(u8, text, "enum_");
    }

    fn isFlagBits2(text: []const u8) bool {
        const name = text[0..std.mem.indexOfScalar(u8, text, ' ').?];
        // std.debug.print("Name: {s}\n", .{name});
        const is_flagbits2 = std.mem.indexOf(u8, name, "FlagBits2") != null;
        const is_vkflags64 = std.mem.endsWith(u8, text, "VkFlags64;");
        // std.debug.print("Bool: {} {}\n", .{ is_flagbits2, is_vkflags64 });
        return (is_flagbits2 and is_vkflags64);
    }

    fn isAnyopaque(text: []const u8) bool {
        return std.mem.endsWith(u8, text, "= ?*anyopaque;") or std.mem.endsWith(u8, text, "= anyopaque;");
    }

    fn isVersion(text: []const u8) bool {
        const name = text[0..std.mem.indexOfScalar(u8, text, ' ').?];
        const value = text[std.mem.lastIndexOfScalar(u8, text, '=').? + 2 .. text.len - 1];

        const is_name_version = std.mem.indexOf(u8, name, "API_VERSION") != null;
        const is_value_version = std.mem.indexOf(u8, value, "_VERSION(") != null;

        return is_name_version and is_value_version;
    }

    fn isType(self: *Self, i: u16) !bool {
        const text = self.text.items[i];
        if (std.mem.indexOf(u8, text, "fn") != null) return false;

        const name = getName(text, &.{"pub const "}, &.{ "Vk", "Std" }, &.{" "});

        if (std.mem.startsWith(u8, name, "enum_Vk")) return false;
        if (std.mem.startsWith(u8, name, "struct_Vk")) return false;

        // check for unique titles = guaranteed to be upper case
        if (std.ascii.isLower(name[0])) return false;
        if (self.unique_titles[name[0] - 'A'].get(name) != null) return false;

        // Convert FlagBit to Flag
        const name1 = try std.mem.replaceOwned(u8, self.allo, name, "FlagBit", "Flag");
        defer self.allo.free(name1);

        // check if version 2 flagbits
        if (std.mem.indexOfScalar(u8, name1, '2') != null) {
            const name2 = getName(self.text.items[i + 1], &.{"pub const "}, &.{ "Vk", "Std" }, &.{" "});
            if (std.mem.indexOf(u8, name2, "FlagBits2") != null) return false;
        }

        // check if previous line contains flags/flagbits and current line contains flags or flagbits
        if (std.mem.indexOf(u8, name, "Flag") != null) {
            const prev_name = getName(self.text.items[i - 1], &.{"pub const "}, &.{ "Vk", "Std" }, &.{" "});
            if (std.mem.indexOf(u8, prev_name, "Flag") != null) {
                const new_prev_name = try std.mem.replaceOwned(u8, self.allo, prev_name, "FlagBit", "Flag");
                defer self.allo.free(new_prev_name);

                if (std.mem.eql(u8, new_prev_name, name1)) return false;
            }
        }

        const value = getValue(text);

        // check for standard values
        for (&[_][]const u8{
            "VkFlags", "VkFlags64", "u32", "u64", "i32", "i64",
        }) |valid_value| {
            if (!std.mem.eql(u8, valid_value, value)) continue;

            try self.unique_titles[name1[0] - 'A'].put(try self.allo.dupe(u8, name1), {});
            return true;
        }

        // check for non-standard values
        if (std.mem.startsWith(u8, value, "Vk")) {
            try self.unique_titles[name1[0] - 'A'].put(try self.allo.dupe(u8, name1), {});
            return true;
        }

        return false;
    }

    fn processInlineFn(self: *Self, i: u16) !u16 {
        const text = self.text.items[i];

        const name = getName(text, &.{"pub inline fn "}, &.{ "VK_", "STD_" }, &.{"("});
        var mem = [_]u8{0} ** 2048;
        const new_name = try cc.convert(@ptrCast(&mem), name, .camel, .screaming_snake);

        const value = text[std.mem.indexOfScalar(u8, text, '(').?..text.len];

        var line: []u8 = undefined;
        line = try std.fmt.allocPrint(
            self.allo,
            "pub inline fn {s} {s}\n",
            .{ new_name, value },
        );
        _ = try self.write_file.?.write(line);
        self.allo.free(line);

        var j: u16 = i + 1;
        while (true) : (j += 1) {
            const text1 = self.text.items[j];

            // append newline
            line = try std.fmt.allocPrint(self.allo, "{s}\n", .{text1});
            defer self.allo.free(line);
            _ = try self.write_file.?.write(line);

            if (std.mem.eql(u8, text1, "}")) break;
        }

        return j;
    }

    fn processExternFn(self: *Self, i: u16) !void {
        const text = self.text.items[i];
        // std.debug.print("Text: {s}\n", .{text});

        var line: []u8 = undefined;
        var tmp: []u8 = undefined;

        // get rid of Vk and vk
        line = try self.allo.dupe(u8, text);
        for ([_][]const u8{ "Vk", "vk" }) |match| {
            if (std.mem.indexOf(u8, line, match) != null) {
                tmp = try std.mem.replaceOwned(u8, self.allo, line, match, "");
                self.allo.free(line);
                line = tmp;
            }
        }
        defer self.allo.free(line);

        // convert fn title from pascal case to camel case
        var end = std.mem.indexOfScalar(u8, line, '(').?;
        var start = (std.mem.lastIndexOfScalar(u8, line[0..end], ' ').?) + 1;
        line[start] = std.ascii.toLower(line[start]);

        // convert argument names from camel case to snake case
        const open_paren = std.mem.indexOfScalar(u8, line, '(').?;
        // start = ( or ,
        start = open_paren + 1;
        while (true) {
            // end = : or )
            end = std.mem.indexOfScalar(u8, line[start..line.len], ':') orelse std.mem.indexOfScalar(u8, line[start..line.len], ')').?;
            end += start;

            const arg_name = line[start..end];

            if (!std.mem.startsWith(u8, arg_name, "@")) {
                var mem = [_]u8{0} ** 256;
                const snake_name = try cc.convert(&mem, arg_name, .snake, .camel);
                // std.debug.print("Snake Name: {s}\n", .{snake_name});

                tmp = try self.allo.alloc(u8, line.len - arg_name.len + snake_name.len);
                @memcpy(tmp[0..start], line[0..start]);
                @memcpy(tmp[start .. start + snake_name.len], snake_name);
                @memcpy(tmp[start + snake_name.len .. snake_name.len + line.len - arg_name.len], line[start + arg_name.len .. line.len]);
                self.allo.free(line);
                line = tmp;
            }

            const new_start = std.mem.indexOfScalar(u8, line[start..line.len], ',') orelse break;
            start += new_start + 2;
        }

        // convert flagbits to flag
        if (std.mem.indexOf(u8, line, "FlagBits") != null) {
            tmp = try std.mem.replaceOwned(u8, self.allo, line, "FlagBits", "Flags");
            self.allo.free(line);
            line = tmp;
        }

        // convert PFN fns from pascal to camel case
        start = 0;
        const pfn_str = "PFN_";
        while (std.mem.indexOf(u8, line[start..line.len], pfn_str)) |ind| {
            line[start + ind + pfn_str.len] = std.ascii.toLower(line[start + ind + pfn_str.len]);
            start += ind + 1;
        }

        // add newline
        tmp = try std.fmt.allocPrint(self.allo, "{s}\n", .{line});
        self.allo.free(line);
        line = tmp;

        // write
        _ = try self.write_file.?.write(line);
    }

    fn processPFN(self: *Self, i: u16) !void {
        const text = self.text.items[i];

        // remove prefixes
        var line = try removeKnownPrefixesAllo(self.allo, text);
        defer self.allo.free(line);

        // convert fn title from pascal case to camel case
        var start: usize = 0;
        const pfn_str = "PFN_";
        while (std.mem.indexOf(u8, line[start..line.len], pfn_str)) |ind| {
            line[start + ind + pfn_str.len] = std.ascii.toLower(line[start + ind + pfn_str.len]);
            start += ind + 1;
        }

        // convert flagbits to flag
        var tmp: []u8 = undefined;
        if (std.mem.indexOf(u8, line, "FlagBit") != null) {
            tmp = try std.mem.replaceOwned(u8, self.allo, line, "FlagBit", "Flag");
            self.allo.free(line);
            line = tmp;
        }

        // append newline
        tmp = try std.fmt.allocPrint(self.allo, "{s}\n", .{line});
        self.allo.free(line);
        line = tmp;

        // write
        _ = try self.write_file.?.write(line);
    }

    fn appendExtensionName(self: *Self, i: u16) !void {
        const text = self.text.items[i];

        // get name, get rid of VK_ prefix, get rid of _EXTENSION_NAME suffix
        const name = getName(text, &.{"pub const "}, &.{"VK_"}, &.{"_EXTENSION_NAME"});

        const value = getValue(text);

        const extension_name = ExtensionName{
            .name = try self.allo.dupe(u8, name),
            .value = try self.allo.dupe(u8, value),
        };

        try self.extension_names.append(extension_name);
    }

    fn processExtensionNames(self: *Self) !void {
        const line = try std.fmt.allocPrint(self.allo, "pub const ExtensionNames = struct {s}\n", .{"{"});
        defer self.allo.free(line);
        _ = try self.write_file.?.write(line);

        for (self.extension_names.items) |extension_name| {
            // convert name from screaming snake to snake
            const mem = try self.allo.dupe(u8, extension_name.name);
            defer self.allo.free(mem);

            const new_name = try cc.convert(mem, extension_name.name, .snake, .screaming_snake);

            // get rid of khr prefix for khr extensions only = most commonly used extensions
            var new_name1: []u8 = undefined;
            for ([_][]const u8{"khr_"}) |prefix| {
                if (std.mem.startsWith(u8, new_name, prefix)) {
                    if (isKeyword(new_name[prefix.len..new_name.len]) or std.ascii.isDigit(new_name[prefix.len])) {
                        new_name1 = try self.allo.alloc(u8, new_name.len - prefix.len + 1);
                        @memcpy(new_name1[1..new_name1.len], new_name[prefix.len..new_name.len]);
                        new_name1[0] = '_';
                    } else {
                        new_name1 = try self.allo.alloc(u8, new_name.len - prefix.len);
                        @memcpy(new_name1, new_name[prefix.len..new_name.len]);
                    }

                    break;
                }
            } else {
                new_name1 = try self.allo.dupe(u8, new_name);
            }
            defer self.allo.free(new_name1);

            const line1 = try std.fmt.allocPrint(self.allo, "pub const {s} = {s};\n", .{ new_name1, extension_name.value });
            defer self.allo.free(line1);
            _ = try self.write_file.?.write(line1);
        }

        _ = try self.write_file.?.write("};\n");
    }

    fn processOpaque(self: *Self, i: u16) !void {
        const text = self.text.items[i];
        const name = getName(text, &.{"pub const "}, &.{ "struct_Vk", "struct_Std" }, &.{ "_T", " " });
        // std.debug.print("Name: {s}\n", .{name});

        const line = try std.fmt.allocPrint(
            self.allo,
            "pub const {s} = enum(u64) {s} null = 0, _ {s};\n",
            .{ name, "{", "}" },
        );
        defer self.allo.free(line);
        _ = try self.write_file.?.write(line);
    }

    fn processExternStruct(self: *Self, i: u16) !u16 {
        const text = self.text.items[i];
        const title = getName(text, &.{"pub const "}, &.{ "struct_Vk", "struct_Std" }, &.{" "});

        const line = try std.fmt.allocPrint(self.allo, "pub const {s} = extern struct {s}\n", .{ title, "{" });
        defer self.allo.free(line);
        _ = try self.write_file.?.write(line);

        // convert pascal to snake case
        var mem = [_]u8{0} ** 256;
        const snake_title = try cc.convert(&mem, title, .snake, .pascal);

        var j: u16 = i + 1;
        while (true) {
            const text2 = self.text.items[j];
            if (std.mem.eql(u8, text2, "};")) break;

            // convert field name from camel case to snake case
            const end = std.mem.indexOfScalar(u8, text2, ':').?;
            const old_field_name = std.mem.trimLeft(u8, text2[0..end], " ");

            var mem1 = [_]u8{0} ** 256;
            const new_field_name = cc.convert(&mem1, old_field_name, .snake, .camel) catch |err| {
                std.debug.print("Old Field Name: {s}\n", .{old_field_name});
                return err;
            };

            var line1 = try self.allo.alloc(u8, text2.len - end + new_field_name.len);
            defer self.allo.free(line1);

            @memcpy(line1[0..new_field_name.len], new_field_name);
            @memcpy(line1[new_field_name.len..line1.len], text2[end..text2.len]);

            // if field name == s_type:, convert end to StructureType.lowercase_title;
            var tmp: []u8 = undefined;
            if (std.mem.eql(u8, new_field_name, "s_type")) {
                tmp = try std.fmt.allocPrint(self.allo, "s_type: StructureType = StructureType.{s},\n", .{snake_title});
                self.allo.free(line1);
                line1 = tmp;

                _ = try self.write_file.?.write(line1);

                j += 1;
                continue;
            }

            // remove prefixes
            tmp = try removeKnownPrefixesAllo(self.allo, line1);
            self.allo.free(line1);
            line1 = tmp;

            // convert flagbits to flag
            if (std.mem.indexOf(u8, line1, "FlagBits") != null) {
                tmp = try std.mem.replaceOwned(u8, self.allo, line1, "FlagBits", "Flags");
                self.allo.free(line1);
                line1 = tmp;
            }

            // loop through and convert PFN_ from pascal case to camel case
            var start: usize = 0;
            const pfn_str = "PFN_";
            while (std.mem.indexOf(u8, line1[start..line1.len], "PFN_")) |ind| {
                line1[start + ind + pfn_str.len] = std.ascii.toLower(line1[start + ind + pfn_str.len]);
                start += ind + 1;
            }

            // add newline
            tmp = try std.fmt.allocPrint(self.allo, "{s}\n", .{line1});
            self.allo.free(line1);
            line1 = tmp;

            _ = try self.write_file.?.write(line1);

            j += 1;
        }

        _ = try self.write_file.?.write("};\n");

        return j;
    }

    fn processExternUnion(self: *Self, i: u16) !u16 {
        var text = self.text.items[i];
        const name = getName(text, &.{"pub const "}, &.{ "union_Vk", "union_Std" }, &.{" "});

        // vars
        var line: []u8 = undefined;
        var tmp: []u8 = undefined;

        // write title
        line = try std.fmt.allocPrint(self.allo, "pub const {s} = extern union {s}\n", .{ name, "{" });
        _ = try self.write_file.?.write(line);
        self.allo.free(line);

        var j: u16 = i + 1;
        while (true) : (j += 1) {
            text = self.text.items[j];
            if (std.mem.eql(u8, text, "};")) break;

            // convert field name from  camel case to snake case
            const start = std.mem.indexOfScalar(u8, text, ' ') orelse 0;
            const end = std.mem.indexOfScalar(u8, text, ':').?;
            const field_name = text[start..end];

            var mem = [_]u8{0} ** 256;
            const new_field_name = try cc.convert(&mem, field_name, .snake, .camel);

            line = try self.allo.alloc(u8, text.len + new_field_name.len - field_name.len);
            defer self.allo.free(line);

            var s: usize = 0;
            var e: usize = start;
            @memcpy(line[s..e], text[0..start]);
            s = e;
            e += new_field_name.len;
            @memcpy(line[s..e], new_field_name);
            s = e;
            e += text.len - end;
            @memcpy(line[s..e], text[end..text.len]);

            // remove prefixes
            tmp = try removeKnownPrefixesAllo(self.allo, line);
            self.allo.free(line);
            line = tmp;

            // append newline
            tmp = try std.fmt.allocPrint(self.allo, "{s}\n", .{line});
            self.allo.free(line);
            line = tmp;

            _ = try self.write_file.?.write(line);
        }

        _ = try self.write_file.?.write("};\n");

        return j;
    }

    pub fn processEnum(self: *Self, i: u16) !void {
        const text = self.text.items[i];

        const name = getName(text, &.{"pub const "}, &.{ "enum_Vk", "enum_Std" }, &.{" "});

        // Convert flagbits to flags
        var line: []u8 = undefined;
        var tmp: []u8 = undefined;
        if (std.mem.indexOf(u8, name, "FlagBits") != null) {
            line = try std.mem.replaceOwned(u8, self.allo, name, "FlagBit", "Flag");
        } else {
            line = try self.allo.dupe(u8, name);
        }
        defer self.allo.free(line);

        // append as unique title
        // std.debug.print("Title: {s}, First Char:{c}\n", .{ line, line[0] });
        try self.unique_titles[line[0] - 'A'].put(try self.allo.dupe(u8, line), {});

        // get value
        const value = if (std.mem.eql(u8, getValue(text), "c_uint")) "u32" else "i32";

        // create header
        tmp = try std.fmt.allocPrint(self.allo, "pub const {s} = enum({s}) {s}\n", .{ line, value, "{" });
        self.allo.free(line);
        line = tmp;

        // std.debug.print("Header: {s}\n", .{line});
        _ = try self.write_file.?.write(line);

        // convert from pascal to snake case
        var mem1 = [_]u8{0} ** 256;
        const low_name = try cc.convert(@ptrCast(&mem1), name, .snake, .pascal);

        // memory
        var fields = try std.ArrayList(EnumField).initCapacity(self.allo, 128);
        defer fields.deinit();
        defer for (fields.items) |*field| field.deinit(self.allo);

        // unique names
        var unique_names = std.StringHashMap(void).init(self.allo);
        defer unique_names.deinit();

        var n_items: usize = 0;

        // looping backward
        var j = i - 1;
        while (true) : (j -= 1) {
            const text1 = self.text.items[j];

            const name1 = getName(text1, &.{"pub const "}, &.{ "VK_", "STD_" }, &.{":"});

            if (!cc.isCase(name1, .screaming_snake)) break;

            // convert case
            var mem2 = [_]u8{0} ** 1024;
            _ = try cc.convert(&mem2, name1, .snake, .screaming_snake);
            const name2 = try removeOverlaps2(self.allo, @ptrCast(&mem2), low_name);

            // if no overlap = stop, edge case = result
            const len = name1.len;
            const len2 = name2.len;
            if (!std.mem.eql(u8, low_name, "result") and len == len2) break;

            // Name Edge Cases:
            var name3: []u8 = undefined;
            if (name2.len == 0) {
                name3 = try self.allo.dupe(u8, "base");
            } else if (isKeyword(name2) or !std.ascii.isAlphabetic(name2[0])) {
                name3 = try self.allo.alloc(u8, name2.len + 3); //@""
                @memcpy(name3[2 .. name3.len - 1], name2);
                name3[0] = '@';
                name3[1] = '"';
                name3[name3.len - 1] = '"';
            } else {
                name3 = try self.allo.dupe(u8, name2);
            }
            defer self.allo.free(name3);

            // ensure unique names
            if (unique_names.get(name3) != null) continue;

            // value
            const value1 = getValue(text1);

            const field = try EnumField.init(self.allo, name3, value1);
            try fields.append(field);

            // update # of items
            n_items += 1;
        }

        // sort
        std.sort.pdq(EnumField, fields.items, {}, lessThanEnumField);

        // write values differently if not unique
        var unique_values = std.StringHashMap([]const u8).init(self.allo);
        defer unique_values.deinit();

        // write lines
        // write unique values first, then non-uniques as declarations
        var no_zero: bool = true;
        for (fields.items) |field| {
            // check value is unique
            if (unique_values.get(field.value) == null) {
                // check if value is gt or eql to 0
                if (no_zero) {
                    const field_value = try std.fmt.parseInt(i32, field.value, 10);
                    if (field_value > 0) {
                        const line2 = try std.fmt.allocPrint(self.allo, "null = 0,\n", .{});
                        defer self.allo.free(line2);
                        _ = try self.write_file.?.write(line2);
                    }
                    no_zero = false;
                }

                const line2 = try std.fmt.allocPrint(self.allo, "{s} = {s},\n", .{ field.name, field.value });
                defer self.allo.free(line2);
                _ = try self.write_file.?.write(line2);

                try unique_values.put(field.value, field.name);
            }
        }

        if (no_zero) {
            const line2 = try std.fmt.allocPrint(self.allo, "null = 0,\n", .{});
            defer self.allo.free(line2);
            _ = try self.write_file.?.write(line2);
        }

        var first: bool = true;
        for (fields.items) |field| {
            if (unique_values.get(field.value)) |old_name| {
                if (!std.mem.eql(u8, old_name, field.name)) {
                    if (first) {
                        const line2 = try std.fmt.allocPrint(self.allo, "pub const Self = @This();\n", .{});
                        defer self.allo.free(line2);
                        _ = try self.write_file.?.write(line2);

                        first = false;
                    }
                    const line2 = try std.fmt.allocPrint(self.allo, "pub const {s} = Self.{s};\n", .{ field.name, old_name });
                    defer self.allo.free(line2);
                    _ = try self.write_file.?.write(line2);
                }
            }
        }

        _ = try self.write_file.?.write("};\n");
    }

    fn processFlagBits2(self: *Self, i: u16) !u16 {
        const text = self.text.items[i];

        const title = getName(text, &.{"pub const "}, &.{ "Vk", "Std" }, &.{" "});

        const title1 = try std.mem.replaceOwned(u8, self.allo, title, "FlagBits", "Flags");
        defer self.allo.free(title1);

        const line = try std.fmt.allocPrint(self.allo, "pub const {s} = enum(u64) {s}\n", .{ title1, "{" });
        defer self.allo.free(line);
        _ = try self.write_file.?.write(line);

        // convert to lower case
        var mem1 = [_]u8{0} ** 256;
        const low_name: []const u8 = try cc.convert(@ptrCast(&mem1), title1, .snake, .pascal);
        const len = low_name.len;

        var low_name1: []u8 = undefined;
        if (std.mem.lastIndexOfScalar(u8, &mem1, '2')) |ind| {
            if (ind == len) {
                low_name1 = try std.mem.replaceOwned(u8, self.allo, low_name, "2", "_2");
            } else {
                low_name1 = try std.mem.replaceOwned(u8, self.allo, low_name, "2", "_2_");
            }
        } else {
            low_name1 = try self.allo.dupe(u8, low_name);
        }
        defer self.allo.free(low_name1);

        // words
        const words = try cc.splitCase2Words(self.allo, low_name1, .snake);
        defer words.deinit();

        // check for duplicate names/values
        // can't be written in-between values, only at start or end
        // key = value, value = name
        var dups = std.StringHashMap([]const u8).init(self.allo);
        defer {
            var kit = dups.keyIterator();
            while (kit.next()) |key| self.allo.free(key.*);
            var vit = dups.valueIterator();
            while (vit.next()) |value| self.allo.free(value.*);
            dups.deinit();
        }

        // store dup fields to be written later
        var dup_fields = try std.ArrayList(EnumField).initCapacity(self.allo, 64);
        defer dup_fields.deinit();
        defer for (dup_fields.items) |*field| field.deinit(self.allo);

        // goes down
        var j = i + 1;
        while (true) : (j += 1) {
            const text1 = self.text.items[j];
            // std.debug.print("Text 1: {s}\n", .{text1});

            // get name + ensure screaming snake
            const name1 = getName(text1, &.{"pub const "}, &.{ "VK_", "STD_" }, &.{ ":", " " });
            // std.debug.print("Name 1: {s}\n", .{name1});
            if (!cc.isCase(name1, .screaming_snake)) break;

            // get value
            const value1 = getValue(text1);

            // convert name to snake
            var mem3 = [_]u8{0} ** 128;
            const name2 = try cc.convert(@ptrCast(&mem3), name1, .snake, .screaming_snake);
            const len2 = name2.len;

            // remove overlap, if no overlap then on non-field line so break
            const name3 = try removeOverlaps2(self.allo, @ptrCast(&mem3), low_name1);
            const len3 = name3.len;
            if (len2 == len3) break;

            // check if its a duplicate
            const is_dup = dups.get(value1) == null;
            if (is_dup) {
                // add value to list
                const value2 = try self.allo.dupe(u8, value1);
                const name4 = try self.allo.dupe(u8, name3);
                try dups.put(value2, name4);

                // write enum field
                const line1 = try std.fmt.allocPrint(self.allo, "{s} = {s},\n", .{ name3, value1 });
                defer self.allo.free(line1);
                _ = try self.write_file.?.write(line1);
            } else {
                // append duplicate to list to be written later as a declaration
                const new_value: []const u8 = dups.get(value1).?;
                const field = try EnumField.init(self.allo, name3, new_value);
                try dup_fields.append(field);
            }
        }

        // write duplicate fields as declarations equal to not value but name of previous type
        if (dup_fields.items.len > 0) {
            const line1 = try std.fmt.allocPrint(self.allo, "pub const Self = @This();\n", .{});
            defer self.allo.free(line1);
            _ = try self.write_file.?.write(line1);

            for (dup_fields.items) |field| {
                const line2 = try std.fmt.allocPrint(self.allo, "pub const {s} = Self.{s};\n", .{ field.name, field.value });
                defer self.allo.free(line2);
                _ = try self.write_file.?.write(line2);
            }
        }

        // write closing tag
        _ = try self.write_file.?.write("};\n");

        return j - 1; // no ending tag - need to not skip next line
    }

    fn processAnyopaque(self: *Self, i: u16) !void {
        const text = self.text.items[i];
        const name = getName(text, &.{"pub const "}, &.{ "Vk", "Std" }, &.{" "});
        const value = getValue(text);

        const line = try std.fmt.allocPrint(self.allo, "pub const {s} = {s};\n", .{ name, value });
        defer self.allo.free(line);
        _ = try self.write_file.?.write(line);
    }

    fn processVersion(self: *Self, i: u16) !void {
        const text = self.text.items[i];

        const name = getName(text, &.{"pub const "}, &.{ "VK_", "STD_" }, &.{" "});

        const eql_pos = std.mem.indexOfScalar(u8, text, '=').?;
        const start = if (std.mem.startsWith(u8, text[eql_pos + 2 .. text.len], "VK_")) eql_pos + 2 + 3 else eql_pos + 2;
        const end = text.len;
        const value = text[start..end];

        // change the fn title to camelCase
        const open_paren_pos = std.mem.indexOfScalar(u8, value, '(').?;
        const fn_name = value[0..open_paren_pos];

        const output = try self.allo.alloc(u8, fn_name.len);
        defer self.allo.free(output);
        const fn_name_1 = try cc.convert(output, fn_name, .camel, .screaming_snake);

        const value1 = try std.mem.replaceOwned(u8, self.allo, value, fn_name, fn_name_1);
        defer self.allo.free(value1);

        const line2 = try std.fmt.allocPrint(self.allo, "pub const {s} = {s}\n", .{ name, value1 });
        defer self.allo.free(line2);
        _ = try self.write_file.?.write(line2);
    }

    fn processType(self: *Self, i: u16) !void {
        const text = self.text.items[i];

        const name = getName(text, &.{"pub const "}, &.{"Vk"}, &.{" "});

        // remove flagbits
        var name1: []u8 = undefined;
        if (std.mem.indexOf(u8, name, "FlagBit") != null) {
            name1 = try std.mem.replaceOwned(u8, self.allo, name, "FlagBit", "Flag");
        } else {
            name1 = try self.allo.dupe(u8, name);
        }
        defer self.allo.free(name1);

        const value = std.mem.trimLeft(u8, getValue(text), "Vk");

        // remove flagbits
        var value1: []u8 = undefined;
        if (std.mem.indexOf(u8, value, "FlagBit") != null) {
            value1 = try std.mem.replaceOwned(u8, self.allo, value, "FlagBit", "Flag");
        } else {
            value1 = try self.allo.dupe(u8, value);
        }
        defer self.allo.free(value1);

        // special cases
        if (std.mem.eql(u8, name, "Bool32")) {
            const line = try std.fmt.allocPrint(self.allo, "pub const Bool32 = enum(u32) {s}\ntrue=1,\nfalse=0,\n{s};\n", .{ "{", "}" });
            defer self.allo.free(line);
            _ = try self.write_file.?.write(line);
            return;
        }

        // normal case
        const line = try std.fmt.allocPrint(self.allo, "pub const {s} = {s};\n", .{ name1, value1 });
        defer self.allo.free(line);
        _ = try self.write_file.?.write(line);
    }
};

const EnumField = struct {
    name: []const u8,
    value: []const u8,

    pub fn init(allo: std.mem.Allocator, name: []const u8, value: []const u8) !@This() {
        return EnumField{
            .name = try allo.dupe(u8, name),
            .value = try allo.dupe(u8, value),
        };
    }

    pub fn deinit(self: *@This(), allo: std.mem.Allocator) void {
        allo.free(self.name);
        allo.free(self.value);
    }
};

fn skip(text: []const u8, matches: []const []const u8) bool {
    for (matches) |match| {
        if (std.mem.startsWith(u8, text, match)) return false;
    } else return true;
}

fn hasPrefix(text: []const u8, prefixes: []const []const u8) ?usize {
    for (prefixes) |prefix| {
        if (std.mem.startsWith(u8, text, prefix)) return prefix.len;
    } else return null;
}

fn hasSuffix(text: []const u8, suffixes: []const []const u8) ?usize {
    for (suffixes) |suffix| {
        if (suffix.len == 1) {
            if (std.mem.indexOfScalar(u8, text, suffix[0])) |ind| return ind;
        } else {
            if (std.mem.indexOf(u8, text, suffix)) |ind| return ind;
        }
    } else return null;
}

fn lastIndexOfNonWhitespace(input: []const u8) ?usize {
    var i: usize = input.len - 1;
    while (i > 0) : (i -= 1) {
        if (std.ascii.isWhitespace(input[i])) continue;
        return i;
    } else return null;
}

fn removeKnownPrefixesAllo(
    allo: std.mem.Allocator,
    text: []const u8,
) std.mem.Allocator.Error![]u8 {
    var text2 = try allo.dupe(u8, text);
    for (
        &[_][]const u8{ " Vk", "(Vk", "struct_Vk", " Std", "(Std", "struct_Std", "PFN_vk", "PFN_std", "]Vk", "]Std" },
        &[_][]const u8{ " ", "(", "", " ", "(", "", "PFN_", "PFN_", "]", "]" },
    ) |prev_prefix, curr_prefix| {
        if (std.mem.indexOf(u8, text2, prev_prefix) == null) continue;

        const tmp = try std.mem.replaceOwned(u8, allo, text2, prev_prefix, curr_prefix);
        allo.free(text2);
        text2 = tmp;
    }
    return text2;
}

fn removeKnownPrefixesBuf(
    input: []const u8,
    output: []u8,
) ![]const u8 {
    // asserts
    if (input.len == 0 or output.len == 0) unreachable;
    if (output.len < input.len) unreachable;
    // copy data
    @memcpy(output[0..input.len], input);
    // loop through prefixes
    var end: usize = input.len;
    for (
        &[_][]const u8{ " Vk", "(Vk", "struct_Vk", " Std", "(Std", "struct_Std", "PFN_vk", "PFN_std", "]Vk", "]Std" },
        &[_][]const u8{ " ", "(", "", " ", "(", "", "PFN_", "PFN_", "]", "]" },
    ) |prev_prefix, curr_prefix| {
        var start: usize = 0;
        while (std.mem.indexOf(u8, output[start..output.len], prev_prefix)) |ind| {
            // copy the new prefix in-place
            @memcpy(output[ind .. ind + curr_prefix.len], curr_prefix);
            for (
                ind + curr_prefix.len..end - curr_prefix.len,
                ind + prev_prefix.len..end,
            ) |i, j| {
                output[i] = output[j];
            }
            // shift start/end
            start = ind + curr_prefix.len;
            end -= (curr_prefix.len - prev_prefix.len);
        }
    }
}

fn getName(
    text: []const u8,
    prewords: []const []const u8,
    prefixes: []const []const u8,
    suffixes: []const []const u8,
) []const u8 {
    // skips prewords, removes prefixes, removes suffixes
    // will take up to first non-alphanumeric character
    if (text.len == 0 or prewords.len == 0 or prefixes.len == 0 or suffixes.len == 0) unreachable;

    var start: usize = hasPrefix(text, prewords) orelse 0;
    start += hasPrefix(text[start..text.len], prefixes) orelse 0;

    // check for suffix or space
    var end = hasSuffix(text[start..text.len], suffixes) orelse text.len - start;
    end += start;
    if (end < start) unreachable;

    return text[start..end];
}

fn getValue(text: []const u8) []const u8 {
    if (text.len == 0) unreachable;

    const start = (std.mem.lastIndexOfScalar(u8, text, ' ').?) + 1;

    const end = text.len - @as(usize, @intFromBool(!std.ascii.isAlphanumeric(text[text.len - 1])));
    if (end < start) unreachable;

    return text[start..end];
}

fn removeOverlaps2(
    allo: std.mem.Allocator,
    text: []u8,
    overlap: []const u8,
) ![]const u8 {
    // assertions
    if (text.len == 0 or overlap.len == 0) unreachable;
    if (!cc.isCase(overlap, .snake)) return error.IncorrectCase;
    // create words
    var words = try cc.splitCase2Words(allo, overlap, .snake);
    defer words.deinit();
    // match words at start of text
    var start: usize = 0;
    for (words.items) |word| {
        start += @intFromBool(text[start] == '_');
        if (std.mem.startsWith(u8, text[start..text.len], word)) start += word.len;
    }
    start += @intFromBool(text[start] == '_');
    const end = std.mem.indexOfScalar(u8, text, 0) orelse text.len;
    // move data over
    for (0..end - start) |i| text[i] = text[i + start];
    // reset old data
    @memset(text[end - start .. text.len], 0);
    // return non-overlapping word
    return text[0 .. end - start];
}

fn removeOverlaps(text: []u8, overlap: []const u8) []u8 {
    // assumes both text and overlap have snake or scremaing snake case
    if (text.len == 0 or overlap.len == 0) unreachable;

    var prev: usize = 0;
    var curr: usize = 0;
    while (true) {
        curr = std.mem.indexOfScalar(u8, overlap[prev..overlap.len], '_') orelse break;
        if (curr <= prev) break;

        if (std.mem.indexOf(u8, text, overlap[prev..curr])) |match| {
            for (match..text.len - overlap.len, match + overlap.len..text.len) |i, j| text[i] = text[j];
        }

        prev = curr + 1;
        if (prev == overlap.len) break;
    }

    if (curr != overlap.len and curr > prev) {
        if (std.mem.indexOf(u8, text, overlap[prev..overlap.len])) |match| {
            for (match..text.len - overlap.len - 1, match + overlap.len + 1..text.len) |i, j| text[i] = text[j];
        }
    }

    if (text.len < 2) unreachable;

    const next_under = std.mem.indexOfScalar(u8, text[1..text.len], '_') orelse text.len;
    const start: usize = if (text[0] == '_' and std.ascii.isAlphabetic(text[1]) and !isKeyword(text[1..next_under])) 1 else 0;
    const end = std.mem.indexOfScalar(u8, text, 0) orelse text.len;

    // copy data to start
    for (0..end - start) |i| {
        text[i] = text[i + start];
    }
    // reset old data
    @memset(text[end - start .. text.len], 0);
    // return text
    return text[0 .. end - start];
}

fn isKeyword(text: []const u8) bool {
    const map = std.StaticStringMap(void).initComptime(&.{
        &.{"inline"},
        &.{"for"},
        &.{"or"},
        &.{"and"},
    });
    return map.has(text);
}

fn replaceSubstringsAllo(
    allo: std.mem.Allocator,
    text: []const u8,
    substrings: []const []const u8,
    newstrings: []const []const u8,
) ![]const u8 {
    if (newstrings.len != substrings.len) unreachable;

    var new_text = try allo.dupe(u8, text);
    for (newstrings, substrings) |newstring, substring| {
        const tmp = try std.mem.replaceOwned(u8, allo, new_text, substring, newstring);
        allo.free(new_text);
        new_text = tmp;
    }
    return new_text;
}

fn replaceSubstringsBuf(
    text: []u8,
    substrings: []const []const u8,
    newstrings: []const []const u8,
) []const u8 {
    // assertions
    if (newstrings.len != substrings.len) unreachable;
    // get end of string
    for (newstrings, substrings) |newstring, substring| {
        _ = std.mem.replace(u8, text, substring, newstring, text);
    }
    const end = std.mem.indexOfScalar(u8, text, 0) orelse text.len;
    return text[0..end];
}

// sorting fn for processEnums
fn lessThanEnumField(context: void, lhs: EnumField, rhs: EnumField) bool {
    _ = context;
    const left = std.fmt.parseInt(i64, lhs.value, 10) catch unreachable;
    const right = std.fmt.parseInt(i64, rhs.value, 10) catch unreachable;
    return left < right;
}
