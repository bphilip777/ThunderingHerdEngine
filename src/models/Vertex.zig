const vk = @import("../libs.zig").vk;

pos: [2]f32, // 4 bytes * 2 = 8
color: [3]f32, // 4 bytes * 3 = 12
// total = 16

const Vertex = @This();

pub const binding_description = [_]vk.VkVertexInputBindingDescription{
    .{
        .binding = 0,
        .stride = @sizeOf(Vertex),
        .inputRate = vk.VK_VERTEX_INPUT_RATE_VERTEX,
    },
};

pub const attribute_descriptions = [_]vk.VkVertexInputAttributeDescription{
    .{
        .location = 0,
        .binding = 0,
        .format = vk.VK_FORMAT_R32G32_SFLOAT,
        .offset = @offsetOf(Vertex, "pos"),
    },
    .{
        .binding = 0,
        .location = 1,
        .format = vk.VK_FORMAT_R32G32B32_SFLOAT,
        .offset = @offsetOf(Vertex, "color"),
    },
};
