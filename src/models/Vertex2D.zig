const vk = @import("vulkan/vulkan3.zig");

pos: [2]f32,
color: [3]f32,
tex_coord: [2]f32,

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
        .binding = 0,
        .location = 0,
        .format = .r32g32_sfloat,
        .offset = @offsetOf(Vertex, "pos"),
    },
    .{
        .binding = 0,
        .location = 1,
        .format = .r32g32b32_sfloat,
        .offset = @offsetOf(Vertex, "color"),
    },
    .{
        .binding = 0,
        .location = 2,
        .format = .r32g32_sfloat,
        .offset = @offsetOf(Vertex, "tex_coord"),
    },
};
