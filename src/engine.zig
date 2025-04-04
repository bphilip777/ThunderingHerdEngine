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

const vk = @import("vulkan/vulkan3.zig");
const isSuccess = vk.isSuccess;

const builtin = @import("builtin");
// const zstbi = @import("zstbi");
const Window = @import("Window.zig");
const Vulkan = @import("GraphicsAPIs/vulkan/vulkan.zig");
// const Metal = @import("GraphicsAPIs/metal/metal.zig");
// const DirectX = @import("GraphicsAPIs/directx12/directx.zig");

const Stopwatch = @import("Stopwatch.zig");

// sdl - huge library - hopefully drop support in the future
// const sdl = @cImport({
//     @cDefine("SDL_DISABLE_OLD_NAMES", {});
//     @cInclude("SDL3/SDL.h");
//     @cInclude("SDL3/SDL_revision.h");
//
//     // @cDefine("VULKAN_H_", "1");
//     @cInclude("SDL3/SDL_vulkan.h");
//
//     @cDefine("SDL_MAIN_HANDLED", {}); // for programs w/ their own entry point
//     @cInclude("SDL3/SDL_main.h");
// });

const Self = @This();

allo: Allocator,
window: *Window,
// graphics_api: GraphicsAPI, // should be a tagged union
// vulkan: Vulkan,
// metal: ?Metal = null,
// directX: ?DirectX = null,

// current_frame: u32 = 0,
// resize: bool = false,
// time: Stopwatch,

// public functions
pub fn init(allo: Allocator, app_name: [*:0]const u8, initial_extent: vk.Extent2D) !Self {
    // TODO: drop sdl use in the future
    // errdefer |err| if (err == error.SdlError) std.log.err("Sdl Error: {s}", .{sdl.SDL_GetError()});
    // if (is_debug_mode) getSDLVersion();
    // initSDL();

    // TODO: swap with custom QOI loader - faster + memory efficient
    // zstbi.init(allo);

    // const window: *sdl.SDL_Window = sdl.SDL_CreateWindow(
    //     app_name,
    //     @as(c_int, @intCast(initial_extent.width)),
    //     @as(c_int, @intCast(initial_extent.height)),
    //     @as(u64, sdl.SDL_WINDOW_RESIZABLE | sdl.SDL_WINDOW_VULKAN),
    // ) orelse {
    //     std.debug.print("Failed to create window: {s}\n", .{sdl.SDL_GetError()});
    //     return error.FailedToCreateWindow;
    // };

    // const vulkan = try Vulkan.init(allo);

    // const time = Stopwatch.init();
    // if (is_debug_mode) std.debug.print("Stopwatch started\n", .{});

    return Self{
        .allo = allo,
        .window = window,
        // .vulkan = vulkan,
        // .surface = surface,
        // .time = time,
    };
}

pub fn deinit(self: *Self) void {
    // defer sdl.SDL_Quit();
    // defer zstbi.deinit();
    // defer sdl.SDL_DestroyWindow(self.window);
    // defer self.vulkan.deinit();
}

pub fn mainLoop(self: *Self) !void {
    // Main Loop
    outer: while (true) {
        var event: sdl.SDL_Event = undefined;
        while (sdl.SDL_PollEvent(&event)) {
            switch (event.type) {
                sdl.SDL_EVENT_QUIT => break :outer,
                // sdl.SDL_EVENT_WINDOW_SHOWN,
                sdl.SDL_EVENT_WINDOW_RESIZED,
                // sdl.SDL_EVENT_WINDOW_MAXIMIZED,
                // sdl.SDL_EVENT_WINDOW_EXPOSED,
                // sdl.SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED,
                // sdl.SDL_EVENT_WINDOW_METAL_VIEW_RESIZED,
                // sdl.SDL_EVENT_WINDOW_RESTORED,
                // sdl.SDL_EVENT_WINDOW_DISPLAY_CHANGED,
                // sdl.SDL_EVENT_WINDOW_ENTER_FULLSCREEN,
                // sdl.SDL_EVENT_WINDOW_LEAVE_FULLSCREEN,
                => {
                    self.resize = true;
                    break;
                },
                else => {},
            }
        }

        if (self.resize) {
            try self.recreateSwapchain();
        }

        if (self.time.elapsed() > (2 * std.time.ns_per_ms)) {
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

    const window = sdl.SDL_CreateWindow(
        app_name,
        @as(c_int, @intCast(extent.width)),
        @as(c_int, @intCast(extent.height)),
        combo,
    ) orelse {
        std.debug.print("Failed to create window: {s}\n", .{sdl.SDL_GetError()});
        return error.FailedToCreateWindow;
    };

    return window;
}

fn loadImage(filepath: []const u8) !zstbi.Image {
    // TODO: swap from stbi to QOI format - faster + less memory used
    // const filepath = "C:\\Users\\bphil\\Code\\Zig\\ThunderingHerd\\src\\textures\\texture.jpg";

    const info = zstbi.Image.info(filepath);
    std.debug.print("Info: {any}\n", .{info});
    if (!info.is_supported) return error.ImageFileTypeIsNotSupported;

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

    return image_data;
}
