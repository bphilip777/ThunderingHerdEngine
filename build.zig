const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib_mod = b.createModule(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    const exe_mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    exe_mod.addImport("ThunderingHerd_lib", lib_mod);

    const lib = b.addLibrary(.{
        .linkage = .static,
        .name = "ThunderingHerdEngine",
        .root_module = lib_mod,
    });

    b.installArtifact(lib);

    const exe = b.addExecutable(.{
        .name = "ThunderingHerd",
        .root_module = exe_mod,
    });

    exe.linkLibC();

    // add vulkan lib - no need for proc addr now
    exe.root_module.addLibraryPath(b.path("vulkan/Lib"));
    exe.root_module.linkSystemLibrary("vulkan-1", .{});
    exe.addIncludePath(b.path("vulkan/Include"));

    // stbi
    const zstbi = b.dependency("zstbi", .{});
    exe.root_module.addImport("zstbi", zstbi.module("root"));
    exe.linkLibrary(zstbi.artifact("zstbi"));

    // // snektron
    // const vulkan = b.dependency("vulkan_zig", std.Build.LazyPath{
    //     .registry = b.dependency("vulkan_headers", .{}).path("registry/vk.xml"),
    // }).module("vulkan-zig");
    // exe.root_module.addImport("vulkan", vulkan);

    // sdl3
    const sdl_dep = b.dependency("sdl", .{
        .target = target,
        .optimize = optimize,
        .preferred_link_mode = .static, // or .dynamic - for now static
    });
    const sdl_lib = sdl_dep.artifact("SDL3");
    exe.root_module.linkLibrary(sdl_lib);
    // const sdl_test_lib = sdl_dep.artifact("SDL3_test");

    // compile shaders
    // to do: have a for loop that runs through directory and builds everything from the start
    const cmd_str = [_][]const u8{ "glslc", "--target-env=vulkan1.2", "-o" };
    const shaders_dir = "shaders";

    const vert_cmd = b.addSystemCommand(&cmd_str);
    const vert_spv = vert_cmd.addOutputFileArg(shaders_dir ++ "/triangle_3d.vert.spv");
    vert_cmd.addFileArg(b.path(shaders_dir ++ "/triangle_3d.vert"));
    exe.root_module.addAnonymousImport("vertex_shader", .{
        .root_source_file = vert_spv,
    });

    const frag_cmd = b.addSystemCommand(&cmd_str);
    const frag_spv = frag_cmd.addOutputFileArg(shaders_dir ++ "/triangle.frag.spv");
    frag_cmd.addFileArg(b.path(shaders_dir ++ "/triangle.frag"));
    exe.root_module.addAnonymousImport("fragment_shader", .{
        .root_source_file = frag_spv,
    });

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const lib_unit_tests = b.addTest(.{
        .root_module = lib_mod,
    });

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const exe_unit_tests = b.addTest(.{
        .root_module = exe_mod,
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);
    test_step.dependOn(&run_exe_unit_tests.step);
}
