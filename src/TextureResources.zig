const vk = @import("vulkan/vulkan3.zig");
const ImageResources = @import("ImageResources.zig");

image: ImageResources,
view: vk.ImageView,
sampler: vk.Sampler,
