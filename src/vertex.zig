const vk = @import("vk.zig").vk;

const Vertex = struct {
    const binding_description = vk.VkVertexInputBindingDescription{
        .binding = 0,
        .stride = @sizeOf(Vertex),
        .inputRate = vk.VK_VERTEX_INPUT_RATE_VERTEX,
    };
    const attribute_description = [_]vk.VkVertexInputAttributeDescription{
        .{
            .location = 0,
            .binding = 0,
            .format = vk.VK_FORMAT_R32G32_SFLOAT,
            .offset = @offsetOf(Vertex, "pos"),
        },
        .{
            .location = 0,
            .binding = 1,
            .format = vk.VK_FORMAT_R32G32B32_SFLOAT,
            .offset = @offsetOf(Vertex, "color"),
        },
    };

    pos: [2]f32,
    color: [3]f32,
};

pub const vertices = [_]Vertex{
    .{
        .pos = .{ 0, -0.5 },
        .color = .{ 1, 0, 0 },
    },
    .{
        .pos = .{ 0.5, 0.5 },
        .color = .{ 0, 1, 0 },
    },
    .{
        .pos = .{ -0.5, 0.5 },
        .color = .{ 0, 0, 1 },
    },
};
