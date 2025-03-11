// TODO:
// 1. need to implement both the draw and draw indexed functions (only indexed right now) - call correct one based on data
// 2. need to separate engine and app into separate files = separation of concerns + orderliness
// 3. need to fix loading primitives to make passing data easier
// 4. need to swap from 2d to 3d mode
// 5. poll 1x every frame = check frame rate
//      - need to create a fn that takes in other fns and runs them based on the time left - only need to check elapsed time as an argument for that function
// 6. Need a way to abstract uniform buffer calls from specific impl in init - like side functions that call those functions
//  - store UBO in another file
// 7. Need to update the slices
// 8. Convert a lot of syscalls to all into arrays

const std = @import("std");
const Allocator = std.mem.Allocator;
const is_debug_mode = @import("builtin").mode == .Debug;

const zstbi = @import("zstbi");

const SSD = @import("SwapchainSupportDetails.zig");
const QFI = @import("QueueFamilyIndices.zig");
const Stopwatch = @import("Stopwatch.zig");

pub const std_options: std.Options = .{ .log_level = .debug };

// libraries
const vk = @import("vulkan/vulkan3.zig");
const isSuccess = @import("vulkan/vulkan3.zig").isSuccess;

const math = @import("math/math.zig");

// sdl - huge library that may not be what i want
const sdl = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");

    // @cDefine("VULKAN_H_", "1");
    @cInclude("SDL3/SDL_vulkan.h");

    @cDefine("SDL_MAIN_HANDLED", {}); // for programs w/ their own entry point
    @cInclude("SDL3/SDL_main.h");
});

// Extensions
const required_device_extensions = [_][*:0]const u8{
    vk.ExtensionNames.swapchain,
};

const optional_instance_extensions = [_][*:0]const u8{
    vk.ExtensionNames.get_physical_device_properties_2,
    vk.ExtensionNames.get_surface_capabilities_2,
};

// Shader Info
const vert_spv align(@alignOf(u32)) = @embedFile("vertex_shader").*;
const frag_spv align(@alignOf(u32)) = @embedFile("fragment_shader").*;

// Model Info
const Vertex = @import("models/vertex.zig");
const square_indices = @import("models/square.zig").indices;
const square_vertices = @import("models/square.zig").vertices;

// Frame Rate
const FPS = enum {
    thirty,
    sixty,
    one_twenty,
    one_fourty_four,
};

// UBOs
const UBO = @import("UniformBufferObject.zig");

// App Data
const MAX_FRAMES_IN_FLIGHT: i32 = 2;

const Self = @This();

allo: Allocator,

// all of the below should be changed with calls to specific graphics api
window: *sdl.SDL_Window,

instance: vk.Instance,
// surface: vk.VkSurfaceKHR,
//
// physical_device: vk.VkPhysicalDevice,
// device: vk.VkDevice,
//
// graphics_queue: vk.VkQueue,
// present_queue: vk.VkQueue,
//
// swapchain: vk.VkSwapchainKHR,
// images: []vk.VkImage,
// format: vk.VkFormat,
// extent: vk.VkExtent2D,
// views: []vk.VkImageView,
// frame_buffers: []vk.VkFramebuffer,
//
// render_pass: vk.VkRenderPass,
// descriptor_set_layout: vk.VkDescriptorSetLayout,
// pipeline_layout: vk.VkPipelineLayout,
// pipeline: vk.VkPipeline,
//
// command_pool: vk.VkCommandPool,
//
// texture_image: vk.VkImage,
// texture_image_memory: vk.VkDeviceMemory,
//
// vertex_buffer: vk.VkBuffer,
// vertex_buffer_memory: vk.VkDeviceMemory,
//
// index_buffer: vk.VkBuffer,
// index_buffer_memory: vk.VkDeviceMemory,
//
// uniform_buffers: []vk.VkBuffer,
// uniform_buffers_memory: []vk.VkDeviceMemory,
// uniform_buffers_mapped: []?*anyopaque,
//
// descriptor_pool: vk.VkDescriptorPool,
// descriptor_sets: []vk.VkDescriptorSet,
//
// command_buffers: []vk.VkCommandBuffer,
//
// image_available_semaphores: []vk.VkSemaphore,
// render_finished_semaphores: []vk.VkSemaphore,
// in_flight_fences: []vk.VkFence,
//
// current_frame: u32 = 0,
// resize: bool = false,
// fps: FPS = .sixty,
// time: Stopwatch,

// public functions
pub fn init(
    allo: Allocator,
    app_name: [*:0]const u8,
    width: i32,
    height: i32,
) !Self {

    // init sdl
    errdefer |err| if (err == error.SdlError) std.log.err("Sdl Error: {s}", .{sdl.SDL_GetError()});
    if (is_debug_mode) getSDLVersion();
    initSDL();

    // init zstbi
    zstbi.init(allo);

    // vulkan compatiable + resizable
    const window: *sdl.SDL_Window = sdl.SDL_CreateWindow(
        app_name,
        width,
        height,
        sdl.SDL_WINDOW_VULKAN | sdl.SDL_WINDOW_RESIZABLE,
    ) orelse {
        std.debug.print("Failed to create window:{s}\n", .{sdl.SDL_GetError()});
        return error.FailedToCreateWindow;
    };

    const instance = try createInstance(allo);
    // const surface = try createSurface(window, instance);
    // const physical_device: vk.VkPhysicalDevice = try pickPhysicalDevice(instance, surface);
    // const device = try createLogicalDevice(surface, physical_device);
    //
    // const graphics_queue = createQueue(surface, physical_device, device, .graphics);
    // const present_queue = createQueue(surface, physical_device, device, .present);
    //
    // var ssd = try SSD.init(allo, surface, physical_device);
    // defer ssd.deinit(allo);
    // if (is_debug_mode) std.debug.print("# of Formats: {}\n", .{ssd.formats.len});
    // if (is_debug_mode) std.debug.print("# of Present Modes: {}\n", .{ssd.present_modes.len});
    //
    // const extent = ssd.chooseSwapExtent(width, height);
    // const format = ssd.chooseSwapSurfaceFormat();
    //
    // const swapchain = try createSwapchain(allo, surface, physical_device, device, width, height);
    //
    // // allocate memory outside of the fn - one time call at initialization rather than every time recreate is called
    // var n_images = try getNumberOfSwapchainImages(device, swapchain);
    // const images = try allo.alloc(vk.VkImage, n_images);
    // const views = try allo.alloc(vk.VkImageView, n_images);
    // const frame_buffers = try allo.alloc(vk.VkFramebuffer, n_images);
    //
    // const descriptor_set_layout = try createDescriptorSetLayout(device);
    // const pipeline_layout = try createGraphicsPipelineLayout(device, &.{descriptor_set_layout});
    // const render_pass = try createRenderPass(device, format.format);
    //
    // try getSwapchainImages(device, swapchain, &n_images, images);
    // try createImageViews(device, images, format.format, views);
    // try createFramebuffers(device, extent, views, render_pass, frame_buffers);
    // const pipeline = try createGraphicsPipelines(device, pipeline_layout, render_pass);
    //
    // const command_pool = try createCommandPool(surface, physical_device, device);
    // createTextureImage();
    //
    // var vertex_buffer: vk.VkBuffer = undefined;
    // var vertex_buffer_memory: vk.VkDeviceMemory = undefined;
    // try createVertexBuffer(
    //     physical_device,
    //     device,
    //     &vertex_buffer,
    //     &vertex_buffer_memory,
    //     command_pool,
    //     graphics_queue,
    //     // &triangle_vertices,
    //     &square_vertices,
    // );
    //
    // var index_buffer: vk.VkBuffer = undefined;
    // var index_buffer_memory: vk.VkDeviceMemory = undefined;
    // try createIndexBuffer(
    //     physical_device,
    //     device,
    //     &index_buffer,
    //     &index_buffer_memory,
    //     command_pool,
    //     graphics_queue,
    //     // &triangle_indices, // makes no sense since only 1 triangle
    //     &square_indices,
    // );
    //
    // // probably want to pass this into this fn
    // const uniform_buffers = try allo.alloc(vk.VkBuffer, MAX_FRAMES_IN_FLIGHT);
    // const uniform_buffers_memory = try allo.alloc(vk.VkDeviceMemory, MAX_FRAMES_IN_FLIGHT);
    // const uniform_buffers_mapped = try allo.alloc(?*anyopaque, MAX_FRAMES_IN_FLIGHT);
    // try createUniformBuffers(
    //     physical_device,
    //     device,
    //     uniform_buffers,
    //     uniform_buffers_memory,
    //     uniform_buffers_mapped,
    // );
    //
    // const descriptor_pool = try createDescriptorPool(device);
    // const descriptor_sets = try createDescriptorSets(
    //     allo,
    //     device,
    //     descriptor_set_layout,
    //     descriptor_pool,
    //     uniform_buffers,
    // );
    //
    // const command_buffers = try createCommandBuffers(allo, device, command_pool);
    //
    // const image_available_semaphores = try createSemaphores(allo, device);
    // const render_finished_semaphores = try createSemaphores(allo, device);
    // const in_flight_fences = try createFences(allo, device);
    //
    // const time = Stopwatch.init();

    return Self{
        .allo = allo,

        .window = window,
        .instance = instance,
        // .surface = surface,
        // .physical_device = physical_device,
        // .device = device,
        //
        // .graphics_queue = graphics_queue,
        // .present_queue = present_queue,
        //
        // .swapchain = swapchain,
        // .images = images,
        // .format = format.format,
        // .extent = extent,
        // .views = views,
        // .frame_buffers = frame_buffers,
        //
        // .descriptor_set_layout = descriptor_set_layout,
        // .pipeline_layout = pipeline_layout,
        // .render_pass = render_pass,
        // .pipeline = pipeline,
        //
        // .command_pool = command_pool,
        //
        // .vertex_buffer = vertex_buffer,
        // .vertex_buffer_memory = vertex_buffer_memory,
        //
        // .index_buffer = index_buffer,
        // .index_buffer_memory = index_buffer_memory,
        //
        // .uniform_buffers = uniform_buffers,
        // .uniform_buffers_memory = uniform_buffers_memory,
        // .uniform_buffers_mapped = uniform_buffers_mapped,
        //
        // .descriptor_pool = descriptor_pool,
        // .descriptor_sets = descriptor_sets,
        //
        // .command_buffers = command_buffers,
        //
        // .image_available_semaphores = image_available_semaphores,
        // .render_finished_semaphores = render_finished_semaphores,
        // .in_flight_fences = in_flight_fences,
        //
        // .time = time,
    };
}

