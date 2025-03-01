const std = @import("std");
// const Engine = @import("engine.zig");
// const triangle_vertices = @import("models/triangle.zig").vertices;
// const windows = std.os.windows;
const UBO = @import("UniformBufferObject.zig");

pub const glm = @cImport({
    @cDefine("GLM_FORCE_RADIANS", "1");
    @cInclude("vulkan/Include/glm/glm.hpp");
    @cInclude("vulkan/Include/glm/gtc/matrix_transform.hpp");
});

pub fn main() !void {
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // const allo = gpa.allocator();
    // defer _ = gpa.deinit();
    //
    // var engine = try Engine.init(allo, "Mauhlt", 640, 480);
    // defer engine.deinit();
    //
    // try engine.mainLoop();

    const mat4 = glm.mat4(1.0);
    std.debug.print("Mat4: {any}\n", .{mat4});

    // var ubo: UBO = undefined;
    // ubo.model = glm.rota
}
