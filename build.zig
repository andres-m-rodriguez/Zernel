const std = @import("std");

pub fn build(b: *std.Build) void {
    var query: std.Target.Query = .{
        .cpu_arch = .x86,
        .os_tag = .freestanding,
        .abi = .none,
    };

    const Target = std.Target.x86;
    query.cpu_features_sub = Target.featureSet(&.{ .mmx, .sse, .sse2, .avx, .avx2 });

    const target = b.resolveTargetQuery(query);
    const optimize = b.standardOptimizeOption(.{ .preferred_optimize_mode = .ReleaseSmall });

    const kernel = b.addExecutable(.{
        .name = "kernel",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .red_zone = false,
        }),
    });

    kernel.addAssemblyFile(b.path("src/boot.s"));
    kernel.setLinkerScript(b.path("linker.ld"));
    b.installArtifact(kernel);
}
