const std = @import("std");
const expectEqual = std.testing.expectEqual;
const expectApproxEqRel = std.testing.expectApproxEqRel;
// const math = std.math;
pub const epsilon = 0.0001;

// Force type to be f16, f32, f64
pub fn Vector(comptime N: usize, comptime T: type) type {
    // if (@typeInfo(T)) {
    //     @"float" => {},
    //     else => @compileError("Invalid type."),
    // }

    if (N > 4 or N < 2) {
        @compileError("Invalid size.");
    }

    return struct {
        pub const Self = @This();

        values: [N]T,

        pub fn init(values: [N]T) Self {
            return .{ .values = values };
        }

        pub fn fill(n: T) Self {
            var values: [N]T = undefined;
            @memset(values[0..N], n);
            return .{ .values = values };
        }

        pub fn format(
            self: Self,
            writer: anytype,
        ) !void {
            try writer.print("V{}[{}", .{ N, self.values[0] });
            comptime var i = 1;
            inline while (i < N) : (i += 1) {
                try writer.print(", {}", .{self.values[i]});
            }
            try writer.writeAll("]");
        }

        pub fn zeros() Self {
            return comptime Self.fill(0);
        }

        pub fn ones() Self {
            return comptime Self.fill(1);
        }

        pub fn sum(self: Self) T {
            return @reduce(.Add, @as(@Vector(N, T), self.values));
        }

        pub fn add(self: Self, other: Self) Self {
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), other.values);
            return .{ .values = s + o };
        }

        pub fn addAssign(self: *Vector, other: Self) void {
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), other.values);
            self.values = s + o;
        }

        pub fn addScalar(self: Self, other: T) Self {
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), @splat(other));
            return .{ .values = s + o };
        }

        pub fn addScalarAssign(self: *Vector, other: T) void {
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), @splat(other));
            self.values = s + o;
        }

        pub fn sub(self: Self, other: Self) Self {
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), other.values);
            return .{ .values = s - o };
        }

        pub fn subAssign(self: *Vector, other: Self) void {
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), other.values);
            self.values = s - o;
        }

        pub fn subScalar(self: Self, other: T) Self {
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), @splat(other));
            return .{ .values = s - o };
        }

        pub fn subScalarAssign(self: *Vector, other: T) void {
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), @splat(other));
            self.values = s - o;
        }

        pub fn mul(self: Self, other: Self) Self {
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), other.values);
            return .{ .values = s * o };
        }

        pub fn mulAssign(self: *Vector, other: Self) void {
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), other.values);
            self.values = s * o;
        }

        pub fn mulScalar(self: Self, other: T) Self {
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), @splat(other));
            return .{ .values = s * o };
        }

        pub fn mulScalarAssign(self: *Vector, other: T) void {
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), @splat(other));
            self.values = s * o;
        }

        pub fn div(self: Self, other: Self) Self {
            if (@reduce(.And, @as(@Vector(N, T), other.values) == @as(@Vector(N, T), @splat(0)))) unreachable;
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), other.values);
            return .{ .values = s / o };
        }

        pub fn divAssign(self: *Vector, other: Self) void {
            if (@reduce(.And, @as(@Vector(N, T), other.values) == @as(@Vector(N, T), @splat(0)))) unreachable;
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), other.values);
            self.values = s / o;
        }

        pub fn divScalar(self: Self, other: T) Self {
            if (other == 0) unreachable;
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), @splat(other));
            return .{ .values = s / o };
        }

        pub fn divScalarAssign(self: *Vector, other: T) void {
            if (other == 0) unreachable;
            const s = @as(@Vector(N, T), self.values);
            const o = @as(@Vector(N, T), other.values);
            self.values = s / o;
        }

        pub fn abs(self: Self) Self {
            const vself = @as(@Vector(N, T), self.values);
            return .{ .values = @abs(vself) };
        }

        pub fn l1norm(self: Self) T {
            return self.abs().sum();
        }

        pub fn dot(self: Self, other: Self) T {
            return self.mul(other).sum();
        }

        pub fn l2normSqrd(self: Self) T {
            return self.dot(self);
        }

        pub fn l2norm(self: Self) T {
            // return std.math.sqrt(self.l2normSqrd());
            return @sqrt(self.l2normSqrd());
        }

        pub fn normalize(self: Self) Self {
            const num = @as(@Vector(N, T), self.values);
            var den = self.l2norm();
            if (den == 0) den = 0.0001;
            const vden = @as(@Vector(N, T), @splat(den));
            return .{ .values = num / vden };
        }

        pub fn normalizeAssign(self: *Self) void {
            const num = @as(@Vector(N, T), self.values);
            var den = self.l2norm();
            if (den < 0.0001) den = 0.0001; // prevent divide by 0
            const vden = @as(@Vector(N, T), @splat(den));
            self.values = @as([N]T, num / vden);
        }

        pub fn cross(self: Self, other: Self) Self {
            if (N != 3) @compileError("Cross product valid only for 3-length vectors.");

            const i = @as(@Vector(N, i32), .{ 1, 2, 0 });
            const j = @as(@Vector(N, i32), .{ 2, 0, 1 });

            const a = @as(@Vector(N, T), self.values);
            const b = @as(@Vector(N, T), other.values);

            const lp = @shuffle(T, a, undefined, i);
            const rp = @shuffle(T, b, undefined, j);

            const ln = @shuffle(T, a, undefined, j);
            const rn = @shuffle(T, b, undefined, i);

            return .{ .values = lp * rp - ln * rn };
        }

        pub fn shrink(self: Self, comptime L: usize) Vector(L, T) {
            if (L >= N) unreachable;
            var result: Vector(L, T) = undefined;
            @memcpy(result.values[0..L], self.values[0..L]);
            return result;
        }

        pub fn expand(self: Self, comptime L: usize) Vector(L, T) {
            if (L <= N) unreachable;
            var result: Vector(L, T) = undefined;
            @memcpy(result.values[0..N], self.values[0..N]);
            @memset(result.values[N..L], 0);
            return result;
        }
    };
}

