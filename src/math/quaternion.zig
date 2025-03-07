const std = @import("std");

// Types
const V3 = @import("vector.zig").V3;
const V4 = @import("vector.zig").V4;

const M3 = @import("matrix.zig").M3;
const M4 = @import("matrix.zig").M4;

// Main Struct
pub fn Quaternion(comptime T: type) type {
    return packed struct {
        pub const Self = @This();

        w: T,
        x: T,
        y: T,
        z: T,

        pub fn newX() Self {
            return .{ .w = 0, .x = 1, .y = 0, .z = 0 };
        }

        pub fn newY() Self {
            return .{ .w = 0, .x = 0, .y = 1, .z = 0 };
        }

        pub fn newZ() Self {
            return .{ .w = 0, .x = 0, .y = 0, .z = 1 };
        }

        pub fn new(v: V3) Self {
            return .{ .w = 0, .x = v.values[0], .y = v.values[1], .z = v.values[2] };
        }

        pub fn v4FromQuat(self: Self) V4 {
            return .{ .values = .{ self.w, self.x, self.y, self.z } };
        }

        pub fn quatFromV4(self: V4) Self {
            return .{ .w = self.values[0], .x = self.values[1], .y = self.values[2], .z = self.values[3] };
        }

        pub fn quatFromV3(self: V3) Self {
            return .{ .w = 0, .x = self.values[0], .y = self.values[1], .z = self.values[2] };
        }

        pub fn v3FromQuat(self: Self) V3 {
            return .{ .values = .{ self.x, self.y, self.z } };
        }

        pub fn quatFromV3AndAngle(self: V3, theta: T) Self {
            return .{ .w = @cos(theta / 2), .x = self.values[0], .y = self.values[1], .z = self.values[2] };
        }

        pub fn add(self: Self, other: Self) Self {
            const s: V4 = v4FromQuat(self);
            const o: V4 = v4FromQuat(other);
            return quatFromV4(s.add(o));
        }

        pub fn addAssign(self: *Self, other: Self) void {
            var s: V4 = v4FromQuat(self);
            const o: V4 = v4FromQuat(other);
            self = quatFromV4(s.addAssign(o));
        }

        pub fn sub(self: Self, other: Self) Self {
            const s: V4 = v4FromQuat(self);
            const o: V4 = v4FromQuat(other);
            return quatFromV4(s.sub(o));
        }

        pub fn subAssign(self: *Self, other: Self) void {
            const s: V4 = v4FromQuat(self);
            const o: V4 = v4FromQuat(other);
            self = quatFromV4(s.sub(o));
        }

        pub fn conjugate(self: Self) Self {
            return .{ .w = self.w, .x = -self.x, .y = -self.y, .z = -self.z };
        }

        pub fn conjugateAssign(self: *Self) void {
            self.x *= -1;
            self.y *= -1;
            self.z *= -1;
        }

        pub fn dot(self: Self, other: Self) T {
            return @reduce(.Add, v4FromQuat(conjugate(self)) * v4FromQuat(other));
        }

        pub fn cross(self: Self, other: Self) Self {
            // assumes w is 0
            const x = (self.y * other.z) - (other.y * self.z);
            const y = (self.z * other.x) - (self.x * other.z);
            const z = (self.x * other.y) - (self.y * other.x);
            return .{ .w = 0, .x = x, .y = y, .z = z };
        }

        pub fn mulScalar(self: Self, v: T) Self {
            return quatFromV4(v4FromQuat(self).mulScalar(v));
        }

        pub fn mul(self: Self, other: Self) Self {
            const w = dot(self, other);

            const a0b = quatFromV4(v4FromQuat(other).mulScalar(self.w));
            const b0a = quatFromV4(v4FromQuat(self).mulScalar(other.w));
            const axb = cross(self, other);
            const sum = a0b.add(b0a).add(axb);

            self = .{ .w = w, .x = sum.x, .y = sum.y, .z = sum.z };
        }

        pub fn mulAssign(self: *Self, other: Self) Self {
            const w = dot(self, other);

            const a0b = quatFromV4(v4FromQuat(other).mulScalar(self.w));
            const b0a = quatFromV4(v4FromQuat(self).mulScalar(other.w));
            const axb = cross(self, other);
            const sum = a0b.add(b0a).add(axb);

            self = .{ .w = w, .x = sum.x, .y = sum.y, .z = sum.z };
        }

        pub fn norm(self: Self) Self {
            return @sqrt(dot(self, self));
        }

        pub fn rotVecSlow(v: V3, a: V3, theta: T) V3 {
            // v = Vector to rotate
            // a = axis to rotate along
            // theta = angle to rotate by
            const p = quatFromV3(v);
            const q = quatFromV3AndAngle(a, theta);
            const qc = conjugate(q);
            return mul(mul(q, p), qc);
        }

        pub fn rotMatFromQuat(self: Self) M3 {
            _ = self;
        }

        pub fn quatFromRotMat() Self {}
    };
}

// Faster Quaternion Rotation:
// Slow: v' = q * v * conjugate(q) = Stored in Quaternion
// Fast: t = 2 * cross(q.xyz, v); v' = v + q.w * t + cross(q.xyz, t) = Stored in V3
// Above is no longer needed
