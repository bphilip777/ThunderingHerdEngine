const vk = @import("vk.zig").vk;
const Self = @This();

graphics_family: ?u32 = null,
present_family: ?u32 = null,

pub fn findQueueFamilies(surface: vk.VkSurfaceKHR, device: vk.VkPhysicalDevice) Self {
    var qfi: Self = undefined;

    var n_qfis: u32 = 0;
    vk.vkGetPhysicalDeviceQueueFamilyProperties(device, &n_qfis, null);

    var queue_families: [32]vk.VkQueueFamilyProperties = undefined;
    vk.vkGetPhysicalDeviceQueueFamilyProperties(device, &n_qfis, &queue_families);

    for (queue_families[0..n_qfis], 0..) |queue_family, i| {
        if (queue_family.queueFlags & vk.VK_QUEUE_GRAPHICS_BIT == vk.VK_QUEUE_GRAPHICS_BIT) {
            qfi.graphics_family = @truncate(i);
        }

        var has_present_support: vk.VkBool32 = 0;
        _ = vk.vkGetPhysicalDeviceSurfaceSupportKHR(device, @truncate(i), surface, &has_present_support);
        if (has_present_support == vk.VK_TRUE) {
            qfi.present_family = @truncate(i);
        }

        if (qfi.isComplete()) break;
    }

    return qfi;
}

pub fn isComplete(self: *const Self) bool {
    return self.graphics_family != null and self.present_family != null;
}
