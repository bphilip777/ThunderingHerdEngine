const std = @import("std");
const Allocator = std.mem.Allocator;
const is_debug_mode = @import("builtin").mode == .Debug;

// External dependencies
const zstbi = @import("zstbi"); // Temporary, to be replaced with QOI
const Stopwatch = @import("Stopwatch.zig");

// Graphics API implementations (to be provided in separate files)
const vulkan = @import("GraphicsAPIs/vulkan.zig");
const directx = @import("GraphicsAPIs/directx.zig"); // Placeholder
const metal = @import("GraphicsAPIs/metal.zig");   // Placeholder

// SDL for windowing (temporary, with plans to replace)
const sdl = @cImport({
    @cDefine("SDL_DISABLE_OLD_NAMES", {});
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3/SDL_vulkan.h");
    @cDefine("SDL_MAIN_HANDLED", {});
    @cInclude("SDL3/SDL_main.h");
});

// Assume vk is available from vulkan.zig
const vk = vulkan.vk;

// Asset loading libraries (placeholders for QOI, QOA, QOD)
const qoi = @import("Assets/qoi.zig");   // Quite OK Image
const qoa = @import("Assets/qoa.zig");   // Quite OK Audio
const qod = @import("Assets/qod.zig");   // Quite OK Data

// Core engine struct
const Self = @This();

// ### Graphics API Abstraction (TODO #2)
const GraphicsAPIType = enum { Vulkan, DirectX, Metal };
const GraphicsAPI = struct {
    init: *const fn (allo: Allocator, window: *sdl.SDL_Window) anyerror!void,
    deinit: *const fn () void,
    drawFrame: *const fn (draw_call: DrawCallType) anyerror!void,
};

// Specific implementations
const VulkanAPI = struct {
    instance: vk.Instance, // Example field
    // Add other Vulkan-specific fields as needed
    pub fn init(allo: Allocator, window: *sdl.SDL_Window) anyerror!void {
        // Simplified Vulkan initialization
        _ = try vulkan.initVulkan(allo, window, false);
    }
    pub fn deinit() void {
        // Vulkan cleanup
        vulkan.deinitVulkan();
    }
    pub fn drawFrame(draw_call: DrawCallType) anyerror!void {
        // Vulkan draw implementation based on draw_call
        try vulkan.drawFrame(draw_call);
    }
};

// Placeholder for DirectX and Metal (implement similarly)
const DirectXAPI = struct { pub fn init(allo: Allocator, window: *sdl.SDL_Window) anyerror!void {} pub fn deinit() void {} pub fn drawFrame(draw_call: DrawCallType) anyerror!void {} };
const MetalAPI = struct { pub fn init(allo: Allocator, window: *sdl.SDL_Window) anyerror!void {} pub fn deinit() void {} pub fn drawFrame(draw_call: DrawCallType) anyerror!void {} };

// ### Draw Call Types (TODO #1)
const DrawCallType = enum {
    Immediate,           // Basic immediate mode
    Instanced,           // Instanced rendering
    ComputeOptimized,    // Compute shader optimized
};

// ### Application Callbacks (TODO #3)
const AppCallbacks = struct {
    init: *const fn () anyerror!void,
    update: *const fn (delta_time: f32) anyerror!void,
    render: *const fn () anyerror!void,
    deinit: *const fn () void,
};

// ### Shader Manager (TODO #6)
const ShaderManager = struct {
    shaders: std.AutoHashMap(u32, Shader),
    next_id: u32 = 0,

    const Shader = struct {
        code: []const u8,
        is_2d: bool,
    };

    pub fn init(allo: Allocator) ShaderManager {
        return .{ .shaders = std.AutoHashMap(u32, Shader).init(allo) };
    }

    pub fn deinit(self: *ShaderManager) void {
        self.shaders.deinit();
    }

    pub fn loadShader(self: *ShaderManager, filepath: []const u8, is_2d: bool) !u32 {
        const code = try std.fs.cwd().readFileAlloc(self.shaders.allocator, filepath, 1024 * 1024);
        const id = self.next_id;
        self.next_id += 1;
        try self.shaders.put(id, .{ .code = code, .is_2d = is_2d });
        return id;
    }

    pub fn useShader(self: *const ShaderManager, id: u32) void {
        if (self.shaders.get(id)) |shader| {
            // Apply shader, handling 2D vs 3D differences
            std.debug.print("Using shader {d}: 2D={}\n", .{ id, shader.is_2d });
        }
    }
};

// ### Engine Fields
allo: Allocator,
window: *sdl.SDL_Window,
graphics_api: GraphicsAPI,
api_type: GraphicsAPIType,
callbacks: ?AppCallbacks = null,
current_frame: u32 = 0,
resize: bool = false,
time: Stopwatch,
shader_manager: ShaderManager,