pub fn deinit(self: *Self) void {
    defer { // Cleanup vulkan instance/window/surface/quit sdl
        // vk.vkDestroyDevice(self.device, null);
        // sdl.SDL_Vulkan_DestroySurface(@ptrCast(self.instance), @ptrCast(self.surface), null); // sdl
        vk.destroyInstance(self.instance, null);
        sdl.SDL_DestroyWindow(self.window);
        zstbi.deinit();
        sdl.SDL_Quit();
    }

    // defer { // Cleanup command pool/buffers
    //     vk.vkDestroyCommandPool(self.device, self.command_pool, null);
    //     self.allo.free(self.command_buffers);
    // }
    //
    // defer { // Cleanup sync objects
    //     for (0..MAX_FRAMES_IN_FLIGHT) |i| {
    //         vk.vkDestroySemaphore(self.device, self.image_available_semaphores[i], null);
    //         vk.vkDestroySemaphore(self.device, self.render_finished_semaphores[i], null);
    //         vk.vkDestroyFence(self.device, self.in_flight_fences[i], null);
    //     }
    //     self.allo.free(self.in_flight_fences);
    //     self.allo.free(self.image_available_semaphores);
    //     self.allo.free(self.render_finished_semaphores);
    // }
    //
    // defer { // Cleanup vertex buffers
    //     vk.vkFreeMemory(self.device, self.vertex_buffer_memory, null);
    //     vk.vkDestroyBuffer(self.device, self.vertex_buffer, null);
    // }
    //
    // defer { // Cleanup index buffers
    //     vk.vkDestroyBuffer(self.device, self.index_buffer, null);
    //     vk.vkFreeMemory(self.device, self.index_buffer_memory, null);
    // }
    //
    // defer { // Cleanup layout/renderpass/pipeline/pipeline specific descriptor set layout
    //     vk.vkDestroyDescriptorSetLayout(self.device, self.descriptor_set_layout, null);
    //     vk.vkDestroyPipelineLayout(self.device, self.pipeline_layout, null);
    //     vk.vkDestroyRenderPass(self.device, self.render_pass, null);
    //     vk.vkDestroyPipeline(self.device, self.pipeline, null);
    // }
    //
    // defer { // Texture Data
    //     vk.vkDestroyImage(self.device, self.texture_image, null);
    //     vk.vkFreeMemory(self.device, self.texture_image_memory, null);
    // }
    //
    // defer { // Cleanup descriptor sets/layouts/pool - used with UBO
    //     vk.vkDestroyDescriptorPool(self.device, self.descriptor_pool, null); // destroys sets + layouts too
    //     self.allo.free(self.descriptor_sets);
    // }
    //
    // defer { // Cleanup uniform buffers
    //     for (self.uniform_buffers, self.uniform_buffers_memory) |ub, ub_mem| {
    //         vk.vkDestroyBuffer(self.device, ub, null);
    //         vk.vkFreeMemory(self.device, ub_mem, null);
    //     }
    //     self.allo.free(self.uniform_buffers);
    //     self.allo.free(self.uniform_buffers_mapped);
    //     self.allo.free(self.uniform_buffers_memory);
    // }
    //
    // defer { // Cleanup swapchain data
    //     self.cleanupSwapchain();
    //     self.allo.free(self.images);
    //     self.allo.free(self.views);
    //     self.allo.free(self.frame_buffers);
    // }
}

pub fn mainLoop(self: *Self) !void {
    // Main Loop
    outer: while (true) {
        // var current_time = std.time.nanosecond();
        // const elapsed_time = current_time - start_time;

        // poll events = multiplexer - only want to call once every few seconds and handle each case afterwards
        // if (elapsed_time < 0.04) {
        var event: sdl.SDL_Event = undefined;
        while (sdl.SDL_PollEvent(&event)) {
            switch (event.type) {
                sdl.SDL_EVENT_QUIT => break :outer,
                sdl.SDL_EVENT_WINDOW_SHOWN,
                sdl.SDL_EVENT_WINDOW_RESIZED,
                sdl.SDL_EVENT_WINDOW_MAXIMIZED,
                sdl.SDL_EVENT_WINDOW_EXPOSED,
                sdl.SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED,
                sdl.SDL_EVENT_WINDOW_METAL_VIEW_RESIZED,
                sdl.SDL_EVENT_WINDOW_RESTORED,
                sdl.SDL_EVENT_WINDOW_DISPLAY_CHANGED,
                sdl.SDL_EVENT_WINDOW_ENTER_FULLSCREEN,
                sdl.SDL_EVENT_WINDOW_LEAVE_FULLSCREEN,
                => {
                    self.resize = true;
                    break;
                },
                else => {},
            }
        }
        // }

        // game logic
        if (self.resize) {
            try self.recreateSwapchain();
        }

        // only draw at 60 fps
        // not ideal - should set up a poll like above or keep track of previous posiitons and smoothly interpolate b/w them
        if (self.time.elapsed() > (std.time.ns_per_ms * 1_000)) {
            try self.drawFrame();
            self.time.reset();
        }

        try isSuccess(vk.vkDeviceWaitIdle(self.device));
    }
}

// private functions
fn getSDLVersion() void {
    // catch sdl version for build/release
    if (is_debug_mode) {
        std.debug.print("SDL Version @ Build Time: {d}.{d}.{d}\n", .{
            sdl.SDL_MAJOR_VERSION,
            sdl.SDL_MINOR_VERSION,
            sdl.SDL_MICRO_VERSION,
        });
        std.debug.print("SDL build time revision: {s}\n", .{sdl.SDL_REVISION});
    } else {
        const version = sdl.SDL_GetVersion();
        std.debug.print("SDL runtime version: {d}.{d}.{d}\n", .{
            sdl.SDL_VERSIONNUM_MAJOR(version),
            sdl.SDL_VERSIONNUM_MINOR(version),
            sdl.SDL_VERSIONNUM_MICRO(version),
        });
        const revision: [*:0]const u8 = sdl.SDL_GetRevision();
        std.debug.print("SDL runtime revision: {s}\n", .{revision});
    }
}

fn initSDL() void {
    sdl.SDL_SetMainReady();
    _ = sdl.SDL_SetAppMetadata("No Way", "0.0.0", "this may work!");
    _ = sdl.SDL_Init(sdl.SDL_INIT_VIDEO);
}

fn createInstance(allo: std.mem.Allocator) !vk.Instance {
    const ai = vk.ApplicationInfo{
        .p_next = null,
        .p_application_name = "Mauhlt",
        .application_version = vk.makeApiVersion(0, 1, 0, 0),
        .p_engine_name = "ThunderingHerd",
        .engine_version = vk.makeApiVersion(0, 1, 0, 0),
        .api_version = vk.API_VERSION_1_0, // up to 1.4 - need to use asserts on fns/data that are different version
    };

    var n_req_exts: u32 = 0;
    const extension_names = sdl.SDL_Vulkan_GetInstanceExtensions(&n_req_exts);
    std.debug.assert(n_req_exts > 0);

    var instance_extensions = try std.ArrayList([*:0]const u8).initCapacity(allo, 8);
    defer instance_extensions.deinit();
    try instance_extensions.appendSlice(@ptrCast(extension_names[0..n_req_exts]));

    if (is_debug_mode) printInstanceRequiredExts(&instance_extensions);

    var n_available_exts: u32 = 0;
    try isSuccess(vk.enumerateInstanceExtensionProperties(null, &n_available_exts, null));
    std.debug.assert(n_available_exts > 0);
    var available_extensions: [32]vk.ExtensionProperties = undefined;
    try isSuccess(vk.enumerateInstanceExtensionProperties(null, &n_available_exts, @ptrCast(&available_extensions)));

    if (is_debug_mode) printAvailableInstanceExtensions(available_extensions[0..n_available_exts]);

    blk: for (instance_extensions.items) |instance_extension| {
        const req_ext_name = std.mem.span(instance_extension);
        for (available_extensions) |available_extension| {
            const name = available_extension.extension_name;
            const len = std.mem.indexOfScalar(u8, &name, 0) orelse name.len;
            const available_extension_name = name[0..len];
            if (std.mem.eql(u8, req_ext_name, available_extension_name)) {
                continue :blk;
            }
        }
        std.debug.print("Missing extension: {s}\n", .{req_ext_name});
        return error.MissingRequiredInstanceExtension;
    }

    blk: for (optional_instance_extensions) |instance_extension| {
        const opt_ext_name = std.mem.span(instance_extension);
        for (available_extensions) |available_extension| {
            const name = available_extension.extension_name;
            const len = std.mem.indexOfScalar(u8, &name, 0) orelse name.len;
            const available_extension_name = name[0..len];
            if (std.mem.eql(u8, opt_ext_name, available_extension_name)) {
                try instance_extensions.append(instance_extension);
                continue :blk;
            }
        }
    }

    if (is_debug_mode) printChosenInstanceExtensions(instance_extensions.items);

    const ici = vk.InstanceCreateInfo{
        .p_next = null,
        .flags = .null,
        .p_application_info = &ai,
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
        .enabled_extension_count = @truncate(instance_extensions.items.len),
        .pp_enabled_extension_names = instance_extensions.items.ptr,
    };

    var instance: vk.Instance = undefined;
    try vk.isSuccess(vk.createInstance(&ici, null, &instance));
    return instance;
}

