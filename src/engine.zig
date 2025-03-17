// TODO:
// 1. Implement all the different draw calls - data-drive which version to use
// 2. Separate engine vs impl - have an initVulkan/initDirectX/initMetal calls
// 3. Separate engine vs app logic
// 4. Use QOI, QOA, and QOD to load images/audio/data model files easier
// 5. poll 1x every frame = check frame rate
//      - need to create a fn that takes in other fns and runs them based on the time left - only need to check elapsed time as an argument for that function
// 6. ShaderText = handles interactions b/w model and shader, handles 2d vs 3d edges cases
// 7. implement vericidium's optimizations
// 8. maybe convert to object oriented b/c only the struct is being changed

const std = @import("std");
const Allocator = std.mem.Allocator;
const is_debug_mode = @import("builtin").mode == .Debug;

const builtin = @import("builtin");

const zstbi = @import("zstbi");

// Custom Structs
const SSD = @import("SwapchainSupportDetails.zig");
const QFI = @import("QueueFamilyIndices.zig");
const UBO = @import("UniformBufferObject.zig");

const Buffer = @import("Buffer.zig");
const BufferMap = @import("BufferMap.zig");

const ImageResources = @import("ImageResources.zig");
const DepthResources = @import("DepthResources.zig");
const TextureResources = @import("TextureResources.zig");

const Stopwatch = @import("Stopwatch.zig");

// libraries
const vk = @import("vulkan/vulkan3.zig");
const isSuccess = @import("vulkan/vulkan3.zig").isSuccess;

const math = @import("math/math.zig");
const d2r = std.math.degreesToRadians;

// sdl - huge library - hopefully drop support in the future
const sdl = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_revision.h");

    // @cDefine("VULKAN_H_", "1");
    @cInclude("SDL3/SDL_vulkan.h");

    @cDefine("SDL_MAIN_HANDLED", {}); // for programs w/ their own entry point
    @cInclude("SDL3/SDL_main.h");
});

const validation_layers = [_][*:0]const u8{
    "VK_LAYER_KHRONOS_validation",
};

// set to false for now
const enable_validation_layers = is_debug_mode and false;

fn createDebugUtilsMessengerEXT(
    instance: vk.Instance,
    p_create_info: *const vk.DebugUtilsMessengerCreateInfoEXT,
    p_allocator: *const vk.AllocationCallbacks,
    p_debug_messenger: vk.DebugUtilsMessengerEXT,
) vk.Result {
    const maybe_func = vk.getInstanceProcAddr(instance, "vkCreateDebugUtilsMessengerEXT");
    if (maybe_func) |func| {
        return func(instance, p_create_info, p_allocator, p_debug_messenger);
    } else {
        return error.ValidationExtensionNotPresent;
    }
}

fn destroyDebugUtilsMessengerEXT(
    instance: vk.Instance,
    debug_messenger: vk.DebugUtilsMessengerEXT,
    p_allocator: *const vk.AllocationCallbacks,
) void {
    const maybe_func = vk.getInstanceProcAddr(instance, "vkDestroyDebugUtilsMessengerEXT");
    if (maybe_func) |func| {
        func(instance, debug_messenger, p_allocator);
    }
}

// Extensions
const required_device_extensions = [_][*:0]const u8{
    vk.ExtensionNames.swapchain,
};

const optional_instance_extensions = [_][*:0]const u8{
    vk.ExtensionNames.get_physical_device_properties_2,
    vk.ExtensionNames.get_surface_capabilities_2,
    vk.ExtensionNames.get_memory_requirements_2,
};

// Shader Info
const vert_spv align(@alignOf(u32)) = @embedFile("vertex_shader").*;
const frag_spv align(@alignOf(u32)) = @embedFile("fragment_shader").*;

// Model Info
const Vertex = @import("models/Vertex3D.zig");
const square_indices = @import("models/square_3d.zig").indices; // @import("models/square_2d.zig").indices;
const square_vertices = @import("models/square_3d.zig").vertices; // @import("models/square_2d.zig").vertices;

// Frame Rate
const FPS = enum {
    thirty,
    sixty,
    one_twenty,
    one_fourty_four,
};

// App Data
const MAX_FRAMES_IN_FLIGHT: i32 = 2;

const Self = @This();

allo: Allocator,

window: *sdl.SDL_Window,

instance: vk.Instance,
debug_messenger: vk.DebugUtilsMessengerEXT,
surface: vk.SurfaceKHR,

physical_device: vk.PhysicalDevice = .null,
device: vk.Device,

graphics_queue: vk.Queue,
present_queue: vk.Queue,

swapchain: vk.SwapchainKHR,
swapchain_images: []vk.Image,
swapchain_format: vk.Format,
swapchain_extent: vk.Extent2D,
swapchain_image_views: []vk.ImageView,
swapchain_framebuffers: []vk.Framebuffer,

render_pass: vk.RenderPass,
descriptor_set_layout: vk.DescriptorSetLayout,
graphics_pipeline_layout: vk.PipelineLayout,
graphics_pipeline: vk.Pipeline,

command_pool: vk.CommandPool,

depth: DepthResources,
texture: TextureResources,
vertex_buffer: Buffer,
index_buffer: Buffer,
uniform_buffers: []BufferMap,

descriptor_pool: vk.DescriptorPool,
descriptor_sets: []vk.DescriptorSet,

command_buffers: []vk.CommandBuffer,

image_available_semaphores: []vk.Semaphore,
render_finished_semaphores: []vk.Semaphore,
in_flight_fences: []vk.Fence,

current_frame: u32 = 0,
resize: bool = false,
time: Stopwatch,

// public functions
pub fn init(allo: Allocator, app_name: [*:0]const u8, initial_extent: vk.Extent2D) !Self {

    // init sdl - low level interface w/ different systems
    errdefer |err| if (err == error.SdlError) std.log.err("Sdl Error: {s}", .{sdl.SDL_GetError()});
    if (is_debug_mode) getSDLVersion();
    initSDL();

    // init zstbi - image loader - swap with QOI for games
    zstbi.init(allo);

    // vulkan compatiable + resizable
    const window: *sdl.SDL_Window = try createWindow(app_name, initial_extent, &.{ sdl.SDL_WINDOW_VULKAN, sdl.SDL_WINDOW_RESIZABLE });
    const instance = try createInstance(allo);
    const debug_messenger = try createDebugMessenger(instance);

    const surface = try createSurface(window, &instance);
    const physical_device: vk.PhysicalDevice = try pickPhysicalDevice(instance, surface);

    const tiling: vk.ImageTiling = .optimal;
    const feature: vk.FormatFeatureFlagbits = .depth_stencil_attachment_bit;
    for ([_]vk.Format{ .d32_sfloat, .d32_sfloat_s8_uint, .d24_unorm_s8_uint }) |format| {
        var props: vk.FormatProperties = .{};
        vk.getPhysicalDeviceFormatProperties(physical_device, format, &props);
        switch (tiling) {
            .linear => {
                const value = props.linear_tiling_features.isSet(feature);
                std.debug.print("Linear: {any}\n", .{value});
            },
            .optimal => {
                const value = props.optimal_tiling_features.isSet(feature);
                std.debug.print("Optimal: {any}\n", .{value});
            },
            .drm_format_modifier_ext => unreachable,
        }
    }

    const device = try createLogicalDevice(surface, physical_device);

    const graphics_queue = createQueue(surface, physical_device, device, .graphics);
    const present_queue = createQueue(surface, physical_device, device, .present);

    var ssd = try SSD.init(allo, surface, physical_device);
    defer ssd.deinit(allo);
    if (is_debug_mode) std.debug.print("# of Formats: {}\n", .{ssd.formats.len});
    if (is_debug_mode) std.debug.print("# of Present Modes: {}\n", .{ssd.present_modes.len});

    const swapchain = try createSwapchain(allo, surface, physical_device, device, initial_extent);
    const swapchain_extent = ssd.chooseSwapExtent(initial_extent);
    const swapchain_format = ssd.chooseSwapSurfaceFormat();

    // consider making this static rather than a syscall
    var n_images = try getNumberOfSwapchainImages(device, swapchain);
    const swapchain_images = try allo.alloc(vk.Image, n_images);
    const swapchain_image_views = try allo.alloc(vk.ImageView, n_images);
    const swapchain_framebuffers = try allo.alloc(vk.Framebuffer, n_images);

    const descriptor_set_layout = try createDescriptorSetLayout(device);
    const graphics_pipeline_layout = try createGraphicsPipelineLayout(device, &.{descriptor_set_layout});
    const render_pass = try createRenderPass(physical_device, device, swapchain_format.format);

    try getSwapchainImages(device, swapchain, &n_images, swapchain_images);
    try createImageViews(device, swapchain_images, swapchain_format.format, swapchain_image_views);

    const graphics_pipeline = try createGraphicsPipelines(device, graphics_pipeline_layout, render_pass);
    const command_pool = try createCommandPool(surface, physical_device, device);

    const depth_resources = try createDepthResources(
        physical_device,
        device,
        swapchain_extent,
    );

    try createFramebuffers(device, swapchain_extent, swapchain_image_views, depth_resources.view, render_pass, swapchain_framebuffers);

    const texture_resources: TextureResources = try createTextureResources(
        physical_device,
        device,
        graphics_queue,
        command_pool,
    );
    if (is_debug_mode) std.debug.print("Textures Complete\n", .{});

    const vertex_buffer: Buffer = try createVertexBuffer(
        physical_device,
        device,
        command_pool,
        graphics_queue,
        // &triangle_vertices,
        @ptrCast(&square_vertices),
    );
    if (is_debug_mode) std.debug.print("Vertex Complete\n", .{});

    const index_buffer: Buffer = try createIndexBuffer(
        physical_device,
        device,
        command_pool,
        graphics_queue,
        // &triangle_indices, // makes no sense since only 1 triangle
        @ptrCast(&square_indices),
    );
    if (is_debug_mode) std.debug.print("Index Complete\n", .{});

    const uniform_buffers = try createUniformBuffers(allo, physical_device, device);
    if (is_debug_mode) std.debug.print("Uniform Buffers Complete\n", .{});

    const descriptor_pool = try createDescriptorPool(device);
    const descriptor_sets = try createDescriptorSets(
        allo,
        device,
        descriptor_set_layout,
        descriptor_pool,
        uniform_buffers,
        texture_resources.view,
        texture_resources.sampler,
    );
    if (is_debug_mode) std.debug.print("Descriptor Sets Complete\n", .{});

    const command_buffers = try createCommandBuffers(allo, device, command_pool);

    const image_available_semaphores = try createSemaphores(allo, device);
    const render_finished_semaphores = try createSemaphores(allo, device);
    const in_flight_fences = try createFences(allo, device);
    if (is_debug_mode) std.debug.print("Syncs Complete\n", .{});

    const time = Stopwatch.init();

    return Self{
        .allo = allo,

        .window = window,
        .instance = instance,
        .debug_messenger = debug_messenger,
        .surface = surface,
        .physical_device = physical_device,
        .device = device,

        .graphics_queue = graphics_queue,
        .present_queue = present_queue,

        .swapchain = swapchain,
        .swapchain_images = swapchain_images,
        .swapchain_format = swapchain_format.format,
        .swapchain_extent = swapchain_extent,
        .swapchain_image_views = swapchain_image_views,
        .swapchain_framebuffers = swapchain_framebuffers,

        .descriptor_set_layout = descriptor_set_layout,
        .graphics_pipeline_layout = graphics_pipeline_layout,
        .render_pass = render_pass,
        .graphics_pipeline = graphics_pipeline,

        .command_pool = command_pool,

        .depth = depth_resources,
        .texture = texture_resources,
        .vertex_buffer = vertex_buffer,
        .index_buffer = index_buffer,
        .uniform_buffers = uniform_buffers,

        .descriptor_pool = descriptor_pool,
        .descriptor_sets = descriptor_sets,

        .command_buffers = command_buffers,

        .image_available_semaphores = image_available_semaphores,
        .render_finished_semaphores = render_finished_semaphores,
        .in_flight_fences = in_flight_fences,

        .time = time,
    };
}

