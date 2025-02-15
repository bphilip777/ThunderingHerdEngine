const std = @import("std");

pub fn build(b: *std.Build) void {
    // Build
    const target = b.standardTargetOptions(.{});

    const optimize = b.standardOptimizeOption(.{});

    const exe_mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const exe = b.addExecutable(.{
        .name = "gameengine3",
        .root_module = exe_mod,
    });

    b.installArtifact(exe);

    // Commands
    // Shader
    const cmd = b.addSystemCommand(&shader_compilation_commands);
    // need to loop through all shader files in the directory and compile them
    // make a check for whether the file exists or not
    // check whether file is a vert or frag
    const spv = cmd.addOutputFileArg("");
    cmd.addFileArg(b.path("shaders/triangle.vert"));
    const new_name = "old_name" ++ "_vert";
    exe.root_module.addAnonymousImport(new_name, .{
        .root_source_file = spv,
    });

    // Run
    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const exe_unit_tests = b.addTest(.{
        .root_module = exe_mod,
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_exe_unit_tests.step);
}

const shader_compilation_commands = [_][]const u8{
    "glslc",
    "--target-env=vulkan1.2",
    "-o",
};
