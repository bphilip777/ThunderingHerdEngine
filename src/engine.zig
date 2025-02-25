const std = @import("std");
const Allocator = std.mem.Allocator;
const is_debug_mode = @import("builtin").mode == .Debug;

const SSD = @import("SwapchainSupportDetails.zig");
const QFI = @import("QueueFamilyIndices.zig");

const isSuccess = @import("helpers.zig").isSuccess;
const Result = @import("helpers.zig").Result;

pub const std_options: std.Options = .{ .log_level = .debug };

const vk = @import("vk.zig").vk;

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
    vk.VK_KHR_SWAPCHAIN_EXTENSION_NAME,
};

const optional_instance_extensions = [_][*:0]const u8{
    vk.VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME,
    vk.VK_KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME,
};

// Model/Shader Info
const vert_spv align(@alignOf(u32)) = @embedFile("vertex_shader").*;
const frag_spv align(@alignOf(u32)) = @embedFile("fragment_shader").*;

const Vertex = struct {
    const binding_description = vk.VkVertexInputBindingDescription{
        .binding = 0,
        .stride = @sizeOf(Vertex),
        .inputRate = vk.VK_VERTEX_INPUT_RATE_VERTEX,
    };
    const attribute_description = [_]vk.VkVertexInputAttributeDescription{
        .{
            .location = 0,
            .binding = 0,
            .format = vk.VK_FORMAT_R32G32_SFLOAT,
            .offset = @offsetOf(Vertex, "pos"),
        },
        .{
            .location = 0,
            .binding = 1,
            .format = vk.VK_FORMAT_R32G32B32_SFLOAT,
            .offset = @offsetOf(Vertex, "color"),
        },
    };

    pos: [2]f32,
    color: [3]f32,
};

const vertices = [_]Vertex{
    .{ .pos = .{ 0, -0.5 }, .color = .{ 1, 0, 0 } },
    .{ .pos = .{ 0.5, 0.5 }, .color = .{ 0, 1, 0 } },
    .{ .pos = .{ -0.5, 0.5 }, .color = .{ 0, 0, 1 } },
};

const MAX_FRAMES_IN_FLIGHT: i32 = 2;

const Self = @This();

allo: Allocator,
window: *sdl.SDL_Window,
instance: vk.VkInstance,

surface: vk.VkSurfaceKHR,
physical_device: vk.VkPhysicalDevice,
device: vk.VkDevice,

graphics_queue: vk.VkQueue,
present_queue: vk.VkQueue,

swapchain: vk.VkSwapchainKHR,
images: []vk.VkImage,
format: vk.VkFormat,
extent: vk.VkExtent2D,
views: []vk.VkImageView,
frame_buffers: []vk.VkFramebuffer,

layout: vk.VkPipelineLayout,
render_pass: vk.VkRenderPass,
pipeline: vk.VkPipeline,

pool: vk.VkCommandPool,
vertex_buffer: vk.VkBuffer,
vertex_buffer_memory: vk.VkDeviceMemory,
command_buffers: []vk.VkCommandBuffer,

image_available_semaphores: []vk.VkSemaphore,
render_finished_semaphores: []vk.VkSemaphore,
in_flight_fences: []vk.VkFence,

current_frame: u32 = 0,