pub fn deinit(self: *Self) void {
    defer { // Vulkan instance/window/surface/quit sdl
        vk.destroyDevice(self.device, null);

        if (enable_validation_layers) destroyDebugUtilsMessengerEXT(self.instance, self.debug_messenger, null);

        sdl.SDL_Vulkan_DestroySurface(@ptrCast(&self.instance), @ptrCast(&self.surface), null); // sdl
        vk.destroyInstance(self.instance, null);

        sdl.SDL_DestroyWindow(self.window);
        zstbi.deinit();

        sdl.SDL_Quit();
    }

    defer { // Command pool/buffers
        vk.destroyCommandPool(self.device, self.command_pool, null);
        self.allo.free(self.command_buffers);
    }

    defer { // Sync objects
        for (0..MAX_FRAMES_IN_FLIGHT) |i| {
            vk.destroySemaphore(self.device, self.image_available_semaphores[i], null);
            vk.destroySemaphore(self.device, self.render_finished_semaphores[i], null);
            vk.destroyFence(self.device, self.in_flight_fences[i], null);
        }
        self.allo.free(self.in_flight_fences);
        self.allo.free(self.image_available_semaphores);
        self.allo.free(self.render_finished_semaphores);
    }

    defer { // Vertex buffers
        vk.destroyBuffer(self.device, self.vertex_buffer.buffer, null);
        vk.freeMemory(self.device, self.vertex_buffer.memory, null);
    }

    defer { // Index buffers
        vk.destroyBuffer(self.device, self.index_buffer.buffer, null);
        vk.freeMemory(self.device, self.index_buffer.memory, null);
    }

    defer { // DescriptorSetLayout
        vk.destroyDescriptorSetLayout(self.device, self.descriptor_set_layout, null);
    }

    defer { // Texture Data
        vk.destroySampler(self.device, self.texture.sampler, null);
        vk.destroyImageView(self.device, self.texture.view, null);
        vk.destroyImage(self.device, self.texture.image.image, null);
        vk.freeMemory(self.device, self.texture.image.memory, null);
    }

    defer { // Descriptor sets/layouts/pool - used with UBO
        vk.destroyDescriptorPool(self.device, self.descriptor_pool, null); // destroys sets + layouts too
        self.allo.free(self.descriptor_sets);
    }

    defer { // Uniform buffers
        for (
            self.uniform_buffers,
        ) |*ub| {
            vk.destroyBuffer(self.device, ub.buffer.buffer, null);
            vk.freeMemory(self.device, ub.buffer.memory, null);
        }
        self.allo.free(self.uniform_buffers);
    }

    defer { // Pipeline, PipelineLayout, Renderpass
        vk.destroyPipeline(self.device, self.graphics_pipeline, null);
        vk.destroyPipelineLayout(self.device, self.graphics_pipeline_layout, null);
        vk.destroyRenderPass(self.device, self.render_pass, null);
    }

    defer { // swapchain data
        self.cleanupSwapchain();
        self.allo.free(self.swapchain_images);
        self.allo.free(self.swapchain_image_views);
        self.allo.free(self.swapchain_framebuffers);
    }
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

        if (self.time.elapsed() > (std.time.ns_per_ms * 1_000)) {
            try self.drawFrame();
            self.time.reset();
        }

        try isSuccess(vk.deviceWaitIdle(self.device));
    }
}

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

fn createWindow(
    app_name: [*:0]const u8,
    extent: vk.Extent2D,
    flags: []const sdl.SDL_WindowFlags,
) !*sdl.SDL_Window {
    var combo: u64 = 0;
    for (flags) |flag| {
        combo |= flag;
    }

    return sdl.SDL_CreateWindow(
        app_name,
        @intCast(extent.width),
        @intCast(extent.height),
        combo,
        // sdl.SDL_WINDOW_VULKAN | sdl.SDL_WINDOW_RESIZABLE,
    ) orelse {
        std.debug.print("Failed to create window:{s}\n", .{sdl.SDL_GetError()});
        return error.FailedToCreateWindow;
    };
}

