const vk = @import("vulkan/vulkan3.zig");
const Buffer = @import("Buffer.zig");

buffer: Buffer,
map: ?*anyopaque,
