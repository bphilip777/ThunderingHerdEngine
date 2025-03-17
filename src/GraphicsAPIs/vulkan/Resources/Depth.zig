const vk = @import("../../../vulkan/vulkan3.zig");
const Image = @import("Image.zig");

format: vk.Format,
image: Image,
view: vk.ImageView,