fn createSurface(window: *sdl.SDL_Window, instance: vk.VkInstance) !vk.VkSurfaceKHR {
    var surface: vk.VkSurfaceKHR = undefined;
    if (!sdl.SDL_Vulkan_CreateSurface(window, @ptrCast(instance), null, @ptrCast(&surface))) {
        std.debug.print("Failed to create surface: {s}\n", .{sdl.SDL_GetError()});
        return error.FailedToCreateSurface;
    }
    return surface;
}

fn printInstanceRequiredExts(exts: *std.ArrayList([*:0]const u8)) void {
    std.debug.print("Required Instance Extension:\n", .{});
    for (0..exts.items.len) |i| {
        std.debug.print("\t{s}\n", .{std.mem.span(exts.items[i])});
    }
}

fn printAvailableInstanceExtensions(extensions: []const vk.ExtensionProperties) void {
    std.debug.print("Available Instance Extensions:\n", .{});
    for (extensions) |ext| {
        const name = ext.extension_name;
        const len = std.mem.indexOfScalar(u8, &name, 0) orelse name.len;
        std.debug.print("\t{s}\n", .{name[0..len]});
    }
}

fn printChosenInstanceExtensions(extensions: [][*:0]const u8) void {
    std.debug.print("Chosen Instance Extensions:\n", .{});
    for (extensions) |extension| {
        const name = std.mem.span(extension);
        std.debug.print("\t{s}\n", .{name});
    }
}

fn pickPhysicalDevice(instance: vk.Instance, surface: vk.SurfaceKHR) !vk.PhysicalDevice {
    var n_devices: u32 = 0;
    try isSuccess(vk.vkEnumeratePhysicalDevices(instance, &n_devices, null));
    if (n_devices == 0) return error.FailedToVulkanSupportingGPUs;

    var devices: [16]vk.VkPhysicalDevice = undefined;
    try isSuccess(vk.vkEnumeratePhysicalDevices(instance, &n_devices, &devices));

    if (is_debug_mode) try printDeviceExtensions(devices[0]);
    if (is_debug_mode) std.debug.print("Device Scores:\n", .{});

    var max_score: i32 = std.math.minInt(i32); // device = highest score
    var index: ?usize = null;
    for (devices[0..n_devices], 0..) |device, i| {
        if (!(isDeviceSuitable(surface, device) catch continue)) continue;

        // Get device props + feats outside fn for printing values in debug mode
        var props: vk.VkPhysicalDeviceProperties = undefined;
        vk.vkGetPhysicalDeviceProperties(device, &props);
        var feats: vk.VkPhysicalDeviceFeatures = undefined;
        vk.vkGetPhysicalDeviceFeatures(device, &feats);

        const score = rateDeviceSuitability(&props, &feats);

        if (is_debug_mode) {
            const device_name_len = std.mem.indexOfScalar(u8, &props.deviceName, 0) orelse props.deviceName.len;
            const device_name = props.deviceName[0..device_name_len];
            std.debug.print("\t{s}: {}\n", .{ device_name, score });
        }

        if (score > max_score) {
            max_score = score;
            index = i;
        }
    }

    if (index) |ind| {
        if (is_debug_mode) {
            var props: vk.VkPhysicalDeviceProperties = undefined;
            vk.vkGetPhysicalDeviceProperties(devices[ind], &props);
            const device_name_len = std.mem.indexOfScalar(u8, &props.deviceName, 0) orelse props.deviceName.len;
            const device_name = props.deviceName[0..device_name_len];
            std.debug.print("Device Chosen: {s}\n", .{device_name});
        }
        return devices[ind];
    }

    return error.NoSuitableGPUFound;
}

fn isDeviceSuitable(
    surface: vk.VkSurfaceKHR,
    device: vk.VkPhysicalDevice,
) !bool {
    const are_extensions_supported = checkDeviceExtensionSupport(device) catch return false;
    if (is_debug_mode) std.debug.print("Are extensions supported? {}\n", .{are_extensions_supported});
    if (!are_extensions_supported) return false;

    const are_queues_complete = QFI.findQueueFamilies(surface, device).isComplete();
    if (is_debug_mode) std.debug.print("Are queues complete? {}\n", .{are_queues_complete});

    const is_swapchain_adequate = try SSD.isSwapchainAdequate(surface, device);
    if (is_debug_mode) std.debug.print("Is swapchain adequate? {}\n", .{is_swapchain_adequate});

    return are_queues_complete and is_swapchain_adequate;
}

fn printDeviceExtensions(device: vk.VkPhysicalDevice) !void {
    std.debug.print("Required Device Extensions:\n", .{});
    for (required_device_extensions) |rde| {
        const name = std.mem.span(rde);
        std.debug.print("\t{s}\n", .{name});
    }

    var n_exts: u32 = 0;
    try isSuccess(vk.vkEnumerateDeviceExtensionProperties(device, null, &n_exts, null));
    std.debug.assert(n_exts > 0);

    var available_device_extensions: [128]vk.VkExtensionProperties = undefined; // init to alternating 1s and 0s
    try isSuccess(vk.vkEnumerateDeviceExtensionProperties(
        device,
        null,
        &n_exts,
        available_device_extensions[0..n_exts].ptr,
    ));

    std.debug.print("Available Device Extensions:\n", .{});
    for (available_device_extensions[0..n_exts]) |extension| {
        const name = extension.extensionName;
        const ext_name_len = std.mem.indexOfScalar(u8, &name, 0) orelse name.len;
        const ext_name = name[0..ext_name_len];
        std.debug.print("\t{s}\n", .{ext_name});
    }
}

fn checkDeviceExtensionSupport(device: vk.VkPhysicalDevice) !bool {
    var n_exts: u32 = 0;
    try isSuccess(vk.vkEnumerateDeviceExtensionProperties(device, null, &n_exts, null));
    std.debug.assert(n_exts > 0);

    var available_device_extensions: [128]vk.VkExtensionProperties = undefined; // init to alternating 1s and 0s
    try isSuccess(vk.vkEnumerateDeviceExtensionProperties(
        device,
        null,
        &n_exts,
        available_device_extensions[0..n_exts].ptr,
    ));

    blk: for (required_device_extensions) |req_ext| {
        const req_ext_name = std.mem.span(req_ext);
        for (available_device_extensions[0..n_exts]) |extension| {
            const name = extension.extensionName;
            const ext_name_len = std.mem.indexOfScalar(u8, &name, 0) orelse name.len;
            const ext_name = name[0..ext_name_len];
            if (std.mem.eql(u8, req_ext_name, ext_name)) continue :blk;
        }
        std.debug.print("Missing required device extension: {s}\n", .{req_ext_name});
        return error.MissingRequiredDeviceExtension;
    }

    return true;
}

fn rateDeviceSuitability(
    props: *const vk.VkPhysicalDeviceProperties,
    feats: *const vk.VkPhysicalDeviceFeatures,
) i32 {
    var score: i32 = 0;

    score += switch (props.deviceType) {
        vk.VK_PHYSICAL_DEVICE_TYPE_OTHER => 0,
        vk.VK_PHYSICAL_DEVICE_TYPE_INTEGRATED_GPU => 100,
        vk.VK_PHYSICAL_DEVICE_TYPE_DISCRETE_GPU => 1000,
        vk.VK_PHYSICAL_DEVICE_TYPE_VIRTUAL_GPU => 10,
        vk.VK_PHYSICAL_DEVICE_TYPE_CPU => 1,
        else => unreachable,
    };

    score += @intCast(props.limits.maxImageDimension2D);
    score += @as(i32, @intCast(props.limits.maxImageDimension3D)) * 8; // prefer 3d
    //
    // required features
    if (feats.geometryShader == 0) return 0;

    return score;
}

fn createLogicalDevice(
    surface: vk.VkSurfaceKHR,
    physical_device: vk.VkPhysicalDevice,
) !vk.VkDevice {
    const qfi = QFI.findQueueFamilies(surface, physical_device);
    const float_priority = [1]f32{1.0};
    const qcis = [_]vk.VkDeviceQueueCreateInfo{
        .{
            .sType = vk.VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO,
            .queueFamilyIndex = qfi.graphics_family.?,
            .queueCount = 1,
            .pQueuePriorities = &float_priority,
        },
        .{
            .sType = vk.VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO,
            .queueFamilyIndex = qfi.present_family.?,
            .queueCount = 1,
            .pQueuePriorities = &float_priority,
        },
    };

    const is_same_family = qfi.graphics_family.? == qfi.present_family.?;
    const feats: vk.VkPhysicalDeviceFeatures = undefined;

    const dci = vk.VkDeviceCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO,
        .queueCreateInfoCount = if (is_same_family) 1 else @truncate(qcis.len),
        .pQueueCreateInfos = if (is_same_family) &qcis[0] else &qcis,
        .pEnabledFeatures = &feats,
        .enabledExtensionCount = @truncate(required_device_extensions.len),
        .ppEnabledExtensionNames = &required_device_extensions,
        .enabledLayerCount = 0,
        .ppEnabledLayerNames = null,
    };

    var device: vk.VkDevice = undefined;
    try isSuccess(vk.vkCreateDevice(physical_device, &dci, null, &device));
    return device;
}

