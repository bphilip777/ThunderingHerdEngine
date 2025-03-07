const std = @import("std");
const math = std.math;
const expectEqual = std.testing.expectEqual;
const expectApproxEqAbs = std.testing.expectApproxEqAbs;
// const eps_value = comptime math.floatEps(T);
// const sqrt_eps_value = comptime @sqrt(eps_value);
// try expectApproxEqRel(pos_x, pos_y, sqrt_eps_value)
const Vector = @import("vector.zig").Vector;
// supports half, single, double: f16, f32, f64

pub fn Matrix(comptime N: usize, comptime T: type) type {
    return struct {
        pub const Self = @This();

        values: [N][N]T, // this should be changed to [N]Vector(N, T) instead

        pub fn init(values: [N][N]T) Self {
            return .{ .values = values };
        }

        pub fn initMat(values: [N]T) Self {
            return .{ .values = @as([N][N]T, @bitCast(values)) };
        }

        pub fn fill(n: T) Self {
            const result: Self = undefined;
            var new_values = @as([N * N]T, @bitCast(result.values));
            @memset(&new_values, n);
            return result;
        }

        pub fn fillAssign(self: *Self, n: T) void {
            var new_values = @as([N * N]T, @bitCast(self.values));
            @memset(&new_values, n);
        }

        pub fn zeros() Self {
            return comptime Self.fill(@as(T, 0));
        }

        pub fn ones() Self {
            return comptime Self.fill(@as(T, 1));
        }

        pub fn eye() Self {
            var result: Self = Self.zeros();
            inline for (0..N) |i| {
                result.values[i][i] = 1;
            }
            return result;
        }

        pub fn transpose(self: Self) Self {
            var result: Self = undefined;
            inline for (0..N) |i| {
                inline for (i..N) |j| {
                    result.values[j][i] = self.values[i][j];
                    result.values[i][j] = self.values[j][i];
                }
            }
            return result;
        }

        pub fn transposeAssign(self: *Self) void {
            inline for (0..N) |i| {
                inline for (i..N) |j| {
                    const tmp = self.values[i][j];
                    self.values[i][j] = self.values[j][i];
                    self.values[j][i] = tmp;
                }
            }
        }

        pub fn invert(self: Self) ?Self {
            if (N != 4) @compileError("Not implemented for matrices not of size 4.");
            // https://github.com/stackgl/gl-mat4/blob/master/invert.js
            const a = @as([16]f32, self.values);

            const a00 = a[0];
            const a01 = a[1];
            const a02 = a[2];
            const a03 = a[3];
            const a10 = a[4];
            const a11 = a[5];
            const a12 = a[6];
            const a13 = a[7];
            const a20 = a[8];
            const a21 = a[9];
            const a22 = a[10];
            const a23 = a[11];
            const a30 = a[12];
            const a31 = a[13];
            const a32 = a[14];
            const a33 = a[15];

            const b00 = a00 * a11 - a01 * a10;
            const b01 = a00 * a12 - a02 * a10;
            const b02 = a00 * a13 - a03 * a10;
            const b03 = a01 * a12 - a02 * a11;
            const b04 = a01 * a13 - a03 * a11;
            const b05 = a02 * a13 - a03 * a12;
            const b06 = a20 * a31 - a21 * a30;
            const b07 = a20 * a32 - a22 * a30;
            const b08 = a20 * a33 - a23 * a30;
            const b09 = a21 * a32 - a22 * a31;
            const b10 = a21 * a33 - a23 * a31;
            const b11 = a22 * a33 - a23 * a32;

            // Calculate the determinant
            var det = b00 * b11 - b01 * b10 + b02 * b09 + b03 * b08 - b04 * b07 + b05 * b06;

            if (std.math.approxEqAbs(f32, det, 0, 1e-8)) {
                return null;
            }
            det = 1.0 / det;

            const out = [16]f32{
                (a11 * b11 - a12 * b10 + a13 * b09) * det, // 0
                (a02 * b10 - a01 * b11 - a03 * b09) * det, // 1
                (a31 * b05 - a32 * b04 + a33 * b03) * det, // 2
                (a22 * b04 - a21 * b05 - a23 * b03) * det, // 3
                (a12 * b08 - a10 * b11 - a13 * b07) * det, // 4
                (a00 * b11 - a02 * b08 + a03 * b07) * det, // 5
                (a32 * b02 - a30 * b05 - a33 * b01) * det, // 6
                (a20 * b05 - a22 * b02 + a23 * b01) * det, // 7
                (a10 * b10 - a11 * b08 + a13 * b06) * det, // 8
                (a01 * b08 - a00 * b10 - a03 * b06) * det, // 9
                (a30 * b04 - a31 * b02 + a33 * b00) * det, // 10
                (a21 * b02 - a20 * b04 - a23 * b00) * det, // 11
                (a11 * b07 - a10 * b09 - a12 * b06) * det, // 12
                (a00 * b09 - a01 * b07 + a02 * b06) * det, // 13
                (a31 * b01 - a30 * b03 - a32 * b00) * det, // 14
                (a20 * b03 - a21 * b01 + a22 * b00) * det, // 15
            };

            return .{ .values = @as([N][N]T, @bitCast(out)) };
        }

        pub fn mul(self: Self, other: Self) Self {
            var result: Self = undefined;

            const a = self.transpose();
            const b = other;

            inline for (0..N) |i| {
                inline for (0..N) |j| {
                    const row = @as(@Vector(N, T), a.values[j]);
                    const col = @as(@Vector(N, T), b.values[i]);
                    const pro = row * col;

                    var sum: f32 = 0;
                    inline for (0..N) |k| {
                        sum += pro[k];
                    }

                    result.values[i][j] = sum;
                }
            }

            return result;
        }

        pub fn mulAssign(self: *Self, other: Self) void {
            const a = self.transpose();
            const b = other;
            inline for (0..N) |i| {
                const col = @as(@Vector(N, T), b.values[i]);
                inline for (0..N) |j| {
                    const row = @as(@Vector(N, T), a.values[j]);
                    self.values[i][j] = @reduce(.Add, row * col);
                }
            }
        }

        // Output = Vector
        pub fn mulVec(self: Self, other: Vector(N, T)) Vector(N, T) {
            var result: Vector(N, T) = undefined;
            inline for (0..N) |i| {
                const row = @as(@Vector(N, T), self.values[i]);
                const val = @as(@Vector(N, T), @splat(other[i]));
                result.values[i] = @reduce(.Add, row * val);
            }
            return result;
        }

        // Output = Vector
        pub fn mulVecAssign(self: *Self, other: Vector(N, T)) void {
            inline for (0..N) |i| {
                const row = @as(@Vector(N, T), self.values[i]);
                const val = @as(@Vector(N, T), @splat(other[i]));
                self.values[i] = @reduce(.Add, row * val);
            }
        }

        pub fn mulScalar(self: Self, other: T) Self {
            const left = @as(@Vector(N * N, T), @bitCast(self.values));
            const right = @as(@Vector(N * N, T), @splat(other));
            return .{ .values = @as([N][N]T, @bitCast(left * right)) };
        }

        pub fn mulScalarAssign(self: *Self, other: T) void {
            const left = @as(@Vector(N * N, T), @bitCast(self.values));
            const right = @as(@Vector(N * N, T), @splat(other));
            self.values = left * right;
        }
    };
}

