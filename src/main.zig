const std = @import("std");
const Engine = @import("engine.zig");
// const math = @import("./math/math.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allo = gpa.allocator();
    defer _ = gpa.deinit();

    var engine = try Engine.init(allo, "Mauhlt", 1280, 960);
    defer engine.deinit();
    try engine.mainLoop();
}

// GLSL = column major order (in order by columns not rows)
// test "GLM" {
//     _ = @import("./math/math.zig");
// }
