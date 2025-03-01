const std = @import("std");

// Version 1: Auto struct generation, individual fns for each type
// Version 2: Auto struct generation, tagged unions fns for each type
//  - less writing
// Version 3: Simd of each type
//  - least writing
// Version 4: Custom struct generation + fns w/in matrix scope
//  - allows chaining
//  - allows simd
// For testing purposes - limit to largest struct sizes

pub const Version1 = struct {
    fn Matrix(
        comptime T: type,
        comptime width: comptime_int,
        comptime height: comptime_int,
    ) type {
        return [height][width]T;
    }

    pub const Mat2 = Matrix(f32, 2, 2);
    pub const Mat3 = Matrix(f32, 3, 3);
    pub const Mat4 = Matrix(f32, 4, 4);

    pub fn addM2M2(a: Mat2, b: Mat2) Mat2 {
        return .{
            .@"0" = a[0][0] + b[0][0],
            .@"1" = a[0][1] + b[0][1],

            .@"2" = a[1][0] + b[1][0],
            .@"3" = a[1][1] + b[1][1],
        };
    }

    pub fn addM3M3(a: Mat3, b: Mat3) Mat3 {
        return .{
            .@"0" = a[0] + b[0],
            .@"1" = a[0] + b[1],
            .@"2" = a[0] + b[2],

            .@"3" = a[1] + b[0],
            .@"4" = a[1] + b[1],
            .@"5" = a[1] + b[2],

            .@"6" = a[2] + b[0],
            .@"7" = a[2] + b[1],
            .@"8" = a[2] + b[2],
        };
    }

    pub fn addM4M4(a: Mat4, b: Mat4) Mat4 {
        return .{
            .@"0" = a[0] + b[0],
            .@"1" = a[0] + b[1],
            .@"2" = a[0] + b[2],
            .@"3" = a[0] + b[3],

            .@"4" = a[1] + b[0],
            .@"5" = a[1] + b[1],
            .@"6" = a[1] + b[2],
            .@"7" = a[1] + b[3],

            .@"8" = a[2] + b[0],
            .@"9" = a[2] + b[1],
            .@"10" = a[2] + b[2],
            .@"11" = a[2] + b[3],

            .@"12" = a[3] + b[0],
            .@"13" = a[3] + b[1],
            .@"14" = a[3] + b[2],
            .@"15" = a[3] + b[3],
        };
    }

    fn Vector(
        comptime T: type,
        comptime len: comptime_int,
    ) type {
        return [len]T;
    }

    pub const Vec2 = Vector(f32, 2);
    pub const Vec3 = Vector(f32, 3);
    pub const Vec4 = Vector(f32, 4);

    pub fn addV2V2(a: Vec2, b: Vec2) Vec2 {
        return .{
            .@"0" = a[0] + b[0],
            .@"1" = a[1] + b[1],
        };
    }

    pub fn addV3V3(a: Vec3, b: Vec3) Vec3 {
        return .{
            .@"0" = a[0] + b[0],
            .@"1" = a[1] + b[1],
            .@"2" = a[2] + b[2],
        };
    }

    pub fn addV4V4(a: Vec2, b: Vec2) Vec2 {
        return .{
            .@"0" = a[0] + b[0],
            .@"1" = a[1] + b[1],
            .@"2" = a[2] + b[2],
            .@"3" = a[3] + b[3],
        };
    }
};

pub const Version2 = struct {
    // generate matrices
    fn Matrix(
        comptime T: type,
        comptime width: comptime_int,
        comptime height: comptime_int,
    ) type {
        return [height][width]T;
    }

    // basic types
    pub const Mat2 = Matrix(f32, 2, 2);
    pub const Mat3 = Matrix(f32, 3, 3);
    pub const Mat4 = Matrix(f32, 4, 4);

    // tagged union to switch on them
    pub const Matrices = union(enum) {
        mat2: Mat2,
        mat3: Mat3,
        mat4: Mat4,
    };

    pub fn addM2M(a: Matrices, b: Matrices) Matrices {
        var c = switch (a) {
            inline else => |mat| mat,
        };

        switch (b) {
            inline else => |mat| {
                const len = c.len;
                for (0..len) |i| {
                    c[i] += mat[i];
                }
            },
        }

        return c;
    }

    pub fn multM2M(a: Matrices, b: Matrices) Matrices {
        var c = switch (a) {
            inline else => |mat| mat,
        };

        switch (b) {
            inline else => |mat| {
                const len = c.len;
                for (0..len) |i| {
                    c[i] += mat[i];
                }
            },
        }

        return c;
    }

    fn Vector(
        comptime T: type,
        comptime len: comptime_int,
    ) type {
        return [len]T;
    }

    pub const Vec2 = Vector(f32, 2);
    pub const Vec3 = Vector(f32, 3);
    pub const Vec4 = Vector(f32, 4);

    pub const Vectors = union(enum) {
        vec2: Vec2,
        vec3: Vec3,
        vec4: Vec4,
    };

    pub fn addV2V(a: Vectors, b: Vectors) Vectors {
        var v1 = switch (a) {
            inline else => |av| av,
        };

        const v2 = switch (b) {
            inline else => |bv| bv,
        };

        for (0..v1.len) |i| {
            v1[i] += v2[i];
        }

        return v1;
    }

    pub fn multV2V(a: Vectors, b: Vectors) Vectors {
        return a * b;
    }
};

// version 3
// simd only
pub const Version3 = struct {
    pub const Mat2 = @Vector(4, f32);
    pub const Mat3 = @Vector(9, f32);
    pub const Mat4 = @Vector(16, f32);

    pub fn addM2M2(a: Mat2, b: Mat2) Mat2 {
        return a + b;
    }

    pub fn addM3M3(a: Mat3, b: Mat3) Mat3 {
        return a + b;
    }

    pub fn addM4M4(a: Mat4, b: Mat4) Mat4 {
        return a + b;
    }

    pub fn multM4M4(a: Mat4, b: Mat4) Mat4 {
        return a * b;
    }

    pub const Vec2 = @Vector(2, f32);
    pub const Vec3 = @Vector(3, f32);
    pub const Vec4 = @Vector(4, f32);

    pub fn addV2V2(a: Vec2, b: Vec2) Vec2 {
        return a + b;
    }

    pub fn addV3V3(a: Vec3, b: Vec3) Vec3 {
        return a + b;
    }

    pub fn addV4V4(a: Vec4, b: Vec4) Vec4 {
        return a + b;
    }

    pub fn multV2V2(a: Vec2, b: Vec2) Vec2 {
        return a * b;
    }

    pub fn multV3V3(a: Vec3, b: Vec3) Vec3 {
        return a * b;
    }

    pub fn multV4V4(a: Vec4, b: Vec4) Vec4 {
        return a * b;
    }
};
