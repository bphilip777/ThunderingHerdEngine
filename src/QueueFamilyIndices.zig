// const vk = @import("libs.zig").vk;
const vk = @import("vulkan/vulkan3.zig");
const Self = @This();

graphics_family: ?u32 = null,
present_family: ?u32 = null,

pub fn findQueueFamilies(surface: vk.SurfaceKHR, device: vk.PhysicalDevice) Self {
    var qfi: Self = undefined;

    var n_qfis: u32 = 0;
    vk.getPhysicalDeviceQueueFamilyProperties(device, &n_qfis, null);

    var queue_families: [32]vk.QueueFamilyProperties = undefined;
    vk.getPhysicalDeviceQueueFamilyProperties(device, &n_qfis, &queue_families);

    for (queue_families[0..n_qfis], 0..) |queue_family, i| {
        if (queue_family.queue_flags.mask & vk.QueueFlags.graphics_bit == vk.QueueFlags.graphics_bit) {
            qfi.graphics_family = @truncate(i);
        }

        var has_present_support: vk.Bool32 = .false;
        _ = vk.getPhysicalDeviceSurfaceSupportKHR(device, @truncate(i), surface, &has_present_support);
        if (has_present_support == .true) {
            qfi.present_family = @truncate(i);
        }

        if (qfi.isComplete()) break;
    }

    return qfi;
}

pub fn isComplete(self: *const Self) bool {
    return self.graphics_family != null and self.present_family != null;
}
