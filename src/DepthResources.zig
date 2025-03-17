const vk = @import("vulkan/vulkan3.zig");
const ImageResources = @import("ImageResources.zig");

format: vk.Format,
image: ImageResources,
view: vk.ImageView,
