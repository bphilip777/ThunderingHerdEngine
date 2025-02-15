const std = @import("std");
const vk = @import("vulkan.zig");

pub fn main() !void {
    var lib = try std.DynLib.open("vulkan-1.lib");
    defer lib.close();

    const proc_addr = try lookup(&lib, "GetInstanceProcAddr");
    const instance = proc_addr();
}

fn getPFN(comptime name: []const u8) type {
    return @TypeOf(@field(vk, name));
}

fn lookup(lib: *std.DynLib, comptime name: []const u8) getPFN(name) {
    return @ptrCast(lib.open(name) catch unreachable);
}