const QueueMode = enum(u1) {
    graphics = 0,
    present = 1,
};

fn createQueue(
    surface: vk.VkSurfaceKHR,
    physical_device: vk.VkPhysicalDevice,
    device: vk.VkDevice,
    mode: QueueMode,
) vk.VkQueue {
    const qfi = QFI.findQueueFamilies(surface, physical_device);

    if (is_debug_mode) {
        std.debug.assert(qfi.isComplete());
        switch (mode) {
            .graphics => std.debug.print("Graphics Queue: {}\n", .{qfi.graphics_family.?}),
            .present => std.debug.print("Present Queue: {}\n", .{qfi.present_family.?}),
        }
    }

    var queue: vk.VkQueue = undefined;
    switch (mode) {
        .graphics => vk.vkGetDeviceQueue(device, qfi.graphics_family.?, 0, &queue),
        .present => vk.vkGetDeviceQueue(device, qfi.present_family.?, 0, &queue),
    }
    return queue;
}

fn createSwapchain(
    allo: Allocator,
    surface: vk.VkSurfaceKHR,
    physical_device: vk.VkPhysicalDevice,
    device: vk.VkDevice,
    width: i32,
    height: i32,
) !vk.VkSwapchainKHR {
    var ssd = try SSD.init(allo, surface, physical_device);
    defer ssd.deinit(allo);

    const format = ssd.chooseSwapSurfaceFormat();
    const present_mode = ssd.chooseSwapPresentMode();
    const extent = ssd.chooseSwapExtent(width, height);
    // if (is_debug_mode) std.debug.print("Extent: {any}\n", .{extent});

    const min = ssd.capabilities.minImageCount + 1;
    const max = ssd.capabilities.maxImageCount;
    const n_images = if (max != 0) @min(max, min) else min;
    // if (is_debug_mode) std.debug.print("Swapchain # of Images: {}\n", .{n_images});

    const qfi = QFI.findQueueFamilies(surface, physical_device);
    std.debug.assert(qfi.isComplete());
    const is_same_family = qfi.graphics_family.? == qfi.present_family.?;

    const sci = vk.VkSwapchainCreateInfoKHR{
        .sType = vk.VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR,
        .surface = surface,

        .minImageCount = n_images,
        .imageFormat = format.format,
        .imageColorSpace = format.colorSpace,
        .imageExtent = extent,
        .imageArrayLayers = 1,
        .imageUsage = vk.VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT,

        .imageSharingMode = if (is_same_family) vk.VK_SHARING_MODE_EXCLUSIVE else vk.VK_SHARING_MODE_CONCURRENT,
        .queueFamilyIndexCount = if (is_same_family) 1 else 2,
        .pQueueFamilyIndices = if (is_same_family) &[1]u32{qfi.graphics_family.?} else &[2]u32{ qfi.graphics_family.?, qfi.present_family.? },

        .preTransform = ssd.capabilities.currentTransform,
        .compositeAlpha = vk.VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR,
        .presentMode = present_mode,
        .clipped = 1,

        .oldSwapchain = null,
    };

    var swapchain: vk.VkSwapchainKHR = undefined;
    try isSuccess(vk.vkCreateSwapchainKHR(device, &sci, null, &swapchain));
    return swapchain;
}

fn recreateSwapchain(self: *Self) !void {
    // set window resize flag to false
    self.resize = false;

    // resize window -> wait for size to become non zero -> cleanup engine
    var width: i32, var height: i32 = .{ 0, 0 };
    _ = sdl.SDL_GetWindowSize(self.window, &width, &height);

    // don't update game while minimized
    // in c, null == 0 is truthy, so following works - yuck
    // rather than doing this - more optimal to return and allow computer to wait on new events and do nothing = less work overall
    while (width == 0 and height == 0) {
        if (!sdl.SDL_GetWindowSize(self.window, &width, &height)) return;
        _ = sdl.SDL_WaitEvent(null);
    }
    // if (width == 0 or height == 0) return; // seems more efficient to return to regular polling rather than above

    // idle device for awhile
    try isSuccess(vk.vkDeviceWaitIdle(self.device));
    self.cleanupSwapchain();

    self.swapchain = try createSwapchain(self.allo, self.surface, self.physical_device, self.device, width, height);
    // WARNING: will break if n_images changes after new swapchain created
    var n_images: u32 = @truncate(self.images.len);
    try getSwapchainImages(self.device, self.swapchain, &n_images, self.images); // do i need to reobtain the images?
    try createImageViews(self.device, self.images, self.format, self.views);
    self.extent = vk.VkExtent2D{
        .width = @intCast(width),
        .height = @intCast(height),
    };
    try createFramebuffers(self.device, self.extent, self.views, self.render_pass, self.frame_buffers);
}

fn cleanupSwapchain(self: *Self) void {
    // destroy the data but keep the memory - can i just revalue the data to undefined? - try it
    defer vk.vkDestroySwapchainKHR(self.device, self.swapchain, null);
    for (self.frame_buffers, self.views) |frame_buffer, view| {
        defer vk.vkDestroyImageView(self.device, view, null);
        defer vk.vkDestroyFramebuffer(self.device, frame_buffer, null);
    }
}

fn getNumberOfSwapchainImages(
    device: vk.VkDevice,
    swapchain: vk.VkSwapchainKHR,
) !u32 {
    var n_images: u32 = 0;
    try isSuccess(vk.vkGetSwapchainImagesKHR(device, swapchain, &n_images, null));
    std.debug.assert(n_images > 0);
    if (is_debug_mode) std.debug.print("# of Images: {}\n", .{n_images});
    return n_images;
}

fn getSwapchainImages(
    device: vk.VkDevice,
    swapchain: vk.VkSwapchainKHR,
    n_images: *u32,
    images: []vk.VkImage,
) !void {
    try isSuccess(vk.vkGetSwapchainImagesKHR(device, swapchain, n_images, images.ptr));
}

fn createImageViews(
    device: vk.VkDevice,
    images: []vk.VkImage,
    format: vk.VkFormat,
    views: []vk.VkImageView,
) !void {
    for (images, views) |image, *view| {
        const ivci = vk.VkImageViewCreateInfo{
            .sType = vk.VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO,
            .pNext = null,
            .image = image,
            .viewType = vk.VK_IMAGE_VIEW_TYPE_2D,
            .format = format,
            .components = .{
                .r = vk.VK_COMPONENT_SWIZZLE_IDENTITY,
                .g = vk.VK_COMPONENT_SWIZZLE_IDENTITY,
                .b = vk.VK_COMPONENT_SWIZZLE_IDENTITY,
                .a = vk.VK_COMPONENT_SWIZZLE_IDENTITY,
            },
            .subresourceRange = .{
                .aspectMask = vk.VK_IMAGE_ASPECT_COLOR_BIT,
                .baseMipLevel = 0,
                .levelCount = 1,
                .baseArrayLayer = 0,
                .layerCount = 1,
            },
        };
        try isSuccess(vk.vkCreateImageView(device, &ivci, null, view));
    }
}

fn createShaderModule(
    device: vk.VkDevice,
    comptime N: u32,
    code: *align(4) const [N:0]u8,
) !vk.VkShaderModule {
    const smci = vk.VkShaderModuleCreateInfo{
        .codeSize = N,
        .pCode = @ptrCast(code),
    };

    var shader_module: vk.VkShaderModule = undefined;
    try isSuccess(vk.vkCreateShaderModule(device, &smci, null, &shader_module));
    return shader_module;
}

fn createGraphicsPipelineLayout(
    device: vk.VkDevice,
    descriptor_set_layouts: []const vk.VkDescriptorSetLayout,
) !vk.VkPipelineLayout {
    const plci = vk.VkPipelineLayoutCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO,

        .setLayoutCount = @truncate(descriptor_set_layouts.len),
        .pSetLayouts = descriptor_set_layouts.ptr,

        .pushConstantRangeCount = 0,
        .pPushConstantRanges = null,
    };

    var layout: vk.VkPipelineLayout = undefined;
    try isSuccess(vk.vkCreatePipelineLayout(device, &plci, null, &layout));
    return layout;
}

fn createRenderPass(device: vk.VkDevice, format: vk.VkFormat) !vk.VkRenderPass {
    const color_attachment = [1]vk.VkAttachmentDescription{
        .{
            .format = format,
            .samples = vk.VK_SAMPLE_COUNT_1_BIT,
            .loadOp = vk.VK_ATTACHMENT_LOAD_OP_CLEAR,
            .storeOp = vk.VK_ATTACHMENT_STORE_OP_STORE,
            .stencilLoadOp = vk.VK_ATTACHMENT_LOAD_OP_DONT_CARE,
            .stencilStoreOp = vk.VK_ATTACHMENT_STORE_OP_DONT_CARE,
            .initialLayout = vk.VK_IMAGE_LAYOUT_UNDEFINED,
            .finalLayout = vk.VK_IMAGE_LAYOUT_PRESENT_SRC_KHR,
        },
    };

    const color_attachment_refs = [1]vk.VkAttachmentReference{
        .{
            .attachment = 0,
            .layout = vk.VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
        },
    };

    const subpasses = [1]vk.VkSubpassDescription{
        .{
            .pipelineBindPoint = vk.VK_PIPELINE_BIND_POINT_GRAPHICS,
            .colorAttachmentCount = @truncate(color_attachment_refs.len),
            .pColorAttachments = &color_attachment_refs,
        },
    };

    const dependencies = [1]vk.VkSubpassDependency{
        .{
            .srcSubpass = vk.VK_SUBPASS_EXTERNAL,
            .dstSubpass = 0,
            .srcStageMask = vk.VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT,
            .srcAccessMask = 0,
            .dstStageMask = vk.VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT,
            .dstAccessMask = vk.VK_ACCESS_COLOR_ATTACHMENT_WRITE_BIT,
        },
    };

    const rpci = vk.VkRenderPassCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO,
        .attachmentCount = @truncate(color_attachment.len),
        .pAttachments = &color_attachment,
        .subpassCount = @truncate(subpasses.len), // should be based on machine - not default to truncate
        .pSubpasses = &subpasses,
        .dependencyCount = @truncate(dependencies.len),
        .pDependencies = &dependencies,
    };

    var render_pass: vk.VkRenderPass = undefined;
    try isSuccess(vk.vkCreateRenderPass(device, &rpci, null, &render_pass));
    return render_pass;
}

