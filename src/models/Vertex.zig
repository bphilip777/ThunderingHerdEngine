const vk = @import("../vulkan/vulkan3.zig");

pos: [2]f32, // 4 bytes * 2 = 8
color: [3]f32, // 4 bytes * 3 = 12
// total = 16

const Vertex = @This();

pub const binding_description = [_]vk.VertexInputBindingDescription{
    .{
        .binding = 0,
        .stride = @sizeOf(Vertex),
        .input_rate = .vertex,
    },
};

pub const attribute_descriptions = [_]vk.VertexInputAttributeDescription{
    .{
        .location = 0,
        .binding = 0,
        .format = .r32g32_sfloat,
        .offset = @offsetOf(Vertex, "pos"),
    },
    .{
        .binding = 0,
        .location = 1,
        .format = .r32g32b32_sfloat,
        .offset = @offsetOf(Vertex, "color"),
    },
};
