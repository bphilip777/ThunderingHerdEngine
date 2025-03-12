const std = @import("std");

pub fn EnumPackedStruct(Enum: type) type {
    switch (@typeInfo(Enum)) {
        .@"enum" => {},
        else => @compileError("Fn only works for enums."),
    }

    const T = @typeInfo(Enum).@"enum".tag_type;

    return packed struct(T) {
        mask: T = 0,

        pub const Self = @This();

        pub fn initEmpty() Self {
            return .{ .mask = 0 };
        }

        pub fn initFull() Self {
            return .{ .mask = std.math.maxInt(T) };
        }

        pub fn initEnum(e: Enum) Self {
            return .{ .mask = @intFromEnum(e) };
        }

        pub fn initEnums(e: []const Enum) Self {
            var mask: T = 0;
            for (e) |value| {
                mask |= @intFromEnum(value);
            }
            return .{ .mask = mask };
        }

        pub fn resetEmpty(self: *Self) void {
            self.mask = 0;
        }

        pub fn resetFull(self: *Self) void {
            self.mask = std.math.maxInt(T);
        }

        pub fn resetEnum(self: *Self, e: Enum) void {
            self.mask = @intFromEnum(e);
        }

        pub fn toggle(self: *Self, E: []const Enum) void {
            for (E) |e_value| {
                self.mask ^= @intFromEnum(e_value);
            }
        }

        pub fn toggleAll(self: *Self) void {
            self.mask = ~self.mask;
        }

        // might be a performance hit, as a packed struct is just a u32 w/ instructions
        pub fn eql(self: Self, other: Self) bool {
            return self.mask == other.mask;
        }

        pub fn has(self: Self, other: Self) bool {
            return self.mask & other.mask == other.mask;
        }

        pub fn isSet(self: Self, e: Enum) bool {
            return (self.mask & @intFromEnum(e)) != 0;
        }

        pub fn hasAll(self: Self, e: []const Enum) bool {
            for (e) |value| {
                if (!self.isSet(value)) return false;
            } else return true;
        }

        pub fn hasNone(self: Self, e: []const Enum) bool {
            for (e) |value| {
                if (self.isSet(value)) return false;
            } else return true;
        }

        pub fn set(self: *Self, e: []const Enum) void {
            for (e) |value| {
                self.mask |= @intFromEnum(value);
            }
        }

        pub fn unset(self: *Self, e: []const Enum) void {
            for (e) |value| {
                self.mask &= ~@intFromEnum(value);
            }
        }
    };
}
