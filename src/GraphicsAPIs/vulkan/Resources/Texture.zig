const vk = @import("../../../vulkan/vulkan3.zig");
const Image = @import("Image.zig");

image: Image,
view: vk.ImageView,
sampler: vk.Sampler,
