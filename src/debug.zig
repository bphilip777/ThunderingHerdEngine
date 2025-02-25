const std = @import("std");
const Allocator = std.mem.Allocator;
const vk = @import("vk.zig").vk;
const is_debug_mode = @import("builtin").mode == .Debug;
const isSuccess = @import("helpers.zig").isSuccess;

const validation_layers = [_][*:0]const u8 {
    "VK_LAYER_KHRONOS_validation",
};

fn checkValidationLayerSupport(allo: Allocator) !bool {
    var n_layers: u32 = 0;
    try isSuccess(vk.vkEnumerateInstanceLayerProperties(&n_layers, null));
    std.debug.assert(n_layers > 0);

    const layers = try allo.alloc(vk.VkLayerProperties, n_layers); 
    try isSuccess(vk.vkEnumerateInstanceLayerProperties(&n_layers, layers.ptr));

    if (is_debug_mode) {
        std.debug.print("Available Layers\n", .{});
    for (layers) |layer| {
        if (is_debug_mode) std.debug.print("{s}\n", .{layer.layerName});
    }
    }

    var layer_found: bool = false;
    for (layers) |layer| {
        if (std.mem.eql(u8, layer.layerName, layer_name)) {
            layer_found = true;
            break;
        }
    }

    return layer_found;
}

fn CreateDebugUtilsMessengerExt(instance: vk.VkInstance, p_create_info: *const vk.VkDebugUtilsMessengerCreateInfoEXT, p_allocator: *const vk.VkAllocationCallbacks, p_debug_messenger: *vk.VkDebugUtilsMessengerEXT,) vk.VkResult {
    const func = @as(vk.PFN_vkCreateDebugUtilsMessengerEXT, vk.VkGetInstanceProcAddr(instance, "vkCreateDebugUtilsMessengerEXT"));
    if (func != null) {
        return func(instance, p_create_info, p_allocator, p_debug_messenger);
    } else {
        return vk.VK_ERROR_EXTENSION_NOT_PRESENT;
    }
}

fn DestroyDebugUtilsMessengerEXT(instance: vk.VkInstance, debug_messenger: vk.VkDebugUtilsMessengerEXT, p_allocator: *const vk.VkAllocationCallbacks,) void {
    const func = @as(vk.PFN_vkDestroyDebugUtilsMessengerEXT, vk.vkGetInstanceProcAddr(instance, "vkDestroyDebugUtilsMessengerEXT")); // why am i loading this?
                                                                                                                                     if (func != null) {
                                                                                                                                         func(instance, debug_messenger, p_allocator);
                                                                                                                                     }
}

fn populateDebugMessengerCreateInfo(create_info: *vk.VkDebugUtilsMessengerCreateInfoEXT) void {
        create_info.sType = vk.VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT;
        create_info.messageSeverity = vk.VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT | vk.VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT | vk.VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT;
        create_info.messageType = vk.VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT | vk.VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT | vk.VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT;
        create_info.pfnUserCallback = debugCallback;
}

fn setupDebugMessenger() void {
    if (!is_debug_mode) return;

    var create_info = vk.VkDebugUtilsMessengerCreateInfoEXT{};
    populateDebugMessengerCreateInfo(&create_info);

    try isSuccess(CreateDebugUtilsMessengerEXT(instance, &create_info, null, &debugMessenger));
}

fn debugCallback(message_severity: vk.VkDebugUtilsMessageSeverityFlagBitsEXT, message_type: vk.VkDebugUtilsMessageTypeFlagsEXT, p_callback_data: *const vk.VkDebugUtilsMessengerCallbackDataEXT, user_data:*anyopaque) bool {
    std.log.err("Validation Layer: {s}", .{p_callback_data.pMessage});
    return vk.VK_FALSE;
}