// public functions
pub fn init(
    allo: Allocator,
    app_name: [*:0]const u8,
    width: i32,
    height: i32,
) !Self {
    errdefer |err| if (err == error.SdlError) std.log.err("Sdl Error: {s}", .{sdl.SDL_GetError()});
    if (is_debug_mode) getSDLVersion();
    initSDL();

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
    const surface = try createSurface(window, instance);
    const physical_device: vk.VkPhysicalDevice = try pickPhysicalDevice(instance, surface);
    const device = try createLogicalDevice(surface, physical_device);

    const graphics_queue = createQueue(surface, physical_device, device, .graphics);
    const present_queue = createQueue(surface, physical_device, device, .present);

    var ssd = try SSD.init(allo, surface, physical_device);
    defer ssd.deinit(allo);
    if (is_debug_mode) std.debug.print("# of Formats: {}\n", .{ssd.formats.len});
    if (is_debug_mode) std.debug.print("# of Present Modes: {}\n", .{ssd.present_modes.len});

    const extent = ssd.chooseSwapExtent(width, height);
    const format = ssd.chooseSwapSurfaceFormat();

    const swapchain = try createSwapchain(allo, surface, physical_device, device, width, height);

    // allocate memory outside of the fn - one time call at initialization rather than every time recreate is called
    var n_images = try getNumberOfSwapchainImages(device, swapchain);
    const images = try allo.alloc(vk.VkImage, n_images);
    const views = try allo.alloc(vk.VkImageView, n_images);
    const frame_buffers = try allo.alloc(vk.VkFramebuffer, n_images);

    const layout = try createGraphicsPipelineLayout(device);
    const render_pass = try createRenderPass(device, format.format);

    try getSwapchainImages(device, swapchain, &n_images, images);
    try createImageViews(device, images, format.format, views);
    try createFramebuffers(device, extent, views, render_pass, frame_buffers);

    const pipeline = try createGraphicsPipelines(device, layout, render_pass);

    const pool = try createCommandPool(surface, physical_device, device);
    const command_buffers = try createCommandBuffers(allo, device, pool);

    const image_available_semaphores = try createSemaphores(allo, device);
    const render_finished_semaphores = try createSemaphores(allo, device);
    const in_flight_fences = try createFences(allo, device);

    return Self{
        .allo = allo,

        .window = window,
        .instance = instance,
        .surface = surface,
        .physical_device = physical_device,
        .device = device,

        .graphics_queue = graphics_queue,
        .present_queue = present_queue,

        .swapchain = swapchain,
        .images = images,
        .format = format.format,
        .extent = extent,
        .views = views,
        .frame_buffers = frame_buffers,

        .layout = layout,
        .render_pass = render_pass,
        .pipeline = pipeline,

        .pool = pool,
        .command_buffers = command_buffers,

        .image_available_semaphores = image_available_semaphores,
        .render_finished_semaphores = render_finished_semaphores,
        .in_flight_fences = in_flight_fences,
    };
}

pub fn deinit(self: *Self) void {
    defer sdl.SDL_Quit();
    // defer self.window.destroy(); // glfw
    defer sdl.SDL_DestroyWindow(self.window);
    defer vk.vkDestroyInstance(self.instance, null);
    // defer vk.vkDestroySurface(self.instance, self.surface, null); // glfw
    defer sdl.SDL_Vulkan_DestroySurface(@ptrCast(self.instance), @ptrCast(self.surface), null); // sdl
    defer vk.vkDestroyDevice(self.device, null);

    defer vk.vkDestroyCommandPool(self.device, self.pool, null);
    defer self.allo.free(self.command_buffers);

    defer self.allo.free(self.in_flight_fences);
    defer self.allo.free(self.image_available_semaphores);
    defer self.allo.free(self.render_finished_semaphores);
    for (0..MAX_FRAMES_IN_FLIGHT) |i| {
        defer vk.vkDestroySemaphore(self.device, self.image_available_semaphores[i], null);
        defer vk.vkDestroySemaphore(self.device, self.render_finished_semaphores[i], null);
        defer vk.vkDestroyFence(self.device, self.in_flight_fences[i], null);
    }

    defer vk.vkDestroyPipelineLayout(self.device, self.layout, null);
    defer vk.vkDestroyRenderPass(self.device, self.render_pass, null);
    defer vk.vkDestroyPipeline(self.device, self.pipeline, null); // memory leaks w/ images once i reach this step - why?

    defer vk.vkDestroyBuffer(self.device, self.vertex_buffer, null);

    defer self.allo.free(self.images);
    defer self.allo.free(self.views);
    defer self.allo.free(self.frame_buffers);
    defer self.cleanupSwapchain();
}