fn createDescriptorSetLayout(device: vk.VkDevice) !vk.VkDescriptorSetLayout {
    // in the future, pass this into the fn to generate the descriptor set layout
    const dslb = [_]vk.VkDescriptorSetLayoutBinding{
        .{
            .binding = 0,
            .descriptorCount = 1,
            .descriptorType = vk.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,
            .pImmutableSamplers = null,
            .stageFlags = vk.VK_SHADER_STAGE_VERTEX_BIT,
        },
    };

    const dslci = vk.VkDescriptorSetLayoutCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO,
        .bindingCount = @truncate(dslb.len),
        .pBindings = &dslb,
    };

    var descriptor_set_layout: vk.VkDescriptorSetLayout = undefined;
    try isSuccess(vk.vkCreateDescriptorSetLayout(device, &dslci, null, &descriptor_set_layout));
    return descriptor_set_layout;
}

fn createGraphicsPipelines(
    device: vk.VkDevice,
    layout: vk.VkPipelineLayout,
    render_pass: vk.VkRenderPass,
) !vk.VkPipeline {
    std.debug.assert(vert_spv.len > 0);
    std.debug.assert(frag_spv.len > 0);
    if (is_debug_mode) {
        std.debug.print("Vert Spv Len: {}\n", .{vert_spv.len});
        std.debug.print("Frag Spv Len: {}\n", .{frag_spv.len});
    }

    const vert = try createShaderModule(device, @truncate(vert_spv.len), &vert_spv);
    const frag = try createShaderModule(device, @truncate(frag_spv.len), &frag_spv);

    defer vk.vkDestroyShaderModule(device, vert, null);
    defer vk.vkDestroyShaderModule(device, frag, null);

    const shader_stages = [2]vk.VkPipelineShaderStageCreateInfo{
        .{ // vert
            .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
            .stage = vk.VK_SHADER_STAGE_VERTEX_BIT,
            .module = vert,
            .pName = "main",
        },
        .{ // frag
            .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
            .stage = vk.VK_SHADER_STAGE_FRAGMENT_BIT,
            .module = frag,
            .pName = "main",
        },
    };

    const binding_description = Vertex.binding_description;
    const attribute_descriptions = Vertex.attribute_descriptions;

    const vertex_input_info = vk.VkPipelineVertexInputStateCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,
        .vertexBindingDescriptionCount = @truncate(binding_description.len),
        .pVertexBindingDescriptions = &binding_description,
        .vertexAttributeDescriptionCount = @truncate(attribute_descriptions.len),
        .pVertexAttributeDescriptions = &attribute_descriptions,
    };

    const input_assembly = vk.VkPipelineInputAssemblyStateCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO,
        .topology = vk.VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST,
        .primitiveRestartEnable = 0,
    };

    // const viewport = vk.VkViewport{
    //     .x = 0,
    //     .y = 0,
    //     .width = @as(f32, @floatFromInt(extent.width)),
    //     .height = @as(f32, @floatFromInt(extent.height)),
    //     .minDepth = 0,
    //     .maxDepth = 0,
    // };

    // const scissor = vk.VkRect2D{
    //     .offset = vk.VkOffset2D{ .x = 0, .y = 0 },
    //     .extent = extent,
    // };

    const viewport_state = vk.VkPipelineViewportStateCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO,
        .viewportCount = 1,
        // .pViewports = @ptrCast(&viewport),
        .scissorCount = 1,
        // .pScissors = @ptrCast(&scissor),
    };

    const rasterizer = vk.VkPipelineRasterizationStateCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO,
        .depthClampEnable = 0,
        .rasterizerDiscardEnable = 0,
        .polygonMode = vk.VK_POLYGON_MODE_FILL,
        .lineWidth = 1.0,
        .cullMode = vk.VK_CULL_MODE_BACK_BIT, // vk.VK_CULL_MODE_FRONT_BIT, // defines what is culled - front or back
        .frontFace = vk.VK_FRONT_FACE_COUNTER_CLOCKWISE, // vk.VK_FRONT_FACE_CLOCKWISE, defines what is front/back
        .depthBiasEnable = 0,
        // .depthBiasConstantFactor = 0.0,
        // .depthBiasClamp = 0.0,
        // .depthBiasSlopeFactor = 0.0,
    };

    const multisampling = vk.VkPipelineMultisampleStateCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO,
        .sampleShadingEnable = 0,
        .rasterizationSamples = vk.VK_SAMPLE_COUNT_1_BIT,
        .minSampleShading = 1.0,
        .pSampleMask = null,
        .alphaToCoverageEnable = 0,
        .alphaToOneEnable = 0,
    };

    const color_blend_attachments = [1]vk.VkPipelineColorBlendAttachmentState{
        .{
            .colorWriteMask = vk.VK_COLOR_COMPONENT_R_BIT | vk.VK_COLOR_COMPONENT_G_BIT | vk.VK_COLOR_COMPONENT_B_BIT | vk.VK_COLOR_COMPONENT_A_BIT,
            .blendEnable = 0,
            .srcColorBlendFactor = vk.VK_BLEND_FACTOR_ONE,
            .dstColorBlendFactor = vk.VK_BLEND_FACTOR_ZERO,
            .colorBlendOp = vk.VK_BLEND_OP_ADD,
            .srcAlphaBlendFactor = vk.VK_BLEND_FACTOR_ONE,
            .dstAlphaBlendFactor = vk.VK_BLEND_FACTOR_ONE,
            .alphaBlendOp = vk.VK_BLEND_OP_ADD,
        },
    };

    const color_blending = vk.VkPipelineColorBlendStateCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO,
        .logicOpEnable = 0,
        .logicOp = vk.VK_LOGIC_OP_COPY,
        .attachmentCount = @truncate(color_blend_attachments.len),
        .pAttachments = &color_blend_attachments,
        .blendConstants = [4]f32{ 0, 0, 0, 0 },
    };

    const dynamic_states = [2]vk.VkDynamicState{
        vk.VK_DYNAMIC_STATE_VIEWPORT,
        vk.VK_DYNAMIC_STATE_SCISSOR,
    };

    const dynamic_state = vk.VkPipelineDynamicStateCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO,
        .dynamicStateCount = @truncate(dynamic_states.len),
        .pDynamicStates = &dynamic_states,
    };

    const gpci = [1]vk.VkGraphicsPipelineCreateInfo{
        .{
            .sType = vk.VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO,
            .stageCount = @truncate(shader_stages.len),
            .pStages = &shader_stages,
            .pVertexInputState = &vertex_input_info,
            .pInputAssemblyState = &input_assembly,
            .pViewportState = &viewport_state,
            .pRasterizationState = &rasterizer,
            .pMultisampleState = &multisampling,
            .pDepthStencilState = null,
            .pColorBlendState = &color_blending,
            .pDynamicState = &dynamic_state,
            .layout = layout,
            .renderPass = render_pass,
            .subpass = 0,
            .basePipelineHandle = null,
            .basePipelineIndex = -1,
        },
    };

    var pipeline: vk.VkPipeline = undefined;
    try isSuccess(vk.vkCreateGraphicsPipelines(device, null, @truncate(gpci.len), &gpci, null, &pipeline));
    return pipeline;
}

fn createFramebuffers(
    device: vk.VkDevice,
    extent: vk.VkExtent2D,
    views: []vk.VkImageView,
    render_pass: vk.VkRenderPass,
    frame_buffers: []vk.VkFramebuffer,
) !void {
    for (views, frame_buffers) |view, *frame_buffer| {
        const attachments = [_]vk.VkImageView{view};

        const fci = vk.VkFramebufferCreateInfo{
            .sType = vk.VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO,
            .renderPass = render_pass,
            .attachmentCount = @truncate(attachments.len),
            .pAttachments = @ptrCast(&attachments),
            .width = extent.width,
            .height = extent.height,
            .layers = 1,
        };

        try isSuccess(vk.vkCreateFramebuffer(device, &fci, null, frame_buffer));
    }
}

fn createCommandPool(
    surface: vk.VkSurfaceKHR,
    physical_device: vk.VkPhysicalDevice,
    device: vk.VkDevice,
) !vk.VkCommandPool {
    const qfi = QFI.findQueueFamilies(surface, physical_device);

    const cpci = vk.VkCommandPoolCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO,
        .flags = vk.VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT,
        .queueFamilyIndex = qfi.graphics_family.?,
    };

    var command_pool: vk.VkCommandPool = undefined;
    try isSuccess(vk.vkCreateCommandPool(device, &cpci, null, &command_pool));
    return command_pool;
}

