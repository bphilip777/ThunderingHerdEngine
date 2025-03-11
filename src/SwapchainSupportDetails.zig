const std = @import("std");
const Allocator = std.mem.Allocator;

const vk = @import("vulkan/vulkan.zig");
const isSuccess = vk.isSuccess;
// const vk = @import("libs.zig").vk;

const Self = @This();

capabilities: vk.VkSurfaceCapabilitiesKHR, // version 2 is out
formats: []vk.VkSurfaceFormatKHR,
present_modes: []vk.VkPresentModeKHR,

pub fn init(
    allo: std.mem.Allocator,
    surface: vk.VkSurfaceKHR,
    device: vk.VkPhysicalDevice,
) !Self {
    const upper_bound: usize = 1024;

    // capabilities
    var capabilities: vk.VkSurfaceCapabilitiesKHR = undefined;
    try isSuccess(vk.vkGetPhysicalDeviceSurfaceCapabilitiesKHR(device, surface, &capabilities));

    var n_formats = try getNFormats(surface, device);
    // if (@import("builtin").mode == .Debug) std.debug.print("# of Formats: {}\n", .{n_formats});
    if (n_formats == 0 or n_formats > upper_bound) {
        std.debug.print("Could not find physical device surface formats!", .{});
        return error.NoSurfaceFormatsFound;
    }

    const formats = try allo.alloc(vk.VkSurfaceFormatKHR, n_formats);
    try isSuccess(vk.vkGetPhysicalDeviceSurfaceFormatsKHR(device, surface, &n_formats, @ptrCast(formats.ptr)));

    var n_present_modes = try getNPresentModes(surface, device);
    // if (@import("builtin").mode == .Debug) std.debug.print("# of Present Modes: {}\n", .{n_present_modes});
    if (n_present_modes == 0 or n_present_modes > upper_bound) {
        std.debug.print("Could not find present modes for surface.", .{});
        return error.NoPresentModesFound;
    }

    const present_modes = try allo.alloc(vk.VkPresentModeKHR, n_present_modes);
    try isSuccess(vk.vkGetPhysicalDeviceSurfacePresentModesKHR(device, surface, &n_present_modes, @ptrCast(present_modes.ptr)));

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

fn getNFormats(surface: vk.VkSurfaceKHR, device: vk.VkPhysicalDevice) !u32 {
    var n_formats: u32 = 0;
    try isSuccess(vk.vkGetPhysicalDeviceSurfaceFormatsKHR(device, surface, &n_formats, null));
    return n_formats;
}

fn getNPresentModes(surface: vk.VkSurfaceKHR, device: vk.VkPhysicalDevice) !u32 {
    var n_present_modes: u32 = 0;
    try isSuccess(vk.vkGetPhysicalDeviceSurfacePresentModesKHR(device, surface, &n_present_modes, null));
    return n_present_modes;
}

pub fn isSwapchainAdequate(surface: vk.VkSurfaceKHR, device: vk.VkPhysicalDevice) !bool {
    const n_formats = try getNFormats(surface, device);
    const n_present_modes = try getNPresentModes(surface, device);
    return n_formats > 0 and n_present_modes > 0;
}

pub fn chooseSwapSurfaceFormat(self: *const Self) vk.VkSurfaceFormatKHR {
    std.debug.assert(self.formats.len > 0);
    for (self.formats) |format| {
        if (format.format == vk.VK_FORMAT_B8G8R8A8_SRGB and format.colorSpace == vk.VK_COLOR_SPACE_SRGB_NONLINEAR_KHR) {
            return format;
        }
    }
    return self.formats[0]; // always present
}

pub fn chooseSwapPresentMode(self: *const Self) vk.VkPresentModeKHR {
    // if (self.present_modes.items.len == 0) unreachable;
    std.debug.assert(self.present_modes.len > 0);
    for (self.present_modes) |present_mode| {
        if (present_mode == vk.VK_PRESENT_MODE_MAILBOX_KHR) {
            return present_mode;
        }
    } else return vk.VK_PRESENT_MODE_FIFO_KHR; // always present
}

pub fn chooseSwapExtent(
    self: *const Self,
    width: i32,
    height: i32,
) vk.VkExtent2D {
    const caps = self.capabilities;
    if (caps.currentExtent.width != std.math.maxInt(u32)) {
        return caps.currentExtent;
    }

    const w: u32 = @max(@as(u32, @intCast(width)), 0);
    const h: u32 = @max(@as(u32, @intCast(height)), 0);
    return vk.VkExtent2D{
        .width = std.math.clamp(w, caps.minImageExtent.width, caps.maxImageExtent.width),
        .height = std.math.clamp(h, caps.minImageExtent.height, caps.maxImageExtent.height),
    };
}
