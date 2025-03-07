const std = @import("std");
const expectEqual = std.testing.expectEqual;
const expect = std.testing.expect;
// const math = std.math;
// in this file - i should expose necessary files

pub const Vector = @import("./vector.zig").Vector;
pub const V2 = @import("./vector.zig").V2;
pub const V3 = @import("./vector.zig").V3;
pub const V4 = @import("./vector.zig").V4;

pub const VX = @import("./vector.zig").VX;
pub const VY = @import("./vector.zig").VY;
pub const VZ = @import("./vector.zig").VZ;

pub const Matrix = @import("./matrix.zig").Matrix;
pub const M2 = @import("./matrix.zig").M2;
pub const M3 = @import("./matrix.zig").M3;
pub const M4 = @import(".//matrix.zig").M4;

pub fn translation(v: V3) M4 {
    return .{
        .values = [4][4]f32{
            .{ 1, 0, 0, 0 },
            .{ 0, 1, 0, 0 },
            .{ 0, 0, 1, 0 },
            .{ v.values[0], v.values[1], v.values[2], 1 },
        },
    };
}

// Optimize w/ Quaternions
pub fn rotation(theta: f32, axis: V3) M4 {
    // theta = radians
    // axis = axis of rotation

    const unit = axis.normalize();

    const x = unit.values[0];
    const y = unit.values[1];
    const z = unit.values[2];

    // const ca = math.cos(angle);
    // const sa = math.sin(angle);
    const ca = std.math.cos(theta);
    const sa = std.math.sin(theta);

    const a = ca + x * x * (1 - ca);
    const b = y * x * (1 - ca) + z * sa;
    const c = z * x * (1 - ca) - y * sa;

    const d = x * y * (1 - ca) - z * sa;
    const e = ca + y * y * (1 - ca);
    const f = z * y * (1 - ca) + x * sa;

    const g = x * z * (1 - ca) + y * sa;
    const h = y * z * (1 - ca) - x * sa;
    const i = ca + z * z * (1 - ca);

    return .{
        .values = [4][4]f32{
            .{ a, b, c, 0 },
            .{ d, e, f, 0 },
            .{ g, h, i, 0 },
            .{ 0, 0, 0, 1 },
        },
    };
}

pub fn rotateX(theta: f32) M4 {
    const ca = @cos(theta);
    const sa = @sin(theta);

    return .{
        .values = .{
            .{ 1, 0, 0, 0 },
            .{ 0, ca, sa, 0 },
            .{ 0, -sa, ca, 0 },
            .{ 0, 0, 0, 1 },
        },
    };
}

pub fn rotateY(theta: f32) M4 {
    const ca = @cos(theta);
    const sa = @sin(theta);

    return .{
        .values = .{
            .{ ca, 0, -sa, 0 },
            .{ 0, 1, 0, 0 },
            .{ sa, 0, ca, 0 },
            .{ 0, 0, 0, 1 },
        },
    };
}

pub fn rotateZ(theta: f32) M4 {
    const ca = @cos(theta);
    const sa = @sin(theta);

    return .{
        .values = .{
            .{ ca, sa, 0, 0 },
            .{ -sa, ca, 0, 0 },
            .{ 0, 0, 1, 0 },
            .{ 0, 0, 0, 1 },
        },
    };
}

pub fn scale(v: V3) M4 {
    return .{
        .values = [4][4]f32{
            .{ v.values[0], 0, 0, 0 },
            .{ 0, v.values[1], 0, 0 },
            .{ 0, 0, v.values[2], 0 },
            .{ 0, 0, 0, 1 },
        },
    };
}

pub fn lookAt(eye: V3, center: V3, up: V3) M4 {
    const f = center.sub(eye).normalize();
    const s = f.cross(up).normalize();
    const u = s.cross(f);

    return .{
        .values = [4][4]f32{
            .{ s.values[0], u.values[0], -f.values[0], 0 },
            .{ s.values[1], u.values[1], -f.values[1], 0 },
            .{ s.values[2], u.values[2], -f.values[2], 0 },
            .{ -s.dot(eye), -u.dot(eye), f.dot(eye), 1 },
        },
    };
}

