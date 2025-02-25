const std = @import("std");
const Engine = @import("engine.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allo = gpa.allocator();
    defer _ = gpa.deinit();

    var engine = try Engine.init(allo, "Mauhlt", 640, 480);
    defer engine.deinit();

    try engine.mainLoop();
}
