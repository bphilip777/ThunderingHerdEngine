pub const vk = @cImport({
    // @cDefine("VK_USE_PLATFORM_WIN32_KHR", "1"); // specific to window impl - different for each software
    @cInclude("vulkan/vulkan.h");
});

pub const glm = @cImport({
    @cDefine("GLM_FORCE_RADIANS", "1");
    @cInclude("vulkan/Include/glm/glm.hpp");
    @cInclude("vulkan/Include/glm/gtc/matrix_transform.hpp");
});

pub const stb = @cImport({
    @cDefine("STB_IMAGE_IMPLEMENTATION", "1");
    @cInclude("stb_image.h");
});
