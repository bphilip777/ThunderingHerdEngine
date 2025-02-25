pub const Result = enum(i32) {
    success = 0,
    not_ready = 1,
    timeout = 2,
    event_set = 3,
    event_reset = 4,
    incomplete = 5,
    out_of_host_memory = -1,
    out_of_device_memory = -2,
    init_failed = -3,
    device_lost = -4,
    memory_map_failed = -5,
    layer_not_present = -6,
    extension_not_present = -7,
    feature_not_present = -8,
    incompatible_driver = -9,
    too_many_objects = -10,
    format_not_supported = -11,
    fragmented_pool = -12,
    unkown = -13,
    out_of_pool_memory = -1000069000,
    invalid_external_handle = -1000072003,
    fragmentation = -1000161000,
    invalid_opaque_capture_address = -1000257000,
    pipeline_compile_required = 1000297000,
    not_permitted = -1000174001,
    surface_lost = -1000000000,
    native_window_in_use = -1000000001,
    suboptimal = 1000001003,
    out_of_date = -1000001004,
    incomplete_display = -1000003001,
    validation_failed_ext = -1000011001,
    invalid_shader_nv = -1000012000,
    image_usage_not_supported_khr = -1000023000,
    video_picture_layout_not_supported_khr = -1000023001,
    video_profile_operation_not_supported_khr = -1000023002,
    video_profile_format_not_supported_khr = -1000023003,
    video_profile_code_not_supported_khr = -1000023004,
    video_std_version_not_supported_khr = -1000023005,
    invalid_drm_format_modifier_plane_layout_ext = -1000158000,
    full_screen_exclusive_mode_lost_ext = -1000255000,
    thread_idle_khr = 1000268000,
    thread_done_khr = 1000268001,
    operation_deferred_khr = 1000268002,
    not_deferred_khr = 1000268003,
    invalid_video_std_parameters_khr = -1000299000,
    compression_exhausted_ext = -1000338000,
    incompatible_shader_binary_ext = 1000482000,
    pipeline_binary_missing_khr = 1000483000,
    not_enough_space_khr = -1000483000,

    const Self = @This();
    pub const out_of_pool_memory_khr = Self.out_of_pool_memory;
    pub const invalid_external_handle_khr = Self.invalid_external_hanlde;
    pub const fragmentation_ext = Self.fragmentation;
    pub const error_not_permitted_ext = Self.not_permitted;
    pub const not_permitted_khr = Self.not_permitted;
    pub const invalid_device_address_ext = Self.invalid_opaque_capture_address;
    pub const invalid_opaque_capture_address_khr = Self.invalid_opaque_capture_address;
    pub const pipeline_required_ext = Self.pipeline_compile_required;
    pub const pipeline_compile_required_ext = Self.pipeline_compile_required;
};

pub fn isSuccess(value: i32) !void {
    const result: Result = @enumFromInt(value);
    return switch (result) {
        .success => {},
        inline else => |tag| @field(anyerror, @tagName(tag)),
    };
}