pub fn mainLoop(self: *Self) !void {
    // SDL Loop
    outer: while (true) {
        // poll events = multiplexer
        var event: sdl.SDL_Event = undefined;
        while (sdl.SDL_PollEvent(&event)) {
            switch (event.type) {
                sdl.SDL_EVENT_QUIT => break :outer,
                sdl.SDL_EVENT_WINDOW_RESIZED => try self.recreateSwapchain(),
                else => {},
            }
        }

        // game logic
        try self.drawFrame();

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

fn createInstance(allo: std.mem.Allocator) !vk.VkInstance {
    const ai = vk.VkApplicationInfo{
        .sType = vk.VK_STRUCTURE_TYPE_APPLICATION_INFO,
        .pNext = null,
        .pApplicationName = "Mauhlt",
        .applicationVersion = vk.VK_MAKE_API_VERSION(0, 1, 0, 0),
        .pEngineName = "ThunderingHerd",
        .engineVersion = vk.VK_MAKE_API_VERSION(0, 1, 0, 0),
        .apiVersion = vk.VK_API_VERSION_1_0, // up to 1.4 - need to use asserts on fns/data that are different version
    };

    var n_req_exts: u32 = 0;
    const extension_names = sdl.SDL_Vulkan_GetInstanceExtensions(&n_req_exts);
    std.debug.assert(n_req_exts > 0);

    var instance_extensions = try std.ArrayList([*:0]const u8).initCapacity(allo, 8);
    defer instance_extensions.deinit();
    try instance_extensions.appendSlice(@ptrCast(extension_names[0..n_req_exts]));

    if (is_debug_mode) printInstanceRequiredExts(&instance_extensions);

    var n_available_exts: u32 = 0;
    try isSuccess(vk.vkEnumerateInstanceExtensionProperties(null, &n_available_exts, null));
    std.debug.assert(n_available_exts > 0);
    var available_extensions: [32]vk.VkExtensionProperties = undefined;
    try isSuccess(vk.vkEnumerateInstanceExtensionProperties(null, &n_available_exts, @ptrCast(&available_extensions)));

    if (is_debug_mode) printAvailableInstanceExtensions(available_extensions[0..n_available_exts]);

    blk: for (instance_extensions.items) |instance_extension| {
        const req_ext_name = std.mem.span(instance_extension);
        for (available_extensions) |available_extension| {
            const name = available_extension.extensionName;
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
            const name = available_extension.extensionName;
            const len = std.mem.indexOfScalar(u8, &name, 0) orelse name.len;
            const available_extension_name = name[0..len];
            if (std.mem.eql(u8, opt_ext_name, available_extension_name)) {
                try instance_extensions.append(instance_extension);
                continue :blk;
            }
        }
    }

    if (is_debug_mode) printChosenInstanceExtensions(instance_extensions.items);

    const ici = vk.VkInstanceCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO,
        .pNext = null,
        .flags = 0,
        .pApplicationInfo = &ai,
        .enabledLayerCount = 0,
        .ppEnabledLayerNames = null,
        .enabledExtensionCount = @truncate(instance_extensions.items.len),
        .ppEnabledExtensionNames = instance_extensions.items.ptr,
    };

    var instance: vk.VkInstance = undefined;
    try isSuccess(vk.vkCreateInstance(&ici, null, &instance));
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

fn printAvailableInstanceExtensions(extensions: []const vk.VkExtensionProperties) void {
    std.debug.print("Available Instance Extensions:\n", .{});
    for (extensions) |ext| {
        const name = ext.extensionName;
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

fn pickPhysicalDevice(instance: vk.VkInstance, surface: vk.VkSurfaceKHR) !vk.VkPhysicalDevice {
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
    try isSuccess(vk.vkEnumerateDeviceExtensionProperties(device, null, &n_exts, available_device_extensions[0..n_exts].ptr));

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
    try isSuccess(vk.vkEnumerateDeviceExtensionProperties(device, null, &n_exts, available_device_extensions[0..n_exts].ptr));

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
    // resize window -> wait for size to become non zero -> cleanup engine
    var width: i32 = 0;
    var height: i32 = 0;
    while (width == 0 or height == 0) {
        if (!sdl.SDL_GetWindowSize(self.window, &width, &height)) {
            std.debug.print("Failed to get window size: {s}\n", .{sdl.SDL_GetError()});
            return error.FailedToGetWindowSize;
        }
        _ = sdl.SDL_WaitEvent(null);
    }

    try isSuccess(vk.vkDeviceWaitIdle(self.device));

    self.cleanupSwapchain();

    // if (is_debug_mode) std.debug.print("New Extent: {}x{}\n", .{ width, height });
    self.swapchain = try createSwapchain(self.allo, self.surface, self.physical_device, self.device, width, height);
    // will break if n_images changes after new swapchain created
    var n_images: u32 = @truncate(self.images.len);
    try getSwapchainImages(self.device, self.swapchain, &n_images, self.images);
    try createImageViews(self.device, self.images, self.format, self.views);
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
) !vk.VkPipelineLayout {
    const plci = vk.VkPipelineLayoutCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO,
        .setLayoutCount = 0,
        .pSetLayouts = null,
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

    const vertex_input_info = vk.VkPipelineVertexInputStateCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO,
        .vertexBindingDescriptionCount = 0,
        .pVertexBindingDescriptions = null,
        .vertexAttributeDescriptionCount = 0,
        .pVertexAttributeDescriptions = null,
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
        .cullMode = vk.VK_CULL_MODE_BACK_BIT,
        .frontFace = vk.VK_FRONT_FACE_CLOCKWISE,
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

    var pool: vk.VkCommandPool = undefined;
    try isSuccess(vk.vkCreateCommandPool(device, &cpci, null, &pool));
    return pool;
}

fn createVertexBuffer(device: vk.VkDevice) !vk.VkBuffer {
    const bci = vk.VkBufferCreateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO,
        .size = @sizeOf(Vertex) * vertices.len,
        .usage = vk.VK_BUFFER_USAGE_VERTEX_BUFFER_BIT,
        .sharingMode = vk.VK_SHARING_MODE_EXCLUSIVE,
    };

    var vertex_buffer: vk.VkBuffer = undefined;
    try isSuccess(vk.vkCreateBuffer(device, &bci, null, &vertex_buffer));
    return vertex_buffer;
}

fn bindMemory(device: vk.VkDevice, vertex_buffer: vk.VkBuffer,) !void {
    var mem_reqs: vk.VkMemoryRequirements = undefined;
    vk.vkGetBufferMemoryRequirements(device, vertex_buffer, &mem_reqs);
    
    const mai = vk.VkMemoryAllocateInfo{
        .sType = vk.VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO,
        .allocationSize = mem_reqs.size,
        .memoryTypeIndex = findMemoryType(mem_reqs.memoryTypeBits, vk.VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | vk.VK_MEMORY_PROPERTY_HOST_COHERENT_BIT),
};

    try isSuccess(vk.vkAllocateMemory(device, &mai, null, &vertex_buffer_memory));

    vk.vkBindBufferMemory(device, vertex_buffer, vertex_buffer_memory, 0);
    
    var data: *anyopaque = undefined;
    try isSuccess(vk.vkMapMemory(device, vertex_buffer_memory, 0, buffer_info.len, 0, &data));
    defer vk.vkUnmapMemory(device, vertex_buffer_memory);
    memcpy(data, vertices.len, bufferInfo.size);
}

// fn createIndexBuffer(device: vk.VkDevice) !vk.VkBuffer {
//
// }

fn findMemoryType(
    physical_device: vk.VkPhysicalDevice,
    type_filter: u32,
    props: vk.VkMemoryPropertyFlags,
) !u32 {
    var mem_props: vk.VkPhysicalDeviceMemoryProperties = undefined;
    vk.vkGetPhysicalDeviceMemoryProperties(physical_device, &mem_props);

    for (0..mem_props.memoryTypeCount) |i| {
        if (type_filter & @as(u32, 1 << i) and mem_props.memoryTypes[i].propertyFlags & props == props) {
            return i;
        }
    }

    return error.FailedToFindSuitableMemoryType;
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
    try isSuccess(vk.vkAllocateCommandBuffers(device, &cbai, @ptrCast(command_buffers.ptr)));
    return command_buffers;
}

fn recordCommandBuffer(
    self: *Self,
    command_buffer: vk.VkCommandBuffer,
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

    vk.vkCmdDraw(command_buffer, 3, 1, 0, 0);

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
    try isSuccess(
        vk.vkWaitForFences(self.device, 1, &self.in_flight_fences[self.current_frame], 1, std.math.maxInt(u64)),
    );

    // if out of date = recreate swapchain
    var image_index: u32 = undefined;
    const r1: Result = @enumFromInt(@as(i32, @intCast(vk.vkAcquireNextImageKHR(
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

    // only reset if doing work - prevents deadlock
    try isSuccess(vk.vkResetFences(self.device, 1, &self.in_flight_fences[self.current_frame]));

    try isSuccess(vk.vkResetCommandBuffer(self.command_buffers[self.current_frame], 0));
    try self.recordCommandBuffer(self.command_buffers[self.current_frame], image_index);

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
    const r2: Result = @enumFromInt(@as(i32, @intCast(vk.vkQueuePresentKHR(self.present_queue, &present_info))));
    switch (r2) {
        .success => {},
        .out_of_date, .suboptimal => {
            try self.recreateSwapchain();
        },
        inline else => |err| return @field(anyerror, @tagName(err)),
    }

    self.current_frame = @mod(self.current_frame + 1, MAX_FRAMES_IN_FLIGHT);
}
