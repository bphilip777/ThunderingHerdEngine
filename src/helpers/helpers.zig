const std = @import("std");

pub fn EnumPackedStruct(Enum: type) type {
    switch (@typeInfo(Enum)) {
        .@"enum" => {},
        else => @compileError("Fn only works for enums."),
    }

    const T = @typeInfo(Enum).@"enum".tag_type;

    return packed struct(T) {
        mask: T = 0,

        pub const Self = @This();

        pub fn initEmpty() Self {
            return .{ .mask = 0 };
        }

        pub fn initFull() Self {
            return .{ .mask = std.math.maxInt(T) };
        }

        pub fn resetEmpty(self: *Self) void {
            self.mask = 0;
        }

        pub fn resetFull(self: *Self) void {
            self.mask = std.math.maxInt(T);
        }

        pub fn toggle(self: *Self, E: []const Enum) void {
            for (E) |e_value| {
                self.mask ^= @intFromEnum(e_value);
            }
        }

        pub fn toggleAll(self: *Self) void {
            self.mask = ~self.mask;
        }

        pub fn eql(self: *const Self, E: Enum) bool {
            return (self.mask & @intFromEnum(E)) != 0;
        }

        pub fn set(self: *Self, e: []const Enum) void {
            for (e) |value| {
                self.mask |= @intFromEnum(value);
            }
        }

        pub fn unset(self: *Self, e: []const Enum) void {
            for (e) |value| {
                self.mask &= ~@intFromEnum(value);
            }
        }
    };
}