fn createTextureImage(
    physical_device: vk.VkPhysicalDevice,
    device: vk.VkDevice,
    texture_image: vk.VkImage,
    texture_image_memory: vk.VkDeviceMemory,
) !void {
    var width: i32, var height: i32, var channels: i32 = .{ undefined, undefined, undefined };
    const pixels = zstbi.load("textures/texture.jpg", &width, &height, &channels, zstbi.STBI_rgb_alpha);
    defer zstbi.free(pixels);

    const image_size: vk.VkDeviceSize = width * height * 4;
    if (!pixels) {
        return error.FailedToLoadTextureImage;
    }

    // buffers
    var staging_buffer: vk.VkBuffer = undefined;
    var staging_buffer_memory: vk.VkBufferMemory = undefined;
    try createBuffer(
        physical_device,
        device,
        image_size,
        vk.VK_BUFFER_USAGE_TRANSFER_SRC_BIT,
        vk.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | vk.VK_MEMORY_PROPERTY_HOST_COHERENT_BIT,
        &staging_buffer,
        &staging_buffer_memory,
    );

    {
        var data = ?*anyopaque;
        vk.vkMapMemory(device, staging_buffer_memory, 0, image_size, 0, &data);
        vk.vkUnmapMemory(device, staging_buffer_memory);

        const T = @TypeOf(pixels);
        const image_data: [*]T = @ptrCast(@alignCast(data));
        @memcpy(image_data, pixels);
    }

    createImage(
        width,
        height,
        vk.VK_FORMAT_R8G8B8A8_SRGB,
        vk.VK_IMAGE_TILING_OPTIMAL,
        vk.VK_IMAGE_USAGE_TRANSFER_DST_BIT | vk.VK_IMAGE_USAGE_SAMPLED_BIT,
        vk.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT,
        texture_image,
        texture_image_memory,
    );

    transitionImageLayout(texture_image, vk.VK_FORMAT_R8G8B8A8_SRGB, vk.VK_IMAGE_LAYOUT_UNDEFINED, vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL);
    copyBufferToImage(staging_buffer, texture_image, @as(u32, width), @as(u32, height));
    transitionImageLayout(texture_image, vk.VK_FORMAT_R8G8B8A8_SRGB, vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, vk.VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL);

    vk.vkDestroyBuffer(device, staging_buffer, null);
    vk.vkFreeMemory(device, staging_buffer_memory, null);
}

fn createImage(
    device: vk.VkDevice,
    width: u32,
    height: u32,
    format: vk.VkFormat,
    tiling: vk.VkImageTiling,
    usage: vk.VkImageUsageFlags,
    props: vk.VkMemoryPropertyflags,
    texture_image: *vk.VkImage,
    texture_image_memory: *vk.VkDeviceMemory,
) void {
    const ici = vk.VkImageCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO,
        .imageType = vk.VK_IMAGE_TYPE_2D,
        .extent = .{
            .width = width,
            .height = height,
            .depth = 1,
        },
        .mipLevels = 1,
        .arrayLayers = 1,
        .format = format,
        .tiling = tiling,
        .initialLayout = vk.VK_IMAGE_LAYOUT_UNDEFINED,
        .usage = usage,
        .samples = vk.VK_SAMPLE_COUNT_1_BIT,
        .sharingMode = vk.VK_SHARING_MODE_EXCLUSIVE,
    };

    try isSuccess(vk.vkCreateImage(device, &ici, null, &texture_image));

    const mem_reqs: vk.VkMemoryRequirements = undefined;
    vk.vkGetImageMemoryRequirements(device, texture_image, &mem_reqs);

    const mai = vk.vkMemoryAllocateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO,
        .allocationSize = mem_reqs.size,
        .memoryTypeIndex = findMemoryType(mem_reqs.memoryTypeBits, props),
    };

    try isSuccess(vk.vkAllocateMemory(device, &mai, null, &texture_image_memory));

    vk.vkBindImageMemory(device, texture_image, texture_image_memory, 0);
}

fn transitionImageLayout(
    device: vk.VkDevice,
    command_pool: vk.VkCommandPool,
    image: vk.VkImage,
    old_layout: vk.VkImageLayout,
    new_layout: vk.VkImageLayout,
) void {
    const command_buffer: vk.VkCommandBuffer = beginSingleTimeCommands(device, command_pool);

    var barrier = vk.VkImageMemoryBarrier{
        .sType = vk.VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER,
        .oldLayout = old_layout,
        .newLayout = new_layout,
        .srcQueueFamilyIndex = vk.VK_QUEUE_FAMILY_IGNORED,
        .dstQueueFamilyIndex = vk.VK_QUEUE_FAMILY_IGNORED,
        .image = image,
        .subresourceRange = .{
            .aspectMask = vk.VK_IMAGE_ASPECT_COLOR_BIT,
            .baseMipLevel = 0,
            .levelCount = 1,
            .baseArrayLayer = 0,
            .layerCount = 1,
        },
    };

    var src_stage: vk.VkPipelineStageFlags = undefined;
    var dst_stage: vk.VkPipelineStageFlags = undefined;

    // make below branchless in the future or use switch statement or something
    if (old_layout == vk.VK_IMAGE_LAYOUT_UNDEFINED and new_layout == vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL) {
        barrier.srcAccessMask = 0;
        barrier.dstAccessMask = vk.VK_ACCESS_TRANSFER_WRITE_BIT;

        src_stage = vk.VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT;
        dst_stage = vk.VK_PIPELINE_STAGE_TRANSFER_BIT;
    } else if (old_layout == vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL and new_layout == vk.VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL) {
        barrier.srcAccessMask = vk.VK_ACCESS_TRANSFER_WRITE_BIT;
        barrier.dstAccessMsak = vk.VK_ACCESS_SHADER_READ_BIT;

        src_stage = vk.VK_PIPELINE_STAGE_TRANSFER_BIT;
        dst_stage = vk.VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT;
    } else {
        return error.UnsupportedLayerTransition;
    }

    vk.vkCmdPipelineBarrier(command_buffer, src_stage, dst_stage, 0, 0, null, 0, null, 1, &barrier);
    endSingleTimeCommands(command_buffer);
}

// need to optimize this code better
fn copyBufferToImage(
    device: vk.VkDevice,
    graphics_queue: vk.VkQueue,
    command_pool: vk.VkCommandPool,
    buffer: vk.VkBuffer,
    image: vk.VkImage,
    width: u32,
    height: u32,
) void {
    const command_buffer: vk.VkCommandBuffer = beginSingleTimeCommands();

    const region = vk.VkBufferImageCopy{
        .bufferOffset = 0,
        .bufferRowLength = 0,
        .bufferImageHeight = 0,
        .imageSubresource = .{
            .aspectMask = vk.VK_IMAGE_ASPECT_COLOR_BIT,
            .mipLevel = 0,
            .baseArrayLayer = 0,
            .layerCount = 1,
        },
        .imageOffset = .{ 0, 0, 0 },
        .imageExtent = .{
            .width = width,
            .height = height,
            .depth = 1,
        },
    };

    vk.vkCmdCopyBufferToImage(command_buffer, buffer, image, vk.VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &region);
    endSingleTimeCommands(
        device,
        graphics_queue,
        command_pool,
        command_buffer,
    );
}

// Move these fns to above copy buffer
fn beginSingleTimeCommands(
    device: vk.VkDevice,
    command_pool: vk.VkCommandPool,
) void {
    const ai = vk.VkCommandBufferAllocateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO,
        .level = vk.VK_COMMAND_BUFFER_LEVEL_PRIMARY,
        .commandPool = command_pool,
        .commandBufferCount = 1,
    };

    var command_buffer: vk.VkCommandBuffer = undefined;
    vk.vkAllocateCommandBuffers(device, &ai, &command_buffer);

    const bi = vk.VkBeginInfo{
        .sType = vk.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
        .flags = vk.VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT,
    };
    vk.vkBeginCommandBuffer(command_buffer, &bi);

    return command_buffer;
}

fn endSingleTimeCommands(
    device: vk.VkDevice,
    graphics_queue: vk.VkQueue,
    command_pool: vk.VkCommandPool,
    command_buffer: vk.VkCommandBuffer,
) void {
    vk.vkEndCommandBuffer(command_buffer);

    const command_buffers = [_]vk.VkCommandBuffer{command_buffer};
    const si = vk.VkSubmitInfo{
        .sType = vk.VK_STRUCTURE_TYPE_SUBMIT_INFO,
        .commandBufferCount = @truncate(command_buffers.len),
        .pCommandBuffers = &command_buffers,
    };

    vk.vkQueueSubmit(graphics_queue, 1, &si, null);
    vk.vkQueueWaitIdle(graphics_queue);

    vk.vkFreeCommandBuffers(device, command_pool, 1, &command_buffer);
}

