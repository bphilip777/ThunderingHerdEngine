pub const vk = @cImport({
    // @cDefine("VK_USE_PLATFORM_WIN32_KHR", "1"); // specific to window impl - different for each software
    @cInclude("vulkan/vulkan.h");
});