// Projections
pub fn perspective(fovY: f32, aspect_ratio: f32, near: f32, far: f32) M4 {
    if (far < near) unreachable;
    if (aspect_ratio == 0) unreachable;

    const half_fovY = fovY / 2;
    const f = @sin(half_fovY) / @cos(half_fovY); // might want to change to std.math.tan

    const a = 1 / (aspect_ratio * f);
    const b = 1 / f;

    const depth = 1 / (far - near);
    const c = -(far + near) * depth;
    const d = -(2 * far * near) * depth;

    return .{
        .values = [4][4]f32{
            .{ a, 0, 0, 0 },
            .{ 0, b, 0, 0 },
            .{ 0, 0, c, -1 },
            .{ 0, 0, d, 0 },
        },
    };
}

pub fn orthogonal(left: f32, right: f32, bot: f32, top: f32, near: f32, far: f32) M4 {
    const rl_diff = 1 / (right - left);
    const tb_diff = 1 / (top - bot);
    const fn_diff = 1 / (far - near);

    const a = 2 * rl_diff;
    const b = 2 * tb_diff;
    const c = -2 * fn_diff;
    const d = -(right + left) * rl_diff;
    const e = -(top + bot) * tb_diff;
    const f = -(far + near) * fn_diff;

    return .{
        .values = [4][4]f32{
            .{ a, 0, 0, 0 },
            .{ 0, b, 0, 0 },
            .{ 0, 0, c, -1 },
            .{ d, e, f, 0 },
        },
    };
}

pub fn rotateFast(v: V3, a: V3, theta: f32) V3 {
    // Fast Quaternion Rotation
    const t = a.cross(v).mulScalar(2);
    return v.add(t.mulScalar(@cos(theta >> 2))).add(a.cross(t));
}

// Structure below into a struct w/ state:
// -current angle
// -jumping angle
// that way each calculation isn't a recompute but an addition instead
pub fn lerp(p1: V3, p2: V3, t: f32) V3 {
    // t is a value b/w 0 and 1
    return p1 + t * (p2 - p1);
}

pub fn slerp(v1: V3, v2: V3, t: f32) V3 {
    // spherical linear interpolation based on quaternions
    if (t <= 0 or t >= 1) unreachable;
    // assume w = 0
    // if dot producrts are less than 0 = long path, greater than 0 = short path
    const v1d = v1.dot(v1);
    const v2d = v2.dot(v2);
    const theta = v1.dot(v2) / (v1d * v2d);
    return v1.mulScalar(@sin((1 - t) * theta) / @sin(theta)).add(v2.mulScalar(@sin(t * theta) / @sin(theta)));
}

test "GLM" {
    _ = @import("./vector.zig");
    _ = @import("./matrix.zig");
    _ = @import("./quaternion.zig");
}

test "Translation" {
    const new_pos: V3 = V3.init(.{ 1, 2, 3 });
    const actual = translation(new_pos);
    const expected = [4][4]f32{
        .{ 1, 0, 0, 0 },
        .{ 0, 1, 0, 0 },
        .{ 0, 0, 1, 0 },
        .{ 1, 2, 3, 1 },
    };

    for (0..4) |i| {
        for (0..4) |j| {
            const exp = expected[i][j];
            const act = actual.values[i][j];
            try expectEqual(exp, act);
        }
    }
}

test "Rotation" {
    const rot = rotation(std.math.degreesToRadians(45), VZ);
    _ = rot;
}

test "Scale" {
    const actual = scale(.{ .actual = .{ 2, 2, 2 } }).mul();
    const expected = actual;
    for (actual.values, expected.values) |act, exp| {
        try expect(act, exp);
    }
}
