const std = @import("std");
const Allocator = std.mem.Allocator;

const vk = @import("vulkan/vulkan3.zig");
const isSuccess = vk.isSuccess;
// const vk = @import("libs.zig").vk;

const Self = @This();

capabilities: vk.SurfaceCapabilitiesKHR, // version 2 is out
formats: []vk.SurfaceFormatKHR,
present_modes: []vk.PresentModeKHR,

pub fn init(
    allo: std.mem.Allocator,
    surface: vk.SurfaceKHR,
    device: vk.PhysicalDevice,
) !Self {
    const upper_bound: usize = 1024;

    // capabilities
    var capabilities: vk.SurfaceCapabilitiesKHR = undefined;
    try isSuccess(vk.getPhysicalDeviceSurfaceCapabilitiesKHR(device, surface, &capabilities));

    var n_formats = try getNFormats(surface, device);
    // if (@import("builtin").mode == .Debug) std.debug.print("# of Formats: {}\n", .{n_formats});
    if (n_formats == 0 or n_formats > upper_bound) {
        std.debug.print("Could not find physical device surface formats!", .{});
        return error.NoSurfaceFormatsFound;
    }

    const formats = try allo.alloc(vk.SurfaceFormatKHR, n_formats);
    try isSuccess(vk.getPhysicalDeviceSurfaceFormatsKHR(device, surface, &n_formats, @ptrCast(formats.ptr)));

    var n_present_modes = try getNPresentModes(surface, device);
    // if (@import("builtin").mode == .Debug) std.debug.print("# of Present Modes: {}\n", .{n_present_modes});
    if (n_present_modes == 0 or n_present_modes > upper_bound) {
        std.debug.print("Could not find present modes for surface.", .{});
        return error.NoPresentModesFound;
    }

    const present_modes = try allo.alloc(vk.PresentModeKHR, n_present_modes);
    try isSuccess(vk.getPhysicalDeviceSurfacePresentModesKHR(device, surface, &n_present_modes, @ptrCast(present_modes.ptr)));

    return Self{
        .capabilities = capabilities,
        .formats = formats,
        .present_modes = present_modes,
    };
}

pub fn deinit(self: *Self, allo: Allocator) void {
    allo.free(self.formats);
    allo.free(self.present_modes);
}

fn getNFormats(surface: vk.SurfaceKHR, device: vk.PhysicalDevice) !u32 {
    var n_formats: u32 = 0;
    try isSuccess(vk.getPhysicalDeviceSurfaceFormatsKHR(device, surface, &n_formats, null));
    return n_formats;
}

fn getNPresentModes(surface: vk.SurfaceKHR, device: vk.PhysicalDevice) !u32 {
    var n_present_modes: u32 = 0;
    try isSuccess(vk.getPhysicalDeviceSurfacePresentModesKHR(device, surface, &n_present_modes, null));
    return n_present_modes;
}

pub fn isSwapchainAdequate(surface: vk.SurfaceKHR, device: vk.PhysicalDevice) !bool {
    const n_formats = try getNFormats(surface, device);
    const n_present_modes = try getNPresentModes(surface, device);
    return n_formats > 0 and n_present_modes > 0;
}

pub fn chooseSwapSurfaceFormat(self: *const Self) vk.SurfaceFormatKHR {
    std.debug.assert(self.formats.len > 0);
    for (self.formats) |format| {
        if (format.format == .b8g8r8a8_srgb and format.color_sppace == .srgb_nonlinear_khr) {
            return format;
        }
    }
    return self.formats[0]; // always present
}

pub fn chooseSwapPresentMode(self: *const Self) vk.PresentModeKHR {
    // if (self.present_modes.items.len == 0) unreachable;
    std.debug.assert(self.present_modes.len > 0);
    for (self.present_modes) |present_mode| {
        if (present_mode == .mailbox_khr) {
            return present_mode;
        }
    } else return .fifo_khr; // always present
}

pub fn chooseSwapExtent(
    self: *const Self,
    width: i32,
    height: i32,
) vk.Extent2D {
    const caps = self.capabilities;
    if (caps.current_extent.width != std.math.maxInt(u32)) {
        return caps.current_extent;
    }

    const w: u32 = @max(@as(u32, @intCast(width)), 0);
    const h: u32 = @max(@as(u32, @intCast(height)), 0);
    return vk.Extent2D{
        .width = std.math.clamp(w, caps.min_image_extent.width, caps.max_image_extent.width),
        .height = std.math.clamp(h, caps.min_image_extent.height, caps.max_image_extent.height),
    };
}
