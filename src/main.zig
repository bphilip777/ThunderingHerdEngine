const std = @import("std");
const Engine = @import("engine.zig");
// const TextData = @import("./vulkan/TextData.zig").TextData;

const zstbi = @import("zstbi");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allo = gpa.allocator();
    defer _ = gpa.deinit();

    var engine = try Engine.init(allo, "Mauhlt", 1280, 960);
    defer engine.deinit();
    try engine.mainLoop(); // should this be main loop or just run

    // var text = try TextData.init(allo, "src/vulkan/vulkan.zig", "src/vulkan/vulkan2.zig");
    // defer text.deinit();
    // try text.parse();

}

// GLSL = column major order (in order by columns not rows)
// test "GLM" {
//     _ = @import("./math/math.zig");
// }
//

test "Loading image with zstbi" {
    const allo = std.testing.allocator;

    zstbi.init(allo);
    defer zstbi.deinit();

    // zstbi needs full file path which sucks
    const filepath = "C:\\Users\\bphil\\Code\\Zig\\GameEngine2\\Successes\\triangle.png";
    const info = zstbi.Image.info(filepath);
    std.debug.print("Info: {any}\n", .{info});

    const data = try zstbi.Image.loadFromFile(filepath, info.num_components);
    std.debug.print("Data: {any}\n", .{data});
}