fn createVertexBuffer(
    physical_device: vk.VkPhysicalDevice,
    device: vk.VkDevice,
    vertex_buffer: *vk.VkBuffer,
    vertex_buffer_memory: *vk.VkDeviceMemory,
    pool: vk.VkCommandPool,
    graphics_queue: vk.VkQueue,
    vertices: []const Vertex,
) !void {
    const buffer_size: vk.VkDeviceSize = @sizeOf(Vertex) * vertices.len;

    var staging_buffer: vk.VkBuffer = undefined;
    var staging_buffer_memory: vk.VkDeviceMemory = undefined;
    try createBuffer(
        physical_device,
        device,
        buffer_size,
        vk.VK_BUFFER_USAGE_TRANSFER_SRC_BIT,
        vk.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | vk.VK_MEMORY_PROPERTY_HOST_COHERENT_BIT,
        &staging_buffer,
        &staging_buffer_memory,
    );

    {
        var data: ?*anyopaque = undefined;
        try isSuccess(vk.vkMapMemory(device, staging_buffer_memory, 0, buffer_size, 0, &data));
        defer vk.vkUnmapMemory(device, staging_buffer_memory);

        var gpu_vertices: [*]Vertex = @ptrCast(@alignCast(data));
        @memcpy(gpu_vertices[0..vertices.len], vertices);
    }

    try createBuffer(
        physical_device,
        device,
        buffer_size,
        vk.VK_BUFFER_USAGE_TRANSFER_DST_BIT | vk.VK_BUFFER_USAGE_VERTEX_BUFFER_BIT,
        vk.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT,
        vertex_buffer,
        vertex_buffer_memory,
    );

    try copyBuffer(device, staging_buffer, vertex_buffer.*, buffer_size, pool, graphics_queue);

    vk.vkDestroyBuffer(device, staging_buffer, null);
    vk.vkFreeMemory(device, staging_buffer_memory, null);
}

fn createBuffer(
    physical_device: vk.VkPhysicalDevice,
    device: vk.VkDevice,
    size: vk.VkDeviceSize,
    usage: vk.VkBufferUsageFlags,
    props: vk.VkMemoryPropertyFlags,
    buffer: *vk.VkBuffer,
    buffer_memory: *vk.VkDeviceMemory,
) !void {
    // create buffer
    const bci = vk.VkBufferCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO,
        .size = size,
        .usage = usage,
        .sharingMode = vk.VK_SHARING_MODE_EXCLUSIVE,
    };
    try isSuccess(vk.vkCreateBuffer(device, &bci, null, buffer));

    // create memory
    var mem_reqs: vk.VkMemoryRequirements = undefined;
    vk.vkGetBufferMemoryRequirements(device, buffer.*, &mem_reqs);

    const mai = vk.VkMemoryAllocateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO,
        .allocationSize = mem_reqs.size,
        .memoryTypeIndex = try findMemoryType(
            physical_device,
            mem_reqs.memoryTypeBits,
            props,
        ),
    };
    try isSuccess(vk.vkAllocateMemory(device, &mai, null, @ptrCast(buffer_memory)));

    try isSuccess(vk.vkBindBufferMemory(device, buffer.*, buffer_memory.*, 0));
}

fn copyBuffer(
    device: vk.VkDevice,
    src_buffer: vk.VkBuffer,
    dst_buffer: vk.VkBuffer,
    size: vk.VkDeviceSize,
    pool: vk.VkCommandPool,
    graphics_queue: vk.VkQueue,
) !void {
    const cbai = vk.VkCommandBufferAllocateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO,
        .level = vk.VK_COMMAND_BUFFER_LEVEL_PRIMARY,
        .commandPool = pool,
        .commandBufferCount = 1,
    };
    var command_buffer: vk.VkCommandBuffer = undefined;
    try isSuccess(vk.vkAllocateCommandBuffers(device, &cbai, &command_buffer));

    const cbbi = vk.VkCommandBufferBeginInfo{
        .sType = vk.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
        .flags = vk.VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT,
    };
    try isSuccess(vk.vkBeginCommandBuffer(command_buffer, &cbbi));

    {
        var copy_region = vk.VkBufferCopy{
            .srcOffset = 0,
            .dstOffset = 0,
            .size = size,
        };
        vk.vkCmdCopyBuffer(command_buffer, src_buffer, dst_buffer, 1, &copy_region);
    }

    try isSuccess(vk.vkEndCommandBuffer(command_buffer));

    const si = vk.VkSubmitInfo{
        .sType = vk.VK_STRUCTURE_TYPE_SUBMIT_INFO,
        .commandBufferCount = 1,
        .pCommandBuffers = &command_buffer,
    };

    try isSuccess(vk.vkQueueSubmit(graphics_queue, 1, &si, null));
    try isSuccess(vk.vkQueueWaitIdle(graphics_queue));

    vk.vkFreeCommandBuffers(device, pool, 1, &command_buffer);
}

fn findMemoryType(
    physical_device: vk.VkPhysicalDevice,
    type_filter: u32,
    props: vk.VkMemoryPropertyFlags,
) !u32 {
    var mem_props: vk.VkPhysicalDeviceMemoryProperties = undefined;
    vk.vkGetPhysicalDeviceMemoryProperties(physical_device, &mem_props);

    for (0..mem_props.memoryTypeCount) |i| {
        if ((type_filter & (@as(u32, 1) << @truncate(i))) > 0 and mem_props.memoryTypes[i].propertyFlags & props == props) {
            return @truncate(i);
        }
    }

    return error.FailedToFindSuitableMemoryType;
}

fn createIndexBuffer(
    physical_device: vk.VkPhysicalDevice,
    device: vk.VkDevice,
    index_buffer: *vk.VkBuffer,
    index_buffer_memory: *vk.VkDeviceMemory,
    pool: vk.VkCommandPool,
    graphics_queue: vk.VkQueue,
    indices: []const u16,
) !void {
    const buffer_size: vk.VkDeviceSize = @sizeOf(@TypeOf(indices[0])) * indices.len;

    var staging_buffer: vk.VkBuffer = undefined;
    var staging_buffer_memory: vk.VkDeviceMemory = undefined;
    try createBuffer(
        physical_device,
        device,
        buffer_size,
        vk.VK_BUFFER_USAGE_TRANSFER_SRC_BIT,
        vk.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | vk.VK_MEMORY_PROPERTY_HOST_COHERENT_BIT,
        &staging_buffer,
        &staging_buffer_memory,
    );

    {
        var data: ?*anyopaque = undefined;
        try isSuccess(vk.vkMapMemory(device, staging_buffer_memory, 0, buffer_size, 0, &data));
        defer vk.vkUnmapMemory(device, staging_buffer_memory);

        var gpu_indices: [*]u16 = @ptrCast(@alignCast(data));
        @memcpy(gpu_indices[0..indices.len], indices);
    }

    try createBuffer(
        physical_device,
        device,
        buffer_size,
        vk.VK_BUFFER_USAGE_TRANSFER_DST_BIT | vk.VK_BUFFER_USAGE_INDEX_BUFFER_BIT,
        vk.VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT,
        index_buffer,
        index_buffer_memory,
    );

    try copyBuffer(device, staging_buffer, index_buffer.*, buffer_size, pool, graphics_queue);

    vk.vkDestroyBuffer(device, staging_buffer, null);
    vk.vkFreeMemory(device, staging_buffer_memory, null);
}

fn createUniformBuffers(
    physical_device: vk.VkPhysicalDevice,
    device: vk.VkDevice,
    uniform_buffers: []vk.VkBuffer,
    uniform_buffers_memory: []vk.VkDeviceMemory,
    uniform_buffers_mapped: []?*anyopaque,
) !void {
    const buffer_size: vk.VkDeviceSize = @sizeOf(UBO);

    for (uniform_buffers, uniform_buffers_memory, uniform_buffers_mapped) |*ub, *ub_mem, *ub_map| {
        try createBuffer(
            physical_device,
            device,
            buffer_size,
            vk.VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT,
            vk.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | vk.VK_MEMORY_PROPERTY_HOST_COHERENT_BIT,
            ub,
            ub_mem,
        );

        try isSuccess(vk.vkMapMemory(device, ub_mem.*, 0, buffer_size, 0, @ptrCast(ub_map)));
    }
}

fn createDescriptorPool(device: vk.VkDevice) !vk.VkDescriptorPool {
    // Currently 1 per frame
    const pool_size = [_]vk.VkDescriptorPoolSize{
        .{
            .type = vk.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,
            .descriptorCount = @as(u32, MAX_FRAMES_IN_FLIGHT),
        },
    };

    const dpci = vk.VkDescriptorPoolCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO,
        .poolSizeCount = @truncate(pool_size.len),
        .pPoolSizes = @ptrCast(&pool_size),
        .maxSets = @as(u32, MAX_FRAMES_IN_FLIGHT),
    };

    var descriptor_pool: vk.VkDescriptorPool = undefined;
    try isSuccess(vk.vkCreateDescriptorPool(device, &dpci, null, &descriptor_pool));
    return descriptor_pool;
}

fn createDescriptorSets(
    allo: Allocator,
    device: vk.VkDevice,
    descriptor_set_layout: vk.VkDescriptorSetLayout,
    descriptor_pool: vk.VkDescriptorPool,
    uniform_buffers: []vk.VkBuffer,
) ![]vk.VkDescriptorSet {
    const descriptor_set_layouts = try allo.alloc(vk.VkDescriptorSetLayout, MAX_FRAMES_IN_FLIGHT);
    @memset(descriptor_set_layouts, descriptor_set_layout); // default value
    defer allo.free(descriptor_set_layouts);

    const dsai = vk.VkDescriptorSetAllocateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO,
        .descriptorPool = descriptor_pool,
        .descriptorSetCount = @intCast(MAX_FRAMES_IN_FLIGHT),
        .pSetLayouts = descriptor_set_layouts.ptr,
    };

    const sets = try allo.alloc(vk.VkDescriptorSet, MAX_FRAMES_IN_FLIGHT);
    try isSuccess(vk.vkAllocateDescriptorSets(device, &dsai, sets.ptr));

    // fails on second iteration - why?
    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        const dbi = vk.VkDescriptorBufferInfo{
            .buffer = uniform_buffers[i],
            .offset = 0,
            .range = @sizeOf(UBO),
        };

        const descriptor_write = [_]vk.VkWriteDescriptorSet{
            .{
                .sType = vk.VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET,
                .dstSet = sets[i],
                .dstBinding = 0,
                .dstArrayElement = 0,
                .descriptorType = vk.VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,
                .descriptorCount = 1,
                .pBufferInfo = &dbi,
                .pImageInfo = null,
                .pTexelBufferView = null,
            },
        };

        vk.vkUpdateDescriptorSets(device, @truncate(descriptor_write.len), @ptrCast(&descriptor_write), 0, null);
    }

    return sets;
}