fn expectMatEq(comptime N: usize, comptime T: type, expected: [N][N]T, actual: [N][N]T) !void {
    const eps_value = comptime std.math.floatEps(T);
    const sqrt_eps_value = comptime @sqrt(eps_value);
    for (0..N) |i| {
        for (0..N) |j| {
            const exp = expected[i][j];
            const act = actual[i][j];
            try expectApproxEqAbs(exp, act, sqrt_eps_value);
        }
    }
}

test "Init" {
    const A = Matrix(2, f32).init(.{
        .{ 1, 2 },
        .{ 3, 4 },
    });
    const B = [2][2]f32{
        .{ 1, 2 },
        .{ 3, 4 },
    };
    try expectMatEq(2, f32, B, A.values);
}

test "Zero" {
    const A = Matrix(3, f32).zeros();
    const expected = [3][3]f32{
        .{ 0, 0, 0 },
        .{ 0, 0, 0 },
        .{ 0, 0, 0 },
    };
    try expectMatEq(3, f32, expected, A.values);
}

test "Eye" {
    const expected = [4][4]f32{
        .{ 1, 0, 0, 0 },
        .{ 0, 1, 0, 0 },
        .{ 0, 0, 1, 0 },
        .{ 0, 0, 0, 1 },
    };
    const actual = Matrix(4, f32).eye();
    try expectMatEq(4, f32, expected, actual.values);
}

test "Transpose" {
    const actual = Matrix(3, f32).init(.{
        .{ 1, 2, 3 },
        .{ 4, 5, 6 },
        .{ 7, 8, 9 },
    }).transpose();
    const expected = [3][3]f32{
        .{ 1, 4, 7 },
        .{ 2, 5, 8 },
        .{ 3, 6, 9 },
    };
    try expectMatEq(3, f32, expected, actual.values);
}

test "Transpose Assign" {
    var actual = Matrix(3, f32).init(.{
        .{ 1, 2, 3 },
        .{ 4, 5, 6 },
        .{ 7, 8, 9 },
    });
    actual.transposeAssign();
    const expected = [3][3]f32{
        .{ 1, 4, 7 },
        .{ 2, 5, 8 },
        .{ 3, 6, 9 },
    };
    try expectMatEq(3, f32, expected, actual.values);
}

test "Mult" {
    const A = Matrix(2, f32).init(.{
        .{ 1, 2 },
        .{ 3, 4 },
    });
    const B = Matrix(2, f32).init(.{
        .{ 6, 7 },
        .{ 8, 9 },
    });
    // Rule: 1st Mat: down a col, 2nd Mat: over a row for col major order (default)
    // Rule: 1st Mat: over a row, 2nd Mat: down a col for row major order
    // 1*6 + 3*7 = 6 + 21 = 27
    // 1*7 + 3*9 = 8 + 27 = 34
    // 2*6 + 4*7 = 12 + 28 = 40
    // 2*8 + 4*9 = 16 + 36 = 52
    const expected = [2][2]f32{
        .{ 27, 40 },
        .{ 35, 52 },
    };
    try expectMatEq(2, f32, expected, A.mul(B).values);

    const C = Matrix(4, f32).init(.{
        .{ 1, 0, 0, 0 },
        .{ 0, 1, 0, 0 },
        .{ 0, 0, 1, 0 },
        .{ 0, 0, 0, 1 },
    });
    const D = Matrix(4, f32).init(.{
        .{ 1, 0, 0, 0 },
        .{ 0, 1, 0, 0 },
        .{ 0, 0, 1, 0 },
        .{ 0, 0, 0, 1 },
    });
    // 1*1 + 0*0 + 0*0 + 0*0 = 1
    const expected2 = [4][4]f32{
        .{ 1, 0, 0, 0 },
        .{ 0, 1, 0, 0 },
        .{ 0, 0, 1, 0 },
        .{ 0, 0, 0, 1 },
    };
    try expectMatEq(4, f32, expected2, C.mul(D).values);
}

// test "Mul Vec" {
// }

// Types
pub const M2 = Matrix(2, f32);
pub const M3 = Matrix(3, f32);
pub const M4 = Matrix(4, f32);
