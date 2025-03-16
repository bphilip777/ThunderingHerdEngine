const Vertex = @import("./Vertex3D.zig");

// should apply qoi to compress this data as well
// or use lz77 compression

pub const vertices = [_]Vertex{
    .{ .pos = .{ -0.5, -0.5, 0.0 }, .color = .{ 1.0, 0.0, 0.0 }, .tex_coord = .{ 0.0, 0.0 } },
    .{ .pos = .{ 0.5, -0.5, 0.0 }, .color = .{ 0.0, 1.0, 0.0 }, .tex_coord = .{ 1.0, 0.0 } },
    .{ .pos = .{ 0.5, 0.5, 0.0 }, .color = .{ 0.0, 0.0, 1.0 }, .tex_coord = .{ 1.0, 1.0 } },
    .{ .pos = .{ -0.5, 0.5, 0.0 }, .color = .{ 1.0, 1.0, 1.0 }, .tex_coord = .{ 0.0, 1.0 } },

    .{ .pos = .{ -0.5, -0.5, -0.5 }, .color = .{ 1.0, 0.0, 0.0 }, .tex_coord = .{ 0.0, 0.0 } },
    .{ .pos = .{ 0.5, -0.5, -0.5 }, .color = .{ 0.0, 1.0, 0.0 }, .tex_coord = .{ 1.0, 0.0 } },
    .{ .pos = .{ 0.5, 0.5, -0.5 }, .color = .{ 0.0, 0.0, 1.0 }, .tex_coord = .{ 1.0, 1.0 } },
    .{ .pos = .{ -0.5, 0.5, -0.5 }, .color = .{ 1.0, 1.0, 1.0 }, .tex_coord = .{ 0.0, 1.0 } },
};

pub const indices = [_]u16{ 0, 1, 2, 2, 3, 0, 4, 5, 6, 6, 7, 4 };
