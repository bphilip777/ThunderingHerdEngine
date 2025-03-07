const std = @import("std");
const Stopwatch = @This();

start_time: i128 = 0,
current_time: i128 = 0,

pub fn init() Stopwatch {
    const curr = std.time.nanoTimestamp();
    return .{
        .start_time = curr,
        .current_time = curr,
    };
}

pub fn elapsed(self: *Stopwatch) i128 {
    self.current_time = std.time.nanoTimestamp();
    return self.current_time - self.start_time;
}

pub fn reset(self: *Stopwatch) void {
    self.start_time = self.current_time;
}