// ### Public Functions
pub fn init(
    allo: Allocator,
    app_name: [*:0]const u8,
    initial_extent: vk.Extent2D,
    api_type: GraphicsAPIType,
) !Self {
    initSDL();

    const window = try createWindow(app_name, initial_extent, &.{ sdl.SDL_WINDOW_RESIZABLE });
    errdefer sdl.SDL_DestroyWindow(window);

    // Initialize graphics API (TODO #2)
    var graphics_api: GraphicsAPI = switch (api_type) {
        .Vulkan => .{ .init = VulkanAPI.init, .deinit = VulkanAPI.deinit, .drawFrame = VulkanAPI.drawFrame },
        .DirectX => .{ .init = DirectXAPI.init, .deinit = DirectXAPI.deinit, .drawFrame = DirectXAPI.drawFrame },
        .Metal => .{ .init = MetalAPI.init, .deinit = MetalAPI.deinit, .drawFrame = MetalAPI.drawFrame },
    };
    try graphics_api.init(allo, window);

    // Initialize asset loaders (TODO #4)
    qoi.init(allo);
    qoa.init(allo);
    qod.init(allo);

    if (is_debug_mode) getSDLVersion();

    return Self{
        .allo = allo,
        .window = window,
        .graphics_api = graphics_api,
        .api_type = api_type,
        .time = Stopwatch.init(),
        .shader_manager = ShaderManager.init(allo),
    };
}

pub fn deinit(self: *Self) void {
    self.shader_manager.deinit();
    self.graphics_api.deinit();
    qoi.deinit();
    qoa.deinit();
    qod.deinit();
    sdl.SDL_DestroyWindow(self.window);
    sdl.SDL_Quit();
    if (self.callbacks) |cb| cb.deinit();
}

pub fn setAppCallbacks(self: *Self, callbacks: AppCallbacks) void {
    self.callbacks = callbacks;
    if (callbacks.init) |init_fn| init_fn() catch |err| {
        std.debug.print("App init failed: {}\n", .{err});
    };
}

pub fn mainLoop(self: *Self) !void {
    const fixed_time_step: f32 = 1.0 / 60.0; // 60 FPS target
    var accumulator: f32 = 0.0;
    var last_time = self.time.elapsed();

    outer: while (true) {
        // Event handling
        var event: sdl.SDL_Event = undefined;
        while (sdl.SDL_PollEvent(&event)) {
            switch (event.type) {
                sdl.SDL_EVENT_QUIT => break :outer,
                sdl.SDL_EVENT_WINDOW_RESIZED => self.resize = true,
                else => {},
            }
        }

        // Timing management (TODO #5)
        const current_time = self.time.elapsed() / std.time.ns_per_s;
        const frame_time = current_time - last_time;
        last_time = current_time;
        accumulator += frame_time;

        while (accumulator >= fixed_time_step) {
            if (self.callbacks) |cb| try cb.update(fixed_time_step);
            accumulator -= fixed_time_step;
        }

        // Render frame
        if (self.resize) {
            try self.recreateSwapchain();
            self.resize = false;
        }
        if (self.callbacks) |cb| try cb.render();
        try self.graphics_api.drawFrame(.Immediate); // Example draw call type (TODO #1)
        self.current_frame += 1;

        // Frame rate check (TODO #5)
        if (is_debug_mode and self.current_frame % 60 == 0) {
            const fps = 1.0 / frame_time;
            std.debug.print("FPS: {d:.2}\n", .{fps});
        }
    }
}

// ### Helper Functions
fn createWindow(
    app_name: [*:0]const u8,
    extent: vk.Extent2D,
    flags: []const sdl.SDL_WindowFlags,
) !*sdl.SDL_Window {
    var combo: u64 = 0;
    for (flags) |flag| combo |= flag;
    return sdl.SDL_CreateWindow(app_name, @intCast(extent.width), @intCast(extent.height), combo) orelse {
        std.debug.print("Failed to create window: {s}\n", .{sdl.SDL_GetError()});
        return error.FailedToCreateWindow;
    };
}

fn recreateSwapchain(self: *Self) !void {
    // Placeholder for swapchain recreation
    std.debug.print("Recreating swapchain\n", .{});
}

// ### Asset Loading (TODO #4)
pub fn loadImage(self: *Self, filepath: []const u8) !qoi.Image {
    return qoi.load(filepath, self.allo) catch |err| {
        std.debug.print("Failed to load QOI image: {}\n", .{err});
        return error.FailedToLoadImage;
    };
}

pub fn loadAudio(self: *Self, filepath: []const u8) !qoa.Audio {
    return qoa.load(filepath, self.allo) catch |err| {
        std.debug.print("Failed to load QOA audio: {}\n", .{err});
        return error.FailedToLoadAudio;
    };
}

pub fn loadDataModel(self: *Self, filepath: []const u8) !qod.DataModel {
    return qod.load(filepath, self.allo) catch |err| {
        std.debug.print("Failed to load QOD data: {}\n", .{err});
        return error.FailedToLoadData;
    };
}

// ### Utility Functions
fn initSDL() void {
    sdl.SDL_SetMainReady();
    _ = sdl.SDL_Init(sdl.SDL_INIT_VIDEO);
}

fn getSDLVersion() void {
    const version = sdl.SDL_GetVersion();
    std.debug.print("SDL Version: {d}.{d}.{d}\n", .{ 
        sdl.SDL_VERSIONNUM_MAJOR(version), 
        sdl.SDL_VERSIONNUM_MINOR(version), 
        sdl.SDL_VERSIONNUM_MICRO(version) 
    });
}
