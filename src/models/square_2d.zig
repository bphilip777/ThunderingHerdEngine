const Vertex = @import("./Vertex2D.zig");

pub const vertices = [_]Vertex{
    .{ .pos = .{ -0.5, -0.5 }, .color = .{ 1.0, 0.0, 0.0 }, .tex_coord = .{ 1.0, 0.0 } },
    .{ .pos = .{ 0.5, -0.5 }, .color = .{ 0.0, 1.0, 0.0 }, .tex_coord = .{ 0.0, 0.0 } },
    .{ .pos = .{ 0.5, 0.5 }, .color = .{ 0.0, 0.0, 1.0 }, .tex_coord = .{ 0.0, 1.0 } },
    .{ .pos = .{ -0.5, 0.5 }, .color = .{ 1.0, 1.0, 1.0 }, .tex_coord = .{ 1.0, 1.0 } },
};

pub const indices = [_]u16{ 0, 1, 2, 2, 3, 0 };