fn createCommandBuffers(
    allo: Allocator,
    device: vk.VkDevice,
    pool: vk.VkCommandPool,
) ![]vk.VkCommandBuffer {
    const cbai = vk.VkCommandBufferAllocateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO,
        .commandPool = pool,
        .level = vk.VK_COMMAND_BUFFER_LEVEL_PRIMARY,
        .commandBufferCount = @as(u32, @intCast(MAX_FRAMES_IN_FLIGHT)),
    };

    const command_buffers = try allo.alloc(vk.VkCommandBuffer, MAX_FRAMES_IN_FLIGHT);
    try isSuccess(vk.vkAllocateCommandBuffers(device, &cbai, command_buffers.ptr));
    return command_buffers;
}

fn recordCommandBuffer(
    self: *Self,
    command_buffer: vk.VkCommandBuffer,
    pipeline_layout: vk.VkPipelineLayout,
    vertex_buffer: vk.VkBuffer,
    descriptor_set: *const vk.VkDescriptorSet,
    index_buffer: vk.VkBuffer,
    image_index: u32,
) !void {
    const cbbi = vk.VkCommandBufferBeginInfo{
        .sType = vk.VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO,
        .pInheritanceInfo = null,
    };
    try isSuccess(vk.vkBeginCommandBuffer(command_buffer, &cbbi));

    const clear_colors = [_][4]f32{.{ 0, 0, 0, 1 }};
    const rpbi = vk.VkRenderPassBeginInfo{
        .sType = vk.VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO,
        .renderPass = self.render_pass,
        .framebuffer = self.frame_buffers[image_index],
        .renderArea = vk.VkRect2D{
            .offset = .{ .x = 0, .y = 0 },
            .extent = self.extent,
        },
        .clearValueCount = @truncate(clear_colors.len),
        .pClearValues = &.{
            .color = .{
                .float32 = clear_colors[0],
            },
        },
    };

    vk.vkCmdBeginRenderPass(
        command_buffer,
        &rpbi,
        vk.VK_SUBPASS_CONTENTS_INLINE,
    );

    vk.vkCmdBindPipeline(
        command_buffer,
        vk.VK_PIPELINE_BIND_POINT_GRAPHICS,
        self.pipeline,
    );

    const viewport = vk.VkViewport{
        .x = 0,
        .y = 0,
        .width = @floatFromInt(self.extent.width),
        .height = @floatFromInt(self.extent.height),
        .minDepth = 0,
        .maxDepth = 1,
    };
    vk.vkCmdSetViewport(command_buffer, 0, 1, @ptrCast(&viewport));

    const scissor = vk.VkRect2D{
        .offset = .{ .x = 0, .y = 0 },
        .extent = self.extent,
    };
    vk.vkCmdSetScissor(command_buffer, 0, 1, &scissor);

    // vk.vkCmdDraw(command_buffer, 3, 1, 0, 0); // simple draw call fn

    const vertex_buffers = [_]vk.VkBuffer{vertex_buffer};
    const offsets = [_]vk.VkDeviceSize{0};

    vk.vkCmdBindVertexBuffers(command_buffer, 0, 1, &vertex_buffers, &offsets); // bind vertex buffers
    vk.vkCmdBindIndexBuffer(command_buffer, index_buffer, 0, vk.VK_INDEX_TYPE_UINT16); // bind indices
    vk.vkCmdBindDescriptorSets(command_buffer, vk.VK_PIPELINE_BIND_POINT_GRAPHICS, pipeline_layout, 0, 1, descriptor_set, 0, null); // bind descriptors
    vk.vkCmdDrawIndexed(command_buffer, @truncate(square_indices.len), 1, 0, 0, 0); // draw indices

    vk.vkCmdEndRenderPass(command_buffer);

    try isSuccess(vk.vkEndCommandBuffer(command_buffer));
}

fn createFences(
    allo: Allocator,
    device: vk.VkDevice,
) ![]vk.VkFence {
    var fences = try allo.alloc(vk.VkFence, MAX_FRAMES_IN_FLIGHT);

    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        const fci = vk.VkFenceCreateInfo{
            .sType = vk.VK_STRUCTURE_TYPE_FENCE_CREATE_INFO,
            .flags = vk.VK_FENCE_CREATE_SIGNALED_BIT, // default to on
        };
        try isSuccess(vk.vkCreateFence(device, &fci, null, &fences[i]));
    }

    return fences;
}

fn createSemaphores(
    allo: Allocator,
    device: vk.VkDevice,
) ![]vk.VkSemaphore {
    var semaphores = try allo.alloc(vk.VkSemaphore, MAX_FRAMES_IN_FLIGHT);

    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        const sci = vk.VkSemaphoreCreateInfo{
            .sType = vk.VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO,
        };
        try isSuccess(vk.vkCreateSemaphore(device, &sci, null, &semaphores[i]));
    }

    return semaphores;
}

fn drawFrame(self: *Self) !void {
    try isSuccess(vk.vkWaitForFences(self.device, 1, &self.in_flight_fences[self.current_frame], 1, std.math.maxInt(u64)));

    // if out of date = recreate swapchain
    var image_index: u32 = undefined;
    const r1: vk.Result = @enumFromInt(@as(i32, @intCast(vk.vkAcquireNextImageKHR(
        self.device,
        self.swapchain,
        std.math.maxInt(u64),
        self.image_available_semaphores[self.current_frame],
        null,
        &image_index,
    ))));

    switch (r1) {
        .success => {},
        .out_of_date => {
            try self.recreateSwapchain();
            return;
        },
        inline else => |err| return @field(anyerror, @tagName(err)),
    }

    self.updateUniformBuffer();

    // only reset if doing work - prevents dead lock
    try isSuccess(vk.vkResetFences(self.device, 1, &self.in_flight_fences[self.current_frame]));

    try isSuccess(vk.vkResetCommandBuffer(self.command_buffers[self.current_frame], 0));
    try self.recordCommandBuffer(
        self.command_buffers[self.current_frame],
        self.pipeline_layout,
        self.vertex_buffer,
        &self.descriptor_sets[self.current_frame],
        self.index_buffer,
        image_index,
    );

    const wait_semaphores = [1]vk.VkSemaphore{self.image_available_semaphores[self.current_frame]};
    const wait_stages = [1]vk.VkPipelineStageFlags{vk.VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT};

    std.debug.assert(wait_semaphores.len == wait_stages.len);
    const signal_semaphores = [1]vk.VkSemaphore{self.render_finished_semaphores[self.current_frame]};

    const submit_info = vk.VkSubmitInfo{
        .sType = vk.VK_STRUCTURE_TYPE_SUBMIT_INFO,
        .waitSemaphoreCount = @truncate(wait_semaphores.len),
        .pWaitSemaphores = &wait_semaphores,
        .pWaitDstStageMask = &wait_stages,
        .commandBufferCount = 1,
        .pCommandBuffers = &self.command_buffers[self.current_frame],
    };

    try isSuccess(
        vk.vkQueueSubmit(self.graphics_queue, 1, &submit_info, self.in_flight_fences[self.current_frame]),
    );

    const swapchains = [1]vk.VkSwapchainKHR{self.swapchain};
    const present_info = vk.VkPresentInfoKHR{
        .sType = vk.VK_STRUCTURE_TYPE_PRESENT_INFO_KHR,
        .waitSemaphoreCount = 1,
        .pWaitSemaphores = @ptrCast(&signal_semaphores),
        .swapchainCount = @truncate(swapchains.len),
        .pSwapchains = @ptrCast(&swapchains),
        .pImageIndices = @ptrCast(&image_index),
    };

    // if suboptimal or out of date = update swapchain
    const r2: vk.Result = @enumFromInt(@as(i32, @intCast(vk.vkQueuePresentKHR(self.present_queue, &present_info))));
    switch (r2) {
        .success => {},
        .out_of_date, .suboptimal => {
            try self.recreateSwapchain();
        },
        inline else => |err| return @field(anyerror, @tagName(err)),
    }

    self.current_frame = @mod(self.current_frame + 1, MAX_FRAMES_IN_FLIGHT);
}

fn updateUniformBuffer(self: *Self) void {
    const elapsed_time = @as(f32, @floatFromInt(self.time.elapsed()));

    const model = math.rotation(std.math.degreesToRadians(90) * elapsed_time, math.VZ);
    const view = math.lookAt(math.Vector(3, f32).ones().mulScalar(2), math.Vector(3, f32).zeros(), math.VZ);
    const aspect_ratio = @as(f32, @floatFromInt(self.extent.width)) / @as(f32, @floatFromInt(self.extent.height));
    const proj = math.perspective(std.math.degreesToRadians(45), aspect_ratio, 0.1, 10);

    // need to compute basics
    var ubo = [_]UBO{
        .{
            .model = @as([16]f32, @bitCast(model.values)),
            .view = @as([16]f32, @bitCast(view.values)),
            .proj = @as([16]f32, @bitCast(proj.values)),
        },
    };
    ubo[0].proj[5] *= -1;

    var ubos_mapped: [*]UBO = @ptrCast(@alignCast(self.uniform_buffers_mapped[self.current_frame]));
    @memcpy(ubos_mapped[0..ubo.len], @as([*]UBO, @ptrCast(&ubo)));
}