fn expectVecEq(
    comptime N: usize,
    comptime T: type,
    expected: [N]T,
    actual: [N]T,
) !void {
    const eps_value = comptime std.math.floatEps(T);
    const sqrt_eps_value = comptime @sqrt(eps_value);
    for (expected, actual) |exp, act| {
        try expectApproxEqRel(exp, act, sqrt_eps_value);
    }
}

test "Init" {
    const actual = Vector(2, f32).init(.{ 1, 2 });
    try expectEqual(@as(f32, 1), actual.values[0]);
    try expectEqual(@as(f32, 2), actual.values[1]);
}

test "Scalar" {
    const actual = Vector(3, f32).fill(3);
    const expected = [3]f32{ 3, 3, 3 };
    try expectVecEq(3, f32, expected, actual.values);
}

test "Zero" {
    const actual = Vector(3, f32).zeros();
    const expected = [3]f32{ 0, 0, 0 };
    try expectVecEq(3, f32, expected, actual.values);
}

test "Sum" {
    const v1 = Vector(3, f32).ones();
    const v2 = Vector(3, f32).ones();
    const actual = v1.add(v2);
    const expected = [3]f32{ 2, 2, 2 };
    try expectVecEq(3, f32, expected, actual.values);
}

test "Sub" {
    const v1 = Vector(3, f32).init(.{ 3, 2, 1 });
    const v2 = Vector(3, f32).init(.{ 3, -1, 0 });
    const actual = v1.sub(v2);
    const expected = [3]f32{ 0, 3, 1 };
    try expectVecEq(3, f32, expected, actual.values);
}

test "Mul" {
    const v1 = Vector(3, f32).init(.{ 1, 2, 3 });
    const v2 = Vector(3, f32).init(.{ 3, 2, 1 });
    const actual = v1.mul(v2);
    const expected = [3]f32{ 3, 4, 3 };
    try expectVecEq(3, f32, expected, actual.values);
}

test "Div" {
    const v1 = Vector(3, f32).init(.{ 2, 0.5, 10 });
    const v2 = Vector(3, f32).init(.{ 2, 5, 2 });
    const actual = v1.div(v2);
    const expected = [3]f32{ 1, 0.1, 5 };
    try expectVecEq(3, f32, expected, actual.values);
}

test "Dot Product" {
    const v1 = Vector(3, f32).init(.{ 1, 2, 1 });
    const v2 = Vector(3, f32).init(.{ 1, 2, 1 });
    const actual = v1.dot(v2);
    const expected = @as(f32, 6);
    try expectEqual(expected, actual);
}

test "L2 Norm" {
    const A = Vector(3, f32).init(.{ 1, 2, 3 }); // sqrt( 1*1 + 2*2 + 3*3) = sqrt(1 + 4 + 9) = sqrt(14) =
    const expected = @as(f32, 3.7416573868);
    try expectEqual(expected, A.l2norm());
}

test "L1 Norm" {
    const v1 = Vector(3, f32).init(.{ -1, 0, 1 });
    try expectEqual(@as(f32, 2), v1.l1norm());
}

test "Normalization" {
    const actual = Vector(3, f32).init(.{ 30, 10, 20 }).normalize();
    const expected = [3]f32{
        0.80178372573729,
        0.26726124191243,
        0.53452248382486,
    };
    try expectVecEq(3, f32, expected, actual.values);

    var v2 = Vector(3, f32).init(.{ 60, 20, 40 });
    v2.normalizeAssign();
    const expected1 = [3]f32{
        0.80178372573729,
        0.26726124191243,
        0.53452248382486,
    };
    try expectVecEq(3, f32, expected1, v2.values);
}

test "Cross Product" {
    const v1 = Vector(3, f32).init(.{ 4, 5, 6 });
    const v2 = Vector(3, f32).init(.{ 7, 8, 9 });
    const actual = v1.cross(v2);
    const expected = [3]f32{ -3, 6, -3 };
    try expectVecEq(3, f32, expected, actual.values);
}

test "Shrink" {
    const v1 = Vector(4, f32).init(.{ 1, 2, 3, 0 });
    const actual = v1.shrink(3);
    const expected = [3]f32{ 1, 2, 3 };
    try expectVecEq(3, f32, expected, actual.values);
}

test "Expand" {
    const v1 = Vector(3, f32).init(.{ 1, 2, 3 });
    const v2 = v1.expand(4);
    const expected = [4]f32{ 1, 2, 3, 0 };
    try expectVecEq(4, f32, expected, v2.values);
}

// Types
pub const V2 = Vector(2, f32);
pub const V3 = Vector(3, f32);
pub const V4 = Vector(4, f32);

// Might want to store this inside math.zig instead
pub const VX = V3.init(.{ 1, 0, 0 });
pub const VY = V3.init(.{ 0, 1, 0 });
pub const VZ = V3.init(.{ 0, 0, 1 });
