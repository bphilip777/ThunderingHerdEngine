const std = @import("std");

fn Matrix(
    comptime T: type,
    comptime width: comptime_int,
    comptime height: comptime_int,
) type {
    return [height][width]T;
}

pub const Mat4 = Matrix(f32, 4, 4);

fn Vector(
    comptime T: type,
    comptime len: comptime_int,
) type {
    return [len]T;
}

pub const Vec2 = Vector(f32, 2);
pub const Vec3 = Vector(f32, 3);
pub const Vec4 = Vector(f32, 4);