fn createInstance(allo: std.mem.Allocator) !vk.Instance {
    if (enable_validation_layers and !checkValidationLayerSupport()) return error.ValiddationLayersRequestedButUnavailable;

    const ai = vk.ApplicationInfo{
        .p_next = null,
        .p_application_name = "Mauhlt",
        .application_version = vk.makeApiVersion(0, 1, 0, 0),
        .p_engine_name = "ThunderingHerd",
        .engine_version = vk.makeApiVersion(0, 1, 0, 0),
        .api_version = vk.makeApiVersion(0, 1, 1, 0), // up to 1.4 - need to use asserts on fns/data that are different version
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

    var debug_create_info: vk.DebugUtilsMessengerCreateInfoEXT = undefined;

    const ici = vk.InstanceCreateInfo{
        .p_next = if (enable_validation_layers) @as(*vk.DebugUtilsMessengerCreateInfoEXT, @ptrCast(&debug_create_info)) else null,
        .flags = vk.InstanceCreateFlags.initEmpty(),
        .p_application_info = &ai,
        .enabled_layer_count = if (enable_validation_layers) @truncate(validation_layers.len) else 0,
        .pp_enabled_layer_names = if (enable_validation_layers) @ptrCast(&validation_layers) else null,
        .enabled_extension_count = @truncate(instance_extensions.items.len),
        .pp_enabled_extension_names = instance_extensions.items.ptr,
    };

    var instance: vk.Instance = undefined;
    try vk.isSuccess(vk.createInstance(&ici, null, &instance));
    return instance;
}

fn populateDebugMessengerCreateInfo(
    create_info: *vk.DebugUtilsMessengerCreateInfoEXT,
    debug_callback: vk.DebugUtilsMessengerEXT,
) void {
    create_info.s_type = vk.StructureType.debug_utils_messenger_create_info_ext;
    create_info.message_severity = vk.DebugUtilsMessageSeverityFlagsEXT.initEnums(&.{
        .error_bit_ext,
        .warning_bit_ext,
        .verbose_bit_ext,
    });
    create_info.message_type = vk.DebugUtilsMessageTypeFlagsEXT.initEnums(&.{
        .performance_bit_ext,
        .validation_bit_ext,
        .general_bit_ext,
    });
    create_info.pfn_user_callback = debug_callback;
}

fn createDebugMessenger(instance: vk.Instance) !vk.DebugUtilsMessengerEXT {
    if (!enable_validation_layers) return .null;
    var create_info: vk.DebugUtilsMessengerCreateInfoEXT = undefined;
    populateDebugMessengerCreateInfo(&create_info);

    var debug_messenger: vk.DebugUtilsMessengerEXT = undefined;
    try isSuccess(vk.createDebugUtilsMessengerEXT(instance, &create_info, null, &debug_messenger));
    return debug_messenger;
}

fn createSurface(window: *sdl.SDL_Window, instance: *const vk.Instance) !vk.SurfaceKHR {
    var surface: sdl.VkSurfaceKHR = undefined;
    if (!sdl.SDL_Vulkan_CreateSurface(window, @as(*const sdl.VkInstance, @ptrCast(instance)).*, null, &surface)) {
        std.debug.print("Failed to create surface: {s}\n", .{sdl.SDL_GetError()});
        return error.FailedToCreateSurface;
    }
    const new_surface = @as(*const vk.SurfaceKHR, @ptrCast(&surface)).*;
    return new_surface;
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
    try isSuccess(vk.enumeratePhysicalDevices(instance, &n_devices, null));
    if (n_devices == 0) return error.FailedToVulkanSupportingGPUs;

    var devices: [16]vk.PhysicalDevice = undefined;
    try isSuccess(vk.enumeratePhysicalDevices(instance, &n_devices, &devices));

    if (is_debug_mode) try printDeviceExtensions(devices[0]);
    if (is_debug_mode) std.debug.print("Device Scores:\n", .{});

    var max_score: i32 = std.math.minInt(i32); // device = highest score
    var index: ?usize = null;
    for (devices[0..n_devices], 0..) |device, i| {
        if (!(isDeviceSuitable(surface, device) catch continue)) continue;

        // Get device props + feats outside fn for printing values in debug mode
        var props: vk.PhysicalDeviceProperties = undefined;
        vk.getPhysicalDeviceProperties(device, &props);

        var feats: vk.PhysicalDeviceFeatures = undefined;
        vk.getPhysicalDeviceFeatures(device, &feats);

        const score = rateDeviceSuitability(&props, &feats);

        if (is_debug_mode) {
            const device_name_len = std.mem.indexOfScalar(u8, &props.device_name, 0) orelse props.device_name.len;
            const device_name = props.device_name[0..device_name_len];
            std.debug.print("\t{s}: {}\n", .{ device_name, score });
        }

        if (score > max_score) {
            max_score = score;
            index = i;
        }
    }

    if (index) |ind| {
        if (is_debug_mode) {
            var props: vk.PhysicalDeviceProperties = undefined;
            vk.getPhysicalDeviceProperties(devices[ind], &props);

            const device_name_len = std.mem.indexOfScalar(u8, &props.device_name, 0) orelse props.device_name.len;
            const device_name = props.device_name[0..device_name_len];
            std.debug.print("Device Chosen: {s}\n", .{device_name});
        }
        return devices[ind];
    }

    return error.NoSuitableGPUFound;
}

fn isDeviceSuitable(
    surface: vk.SurfaceKHR,
    device: vk.PhysicalDevice,
) !bool {
    const are_extensions_supported = checkDeviceExtensionSupport(device) catch return false;
    if (is_debug_mode) std.debug.print("Are extensions supported? {}\n", .{are_extensions_supported});
    if (!are_extensions_supported) return false;

    const are_queues_complete = QFI.findQueueFamilies(surface, device).isComplete();
    if (is_debug_mode) std.debug.print("Are queues complete? {}\n", .{are_queues_complete});

    const is_swapchain_adequate = try SSD.isSwapchainAdequate(surface, device);
    if (is_debug_mode) std.debug.print("Is swapchain adequate? {}\n", .{is_swapchain_adequate});

    var supported_features: vk.PhysicalDeviceFeatures = .{};
    vk.getPhysicalDeviceFeatures(device, &supported_features);
    const are_desired_features_supported = supported_features.sampler_anisotropy == .true;

    return are_queues_complete and is_swapchain_adequate and are_desired_features_supported;
}

fn printDeviceExtensions(device: vk.PhysicalDevice) !void {
    std.debug.print("Required Device Extensions:\n", .{});
    for (required_device_extensions) |rde| {
        const name = std.mem.span(rde);
        std.debug.print("\t{s}\n", .{name});
    }

    var n_exts: u32 = 0;
    try isSuccess(vk.enumerateDeviceExtensionProperties(device, null, &n_exts, null));
    std.debug.assert(n_exts > 0);

    var available_device_extensions: [128]vk.ExtensionProperties = undefined; // init to alternating 1s and 0s
    try isSuccess(vk.enumerateDeviceExtensionProperties(
        device,
        null,
        &n_exts,
        available_device_extensions[0..n_exts].ptr,
    ));

    std.debug.print("Available Device Extensions:\n", .{});
    for (available_device_extensions[0..n_exts]) |extension| {
        const name = extension.extension_name;
        const ext_name_len = std.mem.indexOfScalar(u8, &name, 0) orelse name.len;
        const ext_name = name[0..ext_name_len];
        std.debug.print("\t{s}\n", .{ext_name});
    }
}

fn checkDeviceExtensionSupport(device: vk.PhysicalDevice) !bool {
    var n_exts: u32 = 0;
    try isSuccess(vk.enumerateDeviceExtensionProperties(device, null, &n_exts, null));
    std.debug.assert(n_exts > 0);

    var available_device_extensions: [128]vk.ExtensionProperties = undefined; // init to alternating 1s and 0s
    try isSuccess(vk.enumerateDeviceExtensionProperties(
        device,
        null,
        &n_exts,
        available_device_extensions[0..n_exts].ptr,
    ));

    blk: for (required_device_extensions) |req_ext| {
        const req_ext_name = std.mem.span(req_ext);
        for (available_device_extensions[0..n_exts]) |extension| {
            const name = extension.extension_name;
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
    props: *const vk.PhysicalDeviceProperties,
    feats: *const vk.PhysicalDeviceFeatures,
) i32 {
    var score: i32 = 0;

    score += switch (props.device_type) {
        .other => 0,
        .integrated_gpu => 100,
        .discrete_gpu => 1000,
        .virtual_gpu => 10,
        .cpu => 1,
    };

    score += @intCast(props.limits.max_image_dimension2d);
    score += @as(i32, @intCast(props.limits.max_image_dimension3d)) * 8; // prefer 3d
    //
    // required features
    if (feats.geometry_shader == .false) return 0;

    return score;
}

fn createLogicalDevice(
    surface: vk.SurfaceKHR,
    physical_device: vk.PhysicalDevice,
) !vk.Device {
    const qfi = QFI.findQueueFamilies(surface, physical_device);
    const float_priority = [1]f32{1.0};
    const qcis = [_]vk.DeviceQueueCreateInfo{
        .{
            .queue_family_index = qfi.graphics_family.?,
            .queue_count = 1,
            .p_queue_priorities = &float_priority,
        },
        .{
            .queue_family_index = qfi.present_family.?,
            .queue_count = 1,
            .p_queue_priorities = &float_priority,
        },
    };

    const is_same_family = qfi.graphics_family.? == qfi.present_family.?;
    const feats: vk.PhysicalDeviceFeatures = .{
        .sampler_anisotropy = .true,
    };

    const dci = vk.DeviceCreateInfo{
        .queue_create_info_count = if (is_same_family) 1 else @truncate(qcis.len),
        .p_queue_create_infos = if (is_same_family) &qcis[0] else &qcis,
        .p_enabled_features = &feats,
        .enabled_extension_count = @truncate(required_device_extensions.len),
        .pp_enabled_extension_names = &required_device_extensions,
        .enabled_layer_count = 0,
        .pp_enabled_layer_names = null,
    };

    var device: vk.Device = .null; // is it better to set to null or to a value
    try isSuccess(vk.createDevice(physical_device, &dci, null, &device));
    return device;
}

const QueueMode = enum(u1) {
    graphics = 0,
    present = 1,
};

fn createQueue(
    surface: vk.SurfaceKHR,
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    mode: QueueMode,
) vk.Queue {
    const qfi = QFI.findQueueFamilies(surface, physical_device);

    if (is_debug_mode) {
        std.debug.assert(qfi.isComplete());
        switch (mode) {
            .graphics => std.debug.print("Graphics Queue: {}\n", .{qfi.graphics_family.?}),
            .present => std.debug.print("Present Queue: {}\n", .{qfi.present_family.?}),
        }
    }

    var queue: vk.Queue = undefined;
    switch (mode) {
        .graphics => vk.getDeviceQueue(device, qfi.graphics_family.?, 0, &queue),
        .present => vk.getDeviceQueue(device, qfi.present_family.?, 0, &queue),
    }
    return queue;
}

fn createSwapchain(
    allo: Allocator,
    surface: vk.SurfaceKHR,
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    initial_extent: vk.Extent2D,
) !vk.SwapchainKHR {
    var ssd = try SSD.init(allo, surface, physical_device);
    defer ssd.deinit(allo);

    const format = ssd.chooseSwapSurfaceFormat();
    const present_mode = ssd.chooseSwapPresentMode();
    const extent = ssd.chooseSwapExtent(initial_extent);
    // if (is_debug_mode) std.debug.print("Extent: {any}\n", .{extent});

    const min = ssd.capabilities.min_image_count + 1;
    const max = ssd.capabilities.max_image_count;
    const n_images = if (max != 0) @min(max, min) else min;
    // if (is_debug_mode) std.debug.print("Swapchain # of Images: {}\n", .{n_images});

    const qfi = QFI.findQueueFamilies(surface, physical_device);
    std.debug.assert(qfi.isComplete());
    const is_same_family = qfi.graphics_family.? == qfi.present_family.?;

    const sci = vk.SwapchainCreateInfoKHR{
        .surface = surface,

        .min_image_count = n_images,
        .image_format = format.format,
        .image_color_space = format.color_space,
        .image_extent = extent,
        .image_array_layers = 1,
        .image_usage = vk.ImageUsageFlags.initEnum(.color_attachment_bit),

        .image_sharing_mode = if (is_same_family) .exclusive else .concurrent,
        .queue_family_index_count = if (is_same_family) 1 else 2,
        .p_queue_family_indices = if (is_same_family) &[1]u32{qfi.graphics_family.?} else &[2]u32{
            qfi.graphics_family.?,
            qfi.present_family.?,
        },

        .pre_transform = ssd.capabilities.current_transform,
        .composite_alpha = .opaque_bit_khr, // vk._COMPOSITE_ALPHA_OPAQUE_BIT_KHR,
        .present_mode = present_mode,
        .clipped = .true,

        .old_swapchain = .null,
    };

    var swapchain: vk.SwapchainKHR = undefined;
    try isSuccess(vk.createSwapchainKHR(device, &sci, null, &swapchain));
    return swapchain;
}

fn recreateSwapchain(self: *Self) !void {
    // reset resize flag
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
    try isSuccess(vk.deviceWaitIdle(self.device));
    self.cleanupSwapchain();

    self.swapchain = try createSwapchain(
        self.allo,
        self.surface,
        self.physical_device,
        self.device,
        .{ .width = @intCast(width), .height = @intCast(height) },
    );

    // WARNING: will break if n_images changes after new swapchain created
    var n_images: u32 = @truncate(self.swapchain_images.len);
    try getSwapchainImages(self.device, self.swapchain, &n_images, self.swapchain_images);

    try createImageViews(
        self.device,
        self.swapchain_images,
        self.swapchain_format,
        self.swapchain_image_views,
    );
    self.swapchain_extent = vk.Extent2D{
        .width = @intCast(width),
        .height = @intCast(height),
    };

    self.depth = try createDepthResources(
        self.physical_device,
        self.device,
        self.swapchain_extent,
    );

    try createFramebuffers(
        self.device,
        self.swapchain_extent,
        self.swapchain_image_views,
        self.depth.view,
        self.render_pass,
        self.swapchain_framebuffers,
    );
}

fn cleanupSwapchain(self: *Self) void {
    {
        defer vk.destroyImageView(self.device, self.depth.view, null);
        defer vk.freeMemory(self.device, self.depth.image.memory, null);
        defer vk.destroyImage(self.device, self.depth.image.image, null);
    }

    for (
        self.swapchain_framebuffers,
        self.swapchain_image_views,
        self.swapchain_images,
    ) |framebuffer, view, image| {
        defer vk.destroyFramebuffer(self.device, framebuffer, null);
        defer vk.destroyImageView(self.device, view, null);
        defer vk.destroyImage(self.device, image, null);
    }

    vk.destroySwapchainKHR(self.device, self.swapchain, null);
}

fn getNumberOfSwapchainImages(
    device: vk.Device,
    swapchain: vk.SwapchainKHR,
) !u32 {
    var n_images: u32 = 0;
    try isSuccess(vk.getSwapchainImagesKHR(device, swapchain, &n_images, null));
    std.debug.assert(n_images > 0);
    if (is_debug_mode) std.debug.print("# of Images: {}\n", .{n_images});
    return n_images;
}

fn getSwapchainImages(
    device: vk.Device,
    swapchain: vk.SwapchainKHR,
    n_images: *u32,
    images: []vk.Image,
) !void {
    try isSuccess(vk.getSwapchainImagesKHR(device, swapchain, n_images, images.ptr));
}

fn createImageViews(
    device: vk.Device,
    images: []vk.Image,
    format: vk.Format,
    views: []vk.ImageView,
) !void {
    for (images, views) |image, *view| {
        view.* = try createImageView(device, image, format, .color_bit);
    }
}

fn createShaderModule(
    device: vk.Device,
    comptime N: u32,
    code: *align(4) const [N:0]u8,
) !vk.ShaderModule {
    const smci = vk.ShaderModuleCreateInfo{
        .code_size = N,
        .p_code = @ptrCast(code),
    };

    var shader_module: vk.ShaderModule = undefined;
    try isSuccess(vk.createShaderModule(device, &smci, null, &shader_module));
    return shader_module;
}

fn createGraphicsPipelineLayout(
    device: vk.Device,
    descriptor_set_layouts: []const vk.DescriptorSetLayout,
) !vk.PipelineLayout {
    const plci = vk.PipelineLayoutCreateInfo{
        .set_layout_count = @truncate(descriptor_set_layouts.len),
        .p_set_layouts = descriptor_set_layouts.ptr,

        .push_constant_range_count = 0,
        .p_push_constant_ranges = null,
    };

    var layout: vk.PipelineLayout = undefined;
    try isSuccess(vk.createPipelineLayout(device, &plci, null, &layout));
    return layout;
}

fn createRenderPass(
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    format: vk.Format,
) !vk.RenderPass {
    const attachments = [_]vk.AttachmentDescription{
        .{ // color
            .format = format,
            .samples = vk.SampleCountFlags.initEnum(.@"1_bit"),
            .load_op = .clear,
            .store_op = .store,
            .stencil_load_op = .dont_care,
            .stencil_store_op = .dont_care,
            .initial_layout = .undefined,
            .final_layout = .present_src_khr,
        },
        .{ // depth
            .format = try findDepthFormat(physical_device),
            .samples = vk.SampleCountFlags.initEnum(.@"1_bit"),
            .load_op = .clear,
            .store_op = .dont_care,
            .stencil_load_op = .dont_care,
            .stencil_store_op = .dont_care,
            .initial_layout = .undefined,
            .final_layout = .attachment_optimal,
        },
    };

    const color_attachment_refs = [1]vk.AttachmentReference{
        .{
            .attachment = 0,
            .layout = .attachment_optimal, // vk._IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL,
        },
    };

    const subpasses = [1]vk.SubpassDescription{
        .{
            .pipeline_bind_point = .graphics,
            .color_attachment_count = @truncate(color_attachment_refs.len),
            .p_color_attachments = &color_attachment_refs,
        },
    };

    const dependencies = [1]vk.SubpassDependency{
        .{
            .src_subpass = vk.subpass_external,
            .dst_subpass = 0,
            .src_stage_mask = vk.PipelineStageFlags.initEnum(.color_attachment_output_bit),
            .src_access_mask = vk.AccessFlags.initEnum(.none),
            .dst_stage_mask = vk.PipelineStageFlags.initEnum(.color_attachment_output_bit),
            .dst_access_mask = vk.AccessFlags.initEnum(.color_attachment_write_bit),
        },
    };

    const rpci = vk.RenderPassCreateInfo{
        .attachment_count = @truncate(attachments.len),
        .p_attachments = &attachments,
        .subpass_count = @truncate(subpasses.len),
        .p_subpasses = &subpasses,
        .dependency_count = @truncate(dependencies.len),
        .p_dependencies = &dependencies,
    };

    var render_pass: vk.RenderPass = undefined;
    try isSuccess(vk.createRenderPass(device, &rpci, null, &render_pass));
    return render_pass;
}

fn createDescriptorSetLayout(device: vk.Device) !vk.DescriptorSetLayout {
    // in the future, pass this into the fn to generate the descriptor set layout
    const ubo_layout_binding = vk.DescriptorSetLayoutBinding{
        .binding = 0,
        .descriptor_count = 1,
        .descriptor_type = .uniform_buffer, // vk._DESCRIPTOR_TYPE_UNIFORM_BUFFER,
        .p_immutable_samplers = null,
        .stage_flags = vk.ShaderStageFlags.initEnum(.vertex_bit),
    };

    const sampler_layout_binding = vk.DescriptorSetLayoutBinding{
        .binding = 1,
        .descriptor_count = 1,
        .descriptor_type = .combined_image_sampler,
        .p_immutable_samplers = null,
        .stage_flags = vk.ShaderStageFlags.initEnum(.fragment_bit),
    };

    const dslb = [_]vk.DescriptorSetLayoutBinding{
        ubo_layout_binding,
        sampler_layout_binding,
    };

    const dslci = vk.DescriptorSetLayoutCreateInfo{
        .binding_count = @truncate(dslb.len),
        .p_bindings = &dslb,
    };

    var descriptor_set_layout: vk.DescriptorSetLayout = undefined;
    try isSuccess(vk.createDescriptorSetLayout(device, &dslci, null, &descriptor_set_layout));
    return descriptor_set_layout;
}

fn createGraphicsPipelines(
    device: vk.Device,
    layout: vk.PipelineLayout,
    render_pass: vk.RenderPass,
) !vk.Pipeline {
    std.debug.assert(vert_spv.len > 0);
    std.debug.assert(frag_spv.len > 0);
    if (is_debug_mode) {
        std.debug.print("Vert Spv Len: {}\n", .{vert_spv.len});
        std.debug.print("Frag Spv Len: {}\n", .{frag_spv.len});
    }

    const vert = try createShaderModule(device, @truncate(vert_spv.len), &vert_spv);
    const frag = try createShaderModule(device, @truncate(frag_spv.len), &frag_spv);

    defer vk.destroyShaderModule(device, vert, null);
    defer vk.destroyShaderModule(device, frag, null);

    const shader_stages = [2]vk.PipelineShaderStageCreateInfo{
        .{ // vert
            .stage = vk.ShaderStageFlags.initEnum(.vertex_bit),
            .module = vert,
            .p_name = "main",
        },
        .{ // frag
            .stage = vk.ShaderStageFlags.initEnum(.fragment_bit),
            .module = frag,
            .p_name = "main",
        },
    };

    const binding_description = Vertex.binding_description;
    const attribute_descriptions = Vertex.attribute_descriptions;

    const vertex_input_info = vk.PipelineVertexInputStateCreateInfo{
        .vertex_binding_description_count = @truncate(binding_description.len),
        .p_vertex_binding_descriptions = &binding_description,
        .vertex_attribute_description_count = @truncate(attribute_descriptions.len),
        .p_vertex_attribute_descriptions = &attribute_descriptions,
    };

    const input_assembly = vk.PipelineInputAssemblyStateCreateInfo{
        .topology = .triangle_list,
        .primitive_restart_enable = .false,
    };

    // const viewport = vk.Viewport{
    //     .x = 0,
    //     .y = 0,
    //     .width = @as(f32, @floatFromInt(extent.width)),
    //     .height = @as(f32, @floatFromInt(extent.height)),
    //     .minDepth = 0,
    //     .maxDepth = 0,
    // };

    // const scissor = vk.Rect2D{
    //     .offset = vk.Offset2D{ .x = 0, .y = 0 },
    //     .extent = extent,
    // };

    const viewport_state = vk.PipelineViewportStateCreateInfo{
        .viewport_count = 1,
        // .pViewports = @ptrCast(&viewport),
        .scissor_count = 1,
        // .pScissors = @ptrCast(&scissor),
    };

    const rasterizer = vk.PipelineRasterizationStateCreateInfo{
        .depth_clamp_enable = .false,
        .rasterizer_discard_enable = .false,
        .polygon_mode = .fill,
        .line_width = 1.0,
        .cull_mode = vk.CullModeFlags.initEnum(.back_bit),
        .front_face = .counter_clockwise,
        .depth_bias_enable = .false,
        // .depthBiasConstantFactor = 0.0,
        // .depthBiasClamp = 0.0,
        // .depthBiasSlopeFactor = 0.0,
    };

    const multisampling = vk.PipelineMultisampleStateCreateInfo{
        .sample_shading_enable = .false,
        .rasterization_samples = vk.SampleCountFlags.initEnum(.@"1_bit"),
        .min_sample_shading = 1.0,
        .p_sample_mask = null,
        .alpha_to_coverage_enable = .false,
        .alpha_to_one_enable = .false,
    };

    const color_blend_attachments = [1]vk.PipelineColorBlendAttachmentState{
        .{
            .color_write_mask = vk.ColorComponentFlags.initEnums(&.{ .r_bit, .g_bit, .b_bit, .a_bit }),
            .blend_enable = .false,
            .src_color_blend_factor = .one,
            .dst_color_blend_factor = .zero,
            .color_blend_op = .add,
            .src_alpha_blend_factor = .one,
            .dst_alpha_blend_factor = .one,
            .alpha_blend_op = .add,
        },
    };

    const color_blending = vk.PipelineColorBlendStateCreateInfo{
        .logic_op_enable = .false,
        .logic_op = .copy,
        .attachment_count = @truncate(color_blend_attachments.len),
        .p_attachments = &color_blend_attachments,
        .blend_constants = [4]f32{ 0, 0, 0, 0 },
    };

    const dynamic_states = [2]vk.DynamicState{
        .viewport,
        .scissor,
    };

    const dynamic_state = vk.PipelineDynamicStateCreateInfo{
        .dynamic_state_count = @truncate(dynamic_states.len),
        .p_dynamic_states = &dynamic_states,
    };

    const gpci = [1]vk.GraphicsPipelineCreateInfo{
        .{
            .stage_count = @truncate(shader_stages.len),
            .p_stages = &shader_stages,
            .p_vertex_input_state = &vertex_input_info,
            .p_input_assembly_state = &input_assembly,
            .p_viewport_state = &viewport_state,
            .p_rasterization_state = &rasterizer,
            .p_multisample_state = &multisampling,
            .p_depth_stencil_state = null,
            .p_color_blend_state = &color_blending,
            .p_dynamic_state = &dynamic_state,
            .layout = layout,
            .render_pass = render_pass,
            .subpass = 0,
            .base_pipeline_handle = .null,
            .base_pipeline_index = -1,
        },
    };

    var pipeline: vk.Pipeline = undefined;
    try isSuccess(vk.createGraphicsPipelines(device, .null, @truncate(gpci.len), &gpci, null, &pipeline));
    return pipeline;
}

fn createFramebuffers(
    device: vk.Device,
    swapchain_extent: vk.Extent2D,
    swapchain_image_views: []vk.ImageView,
    depth_image_view: vk.ImageView,
    render_pass: vk.RenderPass,
    swapchain_framebuffers: []vk.Framebuffer,
) !void {
    for (swapchain_image_views, swapchain_framebuffers) |image_view, *framebuffer| {
        const attachments = [_]vk.ImageView{ image_view, depth_image_view };

        const fci = vk.FramebufferCreateInfo{
            .render_pass = render_pass,
            .attachment_count = @truncate(attachments.len),
            .p_attachments = @ptrCast(&attachments),
            .width = swapchain_extent.width,
            .height = swapchain_extent.height,
            .layers = 1,
        };

        try isSuccess(vk.createFramebuffer(device, &fci, null, framebuffer));
    }
}

fn createCommandPool(
    surface: vk.SurfaceKHR,
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
) !vk.CommandPool {
    const qfi = QFI.findQueueFamilies(surface, physical_device);

    const cpci = vk.CommandPoolCreateInfo{
        .flags = vk.CommandPoolCreateFlags.initEnum(.reset_command_buffer_bit),
        .queue_family_index = qfi.graphics_family.?,
    };

    var command_pool: vk.CommandPool = undefined;
    try isSuccess(vk.createCommandPool(device, &cpci, null, &command_pool));
    return command_pool;
}

fn findBestSupportedFormat(
    physical_device: vk.PhysicalDevice,
    candidates: []const vk.Format,
    tiling: vk.ImageTiling,
    feature_flagbits: vk.FormatFeatureFlagbits,
) !vk.Format {
    for (candidates) |format| {
        var props: vk.FormatProperties = .{};
        vk.getPhysicalDeviceFormatProperties(physical_device, format, &props);

        switch (tiling) {
            .linear => {
                const value = props.linear_tiling_features.isSet(feature_flagbits);
                if (is_debug_mode) std.debug.print("Linear: {any}\n", .{value});
                return format;
            },
            .optimal => {
                const value = props.optimal_tiling_features.isSet(feature_flagbits);
                if (is_debug_mode) std.debug.print("Optimal: {any}\n", .{value});
                return format;
            },
            .drm_format_modifier_ext => unreachable,
        }
    }
    return error.FailedToFindSupportedFormat;
}

fn findDepthFormat(physical_device: vk.PhysicalDevice) !vk.Format {
    return try findBestSupportedFormat(
        physical_device,
        &.{ .d32_sfloat, .d32_sfloat_s8_uint, .d24_unorm_s8_uint },
        .optimal,
        .depth_stencil_attachment_bit,
    );
}

fn hasStencilComponent(format: vk.Format) bool {
    return switch (format) {
        .d32_sfloat_s8_uint, .d24_unorm_s8_uint => true,
        else => false,
    };
}

fn createDepthResources(
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    swapchain_extent: vk.Extent2D,
) !DepthResources {
    const depth_format = try findDepthFormat(physical_device);
    const depth_image = try createImage(
        device,
        .{ .width = swapchain_extent.width, .height = swapchain_extent.height, .depth = 1 },
        depth_format,
        .optimal,
        &.{.depth_stencil_attachment_bit},
    );
    const depth_image_memory = try createImageMemory(physical_device, device, depth_image, &.{.device_local_bit});
    const depth_image_view = try createImageView(device, depth_image, depth_format, .depth_bit);
    return .{
        .format = depth_format,
        .image = .{
            .image = depth_image,
            .memory = depth_image_memory,
        },
        .view = depth_image_view,
    };
}

fn createTextureResources(
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    graphics_queue: vk.Queue,
    command_pool: vk.CommandPool,
) !TextureResources {
    const texture_image = try createTextureImage(
        physical_device,
        device,
        graphics_queue,
        command_pool,
    );
    const texture_image_view = try createTextureImageView(device, texture_image.image);
    const texture_sampler = try createTextureSampler(physical_device, device);
    return .{
        .image = texture_image,
        .view = texture_image_view,
        .sampler = texture_sampler,
    };
}

fn createTextureImage(
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    graphics_queue: vk.Queue,
    command_pool: vk.CommandPool,
) !ImageResources {
    // TODO: swap from stbi to QOI format - faster + less memory used
    const filepath = "C:\\Users\\bphil\\Code\\Zig\\ThunderingHerd\\src\\textures\\texture.jpg";

    const info = zstbi.Image.info(filepath);
    std.debug.print("Info: {any}\n", .{info});
    if (!info.is_supported) return error.ImageFileTypeIsNotSupported; // Great Catch!
    const width, const height, const channels = .{ info.width, info.height, info.num_components };
    _ = channels;

    var image_data = zstbi.Image.loadFromFile(filepath, info.num_components) catch return error.FailedToLoadTextureImage;
    defer image_data.deinit();
    std.debug.print("Image Texture Data:\n", .{});
    std.debug.print("\tData Length: {}\n\tData Type: {s}\n\tWidth: {}\n\tHeight: {}\n\tChannels: {}\n\tBytes Per Component: {}\n\tBytes Per Row: {}\n\tIs HDR: {}\n", .{
        image_data.data.len,
        @typeName(@TypeOf(image_data.data)),
        image_data.width,
        image_data.height,
        image_data.num_components,
        image_data.bytes_per_component,
        image_data.bytes_per_row,
        image_data.is_hdr,
    });

    // when writing data - rgba - all u8
    const size: vk.DeviceSize = width * height * 4;

    const staging_buffer = try createBuffer(device, size, &.{.transfer_src_bit});
    defer vk.destroyBuffer(device, staging_buffer, null);

    const staging_buffer_memory = try createBufferMemory(
        physical_device,
        device,
        staging_buffer,
        &.{ .host_visible_bit, .host_coherent_bit },
    );
    defer vk.freeMemory(device, staging_buffer_memory, null);

    {
        var data: ?*anyopaque = undefined;
        try isSuccess(vk.mapMemory(device, staging_buffer_memory, 0, size, vk.MemoryMapFlags.initEmpty(), &data));
        defer vk.unmapMemory(device, staging_buffer_memory);

        var image_copy: [*]u8 = @ptrCast(@alignCast(data)); // @TypeOf(image_data.data[0]);
        @memcpy(image_copy[0..image_data.data.len], @as([*]@TypeOf(image_data.data[0]), @ptrCast(image_data.data)));
        // alpha, idk if 0,1, or 255 - default to 255
        @memset(image_copy[image_data.data.len .. image_data.data.len + (width * height)], 255);
    }

    const image = try createImage(
        device,
        .{
            .width = width,
            .height = height,
            .depth = 1,
        },
        .r8g8b8a8_srgb,
        .optimal,
        &.{ .transfer_dst_bit, .sampled_bit },
    );

    const memory = try createImageMemory(
        physical_device,
        device,
        image,
        &.{.device_local_bit},
    );

    try transitionImageLayout(
        device,
        graphics_queue,
        command_pool,
        image,
        .r8g8b8a8_srgb,
        .undefined,
        .transfer_dst_optimal,
    );

    try copyBufferToImage(
        device,
        graphics_queue,
        command_pool,
        staging_buffer,
        image,
        width,
        height,
    );

    try transitionImageLayout(
        device,
        graphics_queue,
        command_pool,
        image,
        .r8g8b8a8_srgb,
        .transfer_dst_optimal,
        .shader_read_only_optimal,
    );

    return .{ .image = image, .memory = memory };
}

// this is not great - should just be single call to createImageView
fn createTextureImageView(device: vk.Device, texture_image: vk.Image) !vk.ImageView {
    const texture_image_view = try createImageView(device, texture_image, .r8g8b8a8_srgb, .color_bit);
    return texture_image_view;
}

fn createTextureSampler(physical_device: vk.PhysicalDevice, device: vk.Device) !vk.Sampler {
    var props: vk.PhysicalDeviceProperties = .{};
    vk.getPhysicalDeviceProperties(physical_device, &props);

    const sci = vk.SamplerCreateInfo{
        .mag_filter = .linear,
        .min_filter = .linear,
        .address_mode_u = .repeat,
        .address_mode_v = .repeat,
        .address_mode_w = .repeat,
        .anisotropy_enable = .true, // .false
        .max_anisotropy = props.limits.max_sampler_anisotropy, // 1.0
        .border_color = .int_opaque_black,
        .unnormalized_coordinates = .false,
        .compare_enable = .false,
        .compare_op = .always,
        .mipmap_mode = .linear,
    };
    // other option is false w/ max anisotropy set to 1.0

    var texture_sampler: vk.Sampler = undefined;
    try isSuccess(vk.createSampler(device, &sci, null, &texture_sampler));
    return texture_sampler;
}

fn createImageView(
    device: vk.Device,
    image: vk.Image,
    format: vk.Format,
    aspect_mask: vk.ImageAspectFlagbits,
) !vk.ImageView {
    const ivci = vk.ImageViewCreateInfo{
        .image = image,
        .view_type = .@"2d",
        .format = format,
        .subresource_range = .{
            .aspect_mask = vk.ImageAspectFlags.initEnum(aspect_mask), // .color_bit
            .base_mip_level = 0,
            .level_count = 1,
            .base_array_layer = 0,
            .layer_count = 1,
        },
    };

    var image_view: vk.ImageView = undefined;
    try isSuccess(vk.createImageView(device, &ivci, null, &image_view));
    return image_view;
}

fn createImage(
    device: vk.Device,
    extent: vk.Extent3D,
    format: vk.Format,
    tiling: vk.ImageTiling,
    usage: []const vk.ImageUsageFlagbits,
) !vk.Image {
    const ici = vk.ImageCreateInfo{
        .image_type = .@"2d",
        .extent = extent,
        .mip_levels = 1,
        .array_layers = 1,
        .format = format,
        .tiling = tiling,
        .initial_layout = .undefined,
        .usage = vk.ImageUsageFlags.initEnums(usage),
        .samples = vk.SampleCountFlags.initEnum(.@"1_bit"),
        .sharing_mode = .exclusive,
    };

    var texture_image: vk.Image = undefined;
    try isSuccess(vk.createImage(device, &ici, null, &texture_image));
    return texture_image;
}

fn createImageMemory(
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    image: vk.Image,
    props: []const vk.MemoryPropertyFlagbits,
) !vk.DeviceMemory {
    var mem_reqs: vk.MemoryRequirements = undefined;
    vk.getImageMemoryRequirements(device, image, &mem_reqs);

    const mai = vk.MemoryAllocateInfo{
        .allocation_size = mem_reqs.size,
        .memory_type_index = try findMemoryType(
            physical_device,
            mem_reqs.memory_type_bits,
            props,
        ),
    };

    var memory: vk.DeviceMemory = undefined;
    try isSuccess(vk.allocateMemory(device, &mai, null, &memory));

    try isSuccess(vk.bindImageMemory(device, image, memory, 0));
    return memory;
}

fn transitionImageLayout(
    device: vk.Device,
    graphics_queue: vk.Queue,
    command_pool: vk.CommandPool,
    image: vk.Image,
    format: vk.Format,
    old_layout: vk.ImageLayout,
    new_layout: vk.ImageLayout,
) !void {
    _ = format;
    const command_buffer: vk.CommandBuffer = try beginSingleTimeCommands(device, command_pool);

    const flag1 = old_layout == .undefined and new_layout == .transfer_dst_optimal;
    const flag2 = old_layout == .transfer_dst_optimal and new_layout == .shader_read_only_optimal;
    if (!flag1 and !flag2) return error.UnsupportedLayerTransition;

    const src_access_mask: vk.AccessFlagbits = if (flag1) .none else if (flag2) .transfer_write_bit else unreachable;
    const dst_access_mask: vk.AccessFlagbits = if (flag1) .transfer_write_bit else if (flag2) .shader_read_bit else unreachable;

    const barrier = vk.ImageMemoryBarrier{
        .old_layout = old_layout,
        .new_layout = new_layout,
        .src_queue_family_index = vk.queue_family_ignored,
        .dst_queue_family_index = vk.queue_family_ignored,
        .image = image,
        .subresource_range = .{
            .aspect_mask = vk.ImageAspectFlags.initEnum(.color_bit),
            .base_mip_level = 0,
            .level_count = 1,
            .base_array_layer = 0,
            .layer_count = 1,
        },
        .src_access_mask = vk.AccessFlags.initEnum(src_access_mask),
        .dst_access_mask = vk.AccessFlags.initEnum(dst_access_mask),
    };

    const src_stage: vk.PipelineStageFlagbits = if (flag1) .top_of_pipe_bit else if (flag2) .transfer_bit else unreachable;
    const dst_stage: vk.PipelineStageFlagbits = if (flag1) .transfer_bit else if (flag2) .fragment_shader_bit else unreachable;

    vk.cmdPipelineBarrier(
        command_buffer,
        vk.PipelineStageFlags.initEnum(src_stage),
        vk.PipelineStageFlags.initEnum(dst_stage),
        vk.DependencyFlags.initEnum(.null),
        0,
        null,
        0,
        null,
        1,
        &barrier,
    );
    try endSingleTimeCommands(device, graphics_queue, command_pool, &command_buffer);
}

// need to optimize this code better
fn copyBufferToImage(
    device: vk.Device,
    graphics_queue: vk.Queue,
    command_pool: vk.CommandPool,
    buffer: vk.Buffer,
    image: vk.Image,
    width: u32,
    height: u32,
) !void {
    const command_buffer = try beginSingleTimeCommands(device, command_pool);

    const region = vk.BufferImageCopy{
        .buffer_offset = 0,
        .buffer_row_length = 0,
        .buffer_image_height = 0,
        .image_subresource = .{
            .aspect_mask = vk.ImageAspectFlags.initEnum(.color_bit),
            .mip_level = 0,
            .base_array_layer = 0,
            .layer_count = 1,
        },
        .image_offset = .{},
        .image_extent = .{
            .width = width,
            .height = height,
            .depth = 1,
        },
    };

    vk.cmdCopyBufferToImage(command_buffer, buffer, image, .transfer_dst_optimal, 1, &region);

    try endSingleTimeCommands(
        device,
        graphics_queue,
        command_pool,
        &command_buffer,
    );
}

// Move these fns to above copy buffer
fn beginSingleTimeCommands(
    device: vk.Device,
    command_pool: vk.CommandPool,
) !vk.CommandBuffer {
    const ai = vk.CommandBufferAllocateInfo{
        .level = .primary,
        .command_pool = command_pool,
        .command_buffer_count = 1,
    };

    var command_buffer: vk.CommandBuffer = undefined;
    try isSuccess(vk.allocateCommandBuffers(device, &ai, &command_buffer));

    const bi = vk.CommandBufferBeginInfo{
        .flags = vk.CommandBufferUsageFlags.initEnum(.one_time_submit_bit),
    };
    try isSuccess(vk.beginCommandBuffer(command_buffer, &bi));

    return command_buffer;
}

fn endSingleTimeCommands(
    device: vk.Device,
    graphics_queue: vk.Queue,
    command_pool: vk.CommandPool,
    command_buffer: *const vk.CommandBuffer,
) !void {
    try isSuccess(vk.endCommandBuffer(command_buffer.*));

    const si = vk.SubmitInfo{
        .command_buffer_count = 1,
        .p_command_buffers = command_buffer,
    };

    try isSuccess(vk.queueSubmit(graphics_queue, 1, &si, .null));
    try isSuccess(vk.queueWaitIdle(graphics_queue));

    vk.freeCommandBuffers(device, command_pool, 1, command_buffer);
}

fn createVertexBuffer(
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    pool: vk.CommandPool,
    graphics_queue: vk.Queue,
    vertices: []const Vertex,
) !Buffer {
    const size: vk.DeviceSize = @sizeOf(Vertex) * vertices.len;

    const staging_buffer = try createBuffer(device, size, &.{.transfer_src_bit});
    defer vk.destroyBuffer(device, staging_buffer, null);

    const staging_buffer_memory = try createBufferMemory(physical_device, device, staging_buffer, &.{ .host_visible_bit, .host_coherent_bit });
    defer vk.freeMemory(device, staging_buffer_memory, null);

    {
        var data: ?*anyopaque = undefined;
        try isSuccess(vk.mapMemory(device, staging_buffer_memory, 0, size, vk.MemoryMapFlags.initEmpty(), &data));
        defer vk.unmapMemory(device, staging_buffer_memory);

        var gpu_vertices: [*]Vertex = @ptrCast(@alignCast(data));
        @memcpy(gpu_vertices[0..vertices.len], vertices);
    }

    const buffer = try createBuffer(device, size, &.{ .transfer_dst_bit, .vertex_buffer_bit });
    const memory = try createBufferMemory(physical_device, device, buffer, &.{.device_local_bit});

    try copyBuffer(device, staging_buffer, buffer, size, pool, graphics_queue);

    return .{
        .buffer = buffer,
        .memory = memory,
    };
}

fn createBuffer(device: vk.Device, size: vk.DeviceSize, usage: []const vk.BufferUsageFlagbits) !vk.Buffer {
    var buffer: vk.Buffer = undefined;
    const bci = vk.BufferCreateInfo{
        .size = size,
        .usage = vk.BufferUsageFlags.initEnums(usage),
        .sharing_mode = .exclusive, // static for now, in the future, change this to a feature w/ a default
    };
    try isSuccess(vk.createBuffer(device, &bci, null, &buffer));
    return buffer;
}

fn createBufferMemory(
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    buffer: vk.Buffer,
    props: []const vk.MemoryPropertyFlagbits,
) !vk.DeviceMemory {
    var mem_reqs: vk.MemoryRequirements = undefined;
    vk.getBufferMemoryRequirements(device, buffer, &mem_reqs);

    const mai = vk.MemoryAllocateInfo{
        .allocation_size = mem_reqs.size,
        .memory_type_index = try findMemoryType(
            physical_device,
            mem_reqs.memory_type_bits,
            props,
        ),
    };

    var buffer_memory: vk.DeviceMemory = undefined;
    try isSuccess(vk.allocateMemory(device, &mai, null, @ptrCast(&buffer_memory)));
    try isSuccess(vk.bindBufferMemory(device, buffer, buffer_memory, 0));
    return buffer_memory;
}

fn copyBuffer(
    device: vk.Device,
    src_buffer: vk.Buffer,
    dst_buffer: vk.Buffer,
    size: vk.DeviceSize,
    command_pool: vk.CommandPool,
    graphics_queue: vk.Queue,
) !void {
    const command_buffer = try beginSingleTimeCommands(device, command_pool);

    const copy_region = vk.BufferCopy{
        .size = size,
    };
    vk.cmdCopyBuffer(command_buffer, src_buffer, dst_buffer, 1, &copy_region);
    try endSingleTimeCommands(device, graphics_queue, command_pool, &command_buffer);
}

fn findMemoryType(
    physical_device: vk.PhysicalDevice,
    type_filter: u32,
    props: []const vk.MemoryPropertyFlagbits,
) !u32 {
    var mem_props: vk.PhysicalDeviceMemoryProperties = undefined;
    vk.getPhysicalDeviceMemoryProperties(physical_device, &mem_props);

    for (0..mem_props.memory_type_count) |i| {
        const match1 = (type_filter & (@as(u32, 1) << @truncate(i))) > 0;
        const match2 = mem_props.memory_types[i].property_flags.has(vk.MemoryPropertyFlags.initEnums(props));
        if (match1 and match2) {
            return @truncate(i);
        }
    }

    return error.FailedToFindSuitableMemoryType;
}

fn createIndexBuffer(
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
    pool: vk.CommandPool,
    graphics_queue: vk.Queue,
    indices: []const u16,
) !Buffer {
    const size: vk.DeviceSize = @sizeOf(@TypeOf(indices[0])) * indices.len;

    const staging_buffer = try createBuffer(device, size, &.{.transfer_src_bit});
    defer vk.destroyBuffer(device, staging_buffer, null);

    const staging_buffer_memory = try createBufferMemory(physical_device, device, staging_buffer, &.{ .host_visible_bit, .host_coherent_bit });
    defer vk.freeMemory(device, staging_buffer_memory, null);

    {
        var data: ?*anyopaque = undefined;
        try isSuccess(vk.mapMemory(device, staging_buffer_memory, 0, size, vk.MemoryMapFlags.initEmpty(), &data));
        defer vk.unmapMemory(device, staging_buffer_memory);

        var gpu_indices: [*]u16 = @ptrCast(@alignCast(data));
        @memcpy(gpu_indices[0..indices.len], indices);
    }

    const buffer = try createBuffer(device, size, &.{ .transfer_dst_bit, .index_buffer_bit });
    const memory = try createBufferMemory(physical_device, device, buffer, &.{.device_local_bit});

    try copyBuffer(device, staging_buffer, buffer, size, pool, graphics_queue);

    return .{
        .buffer = buffer,
        .memory = memory,
    };
}

fn createUniformBuffers(
    allo: Allocator,
    physical_device: vk.PhysicalDevice,
    device: vk.Device,
) ![]BufferMap {
    const buffer_size: vk.DeviceSize = @sizeOf(UBO);

    const ubs = try allo.alloc(BufferMap, MAX_FRAMES_IN_FLIGHT);

    for (ubs) |*ub| {
        ub.buffer.buffer = try createBuffer(
            device,
            buffer_size,
            &.{.uniform_buffer_bit},
        );

        ub.buffer.memory = try createBufferMemory(
            physical_device,
            device,
            ub.buffer.buffer,
            &.{ .host_visible_bit, .host_coherent_bit },
        );

        try isSuccess(vk.mapMemory(device, ub.buffer.memory, 0, buffer_size, vk.MemoryMapFlags.initEmpty(), @ptrCast(&ub.map)));
    }

    return ubs;
}

fn createDescriptorPool(device: vk.Device) !vk.DescriptorPool {
    // Currently 1 per frame
    const pool_size = [_]vk.DescriptorPoolSize{
        .{
            .type = .uniform_buffer, // vk._DESCRIPTOR_TYPE_UNIFORM_BUFFER,
            .descriptor_count = @as(u32, MAX_FRAMES_IN_FLIGHT),
        },
        .{
            .type = .combined_image_sampler,
            .descriptor_count = @as(u32, MAX_FRAMES_IN_FLIGHT),
        },
    };

    const dpci = vk.DescriptorPoolCreateInfo{
        .pool_size_count = @truncate(pool_size.len),
        .p_pool_sizes = @ptrCast(&pool_size),
        .max_sets = @as(u32, MAX_FRAMES_IN_FLIGHT),
    };

    var descriptor_pool: vk.DescriptorPool = undefined;
    try isSuccess(vk.createDescriptorPool(device, &dpci, null, &descriptor_pool));
    return descriptor_pool;
}

fn createDescriptorSets(
    allo: Allocator,
    device: vk.Device,
    descriptor_set_layout: vk.DescriptorSetLayout,
    descriptor_pool: vk.DescriptorPool,
    uniform_buffers: []BufferMap,
    texture_image_view: vk.ImageView,
    texture_sampler: vk.Sampler,
) ![]vk.DescriptorSet {
    const descriptor_set_layouts = try allo.alloc(vk.DescriptorSetLayout, MAX_FRAMES_IN_FLIGHT);
    @memset(descriptor_set_layouts, descriptor_set_layout); // default value
    defer allo.free(descriptor_set_layouts);

    const dsai = vk.DescriptorSetAllocateInfo{
        .descriptor_pool = descriptor_pool,
        .descriptor_set_count = @intCast(MAX_FRAMES_IN_FLIGHT),
        .p_set_layouts = descriptor_set_layouts.ptr,
    };

    const sets = try allo.alloc(vk.DescriptorSet, MAX_FRAMES_IN_FLIGHT);
    try isSuccess(vk.allocateDescriptorSets(device, &dsai, sets.ptr));

    // fails on second iteration - why?
    for (uniform_buffers, sets) |ub, set| {
        const buffer_info = vk.DescriptorBufferInfo{
            .buffer = ub.buffer.buffer,
            .offset = 0,
            .range = @sizeOf(UBO),
        };

        const image_info = vk.DescriptorImageInfo{
            .image_layout = .shader_read_only_optimal,
            .image_view = texture_image_view,
            .sampler = texture_sampler,
        };

        const descriptor_write = [_]vk.WriteDescriptorSet{
            .{
                .dst_set = set,
                .dst_binding = 0,
                .dst_array_element = 0,
                .descriptor_type = .uniform_buffer,
                .descriptor_count = 1,
                .p_buffer_info = &buffer_info,
                .p_image_info = null,
                .p_texel_buffer_view = null,
            },
            .{
                .dst_set = set,
                .dst_binding = 1,
                .dst_array_element = 0,
                .descriptor_type = .sampler,
                .descriptor_count = 1,
                .p_image_info = &image_info,
                .p_texel_buffer_view = null,
            },
        };

        vk.updateDescriptorSets(device, @truncate(descriptor_write.len), @ptrCast(&descriptor_write), 0, null);
    }

    return sets;
}

fn createCommandBuffers(
    allo: Allocator,
    device: vk.Device,
    pool: vk.CommandPool,
) ![]vk.CommandBuffer {
    const cbai = vk.CommandBufferAllocateInfo{
        .command_pool = pool,
        .level = .primary,
        .command_buffer_count = @as(u32, @intCast(MAX_FRAMES_IN_FLIGHT)),
    };

    const command_buffers = try allo.alloc(vk.CommandBuffer, MAX_FRAMES_IN_FLIGHT);
    try isSuccess(vk.allocateCommandBuffers(device, &cbai, command_buffers.ptr));
    return command_buffers;
}

fn recordCommandBuffer(
    self: *Self,
    command_buffer: vk.CommandBuffer,
    pipeline_layout: vk.PipelineLayout,
    vertex_buffer: vk.Buffer,
    descriptor_set: *const vk.DescriptorSet,
    index_buffer: vk.Buffer,
    image_index: u32,
) !void {
    const cbbi = vk.CommandBufferBeginInfo{
        .p_inheritance_info = null,
    };
    try isSuccess(vk.beginCommandBuffer(command_buffer, &cbbi));

    const clear_colors = [_][4]f32{.{ 0, 0, 0, 1 }};
    const rpbi = vk.RenderPassBeginInfo{
        .render_pass = self.render_pass,
        .framebuffer = self.swapchain_framebuffers[image_index],
        .render_area = vk.Rect2D{
            .offset = .{
                .x = 0,
                .y = 0,
            },
            .extent = self.swapchain_extent,
        },
        .clear_value_count = @truncate(clear_colors.len),
        .p_clear_values = &.{
            .color = .{
                .float32 = clear_colors[0],
            },
        },
    };

    vk.cmdBeginRenderPass(
        command_buffer,
        &rpbi,
        .@"inline",
    );

    vk.cmdBindPipeline(
        command_buffer,
        .graphics,
        self.graphics_pipeline,
    );

    const viewport = vk.Viewport{
        .x = 0,
        .y = 0,
        .width = @floatFromInt(self.swapchain_extent.width),
        .height = @floatFromInt(self.swapchain_extent.height),
        .min_depth = 0,
        .max_depth = 1,
    };
    vk.cmdSetViewport(command_buffer, 0, 1, @ptrCast(&viewport));

    const scissor = vk.Rect2D{
        .offset = .{
            .x = 0,
            .y = 0,
        },
        .extent = self.swapchain_extent,
    };
    vk.cmdSetScissor(command_buffer, 0, 1, &scissor);

    // vk.CmdDraw(command_buffer, 3, 1, 0, 0); // simple draw call fn

    const vertex_buffers = [_]vk.Buffer{vertex_buffer};
    const offsets = [_]vk.DeviceSize{0};

    vk.cmdBindVertexBuffers(command_buffer, 0, 1, &vertex_buffers, &offsets); // bind vertex buffers
    vk.cmdBindIndexBuffer(command_buffer, index_buffer, 0, .uint16); // bind indices
    vk.cmdBindDescriptorSets(command_buffer, .graphics, pipeline_layout, 0, 1, descriptor_set, 0, null); // bind descriptors
    vk.cmdDrawIndexed(command_buffer, @truncate(square_indices.len), 1, 0, 0, 0); // draw indices

    vk.cmdEndRenderPass(command_buffer);

    try isSuccess(vk.endCommandBuffer(command_buffer));
}

fn createFences(
    allo: Allocator,
    device: vk.Device,
) ![]vk.Fence {
    var fences = try allo.alloc(vk.Fence, MAX_FRAMES_IN_FLIGHT);

    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        const fci = vk.FenceCreateInfo{
            .flags = .signaled_bit, // default to on
        };
        try isSuccess(vk.createFence(device, &fci, null, &fences[i]));
    }

    return fences;
}

fn createSemaphores(
    allo: Allocator,
    device: vk.Device,
) ![]vk.Semaphore {
    var semaphores = try allo.alloc(vk.Semaphore, MAX_FRAMES_IN_FLIGHT);

    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        const sci = vk.SemaphoreCreateInfo{};
        try isSuccess(vk.createSemaphore(device, &sci, null, &semaphores[i]));
    }

    return semaphores;
}

fn drawFrame(self: *Self) !void {
    try isSuccess(vk.waitForFences(
        self.device,
        1,
        &self.in_flight_fences[self.current_frame],
        .true,
        std.math.maxInt(u64),
    ));

    // if out of date = recreate swapchain
    var image_index: u32 = undefined;
    const r1: vk.Result = vk.acquireNextImageKHR(
        self.device,
        self.swapchain,
        std.math.maxInt(u64),
        self.image_available_semaphores[self.current_frame],
        .null,
        &image_index,
    );

    switch (r1) {
        .success => {},
        .error_out_of_date_khr => {
            try self.recreateSwapchain();
            return;
        },
        inline else => |err| return @field(anyerror, @tagName(err)),
    }

    self.updateUniformBuffer();

    // only reset if doing work - prevents dead lock
    try isSuccess(vk.resetFences(self.device, 1, &self.in_flight_fences[self.current_frame]));

    try isSuccess(vk.resetCommandBuffer(
        self.command_buffers[self.current_frame],
        vk.CommandBufferResetFlags.initEnum(.null),
    ));

    try self.recordCommandBuffer(
        self.command_buffers[self.current_frame],
        self.graphics_pipeline_layout,
        self.vertex_buffer.buffer,
        &self.descriptor_sets[self.current_frame],
        self.index_buffer.buffer,
        image_index,
    );

    const wait_semaphores = [1]vk.Semaphore{self.image_available_semaphores[self.current_frame]};
    const wait_stages = [1]vk.PipelineStageFlags{vk.PipelineStageFlags.initEnum(.color_attachment_output_bit)};

    std.debug.assert(wait_semaphores.len == wait_stages.len);
    const signal_semaphores = [1]vk.Semaphore{self.render_finished_semaphores[self.current_frame]};

    const submit_info = vk.SubmitInfo{
        .wait_semaphore_count = @truncate(wait_semaphores.len),
        .p_wait_semaphores = &wait_semaphores,
        .p_wait_dst_stage_mask = &wait_stages,
        .command_buffer_count = 1,
        .p_command_buffers = &self.command_buffers[self.current_frame],
    };

    try isSuccess(
        vk.queueSubmit(self.graphics_queue, 1, &submit_info, self.in_flight_fences[self.current_frame]),
    );

    const swapchains = [1]vk.SwapchainKHR{self.swapchain};
    const present_info = vk.PresentInfoKHR{
        .wait_semaphore_count = 1,
        .p_wait_semaphores = @ptrCast(&signal_semaphores),
        .swapchain_count = @truncate(swapchains.len),
        .p_swapchains = @ptrCast(&swapchains),
        .p_image_indices = @ptrCast(&image_index),
    };

    // if suboptimal or out of date = update swapchain
    const r2: vk.Result = vk.queuePresentKHR(self.present_queue, &present_info);
    switch (r2) {
        .success => {},
        .error_out_of_date_khr, .suboptimal_khr => {
            try self.recreateSwapchain();
        },
        inline else => |err| return @field(anyerror, @tagName(err)),
    }

    self.current_frame = @mod(self.current_frame + 1, MAX_FRAMES_IN_FLIGHT);
}

fn updateUniformBuffer(self: *Self) void {
    const elapsed_time = @as(f32, @floatFromInt(self.time.elapsed()));

    const model = math.rotation(d2r(90) * elapsed_time, math.VZ);
    const view = math.lookAt(math.Vector(3, f32).ones().mulScalar(2), math.Vector(3, f32).zeros(), math.VZ);
    const aspect_ratio = @as(f32, @floatFromInt(self.swapchain_extent.width)) / @as(f32, @floatFromInt(self.swapchain_extent.height));
    const proj = math.perspective(d2r(45), aspect_ratio, 0.1, 10);

    // need to compute basics
    var ubo = [_]UBO{
        .{
            .model = @as([16]f32, @bitCast(model.values)),
            .view = @as([16]f32, @bitCast(view.values)),
            .proj = @as([16]f32, @bitCast(proj.values)),
        },
    };
    ubo[0].proj[5] *= -1;

    var ubos_mapped: [*]UBO = @ptrCast(@alignCast(self.uniform_buffers[self.current_frame].map));
    @memcpy(ubos_mapped[0..ubo.len], @as([*]UBO, @ptrCast(&ubo)));
}

fn debugCallback(
    message_severity: vk.DebugUtilsMessageSeverityFlagBitsEXT,
    message_type: vk.DebugUtilsMessageTypeFlagsEXT,
    p_callback_data: *const vk.DebugUtilsMessengerCallbackDataEXT,
    p_user_data: ?*anyopaque,
) vk.Bool32 {
    _ = message_severity;
    _ = message_type;
    _ = p_user_data;
    std.log.err("Validation Layer: {s}", .{p_callback_data.p_message});
    return .false;
}

fn checkValidationLayerSupport() !bool {
    var n_layers: u32 = 0;
    try isSuccess(vk.enumerateInstanceLayerProperties(&n_layers, null));

    const available_layers: [64]vk.LayerProperties = undefined;
    try isSuccess(vk.enumerateInstanceLayerProperties(&n_layers, &available_layers));

    for (validation_layers) |layer_name| {
        const ln = std.mem.span(layer_name);
        var layer_found: bool = false;

        for (available_layers) |available_layer| {
            const len = std.mem.indexOf(u8, available_layer.layer_name, 0).?;
            const name = available_layer.layer_name[0..len];
            if (std.mem.eql(u8, name, ln)) {
                layer_found = true;
                break;
            }
        }

        if (!layer_found) {
            std.debug.print("Failed to find {s}\n", .{});
        }
    }

    return true;
}
