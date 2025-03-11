// Do I need this call too - double overhead
// pub const vk = @cImport({
//     // @cDefine("VK_USE_PLATFORM_WIN32_KHR", "1"); // specific to window impl - different for each software
//     @cInclude("vulkan/vulkan.h");
// });
pub const subpass_external = ~@as(c_uint, 0);
pub const Bool32 = enum(u32) {
    true = 1,
    false = 0,
};
pub const DeviceAddress = u64;
pub const DeviceSize = u64;
pub const Flags = u32;
pub const SampleMask = u32;
pub const Buffer = enum(u64) { null = 0, _ };
pub const Image = enum(u64) { null = 0, _ };
pub const Instance = enum(u64) { null = 0, _ };
pub const PhysicalDevice = enum(u64) { null = 0, _ };
pub const Device = enum(u64) { null = 0, _ };
pub const Queue = enum(u64) { null = 0, _ };
pub const Semaphore = enum(u64) { null = 0, _ };
pub const CommandBuffer = enum(u64) { null = 0, _ };
pub const Fence = enum(u64) { null = 0, _ };
pub const DeviceMemory = enum(u64) { null = 0, _ };
pub const Event = enum(u64) { null = 0, _ };
pub const QueryPool = enum(u64) { null = 0, _ };
pub const BufferView = enum(u64) { null = 0, _ };
pub const ImageView = enum(u64) { null = 0, _ };
pub const ShaderModule = enum(u64) { null = 0, _ };
pub const PipelineCache = enum(u64) { null = 0, _ };
pub const PipelineLayout = enum(u64) { null = 0, _ };
pub const Pipeline = enum(u64) { null = 0, _ };
pub const RenderPass = enum(u64) { null = 0, _ };
pub const DescriptorSetLayout = enum(u64) { null = 0, _ };
pub const Sampler = enum(u64) { null = 0, _ };
pub const DescriptorSet = enum(u64) { null = 0, _ };
pub const DescriptorPool = enum(u64) { null = 0, _ };
pub const Framebuffer = enum(u64) { null = 0, _ };
pub const CommandPool = enum(u64) { null = 0, _ };
pub const Result = enum(i32) {
    error_not_enough_space_khr = -1000483000,
    error_compression_exhausted_ext = -1000338000,
    error_invalid_video_std_parameters_khr = -1000299000,
    error_invalid_opaque_capture_address_khr = -1000257000,
    error_full_screen_exclusive_mode_lost_ext = -1000255000,
    error_not_permitted_ext = -1000174001,
    error_fragmentation_ext = -1000161000,
    error_invalid_drm_format_modifier_plane_layout_ext = -1000158000,
    error_invalid_external_handle_khr = -1000072003,
    error_out_of_pool_memory_khr = -1000069000,
    error_video_std_version_not_supported_khr = -1000023005,
    error_video_profile_codec_not_supported_khr = -1000023004,
    error_video_profile_format_not_supported_khr = -1000023003,
    error_video_profile_operation_not_supported_khr = -1000023002,
    error_video_picture_layout_not_supported_khr = -1000023001,
    error_image_usage_not_supported_khr = -1000023000,
    error_invalid_shader_nv = -1000012000,
    error_validation_failed_ext = -1000011001,
    error_incompatible_display_khr = -1000003001,
    error_out_of_date_khr = -1000001004,
    error_native_window_in_use_khr = -1000000001,
    error_surface_lost_khr = -1000000000,
    error_unknown = -13,
    error_fragmented_pool = -12,
    error_format_not_supported = -11,
    error_too_many_objects = -10,
    error_incompatible_driver = -9,
    error_feature_not_present = -8,
    error_extension_not_present = -7,
    error_layer_not_present = -6,
    error_memory_map_failed = -5,
    error_device_lost = -4,
    error_initialization_failed = -3,
    error_out_of_device_memory = -2,
    error_out_of_host_memory = -1,
    success = 0,
    not_ready = 1,
    timeout = 2,
    event_set = 3,
    event_reset = 4,
    incomplete = 5,
    suboptimal_khr = 1000001003,
    thread_idle_khr = 1000268000,
    thread_done_khr = 1000268001,
    operation_deferred_khr = 1000268002,
    operation_not_deferred_khr = 1000268003,
    error_pipeline_compile_required_ext = 1000297000,
    incompatible_shader_binary_ext = 1000482000,
    pipeline_binary_missing_khr = 1000483000,
    pub const Self = @This();
    pub const error_invalid_device_address_ext = Self.error_invalid_opaque_capture_address_khr;
    pub const error_invalid_opaque_capture_address = Self.error_invalid_opaque_capture_address_khr;
    pub const error_not_permitted_khr = Self.error_not_permitted_ext;
    pub const error_fragmentation = Self.error_fragmentation_ext;
    pub const error_invalid_external_handle = Self.error_invalid_external_handle_khr;
    pub const error_out_of_pool_memory = Self.error_out_of_pool_memory_khr;
    pub const pipeline_compile_required = Self.error_pipeline_compile_required_ext;
    pub const pipeline_compile_required_ext = Self.error_pipeline_compile_required_ext;
    pub const error_incompatible_shader_binary_ext = Self.incompatible_shader_binary_ext;
};
pub fn isSuccess(value: Result) !void {
    // const result: Result = @enumFromInt(value);
    return switch (value) {
        .success => {},
        inline else => |tag| @field(anyerror, @tagName(tag)),
    };
}
pub const StructureType = enum(u32) {
    application_info = 0,
    instance_create_info = 1,
    device_queue_create_info = 2,
    device_create_info = 3,
    submit_info = 4,
    memory_allocate_info = 5,
    mapped_memory_range = 6,
    bind_sparse_info = 7,
    fence_create_info = 8,
    semaphore_create_info = 9,
    event_create_info = 10,
    query_pool_create_info = 11,
    buffer_create_info = 12,
    buffer_view_create_info = 13,
    image_create_info = 14,
    image_view_create_info = 15,
    shader_module_create_info = 16,
    pipeline_cache_create_info = 17,
    pipeline_shader_stage_create_info = 18,
    pipeline_vertex_input_state_create_info = 19,
    pipeline_input_assembly_state_create_info = 20,
    pipeline_tessellation_state_create_info = 21,
    pipeline_viewport_state_create_info = 22,
    pipeline_rasterization_state_create_info = 23,
    pipeline_multisample_state_create_info = 24,
    pipeline_depth_stencil_state_create_info = 25,
    pipeline_color_blend_state_create_info = 26,
    pipeline_dynamic_state_create_info = 27,
    graphics_pipeline_create_info = 28,
    compute_pipeline_create_info = 29,
    pipeline_layout_create_info = 30,
    sampler_create_info = 31,
    descriptor_set_layout_create_info = 32,
    descriptor_pool_create_info = 33,
    descriptor_set_allocate_info = 34,
    write_descriptor_set = 35,
    copy_descriptor_set = 36,
    framebuffer_create_info = 37,
    render_pass_create_info = 38,
    command_pool_create_info = 39,
    command_buffer_allocate_info = 40,
    command_buffer_inheritance_info = 41,
    command_buffer_begin_info = 42,
    render_pass_begin_info = 43,
    buffer_memory_barrier = 44,
    image_memory_barrier = 45,
    memory_barrier = 46,
    loader_instance_create_info = 47,
    loader_device_create_info = 48,
    physical_device_vulkan_1_1_features = 49,
    physical_device_vulkan_1_1_properties = 50,
    physical_device_vulkan_1_2_features = 51,
    physical_device_vulkan_1_2_properties = 52,
    physical_device_vulkan_1_3_features = 53,
    physical_device_vulkan_1_3_properties = 54,
    swapchain_create_info_khr = 1000001000,
    present_info_khr = 1000001001,
    display_mode_create_info_khr = 1000002000,
    display_surface_create_info_khr = 1000002001,
    display_present_info_khr = 1000003000,
    xlib_surface_create_info_khr = 1000004000,
    xcb_surface_create_info_khr = 1000005000,
    wayland_surface_create_info_khr = 1000006000,
    android_surface_create_info_khr = 1000008000,
    win32_surface_create_info_khr = 1000009000,
    debug_report_create_info_ext = 1000011000,
    pipeline_rasterization_state_rasterization_order_amd = 1000018000,
    debug_marker_object_name_info_ext = 1000022000,
    debug_marker_object_tag_info_ext = 1000022001,
    debug_marker_marker_info_ext = 1000022002,
    video_profile_info_khr = 1000023000,
    video_capabilities_khr = 1000023001,
    video_picture_resource_info_khr = 1000023002,
    video_session_memory_requirements_khr = 1000023003,
    bind_video_session_memory_info_khr = 1000023004,
    video_session_create_info_khr = 1000023005,
    video_session_parameters_create_info_khr = 1000023006,
    video_session_parameters_update_info_khr = 1000023007,
    video_begin_coding_info_khr = 1000023008,
    video_end_coding_info_khr = 1000023009,
    video_coding_control_info_khr = 1000023010,
    video_reference_slot_info_khr = 1000023011,
    queue_family_video_properties_khr = 1000023012,
    video_profile_list_info_khr = 1000023013,
    physical_device_video_format_info_khr = 1000023014,
    video_format_properties_khr = 1000023015,
    queue_family_query_result_status_properties_khr = 1000023016,
    video_decode_info_khr = 1000024000,
    video_decode_capabilities_khr = 1000024001,
    video_decode_usage_info_khr = 1000024002,
    dedicated_allocation_image_create_info_nv = 1000026000,
    dedicated_allocation_buffer_create_info_nv = 1000026001,
    dedicated_allocation_memory_allocate_info_nv = 1000026002,
    physical_device_transform_feedback_features_ext = 1000028000,
    physical_device_transform_feedback_properties_ext = 1000028001,
    pipeline_rasterization_state_stream_create_info_ext = 1000028002,
    cu_module_create_info_nvx = 1000029000,
    cu_function_create_info_nvx = 1000029001,
    cu_launch_info_nvx = 1000029002,
    image_view_handle_info_nvx = 1000030000,
    image_view_address_properties_nvx = 1000030001,
    video_encode_h264_capabilities_khr = 1000038000,
    video_encode_h264_session_parameters_create_info_khr = 1000038001,
    video_encode_h264_session_parameters_add_info_khr = 1000038002,
    video_encode_h264_picture_info_khr = 1000038003,
    video_encode_h264_dpb_slot_info_khr = 1000038004,
    video_encode_h264_nalu_slice_info_khr = 1000038005,
    video_encode_h264_gop_remaining_frame_info_khr = 1000038006,
    video_encode_h264_profile_info_khr = 1000038007,
    video_encode_h264_rate_control_info_khr = 1000038008,
    video_encode_h264_rate_control_layer_info_khr = 1000038009,
    video_encode_h264_session_create_info_khr = 1000038010,
    video_encode_h264_quality_level_properties_khr = 1000038011,
    video_encode_h264_session_parameters_get_info_khr = 1000038012,
    video_encode_h264_session_parameters_feedback_info_khr = 1000038013,
    video_encode_h265_capabilities_khr = 1000039000,
    video_encode_h265_session_parameters_create_info_khr = 1000039001,
    video_encode_h265_session_parameters_add_info_khr = 1000039002,
    video_encode_h265_picture_info_khr = 1000039003,
    video_encode_h265_dpb_slot_info_khr = 1000039004,
    video_encode_h265_nalu_slice_segment_info_khr = 1000039005,
    video_encode_h265_gop_remaining_frame_info_khr = 1000039006,
    video_encode_h265_profile_info_khr = 1000039007,
    video_encode_h265_rate_control_info_khr = 1000039009,
    video_encode_h265_rate_control_layer_info_khr = 1000039010,
    video_encode_h265_session_create_info_khr = 1000039011,
    video_encode_h265_quality_level_properties_khr = 1000039012,
    video_encode_h265_session_parameters_get_info_khr = 1000039013,
    video_encode_h265_session_parameters_feedback_info_khr = 1000039014,
    video_decode_h264_capabilities_khr = 1000040000,
    video_decode_h264_picture_info_khr = 1000040001,
    video_decode_h264_profile_info_khr = 1000040003,
    video_decode_h264_session_parameters_create_info_khr = 1000040004,
    video_decode_h264_session_parameters_add_info_khr = 1000040005,
    video_decode_h264_dpb_slot_info_khr = 1000040006,
    texture_lod_gather_format_properties_amd = 1000041000,
    rendering_info_khr = 1000044000,
    rendering_attachment_info = 1000044001,
    pipeline_rendering_create_info = 1000044002,
    physical_device_dynamic_rendering_features = 1000044003,
    command_buffer_inheritance_rendering_info_khr = 1000044004,
    rendering_fragment_shading_rate_attachment_info_khr = 1000044006,
    rendering_fragment_density_map_attachment_info_ext = 1000044007,
    attachment_sample_count_info_amd = 1000044008,
    multiview_per_view_attributes_info_nvx = 1000044009,
    stream_descriptor_surface_create_info_ggp = 1000049000,
    physical_device_corner_sampled_image_features_nv = 1000050000,
    render_pass_multiview_create_info = 1000053000,
    physical_device_multiview_features_khr = 1000053001,
    physical_device_multiview_properties_khr = 1000053002,
    external_memory_image_create_info_nv = 1000056000,
    export_memory_allocate_info_nv = 1000056001,
    import_memory_win32_handle_info_nv = 1000057000,
    export_memory_win32_handle_info_nv = 1000057001,
    win32_keyed_mutex_acquire_release_info_nv = 1000058000,
    physical_device_features_2 = 1000059000,
    physical_device_properties_2 = 1000059001,
    format_properties_2 = 1000059002,
    image_format_properties_2_khr = 1000059003,
    physical_device_image_format_info_2 = 1000059004,
    queue_family_properties_2_khr = 1000059005,
    physical_device_memory_properties_2_khr = 1000059006,
    sparse_image_format_properties_2_khr = 1000059007,
    physical_device_sparse_image_format_info_2_khr = 1000059008,
    memory_allocate_flags_info = 1000060000,
    device_group_render_pass_begin_info = 1000060003,
    device_group_command_buffer_begin_info = 1000060004,
    device_group_submit_info_khr = 1000060005,
    device_group_bind_sparse_info_khr = 1000060006,
    device_group_present_capabilities_khr = 1000060007,
    image_swapchain_create_info_khr = 1000060008,
    bind_image_memory_swapchain_info_khr = 1000060009,
    acquire_next_image_info_khr = 1000060010,
    device_group_present_info_khr = 1000060011,
    device_group_swapchain_create_info_khr = 1000060012,
    bind_buffer_memory_device_group_info_khr = 1000060013,
    bind_image_memory_device_group_info_khr = 1000060014,
    validation_flags_ext = 1000061000,
    vi_surface_create_info_nn = 1000062000,
    physical_device_shader_draw_parameter_features = 1000063000,
    physical_device_texture_compression_astc_hdr_features_ext = 1000066000,
    image_view_astc_decode_mode_ext = 1000067000,
    physical_device_astc_decode_features_ext = 1000067001,
    pipeline_robustness_create_info_ext = 1000068000,
    physical_device_pipeline_robustness_features_ext = 1000068001,
    physical_device_pipeline_robustness_properties_ext = 1000068002,
    physical_device_group_properties = 1000070000,
    device_group_device_create_info = 1000070001,
    physical_device_external_image_format_info_khr = 1000071000,
    external_image_format_properties_khr = 1000071001,
    physical_device_external_buffer_info_khr = 1000071002,
    external_buffer_properties_khr = 1000071003,
    physical_device_id_properties_khr = 1000071004,
    external_memory_buffer_create_info = 1000072000,
    external_memory_image_create_info_khr = 1000072001,
    export_memory_allocate_info_khr = 1000072002,
    import_memory_win32_handle_info_khr = 1000073000,
    export_memory_win32_handle_info_khr = 1000073001,
    memory_win32_handle_properties_khr = 1000073002,
    memory_get_win32_handle_info_khr = 1000073003,
    import_memory_fd_info_khr = 1000074000,
    memory_fd_properties_khr = 1000074001,
    memory_get_fd_info_khr = 1000074002,
    win32_keyed_mutex_acquire_release_info_khr = 1000075000,
    physical_device_external_semaphore_info = 1000076000,
    external_semaphore_properties = 1000076001,
    export_semaphore_create_info = 1000077000,
    import_semaphore_win32_handle_info_khr = 1000078000,
    export_semaphore_win32_handle_info_khr = 1000078001,
    d3d12_fence_submit_info_khr = 1000078002,
    semaphore_get_win32_handle_info_khr = 1000078003,
    import_semaphore_fd_info_khr = 1000079000,
    semaphore_get_fd_info_khr = 1000079001,
    physical_device_push_descriptor_properties_khr = 1000080000,
    command_buffer_inheritance_conditional_rendering_info_ext = 1000081000,
    physical_device_conditional_rendering_features_ext = 1000081001,
    conditional_rendering_begin_info_ext = 1000081002,
    physical_device_shader_float16_int8_features = 1000082000,
    physical_device_16bit_storage_features_khr = 1000083000,
    present_regions_khr = 1000084000,
    descriptor_update_template_create_info_khr = 1000085000,
    pipeline_viewport_w_scaling_state_create_info_nv = 1000087000,
    surface_capabilities2_ext = 1000090000,
    display_power_info_ext = 1000091000,
    device_event_info_ext = 1000091001,
    display_event_info_ext = 1000091002,
    swapchain_counter_create_info_ext = 1000091003,
    present_times_info_google = 1000092000,
    physical_device_subgroup_properties = 1000094000,
    physical_device_multiview_per_view_attributes_properties_nvx = 1000097000,
    pipeline_viewport_swizzle_state_create_info_nv = 1000098000,
    physical_device_discard_rectangle_properties_ext = 1000099000,
    pipeline_discard_rectangle_state_create_info_ext = 1000099001,
    physical_device_conservative_rasterization_properties_ext = 1000101000,
    pipeline_rasterization_conservative_state_create_info_ext = 1000101001,
    physical_device_depth_clip_enable_features_ext = 1000102000,
    pipeline_rasterization_depth_clip_state_create_info_ext = 1000102001,
    hdr_metadata_ext = 1000105000,
    physical_device_imageless_framebuffer_features_khr = 1000108000,
    framebuffer_attachments_create_info_khr = 1000108001,
    framebuffer_attachment_image_info = 1000108002,
    render_pass_attachment_begin_info = 1000108003,
    attachment_description_2_khr = 1000109000,
    attachment_reference_2_khr = 1000109001,
    subpass_description_2 = 1000109002,
    subpass_dependency_2_khr = 1000109003,
    render_pass_create_info_2_khr = 1000109004,
    subpass_begin_info_khr = 1000109005,
    subpass_end_info = 1000109006,
    physical_device_relaxed_line_rasterization_features_img = 1000110000,
    shared_present_surface_capabilities_khr = 1000111000,
    physical_device_external_fence_info = 1000112000,
    external_fence_properties = 1000112001,
    export_fence_create_info = 1000113000,
    import_fence_win32_handle_info_khr = 1000114000,
    export_fence_win32_handle_info_khr = 1000114001,
    fence_get_win32_handle_info_khr = 1000114002,
    import_fence_fd_info_khr = 1000115000,
    fence_get_fd_info_khr = 1000115001,
    physical_device_performance_query_features_khr = 1000116000,
    physical_device_performance_query_properties_khr = 1000116001,
    query_pool_performance_create_info_khr = 1000116002,
    performance_query_submit_info_khr = 1000116003,
    acquire_profiling_lock_info_khr = 1000116004,
    performance_counter_khr = 1000116005,
    performance_counter_description_khr = 1000116006,
    physical_device_point_clipping_properties_khr = 1000117000,
    render_pass_input_attachment_aspect_create_info = 1000117001,
    image_view_usage_create_info = 1000117002,
    pipeline_tessellation_domain_origin_state_create_info = 1000117003,
    physical_device_surface_info_2_khr = 1000119000,
    surface_capabilities_2_khr = 1000119001,
    surface_format_2_khr = 1000119002,
    physical_device_variable_pointer_features_khr = 1000120000,
    display_properties_2_khr = 1000121000,
    display_plane_properties_2_khr = 1000121001,
    display_mode_properties_2_khr = 1000121002,
    display_plane_info_2_khr = 1000121003,
    display_plane_capabilities_2_khr = 1000121004,
    ios_surface_create_info_mvk = 1000122000,
    macos_surface_create_info_mvk = 1000123000,
    memory_dedicated_requirements_khr = 1000127000,
    memory_dedicated_allocate_info = 1000127001,
    debug_utils_object_name_info_ext = 1000128000,
    debug_utils_object_tag_info_ext = 1000128001,
    debug_utils_label_ext = 1000128002,
    debug_utils_messenger_callback_data_ext = 1000128003,
    debug_utils_messenger_create_info_ext = 1000128004,
    android_hardware_buffer_usage_android = 1000129000,
    android_hardware_buffer_properties_android = 1000129001,
    android_hardware_buffer_format_properties_android = 1000129002,
    import_android_hardware_buffer_info_android = 1000129003,
    memory_get_android_hardware_buffer_info_android = 1000129004,
    external_format_android = 1000129005,
    android_hardware_buffer_format_properties_2_android = 1000129006,
    physical_device_sampler_filter_minmax_properties = 1000130000,
    sampler_reduction_mode_create_info = 1000130001,
    physical_device_inline_uniform_block_features = 1000138000,
    physical_device_inline_uniform_block_properties = 1000138001,
    write_descriptor_set_inline_uniform_block = 1000138002,
    descriptor_pool_inline_uniform_block_create_info = 1000138003,
    sample_locations_info_ext = 1000143000,
    render_pass_sample_locations_begin_info_ext = 1000143001,
    pipeline_sample_locations_state_create_info_ext = 1000143002,
    physical_device_sample_locations_properties_ext = 1000143003,
    multisample_properties_ext = 1000143004,
    protected_submit_info = 1000145000,
    physical_device_protected_memory_features = 1000145001,
    physical_device_protected_memory_properties = 1000145002,
    device_queue_info_2 = 1000145003,
    buffer_memory_requirements_info_2_khr = 1000146000,
    image_memory_requirements_info_2_khr = 1000146001,
    image_sparse_memory_requirements_info_2_khr = 1000146002,
    memory_requirements_2 = 1000146003,
    sparse_image_memory_requirements_2_khr = 1000146004,
    image_format_list_create_info = 1000147000,
    physical_device_blend_operation_advanced_features_ext = 1000148000,
    physical_device_blend_operation_advanced_properties_ext = 1000148001,
    pipeline_color_blend_advanced_state_create_info_ext = 1000148002,
    pipeline_coverage_to_color_state_create_info_nv = 1000149000,
    acceleration_structure_build_geometry_info_khr = 1000150000,
    acceleration_structure_device_address_info_khr = 1000150002,
    acceleration_structure_geometry_aabbs_data_khr = 1000150003,
    acceleration_structure_geometry_instances_data_khr = 1000150004,
    acceleration_structure_geometry_triangles_data_khr = 1000150005,
    acceleration_structure_geometry_khr = 1000150006,
    write_descriptor_set_acceleration_structure_khr = 1000150007,
    acceleration_structure_version_info_khr = 1000150009,
    copy_acceleration_structure_info_khr = 1000150010,
    copy_acceleration_structure_to_memory_info_khr = 1000150011,
    copy_memory_to_acceleration_structure_info_khr = 1000150012,
    physical_device_acceleration_structure_features_khr = 1000150013,
    physical_device_acceleration_structure_properties_khr = 1000150014,
    ray_tracing_pipeline_create_info_khr = 1000150015,
    ray_tracing_shader_group_create_info_khr = 1000150016,
    acceleration_structure_create_info_khr = 1000150017,
    ray_tracing_pipeline_interface_create_info_khr = 1000150018,
    acceleration_structure_build_sizes_info_khr = 1000150020,
    pipeline_coverage_modulation_state_create_info_nv = 1000152000,
    physical_device_shader_sm_builtins_features_nv = 1000154000,
    physical_device_shader_sm_builtins_properties_nv = 1000154001,
    sampler_ycbcr_conversion_create_info_khr = 1000156000,
    sampler_ycbcr_conversion_info_khr = 1000156001,
    bind_image_plane_memory_info_khr = 1000156002,
    image_plane_memory_requirements_info_khr = 1000156003,
    physical_device_sampler_ycbcr_conversion_features_khr = 1000156004,
    sampler_ycbcr_conversion_image_format_properties = 1000156005,
    bind_buffer_memory_info_khr = 1000157000,
    bind_image_memory_info_khr = 1000157001,
    drm_format_modifier_properties_list_ext = 1000158000,
    physical_device_image_drm_format_modifier_info_ext = 1000158002,
    image_drm_format_modifier_list_create_info_ext = 1000158003,
    image_drm_format_modifier_explicit_create_info_ext = 1000158004,
    image_drm_format_modifier_properties_ext = 1000158005,
    drm_format_modifier_properties_list_2_ext = 1000158006,
    validation_cache_create_info_ext = 1000160000,
    shader_module_validation_cache_create_info_ext = 1000160001,
    descriptor_set_layout_binding_flags_create_info = 1000161000,
    physical_device_descriptor_indexing_features = 1000161001,
    physical_device_descriptor_indexing_properties = 1000161002,
    descriptor_set_variable_descriptor_count_allocate_info = 1000161003,
    descriptor_set_variable_descriptor_count_layout_support_ext = 1000161004,
    pipeline_viewport_shading_rate_image_state_create_info_nv = 1000164000,
    physical_device_shading_rate_image_features_nv = 1000164001,
    physical_device_shading_rate_image_properties_nv = 1000164002,
    pipeline_viewport_coarse_sample_order_state_create_info_nv = 1000164005,
    ray_tracing_pipeline_create_info_nv = 1000165000,
    acceleration_structure_create_info_nv = 1000165001,
    geometry_nv = 1000165003,
    geometry_triangles_nv = 1000165004,
    geometry_aabb_nv = 1000165005,
    bind_acceleration_structure_memory_info_nv = 1000165006,
    write_descriptor_set_acceleration_structure_nv = 1000165007,
    acceleration_structure_memory_requirements_info_nv = 1000165008,
    physical_device_ray_tracing_properties_nv = 1000165009,
    ray_tracing_shader_group_create_info_nv = 1000165011,
    acceleration_structure_info_nv = 1000165012,
    physical_device_representative_fragment_test_features_nv = 1000166000,
    pipeline_representative_fragment_test_state_create_info_nv = 1000166001,
    physical_device_maintenance_3_properties_khr = 1000168000,
    descriptor_set_layout_support = 1000168001,
    physical_device_image_view_image_format_info_ext = 1000170000,
    filter_cubic_image_view_image_format_properties_ext = 1000170001,
    device_queue_global_priority_create_info_khr = 1000174000,
    physical_device_shader_subgroup_extended_types_features = 1000175000,
    physical_device_8bit_storage_features = 1000177000,
    import_memory_host_pointer_info_ext = 1000178000,
    memory_host_pointer_properties_ext = 1000178001,
    physical_device_external_memory_host_properties_ext = 1000178002,
    physical_device_shader_atomic_int64_features = 1000180000,
    physical_device_shader_clock_features_khr = 1000181000,
    pipeline_compiler_control_create_info_amd = 1000183000,
    calibrated_timestamp_info_ext = 1000184000,
    physical_device_shader_core_properties_amd = 1000185000,
    video_decode_h265_capabilities_khr = 1000187000,
    video_decode_h265_session_parameters_create_info_khr = 1000187001,
    video_decode_h265_session_parameters_add_info_khr = 1000187002,
    video_decode_h265_profile_info_khr = 1000187003,
    video_decode_h265_picture_info_khr = 1000187004,
    video_decode_h265_dpb_slot_info_khr = 1000187005,
    device_memory_overallocation_create_info_amd = 1000189000,
    physical_device_vertex_attribute_divisor_properties_ext = 1000190000,
    pipeline_vertex_input_divisor_state_create_info_khr = 1000190001,
    physical_device_vertex_attribute_divisor_features_ext = 1000190002,
    present_frame_token_ggp = 1000191000,
    pipeline_creation_feedback_create_info = 1000192000,
    physical_device_driver_properties_khr = 1000196000,
    physical_device_float_controls_properties = 1000197000,
    physical_device_depth_stencil_resolve_properties_khr = 1000199000,
    subpass_description_depth_stencil_resolve_khr = 1000199001,
    physical_device_compute_shader_derivatives_features_khr = 1000201000,
    physical_device_mesh_shader_features_nv = 1000202000,
    physical_device_mesh_shader_properties_nv = 1000202001,
    physical_device_fragment_shader_barycentric_features_khr = 1000203000,
    physical_device_shader_image_footprint_features_nv = 1000204000,
    pipeline_viewport_exclusive_scissor_state_create_info_nv = 1000205000,
    physical_device_exclusive_scissor_features_nv = 1000205002,
    checkpoint_data_nv = 1000206000,
    queue_family_checkpoint_properties_nv = 1000206001,
    physical_device_timeline_semaphore_features = 1000207000,
    physical_device_timeline_semaphore_properties_khr = 1000207001,
    semaphore_type_create_info_khr = 1000207002,
    timeline_semaphore_submit_info = 1000207003,
    semaphore_wait_info_khr = 1000207004,
    semaphore_signal_info = 1000207005,
    physical_device_shader_integer_functions_2_features_intel = 1000209000,
    query_pool_create_info_intel = 1000210000,
    initialize_performance_api_info_intel = 1000210001,
    performance_marker_info_intel = 1000210002,
    performance_stream_marker_info_intel = 1000210003,
    performance_override_info_intel = 1000210004,
    performance_configuration_acquire_info_intel = 1000210005,
    physical_device_vulkan_memory_model_features = 1000211000,
    physical_device_pci_bus_info_properties_ext = 1000212000,
    display_native_hdr_surface_capabilities_amd = 1000213000,
    swapchain_display_native_hdr_create_info_amd = 1000213001,
    imagepipe_surface_create_info_fuchsia = 1000214000,
    physical_device_shader_terminate_invocation_features = 1000215000,
    metal_surface_create_info_ext = 1000217000,
    physical_device_fragment_density_map_features_ext = 1000218000,
    physical_device_fragment_density_map_properties_ext = 1000218001,
    render_pass_fragment_density_map_create_info_ext = 1000218002,
    physical_device_scalar_block_layout_features = 1000221000,
    physical_device_subgroup_size_control_properties = 1000225000,
    shader_required_subgroup_size_create_info_ext = 1000225001,
    physical_device_subgroup_size_control_features_ext = 1000225002,
    fragment_shading_rate_attachment_info_khr = 1000226000,
    pipeline_fragment_shading_rate_state_create_info_khr = 1000226001,
    physical_device_fragment_shading_rate_properties_khr = 1000226002,
    physical_device_fragment_shading_rate_features_khr = 1000226003,
    physical_device_fragment_shading_rate_khr = 1000226004,
    physical_device_shader_core_properties_2_amd = 1000227000,
    physical_device_coherent_memory_features_amd = 1000229000,
    physical_device_dynamic_rendering_local_read_features_khr = 1000232000,
    rendering_attachment_location_info_khr = 1000232001,
    rendering_input_attachment_index_info_khr = 1000232002,
    physical_device_shader_image_atomic_int64_features_ext = 1000234000,
    physical_device_shader_quad_control_features_khr = 1000235000,
    physical_device_memory_budget_properties_ext = 1000237000,
    physical_device_memory_priority_features_ext = 1000238000,
    memory_priority_allocate_info_ext = 1000238001,
    surface_protected_capabilities_khr = 1000239000,
    physical_device_dedicated_allocation_image_aliasing_features_nv = 1000240000,
    physical_device_separate_depth_stencil_layouts_features_khr = 1000241000,
    attachment_reference_stencil_layout_khr = 1000241001,
    attachment_description_stencil_layout_khr = 1000241002,
    physical_device_buffer_device_address_features_ext = 1000244000,
    buffer_device_address_info_khr = 1000244001,
    buffer_device_address_create_info_ext = 1000244002,
    physical_device_tool_properties = 1000245000,
    image_stencil_usage_create_info = 1000246000,
    validation_features_ext = 1000247000,
    physical_device_present_wait_features_khr = 1000248000,
    physical_device_cooperative_matrix_features_nv = 1000249000,
    cooperative_matrix_properties_nv = 1000249001,
    physical_device_cooperative_matrix_properties_nv = 1000249002,
    physical_device_coverage_reduction_mode_features_nv = 1000250000,
    pipeline_coverage_reduction_state_create_info_nv = 1000250001,
    framebuffer_mixed_samples_combination_nv = 1000250002,
    physical_device_fragment_shader_interlock_features_ext = 1000251000,
    physical_device_ycbcr_image_arrays_features_ext = 1000252000,
    physical_device_uniform_buffer_standard_layout_features_khr = 1000253000,
    physical_device_provoking_vertex_features_ext = 1000254000,
    pipeline_rasterization_provoking_vertex_state_create_info_ext = 1000254001,
    physical_device_provoking_vertex_properties_ext = 1000254002,
    surface_full_screen_exclusive_info_ext = 1000255000,
    surface_full_screen_exclusive_win32_info_ext = 1000255001,
    surface_capabilities_full_screen_exclusive_ext = 1000255002,
    headless_surface_create_info_ext = 1000256000,
    physical_device_buffer_device_address_features = 1000257000,
    buffer_opaque_capture_address_create_info = 1000257002,
    memory_opaque_capture_address_allocate_info = 1000257003,
    device_memory_opaque_capture_address_info_khr = 1000257004,
    physical_device_line_rasterization_features_khr = 1000259000,
    pipeline_rasterization_line_state_create_info_khr = 1000259001,
    physical_device_line_rasterization_properties_khr = 1000259002,
    physical_device_shader_atomic_float_features_ext = 1000260000,
    physical_device_host_query_reset_features_ext = 1000261000,
    physical_device_index_type_uint8_features_khr = 1000265000,
    physical_device_extended_dynamic_state_features_ext = 1000267000,
    physical_device_pipeline_executable_properties_features_khr = 1000269000,
    pipeline_info_khr = 1000269001,
    pipeline_executable_properties_khr = 1000269002,
    pipeline_executable_info_khr = 1000269003,
    pipeline_executable_statistic_khr = 1000269004,
    pipeline_executable_internal_representation_khr = 1000269005,
    physical_device_host_image_copy_features_ext = 1000270000,
    physical_device_host_image_copy_properties_ext = 1000270001,
    memory_to_image_copy_ext = 1000270002,
    image_to_memory_copy_ext = 1000270003,
    copy_image_to_memory_info_ext = 1000270004,
    copy_memory_to_image_info_ext = 1000270005,
    host_image_layout_transition_info_ext = 1000270006,
    copy_image_to_image_info_ext = 1000270007,
    subresource_host_memcpy_size_ext = 1000270008,
    host_image_copy_device_performance_query_ext = 1000270009,
    memory_map_info_khr = 1000271000,
    memory_unmap_info_khr = 1000271001,
    physical_device_map_memory_placed_features_ext = 1000272000,
    physical_device_map_memory_placed_properties_ext = 1000272001,
    memory_map_placed_info_ext = 1000272002,
    physical_device_shader_atomic_float_2_features_ext = 1000273000,
    surface_present_mode_ext = 1000274000,
    surface_present_scaling_capabilities_ext = 1000274001,
    surface_present_mode_compatibility_ext = 1000274002,
    physical_device_swapchain_maintenance_1_features_ext = 1000275000,
    swapchain_present_fence_info_ext = 1000275001,
    swapchain_present_modes_create_info_ext = 1000275002,
    swapchain_present_mode_info_ext = 1000275003,
    swapchain_present_scaling_create_info_ext = 1000275004,
    release_swapchain_images_info_ext = 1000275005,
    physical_device_shader_demote_to_helper_invocation_features = 1000276000,
    physical_device_device_generated_commands_properties_nv = 1000277000,
    graphics_shader_group_create_info_nv = 1000277001,
    graphics_pipeline_shader_groups_create_info_nv = 1000277002,
    indirect_commands_layout_token_nv = 1000277003,
    indirect_commands_layout_create_info_nv = 1000277004,
    generated_commands_info_nv = 1000277005,
    generated_commands_memory_requirements_info_nv = 1000277006,
    physical_device_device_generated_commands_features_nv = 1000277007,
    physical_device_inherited_viewport_scissor_features_nv = 1000278000,
    command_buffer_inheritance_viewport_scissor_info_nv = 1000278001,
    physical_device_shader_integer_dot_product_features_khr = 1000280000,
    physical_device_shader_integer_dot_product_properties_khr = 1000280001,
    physical_device_texel_buffer_alignment_features_ext = 1000281000,
    physical_device_texel_buffer_alignment_properties_ext = 1000281001,
    command_buffer_inheritance_render_pass_transform_info_qcom = 1000282000,
    render_pass_transform_begin_info_qcom = 1000282001,
    physical_device_depth_bias_control_features_ext = 1000283000,
    depth_bias_info_ext = 1000283001,
    depth_bias_representation_info_ext = 1000283002,
    physical_device_device_memory_report_features_ext = 1000284000,
    device_device_memory_report_create_info_ext = 1000284001,
    device_memory_report_callback_data_ext = 1000284002,
    physical_device_robustness_2_features_ext = 1000286000,
    physical_device_robustness_2_properties_ext = 1000286001,
    sampler_custom_border_color_create_info_ext = 1000287000,
    physical_device_custom_border_color_properties_ext = 1000287001,
    physical_device_custom_border_color_features_ext = 1000287002,
    pipeline_library_create_info_khr = 1000290000,
    physical_device_present_barrier_features_nv = 1000292000,
    surface_capabilities_present_barrier_nv = 1000292001,
    swapchain_present_barrier_create_info_nv = 1000292002,
    present_id_khr = 1000294000,
    physical_device_present_id_features_khr = 1000294001,
    physical_device_private_data_features_ext = 1000295000,
    device_private_data_create_info_ext = 1000295001,
    private_data_slot_create_info_ext = 1000295002,
    physical_device_pipeline_creation_cache_control_features = 1000297000,
    video_encode_info_khr = 1000299000,
    video_encode_rate_control_info_khr = 1000299001,
    video_encode_rate_control_layer_info_khr = 1000299002,
    video_encode_capabilities_khr = 1000299003,
    video_encode_usage_info_khr = 1000299004,
    query_pool_video_encode_feedback_create_info_khr = 1000299005,
    physical_device_video_encode_quality_level_info_khr = 1000299006,
    video_encode_quality_level_properties_khr = 1000299007,
    video_encode_quality_level_info_khr = 1000299008,
    video_encode_session_parameters_get_info_khr = 1000299009,
    video_encode_session_parameters_feedback_info_khr = 1000299010,
    physical_device_diagnostics_config_features_nv = 1000300000,
    device_diagnostics_config_create_info_nv = 1000300001,
    cuda_module_create_info_nv = 1000307000,
    cuda_function_create_info_nv = 1000307001,
    cuda_launch_info_nv = 1000307002,
    physical_device_cuda_kernel_launch_features_nv = 1000307003,
    physical_device_cuda_kernel_launch_properties_nv = 1000307004,
    query_low_latency_support_nv = 1000310000,
    export_metal_object_create_info_ext = 1000311000,
    export_metal_objects_info_ext = 1000311001,
    export_metal_device_info_ext = 1000311002,
    export_metal_command_queue_info_ext = 1000311003,
    export_metal_buffer_info_ext = 1000311004,
    import_metal_buffer_info_ext = 1000311005,
    export_metal_texture_info_ext = 1000311006,
    import_metal_texture_info_ext = 1000311007,
    export_metal_io_surface_info_ext = 1000311008,
    import_metal_io_surface_info_ext = 1000311009,
    export_metal_shared_event_info_ext = 1000311010,
    import_metal_shared_event_info_ext = 1000311011,
    memory_barrier_2 = 1000314000,
    buffer_memory_barrier_2_khr = 1000314001,
    image_memory_barrier_2 = 1000314002,
    dependency_info = 1000314003,
    submit_info_2 = 1000314004,
    semaphore_submit_info = 1000314005,
    command_buffer_submit_info = 1000314006,
    physical_device_synchronization_2_features = 1000314007,
    queue_family_checkpoint_properties_2_nv = 1000314008,
    checkpoint_data_2_nv = 1000314009,
    physical_device_descriptor_buffer_properties_ext = 1000316000,
    physical_device_descriptor_buffer_density_map_properties_ext = 1000316001,
    physical_device_descriptor_buffer_features_ext = 1000316002,
    descriptor_address_info_ext = 1000316003,
    descriptor_get_info_ext = 1000316004,
    buffer_capture_descriptor_data_info_ext = 1000316005,
    image_capture_descriptor_data_info_ext = 1000316006,
    image_view_capture_descriptor_data_info_ext = 1000316007,
    sampler_capture_descriptor_data_info_ext = 1000316008,
    acceleration_structure_capture_descriptor_data_info_ext = 1000316009,
    opaque_capture_descriptor_data_create_info_ext = 1000316010,
    descriptor_buffer_binding_info_ext = 1000316011,
    descriptor_buffer_binding_push_descriptor_buffer_handle_ext = 1000316012,
    physical_device_graphics_pipeline_library_features_ext = 1000320000,
    physical_device_graphics_pipeline_library_properties_ext = 1000320001,
    graphics_pipeline_library_create_info_ext = 1000320002,
    physical_device_shader_early_and_late_fragment_tests_features_amd = 1000321000,
    physical_device_fragment_shader_barycentric_properties_khr = 1000322000,
    physical_device_shader_subgroup_uniform_control_flow_features_khr = 1000323000,
    physical_device_zero_initialize_workgroup_memory_features = 1000325000,
    physical_device_fragment_shading_rate_enums_properties_nv = 1000326000,
    physical_device_fragment_shading_rate_enums_features_nv = 1000326001,
    pipeline_fragment_shading_rate_enum_state_create_info_nv = 1000326002,
    acceleration_structure_geometry_motion_triangles_data_nv = 1000327000,
    physical_device_ray_tracing_motion_blur_features_nv = 1000327001,
    acceleration_structure_motion_info_nv = 1000327002,
    physical_device_mesh_shader_features_ext = 1000328000,
    physical_device_mesh_shader_properties_ext = 1000328001,
    physical_device_ycbcr_2_plane_444_formats_features_ext = 1000330000,
    physical_device_fragment_density_map_2_features_ext = 1000332000,
    physical_device_fragment_density_map_2_properties_ext = 1000332001,
    copy_command_transform_info_qcom = 1000333000,
    physical_device_image_robustness_features_ext = 1000335000,
    physical_device_workgroup_memory_explicit_layout_features_khr = 1000336000,
    copy_buffer_info_2_khr = 1000337000,
    copy_image_info_2 = 1000337001,
    copy_buffer_to_image_info_2_khr = 1000337002,
    copy_image_to_buffer_info_2_khr = 1000337003,
    blit_image_info_2_khr = 1000337004,
    resolve_image_info_2_khr = 1000337005,
    buffer_copy_2 = 1000337006,
    image_copy_2 = 1000337007,
    image_blit_2 = 1000337008,
    buffer_image_copy_2 = 1000337009,
    image_resolve_2 = 1000337010,
    physical_device_image_compression_control_features_ext = 1000338000,
    image_compression_control_ext = 1000338001,
    subresource_layout_2_ext = 1000338002,
    image_subresource_2_ext = 1000338003,
    image_compression_properties_ext = 1000338004,
    physical_device_attachment_feedback_loop_layout_features_ext = 1000339000,
    physical_device_4444_formats_features_ext = 1000340000,
    physical_device_fault_features_ext = 1000341000,
    device_fault_counts_ext = 1000341001,
    device_fault_info_ext = 1000341002,
    physical_device_rasterization_order_attachment_access_features_ext = 1000342000,
    physical_device_rgba10x6_formats_features_ext = 1000344000,
    directfb_surface_create_info_ext = 1000346000,
    physical_device_ray_tracing_pipeline_features_khr = 1000347000,
    physical_device_ray_tracing_pipeline_properties_khr = 1000347001,
    physical_device_ray_query_features_khr = 1000348013,
    physical_device_mutable_descriptor_type_features_ext = 1000351000,
    mutable_descriptor_type_create_info_ext = 1000351002,
    physical_device_vertex_input_dynamic_state_features_ext = 1000352000,
    vertex_input_binding_description_2_ext = 1000352001,
    vertex_input_attribute_description_2_ext = 1000352002,
    physical_device_drm_properties_ext = 1000353000,
    physical_device_address_binding_report_features_ext = 1000354000,
    device_address_binding_callback_data_ext = 1000354001,
    physical_device_depth_clip_control_features_ext = 1000355000,
    pipeline_viewport_depth_clip_control_create_info_ext = 1000355001,
    physical_device_primitive_topology_list_restart_features_ext = 1000356000,
    format_properties_3_khr = 1000360000,
    import_memory_zircon_handle_info_fuchsia = 1000364000,
    memory_zircon_handle_properties_fuchsia = 1000364001,
    memory_get_zircon_handle_info_fuchsia = 1000364002,
    import_semaphore_zircon_handle_info_fuchsia = 1000365000,
    semaphore_get_zircon_handle_info_fuchsia = 1000365001,
    buffer_collection_create_info_fuchsia = 1000366000,
    import_memory_buffer_collection_fuchsia = 1000366001,
    buffer_collection_image_create_info_fuchsia = 1000366002,
    buffer_collection_properties_fuchsia = 1000366003,
    buffer_constraints_info_fuchsia = 1000366004,
    buffer_collection_buffer_create_info_fuchsia = 1000366005,
    image_constraints_info_fuchsia = 1000366006,
    image_format_constraints_info_fuchsia = 1000366007,
    sysmem_color_space_fuchsia = 1000366008,
    buffer_collection_constraints_info_fuchsia = 1000366009,
    subpass_shading_pipeline_create_info_huawei = 1000369000,
    physical_device_subpass_shading_features_huawei = 1000369001,
    physical_device_subpass_shading_properties_huawei = 1000369002,
    physical_device_invocation_mask_features_huawei = 1000370000,
    memory_get_remote_address_info_nv = 1000371000,
    physical_device_external_memory_rdma_features_nv = 1000371001,
    pipeline_properties_identifier_ext = 1000372000,
    physical_device_pipeline_properties_features_ext = 1000372001,
    physical_device_frame_boundary_features_ext = 1000375000,
    frame_boundary_ext = 1000375001,
    physical_device_multisampled_render_to_single_sampled_features_ext = 1000376000,
    subpass_resolve_performance_query_ext = 1000376001,
    multisampled_render_to_single_sampled_info_ext = 1000376002,
    physical_device_extended_dynamic_state_2_features_ext = 1000377000,
    screen_surface_create_info_qnx = 1000378000,
    physical_device_color_write_enable_features_ext = 1000381000,
    pipeline_color_write_create_info_ext = 1000381001,
    physical_device_primitives_generated_query_features_ext = 1000382000,
    physical_device_ray_tracing_maintenance_1_features_khr = 1000386000,
    physical_device_global_priority_query_features_ext = 1000388000,
    queue_family_global_priority_properties_ext = 1000388001,
    physical_device_image_view_min_lod_features_ext = 1000391000,
    image_view_min_lod_create_info_ext = 1000391001,
    physical_device_multi_draw_features_ext = 1000392000,
    physical_device_multi_draw_properties_ext = 1000392001,
    physical_device_image_2d_view_of_3d_features_ext = 1000393000,
    physical_device_shader_tile_image_features_ext = 1000395000,
    physical_device_shader_tile_image_properties_ext = 1000395001,
    micromap_build_info_ext = 1000396000,
    micromap_version_info_ext = 1000396001,
    copy_micromap_info_ext = 1000396002,
    copy_micromap_to_memory_info_ext = 1000396003,
    copy_memory_to_micromap_info_ext = 1000396004,
    physical_device_opacity_micromap_features_ext = 1000396005,
    physical_device_opacity_micromap_properties_ext = 1000396006,
    micromap_create_info_ext = 1000396007,
    micromap_build_sizes_info_ext = 1000396008,
    acceleration_structure_triangles_opacity_micromap_ext = 1000396009,
    physical_device_cluster_culling_shader_features_huawei = 1000404000,
    physical_device_cluster_culling_shader_properties_huawei = 1000404001,
    physical_device_cluster_culling_shader_vrs_features_huawei = 1000404002,
    physical_device_border_color_swizzle_features_ext = 1000411000,
    sampler_border_color_component_mapping_create_info_ext = 1000411001,
    physical_device_pageable_device_local_memory_features_ext = 1000412000,
    physical_device_maintenance_4_features_khr = 1000413000,
    physical_device_maintenance_4_properties = 1000413001,
    device_buffer_memory_requirements_khr = 1000413002,
    device_image_memory_requirements = 1000413003,
    physical_device_shader_core_properties_arm = 1000415000,
    physical_device_shader_subgroup_rotate_features_khr = 1000416000,
    device_queue_shader_core_control_create_info_arm = 1000417000,
    physical_device_scheduling_controls_features_arm = 1000417001,
    physical_device_scheduling_controls_properties_arm = 1000417002,
    physical_device_image_sliced_view_of_3d_features_ext = 1000418000,
    image_view_sliced_create_info_ext = 1000418001,
    physical_device_descriptor_set_host_mapping_features_valve = 1000420000,
    descriptor_set_binding_reference_valve = 1000420001,
    descriptor_set_layout_host_mapping_info_valve = 1000420002,
    physical_device_depth_clamp_zero_one_features_ext = 1000421000,
    physical_device_non_seamless_cube_map_features_ext = 1000422000,
    physical_device_render_pass_striped_features_arm = 1000424000,
    physical_device_render_pass_striped_properties_arm = 1000424001,
    render_pass_stripe_begin_info_arm = 1000424002,
    render_pass_stripe_info_arm = 1000424003,
    render_pass_stripe_submit_info_arm = 1000424004,
    physical_device_fragment_density_map_offset_features_qcom = 1000425000,
    physical_device_fragment_density_map_offset_properties_qcom = 1000425001,
    subpass_fragment_density_map_offset_end_info_qcom = 1000425002,
    physical_device_copy_memory_indirect_features_nv = 1000426000,
    physical_device_copy_memory_indirect_properties_nv = 1000426001,
    physical_device_memory_decompression_features_nv = 1000427000,
    physical_device_memory_decompression_properties_nv = 1000427001,
    physical_device_device_generated_commands_compute_features_nv = 1000428000,
    compute_pipeline_indirect_buffer_info_nv = 1000428001,
    pipeline_indirect_device_address_info_nv = 1000428002,
    physical_device_linear_color_attachment_features_nv = 1000430000,
    physical_device_shader_maximal_reconvergence_features_khr = 1000434000,
    physical_device_image_compression_control_swapchain_features_ext = 1000437000,
    physical_device_image_processing_features_qcom = 1000440000,
    physical_device_image_processing_properties_qcom = 1000440001,
    image_view_sample_weight_create_info_qcom = 1000440002,
    physical_device_nested_command_buffer_features_ext = 1000451000,
    physical_device_nested_command_buffer_properties_ext = 1000451001,
    external_memory_acquire_unmodified_ext = 1000453000,
    physical_device_extended_dynamic_state_3_features_ext = 1000455000,
    physical_device_extended_dynamic_state_3_properties_ext = 1000455001,
    physical_device_subpass_merge_feedback_features_ext = 1000458000,
    render_pass_creation_control_ext = 1000458001,
    render_pass_creation_feedback_create_info_ext = 1000458002,
    render_pass_subpass_feedback_create_info_ext = 1000458003,
    direct_driver_loading_info_lunarg = 1000459000,
    direct_driver_loading_list_lunarg = 1000459001,
    physical_device_shader_module_identifier_features_ext = 1000462000,
    physical_device_shader_module_identifier_properties_ext = 1000462001,
    pipeline_shader_stage_module_identifier_create_info_ext = 1000462002,
    shader_module_identifier_ext = 1000462003,
    physical_device_optical_flow_features_nv = 1000464000,
    physical_device_optical_flow_properties_nv = 1000464001,
    optical_flow_image_format_info_nv = 1000464002,
    optical_flow_image_format_properties_nv = 1000464003,
    optical_flow_session_create_info_nv = 1000464004,
    optical_flow_execute_info_nv = 1000464005,
    optical_flow_session_create_private_data_info_nv = 1000464010,
    physical_device_legacy_dithering_features_ext = 1000465000,
    physical_device_pipeline_protected_access_features_ext = 1000466000,
    physical_device_external_format_resolve_features_android = 1000468000,
    physical_device_external_format_resolve_properties_android = 1000468001,
    android_hardware_buffer_format_resolve_properties_android = 1000468002,
    physical_device_maintenance_5_features_khr = 1000470000,
    physical_device_maintenance_5_properties_khr = 1000470001,
    rendering_area_info_khr = 1000470003,
    device_image_subresource_info_khr = 1000470004,
    pipeline_create_flags_2_create_info_khr = 1000470005,
    buffer_usage_flags_2_create_info_khr = 1000470006,
    physical_device_anti_lag_features_amd = 1000476000,
    anti_lag_data_amd = 1000476001,
    anti_lag_presentation_info_amd = 1000476002,
    physical_device_ray_tracing_position_fetch_features_khr = 1000481000,
    physical_device_shader_object_features_ext = 1000482000,
    physical_device_shader_object_properties_ext = 1000482001,
    shader_create_info_ext = 1000482002,
    physical_device_pipeline_binary_features_khr = 1000483000,
    pipeline_binary_create_info_khr = 1000483001,
    pipeline_binary_info_khr = 1000483002,
    pipeline_binary_key_khr = 1000483003,
    physical_device_pipeline_binary_properties_khr = 1000483004,
    release_captured_pipeline_data_info_khr = 1000483005,
    pipeline_binary_data_info_khr = 1000483006,
    pipeline_create_info_khr = 1000483007,
    device_pipeline_binary_internal_cache_control_khr = 1000483008,
    pipeline_binary_handles_info_khr = 1000483009,
    physical_device_tile_properties_features_qcom = 1000484000,
    tile_properties_qcom = 1000484001,
    physical_device_amigo_profiling_features_sec = 1000485000,
    amigo_profiling_submit_info_sec = 1000485001,
    physical_device_multiview_per_view_viewports_features_qcom = 1000488000,
    physical_device_ray_tracing_invocation_reorder_features_nv = 1000490000,
    physical_device_ray_tracing_invocation_reorder_properties_nv = 1000490001,
    physical_device_extended_sparse_address_space_features_nv = 1000492000,
    physical_device_extended_sparse_address_space_properties_nv = 1000492001,
    physical_device_legacy_vertex_attributes_features_ext = 1000495000,
    physical_device_legacy_vertex_attributes_properties_ext = 1000495001,
    layer_settings_create_info_ext = 1000496000,
    physical_device_shader_core_builtins_features_arm = 1000497000,
    physical_device_shader_core_builtins_properties_arm = 1000497001,
    physical_device_pipeline_library_group_handles_features_ext = 1000498000,
    physical_device_dynamic_rendering_unused_attachments_features_ext = 1000499000,
    latency_sleep_mode_info_nv = 1000505000,
    latency_sleep_info_nv = 1000505001,
    set_latency_marker_info_nv = 1000505002,
    get_latency_marker_info_nv = 1000505003,
    latency_timings_frame_report_nv = 1000505004,
    latency_submission_present_id_nv = 1000505005,
    out_of_band_queue_type_info_nv = 1000505006,
    swapchain_latency_create_info_nv = 1000505007,
    latency_surface_capabilities_nv = 1000505008,
    physical_device_cooperative_matrix_features_khr = 1000506000,
    cooperative_matrix_properties_khr = 1000506001,
    physical_device_cooperative_matrix_properties_khr = 1000506002,
    physical_device_multiview_per_view_render_areas_features_qcom = 1000510000,
    multiview_per_view_render_areas_render_pass_begin_info_qcom = 1000510001,
    physical_device_compute_shader_derivatives_properties_khr = 1000511000,
    video_decode_av1_capabilities_khr = 1000512000,
    video_decode_av1_picture_info_khr = 1000512001,
    video_decode_av1_profile_info_khr = 1000512003,
    video_decode_av1_session_parameters_create_info_khr = 1000512004,
    video_decode_av1_dpb_slot_info_khr = 1000512005,
    physical_device_video_maintenance_1_features_khr = 1000515000,
    video_inline_query_info_khr = 1000515001,
    physical_device_per_stage_descriptor_set_features_nv = 1000516000,
    physical_device_image_processing_2_features_qcom = 1000518000,
    physical_device_image_processing_2_properties_qcom = 1000518001,
    sampler_block_match_window_create_info_qcom = 1000518002,
    sampler_cubic_weights_create_info_qcom = 1000519000,
    physical_device_cubic_weights_features_qcom = 1000519001,
    blit_image_cubic_weights_info_qcom = 1000519002,
    physical_device_ycbcr_degamma_features_qcom = 1000520000,
    sampler_ycbcr_conversion_ycbcr_degamma_create_info_qcom = 1000520001,
    physical_device_cubic_clamp_features_qcom = 1000521000,
    physical_device_attachment_feedback_loop_dynamic_state_features_ext = 1000524000,
    physical_device_vertex_attribute_divisor_properties_khr = 1000525000,
    physical_device_shader_float_controls_2_features_khr = 1000528000,
    screen_buffer_properties_qnx = 1000529000,
    screen_buffer_format_properties_qnx = 1000529001,
    import_screen_buffer_info_qnx = 1000529002,
    external_format_qnx = 1000529003,
    physical_device_external_memory_screen_buffer_features_qnx = 1000529004,
    physical_device_layered_driver_properties_msft = 1000530000,
    physical_device_shader_expect_assume_features_khr = 1000544000,
    physical_device_maintenance_6_features_khr = 1000545000,
    physical_device_maintenance_6_properties_khr = 1000545001,
    bind_memory_status_khr = 1000545002,
    bind_descriptor_sets_info_khr = 1000545003,
    push_constants_info_khr = 1000545004,
    push_descriptor_set_info_khr = 1000545005,
    push_descriptor_set_with_template_info_khr = 1000545006,
    set_descriptor_buffer_offsets_info_ext = 1000545007,
    bind_descriptor_buffer_embedded_samplers_info_ext = 1000545008,
    physical_device_descriptor_pool_overallocation_features_nv = 1000546000,
    physical_device_raw_access_chains_features_nv = 1000555000,
    physical_device_shader_relaxed_extended_instruction_features_khr = 1000558000,
    physical_device_command_buffer_inheritance_features_nv = 1000559000,
    physical_device_maintenance_7_features_khr = 1000562000,
    physical_device_maintenance_7_properties_khr = 1000562001,
    physical_device_layered_api_properties_list_khr = 1000562002,
    physical_device_layered_api_properties_khr = 1000562003,
    physical_device_layered_api_vulkan_properties_khr = 1000562004,
    physical_device_shader_atomic_float16_vector_features_nv = 1000563000,
    physical_device_shader_replicated_composites_features_ext = 1000564000,
    physical_device_ray_tracing_validation_features_nv = 1000568000,
    physical_device_device_generated_commands_features_ext = 1000572000,
    physical_device_device_generated_commands_properties_ext = 1000572001,
    generated_commands_memory_requirements_info_ext = 1000572002,
    indirect_execution_set_create_info_ext = 1000572003,
    generated_commands_info_ext = 1000572004,
    indirect_commands_layout_create_info_ext = 1000572006,
    indirect_commands_layout_token_ext = 1000572007,
    write_indirect_execution_set_pipeline_ext = 1000572008,
    write_indirect_execution_set_shader_ext = 1000572009,
    indirect_execution_set_pipeline_info_ext = 1000572010,
    indirect_execution_set_shader_info_ext = 1000572011,
    indirect_execution_set_shader_layout_info_ext = 1000572012,
    generated_commands_pipeline_info_ext = 1000572013,
    generated_commands_shader_info_ext = 1000572014,
    physical_device_image_alignment_control_features_mesa = 1000575000,
    physical_device_image_alignment_control_properties_mesa = 1000575001,
    image_alignment_control_create_info_mesa = 1000575002,
    physical_device_depth_clamp_control_features_ext = 1000582000,
    pipeline_viewport_depth_clamp_control_create_info_ext = 1000582001,
    pub const Self = @This();
    pub const debug_report_callback_create_info_ext = Self.debug_report_create_info_ext;
    pub const rendering_info = Self.rendering_info_khr;
    pub const rendering_attachment_info_khr = Self.rendering_attachment_info;
    pub const pipeline_rendering_create_info_khr = Self.pipeline_rendering_create_info;
    pub const physical_device_dynamic_rendering_features_khr = Self.physical_device_dynamic_rendering_features;
    pub const command_buffer_inheritance_rendering_info = Self.command_buffer_inheritance_rendering_info_khr;
    pub const attachment_sample_count_info_nv = Self.attachment_sample_count_info_amd;
    pub const render_pass_multiview_create_info_khr = Self.render_pass_multiview_create_info;
    pub const physical_device_multiview_features = Self.physical_device_multiview_features_khr;
    pub const physical_device_multiview_properties = Self.physical_device_multiview_properties_khr;
    pub const physical_device_features_2_khr = Self.physical_device_features_2;
    pub const physical_device_properties_2_khr = Self.physical_device_properties_2;
    pub const format_properties_2_khr = Self.format_properties_2;
    pub const image_format_properties_2 = Self.image_format_properties_2_khr;
    pub const physical_device_image_format_info_2_khr = Self.physical_device_image_format_info_2;
    pub const queue_family_properties_2 = Self.queue_family_properties_2_khr;
    pub const physical_device_memory_properties_2 = Self.physical_device_memory_properties_2_khr;
    pub const sparse_image_format_properties_2 = Self.sparse_image_format_properties_2_khr;
    pub const physical_device_sparse_image_format_info_2 = Self.physical_device_sparse_image_format_info_2_khr;
    pub const memory_allocate_flags_info_khr = Self.memory_allocate_flags_info;
    pub const device_group_render_pass_begin_info_khr = Self.device_group_render_pass_begin_info;
    pub const device_group_command_buffer_begin_info_khr = Self.device_group_command_buffer_begin_info;
    pub const device_group_submit_info = Self.device_group_submit_info_khr;
    pub const device_group_bind_sparse_info = Self.device_group_bind_sparse_info_khr;
    pub const bind_buffer_memory_device_group_info = Self.bind_buffer_memory_device_group_info_khr;
    pub const bind_image_memory_device_group_info = Self.bind_image_memory_device_group_info_khr;
    pub const physical_device_shader_draw_parameters_features = Self.physical_device_shader_draw_parameter_features;
    pub const physical_device_texture_compression_astc_hdr_features = Self.physical_device_texture_compression_astc_hdr_features_ext;
    pub const physical_device_group_properties_khr = Self.physical_device_group_properties;
    pub const device_group_device_create_info_khr = Self.device_group_device_create_info;
    pub const physical_device_external_image_format_info = Self.physical_device_external_image_format_info_khr;
    pub const external_image_format_properties = Self.external_image_format_properties_khr;
    pub const physical_device_external_buffer_info = Self.physical_device_external_buffer_info_khr;
    pub const external_buffer_properties = Self.external_buffer_properties_khr;
    pub const physical_device_id_properties = Self.physical_device_id_properties_khr;
    pub const external_memory_buffer_create_info_khr = Self.external_memory_buffer_create_info;
    pub const external_memory_image_create_info = Self.external_memory_image_create_info_khr;
    pub const export_memory_allocate_info = Self.export_memory_allocate_info_khr;
    pub const physical_device_external_semaphore_info_khr = Self.physical_device_external_semaphore_info;
    pub const external_semaphore_properties_khr = Self.external_semaphore_properties;
    pub const export_semaphore_create_info_khr = Self.export_semaphore_create_info;
    pub const physical_device_float16_int8_features_khr = Self.physical_device_shader_float16_int8_features;
    pub const physical_device_shader_float16_int8_features_khr = Self.physical_device_shader_float16_int8_features;
    pub const physical_device_16bit_storage_features = Self.physical_device_16bit_storage_features_khr;
    pub const descriptor_update_template_create_info = Self.descriptor_update_template_create_info_khr;
    pub const surface_capabilities_2_ext = Self.surface_capabilities2_ext;
    pub const physical_device_imageless_framebuffer_features = Self.physical_device_imageless_framebuffer_features_khr;
    pub const framebuffer_attachments_create_info = Self.framebuffer_attachments_create_info_khr;
    pub const framebuffer_attachment_image_info_khr = Self.framebuffer_attachment_image_info;
    pub const render_pass_attachment_begin_info_khr = Self.render_pass_attachment_begin_info;
    pub const attachment_description_2 = Self.attachment_description_2_khr;
    pub const attachment_reference_2 = Self.attachment_reference_2_khr;
    pub const subpass_description_2_khr = Self.subpass_description_2;
    pub const subpass_dependency_2 = Self.subpass_dependency_2_khr;
    pub const render_pass_create_info_2 = Self.render_pass_create_info_2_khr;
    pub const subpass_begin_info = Self.subpass_begin_info_khr;
    pub const subpass_end_info_khr = Self.subpass_end_info;
    pub const physical_device_external_fence_info_khr = Self.physical_device_external_fence_info;
    pub const external_fence_properties_khr = Self.external_fence_properties;
    pub const export_fence_create_info_khr = Self.export_fence_create_info;
    pub const physical_device_point_clipping_properties = Self.physical_device_point_clipping_properties_khr;
    pub const render_pass_input_attachment_aspect_create_info_khr = Self.render_pass_input_attachment_aspect_create_info;
    pub const image_view_usage_create_info_khr = Self.image_view_usage_create_info;
    pub const pipeline_tessellation_domain_origin_state_create_info_khr = Self.pipeline_tessellation_domain_origin_state_create_info;
    pub const physical_device_variable_pointers_features_khr = Self.physical_device_variable_pointer_features_khr;
    pub const physical_device_variable_pointers_features = Self.physical_device_variable_pointer_features_khr;
    pub const physical_device_variable_pointer_features = Self.physical_device_variable_pointer_features_khr;
    pub const memory_dedicated_requirements = Self.memory_dedicated_requirements_khr;
    pub const memory_dedicated_allocate_info_khr = Self.memory_dedicated_allocate_info;
    pub const physical_device_sampler_filter_minmax_properties_ext = Self.physical_device_sampler_filter_minmax_properties;
    pub const sampler_reduction_mode_create_info_ext = Self.sampler_reduction_mode_create_info;
    pub const physical_device_inline_uniform_block_features_ext = Self.physical_device_inline_uniform_block_features;
    pub const physical_device_inline_uniform_block_properties_ext = Self.physical_device_inline_uniform_block_properties;
    pub const write_descriptor_set_inline_uniform_block_ext = Self.write_descriptor_set_inline_uniform_block;
    pub const descriptor_pool_inline_uniform_block_create_info_ext = Self.descriptor_pool_inline_uniform_block_create_info;
    pub const buffer_memory_requirements_info_2 = Self.buffer_memory_requirements_info_2_khr;
    pub const image_memory_requirements_info_2 = Self.image_memory_requirements_info_2_khr;
    pub const image_sparse_memory_requirements_info_2 = Self.image_sparse_memory_requirements_info_2_khr;
    pub const memory_requirements_2_khr = Self.memory_requirements_2;
    pub const sparse_image_memory_requirements_2 = Self.sparse_image_memory_requirements_2_khr;
    pub const image_format_list_create_info_khr = Self.image_format_list_create_info;
    pub const sampler_ycbcr_conversion_create_info = Self.sampler_ycbcr_conversion_create_info_khr;
    pub const sampler_ycbcr_conversion_info = Self.sampler_ycbcr_conversion_info_khr;
    pub const bind_image_plane_memory_info = Self.bind_image_plane_memory_info_khr;
    pub const image_plane_memory_requirements_info = Self.image_plane_memory_requirements_info_khr;
    pub const physical_device_sampler_ycbcr_conversion_features = Self.physical_device_sampler_ycbcr_conversion_features_khr;
    pub const sampler_ycbcr_conversion_image_format_properties_khr = Self.sampler_ycbcr_conversion_image_format_properties;
    pub const bind_buffer_memory_info = Self.bind_buffer_memory_info_khr;
    pub const bind_image_memory_info = Self.bind_image_memory_info_khr;
    pub const descriptor_set_layout_binding_flags_create_info_ext = Self.descriptor_set_layout_binding_flags_create_info;
    pub const physical_device_descriptor_indexing_features_ext = Self.physical_device_descriptor_indexing_features;
    pub const physical_device_descriptor_indexing_properties_ext = Self.physical_device_descriptor_indexing_properties;
    pub const descriptor_set_variable_descriptor_count_allocate_info_ext = Self.descriptor_set_variable_descriptor_count_allocate_info;
    pub const descriptor_set_variable_descriptor_count_layout_support = Self.descriptor_set_variable_descriptor_count_layout_support_ext;
    pub const physical_device_maintenance_3_properties = Self.physical_device_maintenance_3_properties_khr;
    pub const descriptor_set_layout_support_khr = Self.descriptor_set_layout_support;
    pub const device_queue_global_priority_create_info_ext = Self.device_queue_global_priority_create_info_khr;
    pub const physical_device_shader_subgroup_extended_types_features_khr = Self.physical_device_shader_subgroup_extended_types_features;
    pub const physical_device_8bit_storage_features_khr = Self.physical_device_8bit_storage_features;
    pub const physical_device_shader_atomic_int64_features_khr = Self.physical_device_shader_atomic_int64_features;
    pub const calibrated_timestamp_info_khr = Self.calibrated_timestamp_info_ext;
    pub const pipeline_vertex_input_divisor_state_create_info_ext = Self.pipeline_vertex_input_divisor_state_create_info_khr;
    pub const physical_device_vertex_attribute_divisor_features_khr = Self.physical_device_vertex_attribute_divisor_features_ext;
    pub const pipeline_creation_feedback_create_info_ext = Self.pipeline_creation_feedback_create_info;
    pub const physical_device_driver_properties = Self.physical_device_driver_properties_khr;
    pub const physical_device_float_controls_properties_khr = Self.physical_device_float_controls_properties;
    pub const physical_device_depth_stencil_resolve_properties = Self.physical_device_depth_stencil_resolve_properties_khr;
    pub const subpass_description_depth_stencil_resolve = Self.subpass_description_depth_stencil_resolve_khr;
    pub const physical_device_compute_shader_derivatives_features_nv = Self.physical_device_compute_shader_derivatives_features_khr;
    pub const physical_device_fragment_shader_barycentric_features_nv = Self.physical_device_fragment_shader_barycentric_features_khr;
    pub const physical_device_timeline_semaphore_features_khr = Self.physical_device_timeline_semaphore_features;
    pub const physical_device_timeline_semaphore_properties = Self.physical_device_timeline_semaphore_properties_khr;
    pub const semaphore_type_create_info = Self.semaphore_type_create_info_khr;
    pub const timeline_semaphore_submit_info_khr = Self.timeline_semaphore_submit_info;
    pub const semaphore_wait_info = Self.semaphore_wait_info_khr;
    pub const semaphore_signal_info_khr = Self.semaphore_signal_info;
    pub const query_pool_performance_query_create_info_intel = Self.query_pool_create_info_intel;
    pub const physical_device_vulkan_memory_model_features_khr = Self.physical_device_vulkan_memory_model_features;
    pub const physical_device_shader_terminate_invocation_features_khr = Self.physical_device_shader_terminate_invocation_features;
    pub const physical_device_scalar_block_layout_features_ext = Self.physical_device_scalar_block_layout_features;
    pub const physical_device_subgroup_size_control_properties_ext = Self.physical_device_subgroup_size_control_properties;
    pub const pipeline_shader_stage_required_subgroup_size_create_info = Self.shader_required_subgroup_size_create_info_ext;
    pub const pipeline_shader_stage_required_subgroup_size_create_info_ext = Self.shader_required_subgroup_size_create_info_ext;
    pub const physical_device_subgroup_size_control_features = Self.physical_device_subgroup_size_control_features_ext;
    pub const physical_device_separate_depth_stencil_layouts_features = Self.physical_device_separate_depth_stencil_layouts_features_khr;
    pub const attachment_reference_stencil_layout = Self.attachment_reference_stencil_layout_khr;
    pub const attachment_description_stencil_layout = Self.attachment_description_stencil_layout_khr;
    pub const physical_device_buffer_address_features_ext = Self.physical_device_buffer_device_address_features_ext;
    pub const buffer_device_address_info = Self.buffer_device_address_info_khr;
    pub const buffer_device_address_info_ext = Self.buffer_device_address_info_khr;
    pub const physical_device_tool_properties_ext = Self.physical_device_tool_properties;
    pub const image_stencil_usage_create_info_ext = Self.image_stencil_usage_create_info;
    pub const physical_device_uniform_buffer_standard_layout_features = Self.physical_device_uniform_buffer_standard_layout_features_khr;
    pub const physical_device_buffer_device_address_features_khr = Self.physical_device_buffer_device_address_features;
    pub const buffer_opaque_capture_address_create_info_khr = Self.buffer_opaque_capture_address_create_info;
    pub const memory_opaque_capture_address_allocate_info_khr = Self.memory_opaque_capture_address_allocate_info;
    pub const device_memory_opaque_capture_address_info = Self.device_memory_opaque_capture_address_info_khr;
    pub const physical_device_line_rasterization_features_ext = Self.physical_device_line_rasterization_features_khr;
    pub const pipeline_rasterization_line_state_create_info_ext = Self.pipeline_rasterization_line_state_create_info_khr;
    pub const physical_device_line_rasterization_properties_ext = Self.physical_device_line_rasterization_properties_khr;
    pub const physical_device_host_query_reset_features = Self.physical_device_host_query_reset_features_ext;
    pub const physical_device_index_type_uint8_features_ext = Self.physical_device_index_type_uint8_features_khr;
    pub const pipeline_info_ext = Self.pipeline_info_khr;
    pub const physical_device_shader_demote_to_helper_invocation_features_ext = Self.physical_device_shader_demote_to_helper_invocation_features;
    pub const physical_device_shader_integer_dot_product_features = Self.physical_device_shader_integer_dot_product_features_khr;
    pub const physical_device_shader_integer_dot_product_properties = Self.physical_device_shader_integer_dot_product_properties_khr;
    pub const physical_device_texel_buffer_alignment_properties = Self.physical_device_texel_buffer_alignment_properties_ext;
    pub const physical_device_private_data_features = Self.physical_device_private_data_features_ext;
    pub const device_private_data_create_info = Self.device_private_data_create_info_ext;
    pub const private_data_slot_create_info = Self.private_data_slot_create_info_ext;
    pub const physical_device_pipeline_creation_cache_control_features_ext = Self.physical_device_pipeline_creation_cache_control_features;
    pub const memory_barrier_2_khr = Self.memory_barrier_2;
    pub const buffer_memory_barrier_2 = Self.buffer_memory_barrier_2_khr;
    pub const image_memory_barrier_2_khr = Self.image_memory_barrier_2;
    pub const dependency_info_khr = Self.dependency_info;
    pub const submit_info_2_khr = Self.submit_info_2;
    pub const semaphore_submit_info_khr = Self.semaphore_submit_info;
    pub const command_buffer_submit_info_khr = Self.command_buffer_submit_info;
    pub const physical_device_synchronization_2_features_khr = Self.physical_device_synchronization_2_features;
    pub const physical_device_zero_initialize_workgroup_memory_features_khr = Self.physical_device_zero_initialize_workgroup_memory_features;
    pub const physical_device_image_robustness_features = Self.physical_device_image_robustness_features_ext;
    pub const copy_buffer_info_2 = Self.copy_buffer_info_2_khr;
    pub const copy_image_info_2_khr = Self.copy_image_info_2;
    pub const copy_buffer_to_image_info_2 = Self.copy_buffer_to_image_info_2_khr;
    pub const copy_image_to_buffer_info_2 = Self.copy_image_to_buffer_info_2_khr;
    pub const blit_image_info_2 = Self.blit_image_info_2_khr;
    pub const resolve_image_info_2 = Self.resolve_image_info_2_khr;
    pub const buffer_copy_2_khr = Self.buffer_copy_2;
    pub const image_copy_2_khr = Self.image_copy_2;
    pub const image_blit_2_khr = Self.image_blit_2;
    pub const buffer_image_copy_2_khr = Self.buffer_image_copy_2;
    pub const image_resolve_2_khr = Self.image_resolve_2;
    pub const subresource_layout_2_khr = Self.subresource_layout_2_ext;
    pub const image_subresource_2_khr = Self.image_subresource_2_ext;
    pub const physical_device_rasterization_order_attachment_access_features_arm = Self.physical_device_rasterization_order_attachment_access_features_ext;
    pub const physical_device_mutable_descriptor_type_features_valve = Self.physical_device_mutable_descriptor_type_features_ext;
    pub const mutable_descriptor_type_create_info_valve = Self.mutable_descriptor_type_create_info_ext;
    pub const format_properties_3 = Self.format_properties_3_khr;
    pub const physical_device_global_priority_query_features_khr = Self.physical_device_global_priority_query_features_ext;
    pub const queue_family_global_priority_properties_khr = Self.queue_family_global_priority_properties_ext;
    pub const physical_device_maintenance_4_features = Self.physical_device_maintenance_4_features_khr;
    pub const physical_device_maintenance_4_properties_khr = Self.physical_device_maintenance_4_properties;
    pub const device_buffer_memory_requirements = Self.device_buffer_memory_requirements_khr;
    pub const device_image_memory_requirements_khr = Self.device_image_memory_requirements;
};
pub const PipelineCacheHeaderVersion = enum(u32) {
    null = 0,
    one = 1,
};
pub const ImageLayout = enum(u32) {
    undefined = 0,
    general = 1,
    color_attachment_optimal = 2,
    depth_stencil_attachment_optimal = 3,
    depth_stencil_read_only_optimal = 4,
    shader_read_only_optimal = 5,
    transfer_src_optimal = 6,
    transfer_dst_optimal = 7,
    preinitialized = 8,
    present_src_khr = 1000001002,
    video_decode_dst_khr = 1000024000,
    video_decode_src_khr = 1000024001,
    video_decode_dpb_khr = 1000024002,
    shared_present_khr = 1000111000,
    depth_read_only_stencil_attachment_optimal_khr = 1000117000,
    depth_attachment_stencil_read_only_optimal = 1000117001,
    fragment_shading_rate_attachment_optimal_khr = 1000164003,
    fragment_density_map_optimal_ext = 1000218000,
    rendering_local_read_khr = 1000232000,
    depth_attachment_optimal = 1000241000,
    depth_read_only_optimal = 1000241001,
    stencil_attachment_optimal = 1000241002,
    stencil_read_only_optimal = 1000241003,
    video_encode_dst_khr = 1000299000,
    video_encode_src_khr = 1000299001,
    video_encode_dpb_khr = 1000299002,
    read_only_optimal = 1000314000,
    attachment_optimal = 1000314001,
    attachment_feedback_loop_optimal_ext = 1000339000,
    pub const Self = @This();
    pub const depth_read_only_stencil_attachment_optimal = Self.depth_read_only_stencil_attachment_optimal_khr;
    pub const depth_attachment_stencil_read_only_optimal_khr = Self.depth_attachment_stencil_read_only_optimal;
    pub const shading_rate_optimal_nv = Self.fragment_shading_rate_attachment_optimal_khr;
    pub const depth_attachment_optimal_khr = Self.depth_attachment_optimal;
    pub const depth_read_only_optimal_khr = Self.depth_read_only_optimal;
    pub const stencil_attachment_optimal_khr = Self.stencil_attachment_optimal;
    pub const stencil_read_only_optimal_khr = Self.stencil_read_only_optimal;
    pub const read_only_optimal_khr = Self.read_only_optimal;
    pub const attachment_optimal_khr = Self.attachment_optimal;
};
pub const ObjectType = enum(u32) {
    unknown = 0,
    instance = 1,
    physical_device = 2,
    device = 3,
    queue = 4,
    semaphore = 5,
    command_buffer = 6,
    fence = 7,
    device_memory = 8,
    buffer = 9,
    image = 10,
    event = 11,
    query_pool = 12,
    buffer_view = 13,
    image_view = 14,
    shader_module = 15,
    pipeline_cache = 16,
    pipeline_layout = 17,
    render_pass = 18,
    pipeline = 19,
    descriptor_set_layout = 20,
    sampler = 21,
    descriptor_pool = 22,
    descriptor_set = 23,
    framebuffer = 24,
    command_pool = 25,
    surface_khr = 1000000000,
    swapchain_khr = 1000001000,
    display_khr = 1000002000,
    display_mode_khr = 1000002001,
    debug_report_callback_ext = 1000011000,
    video_session_khr = 1000023000,
    video_session_parameters_khr = 1000023001,
    cu_module_nvx = 1000029000,
    cu_function_nvx = 1000029001,
    descriptor_update_template = 1000085000,
    debug_utils_messenger_ext = 1000128000,
    acceleration_structure_khr = 1000150000,
    sampler_ycbcr_conversion_khr = 1000156000,
    validation_cache_ext = 1000160000,
    acceleration_structure_nv = 1000165000,
    performance_configuration_intel = 1000210000,
    deferred_operation_khr = 1000268000,
    indirect_commands_layout_nv = 1000277000,
    private_data_slot = 1000295000,
    cuda_module_nv = 1000307000,
    cuda_function_nv = 1000307001,
    buffer_collection_fuchsia = 1000366000,
    micromap_ext = 1000396000,
    optical_flow_session_nv = 1000464000,
    shader_ext = 1000482000,
    pipeline_binary_khr = 1000483000,
    indirect_commands_layout_ext = 1000572000,
    indirect_execution_set_ext = 1000572001,
    pub const Self = @This();
    pub const descriptor_update_template_khr = Self.descriptor_update_template;
    pub const sampler_ycbcr_conversion = Self.sampler_ycbcr_conversion_khr;
    pub const private_data_slot_ext = Self.private_data_slot;
};
pub const VendorId = enum(u32) {
    null = 0,
    khronos = 65536,
    viv = 65537,
    vsi = 65538,
    kazan = 65539,
    codeplay = 65540,
    mesa = 65541,
    pocl = 65542,
    mobileye = 65543,
};
pub const SystemAllocationScope = enum(u32) {
    command = 0,
    object = 1,
    cache = 2,
    device = 3,
    instance = 4,
};
pub const InternalAllocationType = enum(u32) {
    executable = 0,
};
pub const Format = enum(u32) {
    undefined = 0,
    r4g4_unorm_pack8 = 1,
    r4g4b4a4_unorm_pack16 = 2,
    b4g4r4a4_unorm_pack16 = 3,
    r5g6b5_unorm_pack16 = 4,
    b5g6r5_unorm_pack16 = 5,
    r5g5b5a1_unorm_pack16 = 6,
    b5g5r5a1_unorm_pack16 = 7,
    a1r5g5b5_unorm_pack16 = 8,
    r8_unorm = 9,
    r8_snorm = 10,
    r8_uscaled = 11,
    r8_sscaled = 12,
    r8_uint = 13,
    r8_sint = 14,
    r8_srgb = 15,
    r8g8_unorm = 16,
    r8g8_snorm = 17,
    r8g_uscaled = 18,
    r8g8_sscaled = 19,
    r8g8_uint = 20,
    r8g8_sint = 21,
    r8g8_srgb = 22,
    r8g8b8_unorm = 23,

    r8g8b8_snorm = 24,
    r8g8b8_uscaled = 25,
    r8g8b8_sscaled = 26,
    r8g8b8_uint = 27,
    r8g8b8_sint = 28,
    r8g8b8_srgb = 29,
    b8g8r8_unorm = 30,
    b8g8r8_snorm = 31,
    b8g8r8_uscaled = 32,
    b8g8r8_sscaled = 33,
    b8g8r8_uint = 34,
    b8g8r8_sint = 35,
    b8g8r8_srgb = 36,
    r8g8b8a8_unorm = 37,
    r8g8b8a8_snorm = 38,
    r8g8b8a8_uscaled = 39,
    r8g8b8a8_sscaled = 40,
    r8g8b8a8_uint = 41,
    r8g8b8a8_sint = 42,
    r8g8b8a8_srgb = 43,
    b8g8r8a8_unorm = 44,
    b8g8r8a8_snorm = 45,
    b8g8r8a8_uscaled = 46,
    b8g8r8a8_sscaled = 47,
    b8g8r8a8_uint = 48,
    b8g8r8a8_sint = 49,
    b8g8r8a8_srgb = 50,
    a8b8g8r8_unorm_pack32 = 51,
    a8b8g8r8_snorm_pack32 = 52,
    a8b8g8r8_uscaled_pack32 = 53,
    a8b8g8r8_sscaled_pack32 = 54,
    a8b8g8r8_uint_pack32 = 55,
    a8b8g8r8_sint_pack32 = 56,
    a8b8g8r8_srgb_pack32 = 57,
    a2r10g10b10_unorm_pack32 = 58,
    a2r10g10b10_snorm_pack32 = 59,
    a2r10g10b10_uscaled_pack32 = 60,
    a2r10g10b10_sscaled_pack32 = 61,
    a2r10g10b10_uint_pack32 = 62,
    a2r10g10b10_sint_pack32 = 63,
    a2b10g10r10_unorm_pack32 = 64,
    a2b10g10r10_snorm_pack32 = 65,
    a2b10g10r10_uscaled_pack32 = 66,
    a2b10g10r10_sscaled_pack32 = 67,
    a2b10g10r10_uint_pack32 = 68,
    a2b10g10r10_sint_pack32 = 69,
    r16_unorm = 70,
    r16_snorm = 71,
    r16_uscaled = 72,
    r16_sscaled = 73,
    r16_uint = 74,
    r16_sint = 75,
    r16_sfloat = 76,
    r16g16_unorm = 77,
    r16g16_snorm = 78,
    r16g16_uscaled = 79,
    r16g16_sscaled = 80,
    r16g16_uint = 81,
    r16g16_sint = 82,
    r16g16_sfloat = 83,
    r16g16b16_unorm = 84,
    r16g16b16_snorm = 85,
    r16g16b16_uscaled = 86,
    r16g16b16_sscaled = 87,
    r16g16b16_uint = 88,
    r16g16b16_sint = 89,
    r16g16b16_sfloat = 90,
    r16g16b16a16_unorm = 91,
    r16g16b16a16_snorm = 92,
    r16g16b16a16_uscaled = 93,
    r16g16b16a16_sscaled = 94,
    r16g16b16a16_uint = 95,
    r16g16b16a16_sint = 96,
    r16g16b16a16_sfloat = 97,
    r32_uint = 98,
    r32_sint = 99,
    r32_sfloat = 100,
    r32g32_uint = 101,
    r32g32_sint = 102,
    r32g32_sfloat = 103,
    r32g32b32_uint = 104,
    r32g32b32_sint = 105,
    r32g32b32_sfloat = 106,
    r32g32b32a32_uint = 107,
    r32g32b32a32_sint = 108,
    r32g32b32a32_sfloat = 109,
    r64_uint = 110,
    r64_sint = 111,
    r64_sfloat = 112,
    r64g64_uint = 113,
    r64g64_sint = 114,
    r64g64_sfloat = 115,
    r64g64b64_uint = 116,
    r64g64b64_sint = 117,
    r64g64b64_sfloat = 118,
    r64g64b64a64_uint = 119,
    r64g64b64a64_sint = 120,
    r64g64b64a64_sfloat = 121,
    b10g11r11_ufloat_pack32 = 122,
    e5b9g9r9_ufloat_pack32 = 123,
    d16_unorm = 124,
    x8_d24_unorm_pack32 = 125,
    d32_sfloat = 126,
    s8_uint = 127,
    d16_unorm_s8_uint = 128,
    d24_unorm_s8_uint = 129,
    d32_sfloat_s8_uint = 130,
    bc1_rgb_unorm_block = 131,
    bc1_rgb_srgb_block = 132,
    bc1_rgba_unorm_block = 133,
    bc1_rgba_srgb_block = 134,
    bc2_unorm_block = 135,
    bc2_srgb_block = 136,
    bc3_unorm_block = 137,
    bc3_srgb_block = 138,
    bc4_unorm_block = 139,
    bc4_snorm_block = 140,
    bc5_unorm_block = 141,
    bc5_snorm_block = 142,
    bc6h_ufloat_block = 143,
    bc6h_sfloat_block = 144,
    bc7_unorm_block = 145,
    bc7_srgb_block = 146,
    etc2_r8g8b8_unorm_block = 147,
    etc2_r8g8b8_srgb_block = 148,
    etc2_r8g8b8a1_unorm_block = 149,
    etc2_r8g8b8a1_srgb_block = 150,
    etc2_r8g8b8a8_unorm_block = 151,
    etc2_r8g8b8a8_srgb_block = 152,
    eac_r11_unorm_block = 153,
    eac_r11_snorm_block = 154,
    eac_r11g11_unorm_block = 155,
    eac_r11g11_snorm_block = 156,
    astc_4x4_unorm_block = 157,
    astc_4x4_srgb_block = 158,
    astc_5x4_unorm_block = 159,
    astc_5x4_srgb_block = 160,
    astc_5x5_unorm_block = 161,
    astc_5x5_srgb_block = 162,
    astc_6x5_unorm_block = 163,
    astc_6x5_srgb_block = 164,
    astc_6x6_unorm_block = 165,
    astc_6x6_srgb_block = 166,
    astc_8x5_unorm_block = 167,
    astc_8x5_srgb_block = 168,
    astc_8x6_unorm_block = 169,
    astc_8x6_srgb_block = 170,
    astc_8x8_unorm_block = 171,
    astc_8x8_srgb_block = 172,
    astc_10x5_unorm_block = 173,
    astc_10x5_srgb_block = 174,
    astc_10x6_unorm_block = 175,
    astc_10x6_srgb_block = 176,
    astc_10x8_unorm_block = 177,
    astc_10x8_srgb_block = 178,
    astc_10x10_unorm_block = 179,
    astc_10x10_srgb_block = 180,
    astc_12x10_unorm_block = 181,
    astc_12x10_srgb_block = 182,
    astc_12x12_unorm_block = 183,
    astc_12x12_srgb_block = 184,
    g8b8g8r8_422_unorm_khr = 1000156000,
    b8g8r8g8_422_unorm_khr = 1000156001,
    g8_b8_r8_3plane_420_unorm_khr = 1000156002,
    g8_b8r8_2plane_420_unorm_khr = 1000156003,
    g8_b8_r8_3plane_422_unorm_khr = 1000156004,
    g8_b8r8_2plane_422_unorm_khr = 1000156005,
    g8_b8_r8_3plane_444_unorm_khr = 1000156006,
    r10x6_unorm_pack16_khr = 1000156007,
    r10x6g10x6_unorm_2pack16_khr = 1000156008,
    r10x6g10x6b10x6a10x6_unorm_4pack16_khr = 1000156009,
    g10x6b10x6g10x6r10x6_422_unorm_4pack16_khr = 1000156010,
    b10x6g10x6r10x6g10x6_422_unorm_4pack16_khr = 1000156011,
    g10x6_b10x6_r10x6_3plane_420_unorm_3pack16_khr = 1000156012,
    g10x6_b10x6r10x6_2plane_420_unorm_3pack16_khr = 1000156013,
    g10x6_b10x6_r10x6_3plane_422_unorm_3pack16_khr = 1000156014,
    g10x6_b10x6r10x6_2plane_422_unorm_3pack16_khr = 1000156015,
    g10x6_b10x6_r10x6_3plane_444_unorm_3pack16_khr = 1000156016,
    r12x4_unorm_pack16_khr = 1000156017,
    r12x4g12x4_unorm_2pack16_khr = 1000156018,
    r12x4g12x4b12x4a12x4_unorm_4pack16_khr = 1000156019,
    g12x4b12x4g12x4r12x4_422_unorm_4pack16_khr = 1000156020,
    b12x4g12x4r12x4g12x4_422_unorm_4pack16_khr = 1000156021,
    g12x4_b12x4_r12x4_3plane_420_unorm_3pack16_khr = 1000156022,
    g12x4_b12x4r12x4_2plane_420_unorm_3pack16_khr = 1000156023,
    g12x4_b12x4_r12x4_3plane_422_unorm_3pack16_khr = 1000156024,
    g12x4_b12x4r12x4_2plane_422_unorm_3pack16_khr = 1000156025,
    g12x4_b12x4_r12x4_3plane_444_unorm_3pack16_khr = 1000156026,
    g16b16g16r16_422_unorm_khr = 1000156027,
    b16g16r16g16_422_unorm_khr = 1000156028,
    g16_b16_r16_3plane_420_unorm_khr = 1000156029,
    g16_b16r16_2plane_420_unorm_khr = 1000156030,
    g16_b16_r16_3plane_422_unorm_khr = 1000156031,
    g16_b16r16_2plane_422_unorm_khr = 1000156032,
    g16_b16_r16_3plane_444_unorm_khr = 1000156033,
    g8_b8r8_2plane_444_unorm_ext = 1000330000,
    g10x6_b10x6r10x6_2plane_444_unorm_3pack16_ext = 1000330001,
    g12x4_b12x4r12x4_2plane_444_unorm_3pack16_ext = 1000330002,
    g16_b16r16_2plane_444_unorm_ext = 1000330003,
    a4r4g4b4_unorm_pack16_ext = 1000340000,
    a4b4g4r4_unorm_pack16_ext = 1000340001,
    r16g16_s10_5_nv = 1000464000,
};
pub const ImageTiling = enum(u32) {
    optimal = 0,
    linear = 1,
    drm_format_modifier_ext = 1000158000,
};
pub const ImageType = enum(u32) {
    @"1d" = 0,
    @"2d" = 1,
    @"3d" = 2,
};
pub const PhysicalDeviceType = enum(u32) {
    other = 0,
    integrated_gpu = 1,
    discrete_gpu = 2,
    virtual_gpu = 3,
    cpu = 4,
};
pub const QueryType = enum(u32) {
    occlusion = 0,
    pipeline_statistics = 1,
    timestamp = 2,
    result_status_only_khr = 1000023000,
    transform_feedback_stream_ext = 1000028004,
    performance_query_khr = 1000116000,
    acceleration_structure_compacted_size_khr = 1000150000,
    acceleration_structure_serialization_size_khr = 1000150001,
    acceleration_structure_compacted_size_nv = 1000165000,
    performance_query_intel = 1000210000,
    video_encode_feedback_khr = 1000299000,
    mesh_primitives_generated_ext = 1000328000,
    primitives_generated_ext = 1000382000,
    acceleration_structure_serialization_bottom_level_pointers_khr = 1000386000,
    acceleration_structure_size_khr = 1000386001,
    micromap_serialization_size_ext = 1000396000,
    micromap_compacted_size_ext = 1000396001,
};
pub const SharingMode = enum(u32) {
    exclusive = 0,
    concurrent = 1,
};
pub const ComponentSwizzle = enum(u32) {
    identity = 0,
    zero = 1,
    one = 2,
    r = 3,
    g = 4,
    b = 5,
    a = 6,
};
pub const ImageViewType = enum(u32) {
    @"1d" = 0,
    @"2d" = 1,
    @"3d" = 2,
    cube = 3,
    @"1d_array" = 4,
    @"2d_array" = 5,
    cube_array = 6,
};
pub const BlendFactor = enum(u32) {
    zero = 0,
    one = 1,
    src_color = 2,
    one_minus_src_color = 3,
    dst_color = 4,
    one_minus_dst_color = 5,
    src_alpha = 6,
    one_minus_src_alpha = 7,
    dst_alpha = 8,
    one_minus_dst_alpha = 9,
    constant_color = 10,
    one_minus_constant_color = 11,
    constant_alpha = 12,
    one_minus_constant_alpha = 13,
    src_alpha_saturate = 14,
    src1_color = 15,
    one_minus_src1_color = 16,
    src1_alpha = 17,
    one_minus_src1_alpha = 18,
};
pub const BlendOp = enum(u32) {
    add = 0,
    subtract = 1,
    reverse_subtract = 2,
    min = 3,
    max = 4,
    zero_ext = 1000148000,
    src_ext = 1000148001,
    dst_ext = 1000148002,
    src_over_ext = 1000148003,
    dst_over_ext = 1000148004,
    src_in_ext = 1000148005,
    dst_in_ext = 1000148006,
    src_out_ext = 1000148007,
    dst_out_ext = 1000148008,
    src_atop_ext = 1000148009,
    dst_atop_ext = 1000148010,
    xor_ext = 1000148011,
    multiply_ext = 1000148012,
    screen_ext = 1000148013,
    overlay_ext = 1000148014,
    darken_ext = 1000148015,
    lighten_ext = 1000148016,
    colordodge_ext = 1000148017,
    colorburn_ext = 1000148018,
    hardlight_ext = 1000148019,
    softlight_ext = 1000148020,
    difference_ext = 1000148021,
    exclusion_ext = 1000148022,
    invert_ext = 1000148023,
    invert_rgb_ext = 1000148024,
    lineardodge_ext = 1000148025,
    linearburn_ext = 1000148026,
    vividlight_ext = 1000148027,
    linearlight_ext = 1000148028,
    pinlight_ext = 1000148029,
    hardmix_ext = 1000148030,
    hsl_hue_ext = 1000148031,
    hsl_saturation_ext = 1000148032,
    hsl_color_ext = 1000148033,
    hsl_luminosity_ext = 1000148034,
    plus_ext = 1000148035,
    plus_clamped_ext = 1000148036,
    plus_clamped_alpha_ext = 1000148037,
    plus_darker_ext = 1000148038,
    minus_ext = 1000148039,
    minus_clamped_ext = 1000148040,
    contrast_ext = 1000148041,
    invert_ovg_ext = 1000148042,
    red_ext = 1000148043,
    green_ext = 1000148044,
    blue_ext = 1000148045,
};
pub const CompareOp = enum(u32) {
    never = 0,
    less = 1,
    equal = 2,
    less_or_equal = 3,
    greater = 4,
    not_equal = 5,
    greater_or_equal = 6,
    always = 7,
};
pub const DynamicState = enum(u32) {
    viewport = 0,
    scissor = 1,
    line_width = 2,
    depth_bias = 3,
    blend_constants = 4,
    depth_bounds = 5,
    stencil_compare_mask = 6,
    stencil_write_mask = 7,
    stencil_reference = 8,
    viewport_w_scaling_nv = 1000087000,
    discard_rectangle_ext = 1000099000,
    discard_rectangle_enable_ext = 1000099001,
    discard_rectangle_mode_ext = 1000099002,
    sample_locations_ext = 1000143000,
    viewport_shading_rate_palette_nv = 1000164004,
    viewport_coarse_sample_order_nv = 1000164006,
    exclusive_scissor_enable_nv = 1000205000,
    exclusive_scissor_nv = 1000205001,
    fragment_shading_rate_khr = 1000226000,
    line_stipple_ext = 1000259000,
    cull_mode_ext = 1000267000,
    front_face_ext = 1000267001,
    primitive_topology_ext = 1000267002,
    viewport_with_count_ext = 1000267003,
    scissor_with_count_ext = 1000267004,
    vertex_input_binding_stride_ext = 1000267005,
    depth_test_enable_ext = 1000267006,
    depth_write_enable_ext = 1000267007,
    depth_compare_op = 1000267008,
    depth_bounds_test_enable = 1000267009,
    stencil_test_enable = 1000267010,
    stencil_op = 1000267011,
    ray_tracing_pipeline_stack_size_khr = 1000347000,
    vertex_input_ext = 1000352000,
    patch_control_points_ext = 1000377000,
    rasterizer_discard_enable = 1000377001,
    depth_bias_enable_ext = 1000377002,
    logic_op_ext = 1000377003,
    primitive_restart_enable = 1000377004,
    color_write_enable_ext = 1000381000,
    tessellation_domain_origin_ext = 1000455002,
    depth_clamp_enable_ext = 1000455003,
    polygon_mode_ext = 1000455004,
    rasterization_samples_ext = 1000455005,
    sample_mask_ext = 1000455006,
    alpha_to_coverage_enable_ext = 1000455007,
    alpha_to_one_enable_ext = 1000455008,
    logic_op_enable_ext = 1000455009,
    color_blend_enable_ext = 1000455010,
    color_blend_equation_ext = 1000455011,
    color_write_mask_ext = 1000455012,
    rasterization_stream_ext = 1000455013,
    conservative_rasterization_mode_ext = 1000455014,
    extra_primitive_overestimation_size_ext = 1000455015,
    depth_clip_enable_ext = 1000455016,
    sample_locations_enable_ext = 1000455017,
    color_blend_advanced_ext = 1000455018,
    provoking_vertex_mode_ext = 1000455019,
    line_rasterization_mode_ext = 1000455020,
    line_stipple_enable_ext = 1000455021,
    depth_clip_negative_one_to_one_ext = 1000455022,
    viewport_w_scaling_enable_nv = 1000455023,
    viewport_swizzle_nv = 1000455024,
    coverage_to_color_enable_nv = 1000455025,
    coverage_to_color_location_nv = 1000455026,
    coverage_modulation_mode_nv = 1000455027,
    coverage_modulation_table_enable_nv = 1000455028,
    coverage_modulation_table_nv = 1000455029,
    shading_rate_image_enable_nv = 1000455030,
    representative_fragment_test_enable_nv = 1000455031,
    coverage_reduction_mode_nv = 1000455032,
    attachment_feedback_loop_enable_ext = 1000524000,
    depth_clamp_range_ext = 1000582000,
    pub const Self = @This();
    pub const line_stipple_khr = Self.line_stipple_ext;
    pub const cull_mode = Self.cull_mode_ext;
    pub const front_face = Self.front_face_ext;
    pub const primitive_topology = Self.primitive_topology_ext;
    pub const viewport_with_count = Self.viewport_with_count_ext;
    pub const scissor_with_count = Self.scissor_with_count_ext;
    pub const vertex_input_binding_stride = Self.vertex_input_binding_stride_ext;
    pub const depth_test_enable = Self.depth_test_enable_ext;
    pub const depth_write_enable = Self.depth_write_enable_ext;
    pub const depth_compare_op_ext = Self.depth_compare_op;
    pub const depth_bounds_test_enable_ext = Self.depth_bounds_test_enable;
    pub const stencil_test_enable_ext = Self.stencil_test_enable;
    pub const stencil_op_ext = Self.stencil_op;
    pub const rasterizer_discard_enable_ext = Self.rasterizer_discard_enable;
    pub const depth_bias_enable = Self.depth_bias_enable_ext;
    pub const primitive_restart_enable_ext = Self.primitive_restart_enable;
};
pub const FrontFace = enum(u32) {
    counter_clockwise = 0,
    clockwise = 1,
};
pub const VertexInputRate = enum(u32) {
    vertex = 0,
    instance = 1,
};
pub const PrimitiveTopology = enum(u32) {
    point_list = 0,
    line_list = 1,
    line_strip = 2,
    triangle_list = 3,
    triangle_strip = 4,
    triangle_fan = 5,
    line_list_with_adjacency = 6,
    line_strip_with_adjacency = 7,
    triangle_list_with_adjacency = 8,
    triangle_strip_with_adjacency = 9,
    patch_list = 10,
};
pub const PolygonMode = enum(u32) {
    fill = 0,
    line = 1,
    point = 2,
    fill_rectangle_nv = 1000153000,
};
pub const StencilOp = enum(u32) {
    keep = 0,
    zero = 1,
    replace = 2,
    increment_and_clamp = 3,
    decrement_and_clamp = 4,
    invert = 5,
    increment_and_wrap = 6,
    decrement_and_wrap = 7,
};
pub const LogicOp = enum(u32) {
    clear = 0,
    @"and" = 1,
    and_reverse = 2,
    copy = 3,
    and_inverted = 4,
    no_op = 5,
    xor = 6,
    @"or" = 7,
    nor = 8,
    equivalent = 9,
    invert = 10,
    or_reverse = 11,
    copy_inverted = 12,
    or_inverted = 13,
    nand = 14,
    set = 15,
};
pub const BorderColor = enum(u32) {
    float_transparent_black = 0,
    int_transparent_black = 1,
    float_opaque_black = 2,
    int_opaque_black = 3,
    float_opaque_white = 4,
    int_opaque_white = 5,
    float_custom_ext = 1000287003,
    int_custom_ext = 1000287004,
};
pub const Filter = enum(u32) {
    nearest = 0,
    linear = 1,
    cubic_img = 1000015000,
    pub const Self = @This();
    pub const cubic_ext = Self.cubic_img;
};
pub const SamplerAddressMode = enum(u32) {
    repeat = 0,
    mirrored_repeat = 1,
    clamp_to_edge = 2,
    clamp_to_border = 3,
    mirror_clamp_to_edge_khr = 4,
    pub const Self = @This();
    pub const mirror_clamp_to_edge = Self.mirror_clamp_to_edge_khr;
};
pub const SamplerMipmapMode = enum(u32) {
    nearest = 0,
    linear = 1,
};
pub const DescriptorType = enum(u32) {
    sampler = 0,
    combined_image_sampler = 1,
    sampled_image = 2,
    storage_image = 3,
    uniform_texel_buffer = 4,
    storage_texel_buffer = 5,
    uniform_buffer = 6,
    storage_buffer = 7,
    uniform_buffer_dynamic = 8,
    storage_buffer_dynamic = 9,
    input_attachment = 10,
    inline_uniform_block_ext = 1000138000,
    acceleration_structure_khr = 1000150000,
    acceleration_structure_nv = 1000165000,
    mutable_valve = 1000351000,
    sample_weight_image_qcom = 1000440000,
    block_match_image_qcom = 1000440001,
    pub const Self = @This();
    pub const inline_uniform_block = Self.inline_uniform_block_ext;
    pub const mutable_ext = Self.mutable_valve;
};
pub const AttachmentLoadOp = enum(u32) {
    load = 0,
    clear = 1,
    dont_care = 2,
    none_ext = 1000400000,
    pub const Self = @This();
    pub const none_khr = Self.none_ext;
};
pub const AttachmentStoreOp = enum(u32) {
    store = 0,
    dont_care = 1,
    none_ext = 1000301000,
    pub const Self = @This();
    pub const none_qcom = Self.none_ext;
    pub const none_khr = Self.none_ext;
    pub const none = Self.none_ext;
};
pub const PipelineBindPoint = enum(u32) {
    graphics = 0,
    compute = 1,
    ray_tracing_nv = 1000165000,
    subpass_shading_huawei = 1000369003,
    pub const Self = @This();
    pub const ray_tracing_khr = Self.ray_tracing_nv;
};
pub const CommandBufferLevel = enum(u32) {
    primary = 0,
    secondary = 1,
};
pub const IndexType = enum(u32) {
    uint16 = 0,
    uint32 = 1,
    none_nv = 1000165000,
    uint8_ext = 1000265000,
    pub const Self = @This();
    pub const none_khr = Self.none_nv;
    pub const uint8_khr = Self.uint8_ext;
};
pub const SubpassContents = enum(u32) {
    @"inline" = 0,
    secondary_command_buffers = 1,
    inline_and_secondary_command_buffers_ext = 1000451000,
    pub const Self = @This();
    pub const inline_and_secondary_command_buffers_khr = Self.inline_and_secondary_command_buffers_ext;
};
pub const AccessFlags = enum(u32) {
    none_khr = 0,
    indirect_command_read_bit = 1,
    index_read_bit = 2,
    vertex_attribute_read_bit = 4,
    uniform_read_bit = 8,
    input_attachment_read_bit = 16,
    shader_read_bit = 32,
    shader_write_bit = 64,
    color_attachment_read_bit = 128,
    color_attachment_write_bit = 256,
    depth_stencil_attachment_read_bit = 512,
    depth_stencil_attachment_write_bit = 1024,
    transfer_read_bit = 2048,
    transfer_write_bit = 4096,
    host_read_bit = 8192,
    host_write_bit = 16384,
    memory_read_bit = 32768,
    memory_write_bit = 65536,
    command_preprocess_read_bit_nv = 131072,
    command_preprocess_write_bit_nv = 262144,
    color_attachment_read_noncoherent_bit_ext = 524288,
    conditional_rendering_read_bit_ext = 1048576,
    acceleration_structure_read_bit_khr = 2097152,
    acceleration_structure_write_bit_khr = 4194304,
    fragment_shading_rate_attachment_read_bit_khr = 8388608,
    fragment_density_map_read_bit_ext = 16777216,
    transform_feedback_write_bit_ext = 33554432,
    transform_feedback_counter_read_bit_ext = 67108864,
    transform_feedback_counter_write_bit_ext = 134217728,
    pub const Self = @This();
    pub const none = Self.none_khr;
    pub const command_preprocess_read_bit_ext = Self.command_preprocess_read_bit_nv;
    pub const command_preprocess_write_bit_ext = Self.command_preprocess_write_bit_nv;
    pub const acceleration_structure_read_bit_nv = Self.acceleration_structure_read_bit_khr;
    pub const acceleration_structure_write_bit_nv = Self.acceleration_structure_write_bit_khr;
    pub const shading_rate_image_read_bit_nv = Self.fragment_shading_rate_attachment_read_bit_khr;
};
pub const ImageAspectFlags = enum(u32) {
    none_khr = 0,
    color_bit = 1,
    depth_bit = 2,
    stencil_bit = 4,
    metadata_bit = 8,
    plane_0_bit_khr = 16,
    plane_1_bit_khr = 32,
    plane_2_bit_khr = 64,
    memory_plane_0_bit_ext = 128,
    memory_plane_1_bit_ext = 256,
    memory_plane_2_bit_ext = 512,
    memory_plane_3_bit_ext = 1024,
    pub const Self = @This();
    pub const none = Self.none_khr;
    pub const plane_0_bit = Self.plane_0_bit_khr;
    pub const plane_1_bit = Self.plane_1_bit_khr;
    pub const plane_2_bit = Self.plane_2_bit_khr;
};
pub const FormatFeatureFlags = enum(u32) {
    null = 0,
    sampled_image_bit = 1,
    storage_image_bit = 2,
    storage_image_atomic_bit = 4,
    uniform_texel_buffer_bit = 8,
    storage_texel_buffer_bit = 16,
    storage_texel_buffer_atomic_bit = 32,
    vertex_buffer_bit = 64,
    color_attachment_bit = 128,
    color_attachment_blend_bit = 256,
    depth_stencil_attachment_bit = 512,
    blit_src_bit = 1024,
    blit_dst_bit = 2048,
    sampled_image_filter_linear_bit = 4096,
    sampled_image_filter_cubic_bit_ext = 8192,
    transfer_src_bit_khr = 16384,
    transfer_dst_bit_khr = 32768,
    sampled_image_filter_minmax_bit = 65536,
    midpoint_chroma_samples_bit = 131072,
    sampled_image_ycbcr_conversion_linear_filter_bit_khr = 262144,
    sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit_khr = 524288,
    sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit = 1048576,
    sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit = 2097152,
    disjoint_bit = 4194304,
    cosited_chroma_samples_bit = 8388608,
    fragment_density_map_bit_ext = 16777216,
    video_decode_output_bit_khr = 33554432,
    video_decode_dpb_bit_khr = 67108864,
    video_encode_input_bit_khr = 134217728,
    video_encode_dpb_bit_khr = 268435456,
    acceleration_structure_vertex_buffer_bit_khr = 536870912,
    fragment_shading_rate_attachment_bit_khr = 1073741824,
    pub const Self = @This();
    pub const sampled_image_filter_cubic_bit_img = Self.sampled_image_filter_cubic_bit_ext;
    pub const transfer_src_bit = Self.transfer_src_bit_khr;
    pub const transfer_dst_bit = Self.transfer_dst_bit_khr;
    pub const sampled_image_filter_minmax_bit_ext = Self.sampled_image_filter_minmax_bit;
    pub const midpoint_chroma_samples_bit_khr = Self.midpoint_chroma_samples_bit;
    pub const sampled_image_ycbcr_conversion_linear_filter_bit = Self.sampled_image_ycbcr_conversion_linear_filter_bit_khr;
    pub const sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit = Self.sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit_khr;
    pub const sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit_khr = Self.sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit;
    pub const sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit_khr = Self.sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit;
    pub const disjoint_bit_khr = Self.disjoint_bit;
    pub const cosited_chroma_samples_bit_khr = Self.cosited_chroma_samples_bit;
};
pub const ImageCreateFlags = enum(u32) {
    null = 0,
    sparse_binding_bit = 1,
    sparse_residency_bit = 2,
    sparse_aliased_bit = 4,
    mutable_format_bit = 8,
    cube_compatible_bit = 16,
    @"2d_array_compatible_bit" = 32,
    split_instance_bind_regions_bit_khr = 64,
    block_texel_view_compatible_bit = 128,
    extended_usage_bit = 256,
    disjoint_bit = 512,
    alias_bit = 1024,
    protected_bit = 2048,
    sample_locations_compatible_depth_bit_ext = 4096,
    corner_sampled_bit_nv = 8192,
    subsampled_bit_ext = 16384,
    fragment_density_map_offset_bit_qcom = 32768,
    descriptor_buffer_capture_replay_bit_ext = 65536,
    @"2d_view_compatible_bit_ext" = 131072,
    multisampled_render_to_single_sampled_bit_ext = 262144,
    video_profile_independent_bit_khr = 1048576,
    pub const Self = @This();
    pub const @"2d_array_compatible_bit_khr" = Self.@"2d_array_compatible_bit";
    pub const split_instance_bind_regions_bit = Self.split_instance_bind_regions_bit_khr;
    pub const block_texel_view_compatible_bit_khr = Self.block_texel_view_compatible_bit;
    pub const extended_usage_bit_khr = Self.extended_usage_bit;
    pub const disjoint_bit_khr = Self.disjoint_bit;
    pub const alias_bit_khr = Self.alias_bit;
};
pub const SampleCountFlags = enum(u32) {
    null = 0,
    @"1_bit" = 1,
    @"2_bit" = 2,
    @"4_bit" = 4,
    @"8_bit" = 8,
    @"16_bit" = 16,
    @"32_bit" = 32,
    @"64_bit" = 64,
};
pub const ImageUsageFlags = enum(u32) {
    null = 0,
    transfer_src_bit = 1,
    transfer_dst_bit = 2,
    sampled_bit = 4,
    storage_bit = 8,
    color_attachment_bit = 16,
    depth_stencil_attachment_bit = 32,
    transient_attachment_bit = 64,
    input_attachment_bit = 128,
    shading_rate_image_bit_nv = 256,
    fragment_density_map_bit_ext = 512,
    video_decode_dst_bit_khr = 1024,
    video_decode_src_bit_khr = 2048,
    video_decode_dpb_bit_khr = 4096,
    video_encode_dst_bit_khr = 8192,
    video_encode_src_bit_khr = 16384,
    video_encode_dpb_bit_khr = 32768,
    invocation_mask_bit_huawei = 262144,
    attachment_feedback_loop_bit_ext = 524288,
    sample_weight_bit_qcom = 1048576,
    sample_block_match_bit_qcom = 2097152,
    host_transfer_bit_ext = 4194304,
    pub const Self = @This();
    pub const fragment_shading_rate_attachment_bit_khr = Self.shading_rate_image_bit_nv;
};
pub const InstanceCreateFlags = enum(u32) {
    null = 0,
    enumerate_portability_bit_khr = 1,
};
pub const MemoryHeapFlags = enum(u32) {
    null = 0,
    device_local_bit = 1,
    multi_instance_bit_khr = 2,
    pub const Self = @This();
    pub const multi_instance_bit = Self.multi_instance_bit_khr;
};
pub const MemoryPropertyFlags = enum(u32) {
    null = 0,
    device_local_bit = 1,
    host_visible_bit = 2,
    host_coherent_bit = 4,
    host_cached_bit = 8,
    lazily_allocated_bit = 16,
    protected_bit = 32,
    device_coherent_bit_amd = 64,
    device_uncached_bit_amd = 128,
    rdma_capable_bit_nv = 256,
};
pub const QueueFlags = enum(u32) {
    null = 0,
    graphics_bit = 1,
    compute_bit = 2,
    transfer_bit = 4,
    sparse_binding_bit = 8,
    protected_bit = 16,
    video_decode_bit_khr = 32,
    video_encode_bit_khr = 64,
    optical_flow_bit_nv = 256,
};
pub const DeviceCreateFlags = Flags;
pub const DeviceQueueCreateFlags = enum(u32) {
    null = 0,
    protected_bit = 1,
};
pub const PipelineStageFlags = enum(u32) {
    none_khr = 0,
    top_of_pipe_bit = 1,
    draw_indirect_bit = 2,
    vertex_input_bit = 4,
    vertex_shader_bit = 8,
    tessellation_control_shader_bit = 16,
    tessellation_evaluation_shader_bit = 32,
    geometry_shader_bit = 64,
    fragment_shader_bit = 128,
    early_fragment_tests_bit = 256,
    late_fragment_tests_bit = 512,
    color_attachment_output_bit = 1024,
    compute_shader_bit = 2048,
    transfer_bit = 4096,
    bottom_of_pipe_bit = 8192,
    host_bit = 16384,
    all_graphics_bit = 32768,
    all_commands_bit = 65536,
    command_preprocess_bit_ext = 131072,
    conditional_rendering_bit_ext = 262144,
    task_shader_bit_nv = 524288,
    mesh_shader_bit_ext = 1048576,
    ray_tracing_shader_bit_khr = 2097152,
    fragment_shading_rate_attachment_bit_khr = 4194304,
    fragment_density_process_bit_ext = 8388608,
    transform_feedback_bit_ext = 16777216,
    acceleration_structure_build_bit_khr = 33554432,
    pub const Self = @This();
    pub const none = Self.none_khr;
    pub const command_preprocess_bit_nv = Self.command_preprocess_bit_ext;
    pub const task_shader_bit_ext = Self.task_shader_bit_nv;
    pub const mesh_shader_bit_nv = Self.mesh_shader_bit_ext;
    pub const ray_tracing_shader_bit_nv = Self.ray_tracing_shader_bit_khr;
    pub const shading_rate_image_bit_nv = Self.fragment_shading_rate_attachment_bit_khr;
    pub const acceleration_structure_build_bit_nv = Self.acceleration_structure_build_bit_khr;
};
pub const MemoryMapFlags = enum(u32) {
    null = 0,
    placed_bit_ext = 1,
};
pub const SparseMemoryBindFlags = enum(u32) {
    null = 0,
    metadata_bit = 1,
};
pub const SparseImageFormatFlags = enum(u32) {
    null = 0,
    single_miptail_bit = 1,
    aligned_mip_size_bit = 2,
    nonstandard_block_size_bit = 4,
};
pub const FenceCreateFlags = enum(u32) {
    null = 0,
    signaled_bit = 1,
};
pub const SemaphoreCreateFlags = Flags;
pub const EventCreateFlags = enum(u32) {
    null = 0,
    device_only_bit_khr = 1,
    pub const Self = @This();
    pub const device_only_bit = Self.device_only_bit_khr;
};
pub const QueryPipelineStatisticFlags = enum(u32) {
    null = 0,
    input_assembly_vertices_bit = 1,
    input_assembly_primitives_bit = 2,
    vertex_shader_invocations_bit = 4,
    geometry_shader_invocations_bit = 8,
    geometry_shader_primitives_bit = 16,
    clipping_invocations_bit = 32,
    clipping_primitives_bit = 64,
    fragment_shader_invocations_bit = 128,
    tessellation_control_shader_patches_bit = 256,
    tessellation_evaluation_shader_invocations_bit = 512,
    compute_shader_invocations_bit = 1024,
    task_shader_invocations_bit_ext = 2048,
    mesh_shader_invocations_bit_ext = 4096,
    cluster_culling_shader_invocations_bit_huawei = 8192,
};
pub const QueryPoolCreateFlags = Flags;
pub const QueryResultFlags = enum(u32) {
    null = 0,
    @"64_bit" = 1,
    wait_bit = 2,
    with_availability_bit = 4,
    partial_bit = 8,
    with_status_bit_khr = 16,
};
pub const BufferCreateFlags = enum(u32) {
    null = 0,
    sparse_binding_bit = 1,
    sparse_residency_bit = 2,
    sparse_aliased_bit = 4,
    protected_bit = 8,
    device_address_capture_replay_bit_khr = 16,
    descriptor_buffer_capture_replay_bit_ext = 32,
    video_profile_independent_bit_khr = 64,
    pub const Self = @This();
    pub const device_address_capture_replay_bit_ext = Self.device_address_capture_replay_bit_khr;
    pub const device_address_capture_replay_bit = Self.device_address_capture_replay_bit_khr;
};
pub const BufferUsageFlags = enum(u32) {
    null = 0,
    transfer_src_bit = 1,
    transfer_dst_bit = 2,
    uniform_texel_buffer_bit = 4,
    storage_texel_buffer_bit = 8,
    uniform_buffer_bit = 16,
    storage_buffer_bit = 32,
    index_buffer_bit = 64,
    vertex_buffer_bit = 128,
    indirect_buffer_bit = 256,
    conditional_rendering_bit_ext = 512,
    shader_binding_table_bit_khr = 1024,
    transform_feedback_buffer_bit_ext = 2048,
    transform_feedback_counter_buffer_bit_ext = 4096,
    video_decode_src_bit_khr = 8192,
    video_decode_dst_bit_khr = 16384,
    video_encode_dst_bit_khr = 32768,
    video_encode_src_bit_khr = 65536,
    shader_device_address_bit = 131072,
    acceleration_structure_build_input_read_only_bit_khr = 524288,
    acceleration_structure_storage_bit_khr = 1048576,
    sampler_descriptor_buffer_bit_ext = 2097152,
    resource_descriptor_buffer_bit_ext = 4194304,
    micromap_build_input_read_only_bit_ext = 8388608,
    micromap_storage_bit_ext = 16777216,
    push_descriptors_descriptor_buffer_bit_ext = 67108864,
    pub const Self = @This();
    pub const ray_tracing_bit_nv = Self.shader_binding_table_bit_khr;
    pub const shader_device_address_bit_ext = Self.shader_device_address_bit;
    pub const shader_device_address_bit_khr = Self.shader_device_address_bit;
};
pub const BufferViewCreateFlags = Flags;
pub const ImageViewCreateFlags = enum(u32) {
    null = 0,
    fragment_density_map_dynamic_bit_ext = 1,
    fragment_density_map_deferred_bit_ext = 2,
    descriptor_buffer_capture_replay_bit_ext = 4,
};
pub const ShaderModuleCreateFlags = Flags;
pub const PipelineCacheCreateFlags = enum(u32) {
    null = 0,
    externally_synchronized_bit_ext = 1,
    pub const Self = @This();
    pub const externally_synchronized_bit = Self.externally_synchronized_bit_ext;
};
pub const ColorComponentFlags = enum(u32) {
    null = 0,
    r_bit = 1,
    g_bit = 2,
    b_bit = 4,
    a_bit = 8,
};
pub const PipelineCreateFlags = enum(u32) {
    null = 0,
    disable_optimization_bit = 1,
    allow_derivatives_bit = 2,
    derivative_bit = 4,
    view_index_from_device_index_bit_khr = 8,
    dispatch_base_khr = 16,
    defer_compile_bit_nv = 32,
    capture_statistics_bit_khr = 64,
    capture_internal_representations_bit_khr = 128,
    fail_on_pipeline_compile_required_bit_ext = 256,
    early_return_on_failure_bit_ext = 512,
    link_time_optimization_bit_ext = 1024,
    library_bit_khr = 2048,
    ray_tracing_skip_triangles_bit_khr = 4096,
    ray_tracing_skip_aabbs_bit_khr = 8192,
    ray_tracing_no_null_any_hit_shaders_bit_khr = 16384,
    ray_tracing_no_null_closest_hit_shaders_bit_khr = 32768,
    ray_tracing_no_null_miss_shaders_bit_khr = 65536,
    ray_tracing_no_null_intersection_shaders_bit_khr = 131072,
    indirect_bindable_bit_nv = 262144,
    ray_tracing_shader_group_handle_capture_replay_bit_khr = 524288,
    ray_tracing_allow_motion_bit_nv = 1048576,
    rendering_fragment_shading_rate_attachment_bit_khr = 2097152,
    rendering_fragment_density_map_attachment_bit_ext = 4194304,
    retain_link_time_optimization_info_bit_ext = 8388608,
    ray_tracing_opacity_micromap_bit_ext = 16777216,
    color_attachment_feedback_loop_bit_ext = 33554432,
    depth_stencil_attachment_feedback_loop_bit_ext = 67108864,
    no_protected_access_bit_ext = 134217728,
    descriptor_buffer_bit_ext = 536870912,
    protected_access_only_bit_ext = 1073741824,
    pub const Self = @This();
    pub const view_index_from_device_index_bit = Self.view_index_from_device_index_bit_khr;
    pub const dispatch_base = Self.dispatch_base_khr;
    pub const dispatch_base_bit = Self.dispatch_base_khr;
    pub const fail_on_pipeline_compile_required_bit = Self.fail_on_pipeline_compile_required_bit_ext;
    pub const early_return_on_failure_bit = Self.early_return_on_failure_bit_ext;
    pub const rasterization_state_create_fragment_shading_rate_attachment_bit_khr = Self.rendering_fragment_shading_rate_attachment_bit_khr;
    pub const rasterization_state_create_fragment_density_map_attachment_bit_ext = Self.rendering_fragment_density_map_attachment_bit_ext;
};
pub const PipelineShaderStageCreateFlags = enum(u32) {
    null = 0,
    allow_varying_subgroup_size_bit_ext = 1,
    require_full_subgroups_bit_ext = 2,
    pub const Self = @This();
    pub const allow_varying_subgroup_size_bit = Self.allow_varying_subgroup_size_bit_ext;
    pub const require_full_subgroups_bit = Self.require_full_subgroups_bit_ext;
};
pub const ShaderStageFlags = enum(u32) {
    null = 0,
    vertex_bit = 1,
    tessellation_control_bit = 2,
    tessellation_evaluation_bit = 4,
    geometry_bit = 8,
    fragment_bit = 16,
    all_graphics = 31,
    compute_bit = 32,
    task_bit_nv = 64,
    mesh_bit_ext = 128,
    raygen_bit_khr = 256,
    any_hit_bit_khr = 512,
    closest_hit_bit_khr = 1024,
    miss_bit_khr = 2048,
    intersection_bit_khr = 4096,
    callable_bit_khr = 8192,
    subpass_shading_bit_huawei = 16384,
    cluster_culling_bit_huawei = 524288,
    pub const Self = @This();
    pub const task_bit_ext = Self.task_bit_nv;
    pub const mesh_bit_nv = Self.mesh_bit_ext;
    pub const raygen_bit_nv = Self.raygen_bit_khr;
    pub const any_hit_bit_nv = Self.any_hit_bit_khr;
    pub const closest_hit_bit_nv = Self.closest_hit_bit_khr;
    pub const miss_bit_nv = Self.miss_bit_khr;
    pub const intersection_bit_nv = Self.intersection_bit_khr;
    pub const callable_bit_nv = Self.callable_bit_khr;
};
pub const CullModeFlags = enum(u32) {
    none = 0,
    front_bit = 1,
    back_bit = 2,
    front_and_back = 3,
};
pub const PipelineVertexInputStateCreateFlags = Flags;
pub const PipelineInputAssemblyStateCreateFlags = Flags;
pub const PipelineTessellationStateCreateFlags = Flags;
pub const PipelineViewportStateCreateFlags = Flags;
pub const PipelineRasterizationStateCreateFlags = Flags;
pub const PipelineMultisampleStateCreateFlags = Flags;
pub const PipelineDepthStencilStateCreateFlags = enum(u32) {
    null = 0,
    rasterization_order_attachment_depth_access_bit_arm = 1,
    rasterization_order_attachment_stencil_access_bit_arm = 2,
    pub const Self = @This();
    pub const rasterization_order_attachment_depth_access_bit_ext = Self.rasterization_order_attachment_depth_access_bit_arm;
    pub const rasterization_order_attachment_stencil_access_bit_ext = Self.rasterization_order_attachment_stencil_access_bit_arm;
};
pub const PipelineColorBlendStateCreateFlags = enum(u32) {
    null = 0,
    rasterization_order_attachment_access_bit_arm = 1,
    pub const Self = @This();
    pub const rasterization_order_attachment_access_bit_ext = Self.rasterization_order_attachment_access_bit_arm;
};
pub const PipelineDynamicStateCreateFlags = Flags;
pub const PipelineLayoutCreateFlags = enum(u32) {
    null = 0,
    independent_sets_bit_ext = 2,
};
pub const SamplerCreateFlags = enum(u32) {
    null = 0,
    subsampled_bit_ext = 1,
    subsampled_coarse_reconstruction_bit_ext = 2,
    non_seamless_cube_map_bit_ext = 4,
    descriptor_buffer_capture_replay_bit_ext = 8,
    image_processing_bit_qcom = 16,
};
pub const DescriptorPoolCreateFlags = enum(u32) {
    null = 0,
    free_descriptor_set_bit = 1,
    update_after_bind_bit_ext = 2,
    host_only_bit_valve = 4,
    allow_overallocation_sets_bit_nv = 8,
    allow_overallocation_pools_bit_nv = 16,
    pub const Self = @This();
    pub const update_after_bind_bit = Self.update_after_bind_bit_ext;
    pub const host_only_bit_ext = Self.host_only_bit_valve;
};
pub const DescriptorPoolResetFlags = Flags;
pub const DescriptorSetLayoutCreateFlags = enum(u32) {
    null = 0,
    push_descriptor_bit_khr = 1,
    update_after_bind_pool_bit_ext = 2,
    host_only_pool_bit_valve = 4,
    descriptor_buffer_bit_ext = 16,
    embedded_immutable_samplers_bit_ext = 32,
    per_stage_bit_nv = 64,
    indirect_bindable_bit_nv = 128,
    pub const Self = @This();
    pub const update_after_bind_pool_bit = Self.update_after_bind_pool_bit_ext;
    pub const host_only_pool_bit_ext = Self.host_only_pool_bit_valve;
};
pub const AttachmentDescriptionFlags = enum(u32) {
    null = 0,
    may_alias_bit = 1,
};
pub const DependencyFlags = enum(u32) {
    null = 0,
    by_region_bit = 1,
    view_local_bit_khr = 2,
    device_group_bit_khr = 4,
    feedback_loop_bit_ext = 8,
    pub const Self = @This();
    pub const view_local_bit = Self.view_local_bit_khr;
    pub const device_group_bit = Self.device_group_bit_khr;
};
pub const FramebufferCreateFlags = enum(u32) {
    null = 0,
    imageless_bit_khr = 1,
    pub const Self = @This();
    pub const imageless_bit = Self.imageless_bit_khr;
};
pub const RenderPassCreateFlags = enum(u32) {
    null = 0,
    transform_bit_qcom = 2,
};
pub const SubpassDescriptionFlags = enum(u32) {
    null = 0,
    per_view_attributes_bit_nvx = 1,
    per_view_position_x_only_bit_nvx = 2,
    fragment_region_bit_qcom = 4,
    shader_resolve_bit_qcom = 8,
    rasterization_order_attachment_color_access_bit_arm = 16,
    rasterization_order_attachment_depth_access_bit_arm = 32,
    rasterization_order_attachment_stencil_access_bit_arm = 64,
    enable_legacy_dithering_bit_ext = 128,
    pub const Self = @This();
    pub const rasterization_order_attachment_color_access_bit_ext = Self.rasterization_order_attachment_color_access_bit_arm;
    pub const rasterization_order_attachment_depth_access_bit_ext = Self.rasterization_order_attachment_depth_access_bit_arm;
    pub const rasterization_order_attachment_stencil_access_bit_ext = Self.rasterization_order_attachment_stencil_access_bit_arm;
};
pub const CommandPoolCreateFlags = enum(u32) {
    null = 0,
    transient_bit = 1,
    reset_command_buffer_bit = 2,
    protected_bit = 4,
};
pub const CommandPoolResetFlags = enum(u32) {
    null = 0,
    release_resources_bit = 1,
};
pub const CommandBufferUsageFlags = enum(u32) {
    null = 0,
    one_time_submit_bit = 1,
    render_pass_continue_bit = 2,
    simultaneous_use_bit = 4,
};
pub const QueryControlFlags = enum(u32) {
    null = 0,
    precise_bit = 1,
};
pub const CommandBufferResetFlags = enum(u32) {
    null = 0,
    release_resources_bit = 1,
};
pub const StencilFaceFlags = enum(u32) {
    null = 0,
    front_bit = 1,
    back_bit = 2,
    front_and_back = 3,
};
pub const Extent2D = extern struct {
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
};
pub const Extent3D = extern struct {
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
    depth: u32 = @import("std").mem.zeroes(u32),
};
pub const Offset2D = extern struct {
    x: i32 = @import("std").mem.zeroes(i32),
    y: i32 = @import("std").mem.zeroes(i32),
};
pub const Offset3D = extern struct {
    x: i32 = @import("std").mem.zeroes(i32),
    y: i32 = @import("std").mem.zeroes(i32),
    z: i32 = @import("std").mem.zeroes(i32),
};
pub const Rect2D = extern struct {
    offset: Offset2D = @import("std").mem.zeroes(Offset2D),
    extent: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const BaseInStructure = extern struct {
    s_type: StructureType = StructureType.base_in_structure,
    p_next: [*c]const BaseInStructure = @import("std").mem.zeroes([*c]const BaseInStructure),
};
pub const BaseOutStructure = extern struct {
    s_type: StructureType = StructureType.base_out_structure,
    p_next: [*c]BaseOutStructure = @import("std").mem.zeroes([*c]BaseOutStructure),
};
pub const BufferMemoryBarrier = extern struct {
    s_type: StructureType = StructureType.buffer_memory_barrier,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dst_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    src_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    dst_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const DispatchIndirectCommand = extern struct {
    x: u32 = @import("std").mem.zeroes(u32),
    y: u32 = @import("std").mem.zeroes(u32),
    z: u32 = @import("std").mem.zeroes(u32),
};
pub const DrawIndexedIndirectCommand = extern struct {
    index_count: u32 = @import("std").mem.zeroes(u32),
    instance_count: u32 = @import("std").mem.zeroes(u32),
    first_index: u32 = @import("std").mem.zeroes(u32),
    vertex_offset: i32 = @import("std").mem.zeroes(i32),
    first_instance: u32 = @import("std").mem.zeroes(u32),
};
pub const DrawIndirectCommand = extern struct {
    vertex_count: u32 = @import("std").mem.zeroes(u32),
    instance_count: u32 = @import("std").mem.zeroes(u32),
    first_vertex: u32 = @import("std").mem.zeroes(u32),
    first_instance: u32 = @import("std").mem.zeroes(u32),
};
pub const ImageSubresourceRange = extern struct {
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
    base_mip_level: u32 = @import("std").mem.zeroes(u32),
    level_count: u32 = @import("std").mem.zeroes(u32),
    base_array_layer: u32 = @import("std").mem.zeroes(u32),
    layer_count: u32 = @import("std").mem.zeroes(u32),
};
pub const ImageMemoryBarrier = extern struct {
    s_type: StructureType = StructureType.image_memory_barrier,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dst_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    old_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    new_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    src_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    dst_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    image: Image = @import("std").mem.zeroes(Image),
    subresource_range: ImageSubresourceRange = @import("std").mem.zeroes(ImageSubresourceRange),
};
pub const MemoryBarrier = extern struct {
    s_type: StructureType = StructureType.memory_barrier,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dst_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
};
pub const PipelineCacheHeaderVersionOne = extern struct {
    header_size: u32 = @import("std").mem.zeroes(u32),
    header_version: PipelineCacheHeaderVersion = @import("std").mem.zeroes(PipelineCacheHeaderVersion),
    vendor_id: u32 = @import("std").mem.zeroes(u32),
    device_id: u32 = @import("std").mem.zeroes(u32),
    pipeline_cache_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const PFN_allocationFunction = ?*const fn (?*anyopaque, usize, usize, SystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_freeFunction = ?*const fn (?*anyopaque, ?*anyopaque) callconv(.c) void;
pub const PFN_internalAllocationNotification = ?*const fn (?*anyopaque, usize, InternalAllocationType, SystemAllocationScope) callconv(.c) void;
pub const PFN_internalFreeNotification = ?*const fn (?*anyopaque, usize, InternalAllocationType, SystemAllocationScope) callconv(.c) void;
pub const PFN_reallocationFunction = ?*const fn (?*anyopaque, ?*anyopaque, usize, usize, SystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_voidFunction = ?*const fn () callconv(.c) void;
pub const AllocationCallbacks = extern struct {
    p_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pfn_allocation: PFN_allocationFunction = @import("std").mem.zeroes(PFN_allocationFunction),
    pfn_reallocation: PFN_reallocationFunction = @import("std").mem.zeroes(PFN_reallocationFunction),
    pfn_free: PFN_freeFunction = @import("std").mem.zeroes(PFN_freeFunction),
    pfn_internal_allocation: PFN_internalAllocationNotification = @import("std").mem.zeroes(PFN_internalAllocationNotification),
    pfn_internal_free: PFN_internalFreeNotification = @import("std").mem.zeroes(PFN_internalFreeNotification),
};
pub const ApplicationInfo = extern struct {
    s_type: StructureType = StructureType.application_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_application_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    application_version: u32 = @import("std").mem.zeroes(u32),
    p_engine_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    engine_version: u32 = @import("std").mem.zeroes(u32),
    api_version: u32 = @import("std").mem.zeroes(u32),
};
pub const FormatProperties = extern struct {
    linear_tiling_features: FormatFeatureFlags = @import("std").mem.zeroes(FormatFeatureFlags),
    optimal_tiling_features: FormatFeatureFlags = @import("std").mem.zeroes(FormatFeatureFlags),
    buffer_features: FormatFeatureFlags = @import("std").mem.zeroes(FormatFeatureFlags),
};
pub const ImageFormatProperties = extern struct {
    max_extent: Extent3D = @import("std").mem.zeroes(Extent3D),
    max_mip_levels: u32 = @import("std").mem.zeroes(u32),
    max_array_layers: u32 = @import("std").mem.zeroes(u32),
    sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    max_resource_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const InstanceCreateInfo = extern struct {
    s_type: StructureType = StructureType.instance_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: InstanceCreateFlags = @import("std").mem.zeroes(InstanceCreateFlags),
    p_application_info: [*c]const ApplicationInfo = @import("std").mem.zeroes([*c]const ApplicationInfo),
    enabled_layer_count: u32 = @import("std").mem.zeroes(u32),
    pp_enabled_layer_names: [*c]const [*c]const u8 = @import("std").mem.zeroes([*c]const [*c]const u8),
    enabled_extension_count: u32 = @import("std").mem.zeroes(u32),
    pp_enabled_extension_names: [*c]const [*c]const u8 = @import("std").mem.zeroes([*c]const [*c]const u8),
};
pub const MemoryHeap = extern struct {
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    flags: MemoryHeapFlags = @import("std").mem.zeroes(MemoryHeapFlags),
};
pub const MemoryType = extern struct {
    property_flags: MemoryPropertyFlags = @import("std").mem.zeroes(MemoryPropertyFlags),
    heap_index: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceFeatures = extern struct {
    robust_buffer_access: Bool32 = @import("std").mem.zeroes(Bool32),
    full_draw_index_uint32: Bool32 = @import("std").mem.zeroes(Bool32),
    image_cube_array: Bool32 = @import("std").mem.zeroes(Bool32),
    independent_blend: Bool32 = @import("std").mem.zeroes(Bool32),
    geometry_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    tessellation_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    sample_rate_shading: Bool32 = @import("std").mem.zeroes(Bool32),
    dual_src_blend: Bool32 = @import("std").mem.zeroes(Bool32),
    logic_op: Bool32 = @import("std").mem.zeroes(Bool32),
    multi_draw_indirect: Bool32 = @import("std").mem.zeroes(Bool32),
    draw_indirect_first_instance: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_clamp: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_bias_clamp: Bool32 = @import("std").mem.zeroes(Bool32),
    fill_mode_non_solid: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_bounds: Bool32 = @import("std").mem.zeroes(Bool32),
    wide_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    large_points: Bool32 = @import("std").mem.zeroes(Bool32),
    alpha_to_one: Bool32 = @import("std").mem.zeroes(Bool32),
    multi_viewport: Bool32 = @import("std").mem.zeroes(Bool32),
    sampler_anisotropy: Bool32 = @import("std").mem.zeroes(Bool32),
    texture_compression_etc2: Bool32 = @import("std").mem.zeroes(Bool32),
    texture_compression_astc_ldr: Bool32 = @import("std").mem.zeroes(Bool32),
    texture_compression_bc: Bool32 = @import("std").mem.zeroes(Bool32),
    occlusion_query_precise: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_statistics_query: Bool32 = @import("std").mem.zeroes(Bool32),
    vertex_pipeline_stores_and_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_stores_and_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_tessellation_and_geometry_point_size: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_image_gather_extended: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_extended_formats: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_multisample: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_read_without_format: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_write_without_format: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_buffer_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_sampled_image_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_buffer_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_clip_distance: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_cull_distance: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_int64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_int16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_resource_residency: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_resource_min_lod: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_binding: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency_buffer: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency_image2d: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency_image3d: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency2samples: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency4samples: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency8samples: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency16samples: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_residency_aliased: Bool32 = @import("std").mem.zeroes(Bool32),
    variable_multisample_rate: Bool32 = @import("std").mem.zeroes(Bool32),
    inherited_queries: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceLimits = extern struct {
    max_image_dimension1d: u32 = @import("std").mem.zeroes(u32),
    max_image_dimension2d: u32 = @import("std").mem.zeroes(u32),
    max_image_dimension3d: u32 = @import("std").mem.zeroes(u32),
    max_image_dimension_cube: u32 = @import("std").mem.zeroes(u32),
    max_image_array_layers: u32 = @import("std").mem.zeroes(u32),
    max_texel_buffer_elements: u32 = @import("std").mem.zeroes(u32),
    max_uniform_buffer_range: u32 = @import("std").mem.zeroes(u32),
    max_storage_buffer_range: u32 = @import("std").mem.zeroes(u32),
    max_push_constants_size: u32 = @import("std").mem.zeroes(u32),
    max_memory_allocation_count: u32 = @import("std").mem.zeroes(u32),
    max_sampler_allocation_count: u32 = @import("std").mem.zeroes(u32),
    buffer_image_granularity: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    sparse_address_space_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    max_bound_descriptor_sets: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_samplers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_uniform_buffers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_storage_buffers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_sampled_images: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_storage_images: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_input_attachments: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_resources: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_samplers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_uniform_buffers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_uniform_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_storage_buffers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_storage_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_sampled_images: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_storage_images: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_input_attachments: u32 = @import("std").mem.zeroes(u32),
    max_vertex_input_attributes: u32 = @import("std").mem.zeroes(u32),
    max_vertex_input_bindings: u32 = @import("std").mem.zeroes(u32),
    max_vertex_input_attribute_offset: u32 = @import("std").mem.zeroes(u32),
    max_vertex_input_binding_stride: u32 = @import("std").mem.zeroes(u32),
    max_vertex_output_components: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_generation_level: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_patch_size: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_control_per_vertex_input_components: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_control_per_vertex_output_components: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_control_per_patch_output_components: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_control_total_output_components: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_evaluation_input_components: u32 = @import("std").mem.zeroes(u32),
    max_tessellation_evaluation_output_components: u32 = @import("std").mem.zeroes(u32),
    max_geometry_shader_invocations: u32 = @import("std").mem.zeroes(u32),
    max_geometry_input_components: u32 = @import("std").mem.zeroes(u32),
    max_geometry_output_components: u32 = @import("std").mem.zeroes(u32),
    max_geometry_output_vertices: u32 = @import("std").mem.zeroes(u32),
    max_geometry_total_output_components: u32 = @import("std").mem.zeroes(u32),
    max_fragment_input_components: u32 = @import("std").mem.zeroes(u32),
    max_fragment_output_attachments: u32 = @import("std").mem.zeroes(u32),
    max_fragment_dual_src_attachments: u32 = @import("std").mem.zeroes(u32),
    max_fragment_combined_output_resources: u32 = @import("std").mem.zeroes(u32),
    max_compute_shared_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_compute_work_group_count: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_compute_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    max_compute_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
    sub_pixel_precision_bits: u32 = @import("std").mem.zeroes(u32),
    sub_texel_precision_bits: u32 = @import("std").mem.zeroes(u32),
    mipmap_precision_bits: u32 = @import("std").mem.zeroes(u32),
    max_draw_indexed_index_value: u32 = @import("std").mem.zeroes(u32),
    max_draw_indirect_count: u32 = @import("std").mem.zeroes(u32),
    max_sampler_lod_bias: f32 = @import("std").mem.zeroes(f32),
    max_sampler_anisotropy: f32 = @import("std").mem.zeroes(f32),
    max_viewports: u32 = @import("std").mem.zeroes(u32),
    max_viewport_dimensions: [2]u32 = @import("std").mem.zeroes([2]u32),
    viewport_bounds_range: [2]f32 = @import("std").mem.zeroes([2]f32),
    viewport_sub_pixel_bits: u32 = @import("std").mem.zeroes(u32),
    min_memory_map_alignment: usize = @import("std").mem.zeroes(usize),
    min_texel_buffer_offset_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    min_uniform_buffer_offset_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    min_storage_buffer_offset_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    min_texel_offset: i32 = @import("std").mem.zeroes(i32),
    max_texel_offset: u32 = @import("std").mem.zeroes(u32),
    min_texel_gather_offset: i32 = @import("std").mem.zeroes(i32),
    max_texel_gather_offset: u32 = @import("std").mem.zeroes(u32),
    min_interpolation_offset: f32 = @import("std").mem.zeroes(f32),
    max_interpolation_offset: f32 = @import("std").mem.zeroes(f32),
    sub_pixel_interpolation_offset_bits: u32 = @import("std").mem.zeroes(u32),
    max_framebuffer_width: u32 = @import("std").mem.zeroes(u32),
    max_framebuffer_height: u32 = @import("std").mem.zeroes(u32),
    max_framebuffer_layers: u32 = @import("std").mem.zeroes(u32),
    framebuffer_color_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    framebuffer_depth_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    framebuffer_stencil_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    framebuffer_no_attachments_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    max_color_attachments: u32 = @import("std").mem.zeroes(u32),
    sampled_image_color_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    sampled_image_integer_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    sampled_image_depth_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    sampled_image_stencil_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    storage_image_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    max_sample_mask_words: u32 = @import("std").mem.zeroes(u32),
    timestamp_compute_and_graphics: Bool32 = @import("std").mem.zeroes(Bool32),
    timestamp_period: f32 = @import("std").mem.zeroes(f32),
    max_clip_distances: u32 = @import("std").mem.zeroes(u32),
    max_cull_distances: u32 = @import("std").mem.zeroes(u32),
    max_combined_clip_and_cull_distances: u32 = @import("std").mem.zeroes(u32),
    discrete_queue_priorities: u32 = @import("std").mem.zeroes(u32),
    point_size_range: [2]f32 = @import("std").mem.zeroes([2]f32),
    line_width_range: [2]f32 = @import("std").mem.zeroes([2]f32),
    point_size_granularity: f32 = @import("std").mem.zeroes(f32),
    line_width_granularity: f32 = @import("std").mem.zeroes(f32),
    strict_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    standard_sample_locations: Bool32 = @import("std").mem.zeroes(Bool32),
    optimal_buffer_copy_offset_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    optimal_buffer_copy_row_pitch_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    non_coherent_atom_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PhysicalDeviceMemoryProperties = extern struct {
    memory_type_count: u32 = @import("std").mem.zeroes(u32),
    memory_types: [32]MemoryType = @import("std").mem.zeroes([32]MemoryType),
    memory_heap_count: u32 = @import("std").mem.zeroes(u32),
    memory_heaps: [16]MemoryHeap = @import("std").mem.zeroes([16]MemoryHeap),
};
pub const PhysicalDeviceSparseProperties = extern struct {
    residency_standard2dblock_shape: Bool32 = @import("std").mem.zeroes(Bool32),
    residency_standard2dmultisample_block_shape: Bool32 = @import("std").mem.zeroes(Bool32),
    residency_standard3dblock_shape: Bool32 = @import("std").mem.zeroes(Bool32),
    residency_aligned_mip_size: Bool32 = @import("std").mem.zeroes(Bool32),
    residency_non_resident_strict: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceProperties = extern struct {
    api_version: u32 = @import("std").mem.zeroes(u32),
    driver_version: u32 = @import("std").mem.zeroes(u32),
    vendor_id: u32 = @import("std").mem.zeroes(u32),
    device_id: u32 = @import("std").mem.zeroes(u32),
    device_type: PhysicalDeviceType = @import("std").mem.zeroes(PhysicalDeviceType),
    device_name: [256]u8 = @import("std").mem.zeroes([256]u8),
    pipeline_cache_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    limits: PhysicalDeviceLimits = @import("std").mem.zeroes(PhysicalDeviceLimits),
    sparse_properties: PhysicalDeviceSparseProperties = @import("std").mem.zeroes(PhysicalDeviceSparseProperties),
};
pub const QueueFamilyProperties = extern struct {
    queue_flags: QueueFlags = @import("std").mem.zeroes(QueueFlags),
    queue_count: u32 = @import("std").mem.zeroes(u32),
    timestamp_valid_bits: u32 = @import("std").mem.zeroes(u32),
    min_image_transfer_granularity: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const DeviceQueueCreateInfo = extern struct {
    s_type: StructureType = StructureType.device_queue_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DeviceQueueCreateFlags = @import("std").mem.zeroes(DeviceQueueCreateFlags),
    queue_family_index: u32 = @import("std").mem.zeroes(u32),
    queue_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_priorities: [*c]const f32 = @import("std").mem.zeroes([*c]const f32),
};
pub const DeviceCreateInfo = extern struct {
    s_type: StructureType = StructureType.device_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DeviceCreateFlags = @import("std").mem.zeroes(DeviceCreateFlags),
    queue_create_info_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_create_infos: [*c]const DeviceQueueCreateInfo = @import("std").mem.zeroes([*c]const DeviceQueueCreateInfo),
    enabled_layer_count: u32 = @import("std").mem.zeroes(u32),
    pp_enabled_layer_names: [*c]const [*c]const u8 = @import("std").mem.zeroes([*c]const [*c]const u8),
    enabled_extension_count: u32 = @import("std").mem.zeroes(u32),
    pp_enabled_extension_names: [*c]const [*c]const u8 = @import("std").mem.zeroes([*c]const [*c]const u8),
    p_enabled_features: [*c]const PhysicalDeviceFeatures = @import("std").mem.zeroes([*c]const PhysicalDeviceFeatures),
};
pub const ExtensionProperties = extern struct {
    extension_name: [256]u8 = @import("std").mem.zeroes([256]u8),
    spec_version: u32 = @import("std").mem.zeroes(u32),
};
pub const LayerProperties = extern struct {
    layer_name: [256]u8 = @import("std").mem.zeroes([256]u8),
    spec_version: u32 = @import("std").mem.zeroes(u32),
    implementation_version: u32 = @import("std").mem.zeroes(u32),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const SubmitInfo = extern struct {
    s_type: StructureType = StructureType.submit_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    wait_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_wait_semaphores: [*c]const Semaphore = @import("std").mem.zeroes([*c]const Semaphore),
    p_wait_dst_stage_mask: [*c]const PipelineStageFlags = @import("std").mem.zeroes([*c]const PipelineStageFlags),
    command_buffer_count: u32 = @import("std").mem.zeroes(u32),
    p_command_buffers: [*c]const CommandBuffer = @import("std").mem.zeroes([*c]const CommandBuffer),
    signal_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_signal_semaphores: [*c]const Semaphore = @import("std").mem.zeroes([*c]const Semaphore),
};
pub const MappedMemoryRange = extern struct {
    s_type: StructureType = StructureType.mapped_memory_range,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const MemoryAllocateInfo = extern struct {
    s_type: StructureType = StructureType.memory_allocate_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    allocation_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    memory_type_index: u32 = @import("std").mem.zeroes(u32),
};
pub const MemoryRequirements = extern struct {
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    memory_type_bits: u32 = @import("std").mem.zeroes(u32),
};
pub const SparseMemoryBind = extern struct {
    resource_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    memory_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    flags: SparseMemoryBindFlags = @import("std").mem.zeroes(SparseMemoryBindFlags),
};
pub const SparseBufferMemoryBindInfo = extern struct {
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    bind_count: u32 = @import("std").mem.zeroes(u32),
    p_binds: [*c]const SparseMemoryBind = @import("std").mem.zeroes([*c]const SparseMemoryBind),
};
pub const SparseImageOpaqueMemoryBindInfo = extern struct {
    image: Image = @import("std").mem.zeroes(Image),
    bind_count: u32 = @import("std").mem.zeroes(u32),
    p_binds: [*c]const SparseMemoryBind = @import("std").mem.zeroes([*c]const SparseMemoryBind),
};
pub const ImageSubresource = extern struct {
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
    mip_level: u32 = @import("std").mem.zeroes(u32),
    array_layer: u32 = @import("std").mem.zeroes(u32),
};
pub const SparseImageMemoryBind = extern struct {
    subresource: ImageSubresource = @import("std").mem.zeroes(ImageSubresource),
    offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    extent: Extent3D = @import("std").mem.zeroes(Extent3D),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    memory_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    flags: SparseMemoryBindFlags = @import("std").mem.zeroes(SparseMemoryBindFlags),
};
pub const SparseImageMemoryBindInfo = extern struct {
    image: Image = @import("std").mem.zeroes(Image),
    bind_count: u32 = @import("std").mem.zeroes(u32),
    p_binds: [*c]const SparseImageMemoryBind = @import("std").mem.zeroes([*c]const SparseImageMemoryBind),
};
pub const BindSparseInfo = extern struct {
    s_type: StructureType = StructureType.bind_sparse_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    wait_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_wait_semaphores: [*c]const Semaphore = @import("std").mem.zeroes([*c]const Semaphore),
    buffer_bind_count: u32 = @import("std").mem.zeroes(u32),
    p_buffer_binds: [*c]const SparseBufferMemoryBindInfo = @import("std").mem.zeroes([*c]const SparseBufferMemoryBindInfo),
    image_opaque_bind_count: u32 = @import("std").mem.zeroes(u32),
    p_image_opaque_binds: [*c]const SparseImageOpaqueMemoryBindInfo = @import("std").mem.zeroes([*c]const SparseImageOpaqueMemoryBindInfo),
    image_bind_count: u32 = @import("std").mem.zeroes(u32),
    p_image_binds: [*c]const SparseImageMemoryBindInfo = @import("std").mem.zeroes([*c]const SparseImageMemoryBindInfo),
    signal_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_signal_semaphores: [*c]const Semaphore = @import("std").mem.zeroes([*c]const Semaphore),
};
pub const SparseImageFormatProperties = extern struct {
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
    image_granularity: Extent3D = @import("std").mem.zeroes(Extent3D),
    flags: SparseImageFormatFlags = @import("std").mem.zeroes(SparseImageFormatFlags),
};
pub const SparseImageMemoryRequirements = extern struct {
    format_properties: SparseImageFormatProperties = @import("std").mem.zeroes(SparseImageFormatProperties),
    image_mip_tail_first_lod: u32 = @import("std").mem.zeroes(u32),
    image_mip_tail_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    image_mip_tail_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    image_mip_tail_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const FenceCreateInfo = extern struct {
    s_type: StructureType = StructureType.fence_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: FenceCreateFlags = @import("std").mem.zeroes(FenceCreateFlags),
};
pub const SemaphoreCreateInfo = extern struct {
    s_type: StructureType = StructureType.semaphore_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: SemaphoreCreateFlags = @import("std").mem.zeroes(SemaphoreCreateFlags),
};
pub const EventCreateInfo = extern struct {
    s_type: StructureType = StructureType.event_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: EventCreateFlags = @import("std").mem.zeroes(EventCreateFlags),
};
pub const QueryPoolCreateInfo = extern struct {
    s_type: StructureType = StructureType.query_pool_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: QueryPoolCreateFlags = @import("std").mem.zeroes(QueryPoolCreateFlags),
    query_type: QueryType = @import("std").mem.zeroes(QueryType),
    query_count: u32 = @import("std").mem.zeroes(u32),
    pipeline_statistics: QueryPipelineStatisticFlags = @import("std").mem.zeroes(QueryPipelineStatisticFlags),
};
pub const BufferCreateInfo = extern struct {
    s_type: StructureType = StructureType.buffer_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: BufferCreateFlags = @import("std").mem.zeroes(BufferCreateFlags),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    usage: BufferUsageFlags = @import("std").mem.zeroes(BufferUsageFlags),
    sharing_mode: SharingMode = @import("std").mem.zeroes(SharingMode),
    queue_family_index_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_family_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const BufferViewCreateInfo = extern struct {
    s_type: StructureType = StructureType.buffer_view_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: BufferViewCreateFlags = @import("std").mem.zeroes(BufferViewCreateFlags),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    format: Format = @import("std").mem.zeroes(Format),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    range: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const ImageCreateInfo = extern struct {
    s_type: StructureType = StructureType.image_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ImageCreateFlags = @import("std").mem.zeroes(ImageCreateFlags),
    image_type: ImageType = @import("std").mem.zeroes(ImageType),
    format: Format = @import("std").mem.zeroes(Format),
    extent: Extent3D = @import("std").mem.zeroes(Extent3D),
    mip_levels: u32 = @import("std").mem.zeroes(u32),
    array_layers: u32 = @import("std").mem.zeroes(u32),
    samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    tiling: ImageTiling = @import("std").mem.zeroes(ImageTiling),
    usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    sharing_mode: SharingMode = @import("std").mem.zeroes(SharingMode),
    queue_family_index_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_family_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    initial_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const SubresourceLayout = extern struct {
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    row_pitch: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    array_pitch: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    depth_pitch: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const ComponentMapping = extern struct {
    r: ComponentSwizzle = @import("std").mem.zeroes(ComponentSwizzle),
    g: ComponentSwizzle = @import("std").mem.zeroes(ComponentSwizzle),
    b: ComponentSwizzle = @import("std").mem.zeroes(ComponentSwizzle),
    a: ComponentSwizzle = @import("std").mem.zeroes(ComponentSwizzle),
};
pub const ImageViewCreateInfo = extern struct {
    s_type: StructureType = StructureType.image_view_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ImageViewCreateFlags = @import("std").mem.zeroes(ImageViewCreateFlags),
    image: Image = @import("std").mem.zeroes(Image),
    view_type: ImageViewType = @import("std").mem.zeroes(ImageViewType),
    format: Format = @import("std").mem.zeroes(Format),
    components: ComponentMapping = @import("std").mem.zeroes(ComponentMapping),
    subresource_range: ImageSubresourceRange = @import("std").mem.zeroes(ImageSubresourceRange),
};
pub const ShaderModuleCreateInfo = extern struct {
    s_type: StructureType = StructureType.shader_module_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ShaderModuleCreateFlags = @import("std").mem.zeroes(ShaderModuleCreateFlags),
    code_size: usize = @import("std").mem.zeroes(usize),
    p_code: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const PipelineCacheCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_cache_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCacheCreateFlags = @import("std").mem.zeroes(PipelineCacheCreateFlags),
    initial_data_size: usize = @import("std").mem.zeroes(usize),
    p_initial_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const SpecializationMapEntry = extern struct {
    constant_id: u32 = @import("std").mem.zeroes(u32),
    offset: u32 = @import("std").mem.zeroes(u32),
    size: usize = @import("std").mem.zeroes(usize),
};
pub const SpecializationInfo = extern struct {
    map_entry_count: u32 = @import("std").mem.zeroes(u32),
    p_map_entries: [*c]const SpecializationMapEntry = @import("std").mem.zeroes([*c]const SpecializationMapEntry),
    data_size: usize = @import("std").mem.zeroes(usize),
    p_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const PipelineShaderStageCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_shader_stage_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineShaderStageCreateFlags = @import("std").mem.zeroes(PipelineShaderStageCreateFlags),
    stage: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    module: ShaderModule = @import("std").mem.zeroes(ShaderModule),
    p_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    p_specialization_info: [*c]const SpecializationInfo = @import("std").mem.zeroes([*c]const SpecializationInfo),
};
pub const ComputePipelineCreateInfo = extern struct {
    s_type: StructureType = StructureType.compute_pipeline_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCreateFlags = @import("std").mem.zeroes(PipelineCreateFlags),
    stage: PipelineShaderStageCreateInfo = @import("std").mem.zeroes(PipelineShaderStageCreateInfo),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    base_pipeline_handle: Pipeline = @import("std").mem.zeroes(Pipeline),
    base_pipeline_index: i32 = @import("std").mem.zeroes(i32),
};
pub const VertexInputBindingDescription = extern struct {
    binding: u32 = @import("std").mem.zeroes(u32),
    stride: u32 = @import("std").mem.zeroes(u32),
    input_rate: VertexInputRate = @import("std").mem.zeroes(VertexInputRate),
};
pub const VertexInputAttributeDescription = extern struct {
    location: u32 = @import("std").mem.zeroes(u32),
    binding: u32 = @import("std").mem.zeroes(u32),
    format: Format = @import("std").mem.zeroes(Format),
    offset: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineVertexInputStateCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_vertex_input_state_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineVertexInputStateCreateFlags = @import("std").mem.zeroes(PipelineVertexInputStateCreateFlags),
    vertex_binding_description_count: u32 = @import("std").mem.zeroes(u32),
    p_vertex_binding_descriptions: [*c]const VertexInputBindingDescription = @import("std").mem.zeroes([*c]const VertexInputBindingDescription),
    vertex_attribute_description_count: u32 = @import("std").mem.zeroes(u32),
    p_vertex_attribute_descriptions: [*c]const VertexInputAttributeDescription = @import("std").mem.zeroes([*c]const VertexInputAttributeDescription),
};
pub const PipelineInputAssemblyStateCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_input_assembly_state_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineInputAssemblyStateCreateFlags = @import("std").mem.zeroes(PipelineInputAssemblyStateCreateFlags),
    topology: PrimitiveTopology = @import("std").mem.zeroes(PrimitiveTopology),
    primitive_restart_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineTessellationStateCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_tessellation_state_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineTessellationStateCreateFlags = @import("std").mem.zeroes(PipelineTessellationStateCreateFlags),
    patch_control_points: u32 = @import("std").mem.zeroes(u32),
};
pub const Viewport = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
    width: f32 = @import("std").mem.zeroes(f32),
    height: f32 = @import("std").mem.zeroes(f32),
    min_depth: f32 = @import("std").mem.zeroes(f32),
    max_depth: f32 = @import("std").mem.zeroes(f32),
};
pub const PipelineViewportStateCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_viewport_state_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineViewportStateCreateFlags = @import("std").mem.zeroes(PipelineViewportStateCreateFlags),
    viewport_count: u32 = @import("std").mem.zeroes(u32),
    p_viewports: [*c]const Viewport = @import("std").mem.zeroes([*c]const Viewport),
    scissor_count: u32 = @import("std").mem.zeroes(u32),
    p_scissors: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const PipelineRasterizationStateCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_rasterization_state_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineRasterizationStateCreateFlags = @import("std").mem.zeroes(PipelineRasterizationStateCreateFlags),
    depth_clamp_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    rasterizer_discard_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    polygon_mode: PolygonMode = @import("std").mem.zeroes(PolygonMode),
    cull_mode: CullModeFlags = @import("std").mem.zeroes(CullModeFlags),
    front_face: FrontFace = @import("std").mem.zeroes(FrontFace),
    depth_bias_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_bias_constant_factor: f32 = @import("std").mem.zeroes(f32),
    depth_bias_clamp: f32 = @import("std").mem.zeroes(f32),
    depth_bias_slope_factor: f32 = @import("std").mem.zeroes(f32),
    line_width: f32 = @import("std").mem.zeroes(f32),
};
pub const PipelineMultisampleStateCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_multisample_state_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineMultisampleStateCreateFlags = @import("std").mem.zeroes(PipelineMultisampleStateCreateFlags),
    rasterization_samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    sample_shading_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    min_sample_shading: f32 = @import("std").mem.zeroes(f32),
    p_sample_mask: [*c]const SampleMask = @import("std").mem.zeroes([*c]const SampleMask),
    alpha_to_coverage_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    alpha_to_one_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const StencilOpState = extern struct {
    fail_op: StencilOp = @import("std").mem.zeroes(StencilOp),
    pass_op: StencilOp = @import("std").mem.zeroes(StencilOp),
    depth_fail_op: StencilOp = @import("std").mem.zeroes(StencilOp),
    compare_op: CompareOp = @import("std").mem.zeroes(CompareOp),
    compare_mask: u32 = @import("std").mem.zeroes(u32),
    write_mask: u32 = @import("std").mem.zeroes(u32),
    reference: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineDepthStencilStateCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_depth_stencil_state_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineDepthStencilStateCreateFlags = @import("std").mem.zeroes(PipelineDepthStencilStateCreateFlags),
    depth_test_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_write_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_compare_op: CompareOp = @import("std").mem.zeroes(CompareOp),
    depth_bounds_test_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    stencil_test_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    front: StencilOpState = @import("std").mem.zeroes(StencilOpState),
    back: StencilOpState = @import("std").mem.zeroes(StencilOpState),
    min_depth_bounds: f32 = @import("std").mem.zeroes(f32),
    max_depth_bounds: f32 = @import("std").mem.zeroes(f32),
};
pub const PipelineColorBlendAttachmentState = extern struct {
    blend_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    src_color_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    dst_color_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    color_blend_op: BlendOp = @import("std").mem.zeroes(BlendOp),
    src_alpha_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    dst_alpha_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    alpha_blend_op: BlendOp = @import("std").mem.zeroes(BlendOp),
    color_write_mask: ColorComponentFlags = @import("std").mem.zeroes(ColorComponentFlags),
};
pub const PipelineColorBlendStateCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_color_blend_state_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineColorBlendStateCreateFlags = @import("std").mem.zeroes(PipelineColorBlendStateCreateFlags),
    logic_op_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    logic_op: LogicOp = @import("std").mem.zeroes(LogicOp),
    attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_attachments: [*c]const PipelineColorBlendAttachmentState = @import("std").mem.zeroes([*c]const PipelineColorBlendAttachmentState),
    blend_constants: [4]f32 = @import("std").mem.zeroes([4]f32),
};
pub const PipelineDynamicStateCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_dynamic_state_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineDynamicStateCreateFlags = @import("std").mem.zeroes(PipelineDynamicStateCreateFlags),
    dynamic_state_count: u32 = @import("std").mem.zeroes(u32),
    p_dynamic_states: [*c]const DynamicState = @import("std").mem.zeroes([*c]const DynamicState),
};
pub const GraphicsPipelineCreateInfo = extern struct {
    s_type: StructureType = StructureType.graphics_pipeline_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCreateFlags = @import("std").mem.zeroes(PipelineCreateFlags),
    stage_count: u32 = @import("std").mem.zeroes(u32),
    p_stages: [*c]const PipelineShaderStageCreateInfo = @import("std").mem.zeroes([*c]const PipelineShaderStageCreateInfo),
    p_vertex_input_state: [*c]const PipelineVertexInputStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineVertexInputStateCreateInfo),
    p_input_assembly_state: [*c]const PipelineInputAssemblyStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineInputAssemblyStateCreateInfo),
    p_tessellation_state: [*c]const PipelineTessellationStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineTessellationStateCreateInfo),
    p_viewport_state: [*c]const PipelineViewportStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineViewportStateCreateInfo),
    p_rasterization_state: [*c]const PipelineRasterizationStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineRasterizationStateCreateInfo),
    p_multisample_state: [*c]const PipelineMultisampleStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineMultisampleStateCreateInfo),
    p_depth_stencil_state: [*c]const PipelineDepthStencilStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineDepthStencilStateCreateInfo),
    p_color_blend_state: [*c]const PipelineColorBlendStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineColorBlendStateCreateInfo),
    p_dynamic_state: [*c]const PipelineDynamicStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineDynamicStateCreateInfo),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    render_pass: RenderPass = @import("std").mem.zeroes(RenderPass),
    subpass: u32 = @import("std").mem.zeroes(u32),
    base_pipeline_handle: Pipeline = @import("std").mem.zeroes(Pipeline),
    base_pipeline_index: i32 = @import("std").mem.zeroes(i32),
};
pub const PushConstantRange = extern struct {
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    offset: u32 = @import("std").mem.zeroes(u32),
    size: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineLayoutCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_layout_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineLayoutCreateFlags = @import("std").mem.zeroes(PipelineLayoutCreateFlags),
    set_layout_count: u32 = @import("std").mem.zeroes(u32),
    p_set_layouts: [*c]const DescriptorSetLayout = @import("std").mem.zeroes([*c]const DescriptorSetLayout),
    push_constant_range_count: u32 = @import("std").mem.zeroes(u32),
    p_push_constant_ranges: [*c]const PushConstantRange = @import("std").mem.zeroes([*c]const PushConstantRange),
};
pub const SamplerCreateInfo = extern struct {
    s_type: StructureType = StructureType.sampler_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: SamplerCreateFlags = @import("std").mem.zeroes(SamplerCreateFlags),
    mag_filter: Filter = @import("std").mem.zeroes(Filter),
    min_filter: Filter = @import("std").mem.zeroes(Filter),
    mipmap_mode: SamplerMipmapMode = @import("std").mem.zeroes(SamplerMipmapMode),
    address_mode_u: SamplerAddressMode = @import("std").mem.zeroes(SamplerAddressMode),
    address_mode_v: SamplerAddressMode = @import("std").mem.zeroes(SamplerAddressMode),
    address_mode_w: SamplerAddressMode = @import("std").mem.zeroes(SamplerAddressMode),
    mip_lod_bias: f32 = @import("std").mem.zeroes(f32),
    anisotropy_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    max_anisotropy: f32 = @import("std").mem.zeroes(f32),
    compare_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    compare_op: CompareOp = @import("std").mem.zeroes(CompareOp),
    min_lod: f32 = @import("std").mem.zeroes(f32),
    max_lod: f32 = @import("std").mem.zeroes(f32),
    border_color: BorderColor = @import("std").mem.zeroes(BorderColor),
    unnormalized_coordinates: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const CopyDescriptorSet = extern struct {
    s_type: StructureType = StructureType.copy_descriptor_set,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_set: DescriptorSet = @import("std").mem.zeroes(DescriptorSet),
    src_binding: u32 = @import("std").mem.zeroes(u32),
    src_array_element: u32 = @import("std").mem.zeroes(u32),
    dst_set: DescriptorSet = @import("std").mem.zeroes(DescriptorSet),
    dst_binding: u32 = @import("std").mem.zeroes(u32),
    dst_array_element: u32 = @import("std").mem.zeroes(u32),
    descriptor_count: u32 = @import("std").mem.zeroes(u32),
};
pub const DescriptorBufferInfo = extern struct {
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    range: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const DescriptorImageInfo = extern struct {
    sampler: Sampler = @import("std").mem.zeroes(Sampler),
    image_view: ImageView = @import("std").mem.zeroes(ImageView),
    image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const DescriptorPoolSize = extern struct {
    type: DescriptorType = @import("std").mem.zeroes(DescriptorType),
    descriptor_count: u32 = @import("std").mem.zeroes(u32),
};
pub const DescriptorPoolCreateInfo = extern struct {
    s_type: StructureType = StructureType.descriptor_pool_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DescriptorPoolCreateFlags = @import("std").mem.zeroes(DescriptorPoolCreateFlags),
    max_sets: u32 = @import("std").mem.zeroes(u32),
    pool_size_count: u32 = @import("std").mem.zeroes(u32),
    p_pool_sizes: [*c]const DescriptorPoolSize = @import("std").mem.zeroes([*c]const DescriptorPoolSize),
};
pub const DescriptorSetAllocateInfo = extern struct {
    s_type: StructureType = StructureType.descriptor_set_allocate_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    descriptor_pool: DescriptorPool = @import("std").mem.zeroes(DescriptorPool),
    descriptor_set_count: u32 = @import("std").mem.zeroes(u32),
    p_set_layouts: [*c]const DescriptorSetLayout = @import("std").mem.zeroes([*c]const DescriptorSetLayout),
};
pub const DescriptorSetLayoutBinding = extern struct {
    binding: u32 = @import("std").mem.zeroes(u32),
    descriptor_type: DescriptorType = @import("std").mem.zeroes(DescriptorType),
    descriptor_count: u32 = @import("std").mem.zeroes(u32),
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    p_immutable_samplers: [*c]const Sampler = @import("std").mem.zeroes([*c]const Sampler),
};
pub const DescriptorSetLayoutCreateInfo = extern struct {
    s_type: StructureType = StructureType.descriptor_set_layout_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DescriptorSetLayoutCreateFlags = @import("std").mem.zeroes(DescriptorSetLayoutCreateFlags),
    binding_count: u32 = @import("std").mem.zeroes(u32),
    p_bindings: [*c]const DescriptorSetLayoutBinding = @import("std").mem.zeroes([*c]const DescriptorSetLayoutBinding),
};
pub const WriteDescriptorSet = extern struct {
    s_type: StructureType = StructureType.write_descriptor_set,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    dst_set: DescriptorSet = @import("std").mem.zeroes(DescriptorSet),
    dst_binding: u32 = @import("std").mem.zeroes(u32),
    dst_array_element: u32 = @import("std").mem.zeroes(u32),
    descriptor_count: u32 = @import("std").mem.zeroes(u32),
    descriptor_type: DescriptorType = @import("std").mem.zeroes(DescriptorType),
    p_image_info: [*c]const DescriptorImageInfo = @import("std").mem.zeroes([*c]const DescriptorImageInfo),
    p_buffer_info: [*c]const DescriptorBufferInfo = @import("std").mem.zeroes([*c]const DescriptorBufferInfo),
    p_texel_buffer_view: [*c]const BufferView = @import("std").mem.zeroes([*c]const BufferView),
};
pub const AttachmentDescription = extern struct {
    flags: AttachmentDescriptionFlags = @import("std").mem.zeroes(AttachmentDescriptionFlags),
    format: Format = @import("std").mem.zeroes(Format),
    samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    load_op: AttachmentLoadOp = @import("std").mem.zeroes(AttachmentLoadOp),
    store_op: AttachmentStoreOp = @import("std").mem.zeroes(AttachmentStoreOp),
    stencil_load_op: AttachmentLoadOp = @import("std").mem.zeroes(AttachmentLoadOp),
    stencil_store_op: AttachmentStoreOp = @import("std").mem.zeroes(AttachmentStoreOp),
    initial_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    final_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const AttachmentReference = extern struct {
    attachment: u32 = @import("std").mem.zeroes(u32),
    layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const FramebufferCreateInfo = extern struct {
    s_type: StructureType = StructureType.framebuffer_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: FramebufferCreateFlags = @import("std").mem.zeroes(FramebufferCreateFlags),
    render_pass: RenderPass = @import("std").mem.zeroes(RenderPass),
    attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_attachments: [*c]const ImageView = @import("std").mem.zeroes([*c]const ImageView),
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
    layers: u32 = @import("std").mem.zeroes(u32),
};
pub const SubpassDescription = extern struct {
    flags: SubpassDescriptionFlags = @import("std").mem.zeroes(SubpassDescriptionFlags),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    input_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_input_attachments: [*c]const AttachmentReference = @import("std").mem.zeroes([*c]const AttachmentReference),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachments: [*c]const AttachmentReference = @import("std").mem.zeroes([*c]const AttachmentReference),
    p_resolve_attachments: [*c]const AttachmentReference = @import("std").mem.zeroes([*c]const AttachmentReference),
    p_depth_stencil_attachment: [*c]const AttachmentReference = @import("std").mem.zeroes([*c]const AttachmentReference),
    preserve_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_preserve_attachments: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const SubpassDependency = extern struct {
    src_subpass: u32 = @import("std").mem.zeroes(u32),
    dst_subpass: u32 = @import("std").mem.zeroes(u32),
    src_stage_mask: PipelineStageFlags = @import("std").mem.zeroes(PipelineStageFlags),
    dst_stage_mask: PipelineStageFlags = @import("std").mem.zeroes(PipelineStageFlags),
    src_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dst_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dependency_flags: DependencyFlags = @import("std").mem.zeroes(DependencyFlags),
};
pub const RenderPassCreateInfo = extern struct {
    s_type: StructureType = StructureType.render_pass_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: RenderPassCreateFlags = @import("std").mem.zeroes(RenderPassCreateFlags),
    attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_attachments: [*c]const AttachmentDescription = @import("std").mem.zeroes([*c]const AttachmentDescription),
    subpass_count: u32 = @import("std").mem.zeroes(u32),
    p_subpasses: [*c]const SubpassDescription = @import("std").mem.zeroes([*c]const SubpassDescription),
    dependency_count: u32 = @import("std").mem.zeroes(u32),
    p_dependencies: [*c]const SubpassDependency = @import("std").mem.zeroes([*c]const SubpassDependency),
};
pub const CommandPoolCreateInfo = extern struct {
    s_type: StructureType = StructureType.command_pool_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: CommandPoolCreateFlags = @import("std").mem.zeroes(CommandPoolCreateFlags),
    queue_family_index: u32 = @import("std").mem.zeroes(u32),
};
pub const CommandBufferAllocateInfo = extern struct {
    s_type: StructureType = StructureType.command_buffer_allocate_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    command_pool: CommandPool = @import("std").mem.zeroes(CommandPool),
    level: CommandBufferLevel = @import("std").mem.zeroes(CommandBufferLevel),
    command_buffer_count: u32 = @import("std").mem.zeroes(u32),
};
pub const CommandBufferInheritanceInfo = extern struct {
    s_type: StructureType = StructureType.command_buffer_inheritance_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    render_pass: RenderPass = @import("std").mem.zeroes(RenderPass),
    subpass: u32 = @import("std").mem.zeroes(u32),
    framebuffer: Framebuffer = @import("std").mem.zeroes(Framebuffer),
    occlusion_query_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    query_flags: QueryControlFlags = @import("std").mem.zeroes(QueryControlFlags),
    pipeline_statistics: QueryPipelineStatisticFlags = @import("std").mem.zeroes(QueryPipelineStatisticFlags),
};
pub const CommandBufferBeginInfo = extern struct {
    s_type: StructureType = StructureType.command_buffer_begin_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: CommandBufferUsageFlags = @import("std").mem.zeroes(CommandBufferUsageFlags),
    p_inheritance_info: [*c]const CommandBufferInheritanceInfo = @import("std").mem.zeroes([*c]const CommandBufferInheritanceInfo),
};
pub const BufferCopy = extern struct {
    src_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    dst_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const ImageSubresourceLayers = extern struct {
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
    mip_level: u32 = @import("std").mem.zeroes(u32),
    base_array_layer: u32 = @import("std").mem.zeroes(u32),
    layer_count: u32 = @import("std").mem.zeroes(u32),
};
pub const BufferImageCopy = extern struct {
    buffer_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    buffer_row_length: u32 = @import("std").mem.zeroes(u32),
    buffer_image_height: u32 = @import("std").mem.zeroes(u32),
    image_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    image_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    image_extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const ClearColorValue = extern union {
    float32: [4]f32,
    int32: [4]i32,
    uint32: [4]u32,
};
pub const ClearDepthStencilValue = extern struct {
    depth: f32 = @import("std").mem.zeroes(f32),
    stencil: u32 = @import("std").mem.zeroes(u32),
};
pub const ClearValue = extern union {
    color: ClearColorValue,
    depth_stencil: ClearDepthStencilValue,
};
pub const ClearAttachment = extern struct {
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
    color_attachment: u32 = @import("std").mem.zeroes(u32),
    clear_value: ClearValue = @import("std").mem.zeroes(ClearValue),
};
pub const ClearRect = extern struct {
    rect: Rect2D = @import("std").mem.zeroes(Rect2D),
    base_array_layer: u32 = @import("std").mem.zeroes(u32),
    layer_count: u32 = @import("std").mem.zeroes(u32),
};
pub const ImageBlit = extern struct {
    src_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    src_offsets: [2]Offset3D = @import("std").mem.zeroes([2]Offset3D),
    dst_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    dst_offsets: [2]Offset3D = @import("std").mem.zeroes([2]Offset3D),
};
pub const ImageCopy = extern struct {
    src_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    src_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    dst_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    dst_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const ImageResolve = extern struct {
    src_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    src_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    dst_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    dst_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const RenderPassBeginInfo = extern struct {
    s_type: StructureType = StructureType.render_pass_begin_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    render_pass: RenderPass = @import("std").mem.zeroes(RenderPass),
    framebuffer: Framebuffer = @import("std").mem.zeroes(Framebuffer),
    render_area: Rect2D = @import("std").mem.zeroes(Rect2D),
    clear_value_count: u32 = @import("std").mem.zeroes(u32),
    p_clear_values: [*c]const ClearValue = @import("std").mem.zeroes([*c]const ClearValue),
};
pub const PFN_createInstance = ?*const fn ([*c]const InstanceCreateInfo, [*c]const AllocationCallbacks, [*c]Instance) callconv(.c) Result;
pub const PFN_destroyInstance = ?*const fn (Instance, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_enumeratePhysicalDevices = ?*const fn (Instance, [*c]u32, [*c]PhysicalDevice) callconv(.c) Result;
pub const PFN_getPhysicalDeviceFeatures = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceFeatures) callconv(.c) void;
pub const PFN_getPhysicalDeviceFormatProperties = ?*const fn (PhysicalDevice, Format, [*c]FormatProperties) callconv(.c) void;
pub const PFN_getPhysicalDeviceImageFormatProperties = ?*const fn (PhysicalDevice, Format, ImageType, ImageTiling, ImageUsageFlags, ImageCreateFlags, [*c]ImageFormatProperties) callconv(.c) Result;
pub const PFN_getPhysicalDeviceProperties = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceProperties) callconv(.c) void;
pub const PFN_getPhysicalDeviceQueueFamilyProperties = ?*const fn (PhysicalDevice, [*c]u32, [*c]QueueFamilyProperties) callconv(.c) void;
pub const PFN_getPhysicalDeviceMemoryProperties = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceMemoryProperties) callconv(.c) void;
pub const PFN_getInstanceProcAddr = ?*const fn (Instance, [*c]const u8) callconv(.c) PFN_voidFunction;
pub const PFN_getDeviceProcAddr = ?*const fn (Device, [*c]const u8) callconv(.c) PFN_voidFunction;
pub const PFN_createDevice = ?*const fn (PhysicalDevice, [*c]const DeviceCreateInfo, [*c]const AllocationCallbacks, [*c]Device) callconv(.c) Result;
pub const PFN_destroyDevice = ?*const fn (Device, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_enumerateInstanceExtensionProperties = ?*const fn ([*c]const u8, [*c]u32, [*c]ExtensionProperties) callconv(.c) Result;
pub const PFN_enumerateDeviceExtensionProperties = ?*const fn (PhysicalDevice, [*c]const u8, [*c]u32, [*c]ExtensionProperties) callconv(.c) Result;
pub const PFN_enumerateInstanceLayerProperties = ?*const fn ([*c]u32, [*c]LayerProperties) callconv(.c) Result;
pub const PFN_enumerateDeviceLayerProperties = ?*const fn (PhysicalDevice, [*c]u32, [*c]LayerProperties) callconv(.c) Result;
pub const PFN_getDeviceQueue = ?*const fn (Device, u32, u32, [*c]Queue) callconv(.c) void;
pub const PFN_queueSubmit = ?*const fn (Queue, u32, [*c]const SubmitInfo, Fence) callconv(.c) Result;
pub const PFN_queueWaitIdle = ?*const fn (Queue) callconv(.c) Result;
pub const PFN_deviceWaitIdle = ?*const fn (Device) callconv(.c) Result;
pub const PFN_allocateMemory = ?*const fn (Device, [*c]const MemoryAllocateInfo, [*c]const AllocationCallbacks, [*c]DeviceMemory) callconv(.c) Result;
pub const PFN_freeMemory = ?*const fn (Device, DeviceMemory, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_mapMemory = ?*const fn (Device, DeviceMemory, DeviceSize, DeviceSize, MemoryMapFlags, [*c]?*anyopaque) callconv(.c) Result;
pub const PFN_unmapMemory = ?*const fn (Device, DeviceMemory) callconv(.c) void;
pub const PFN_flushMappedMemoryRanges = ?*const fn (Device, u32, [*c]const MappedMemoryRange) callconv(.c) Result;
pub const PFN_invalidateMappedMemoryRanges = ?*const fn (Device, u32, [*c]const MappedMemoryRange) callconv(.c) Result;
pub const PFN_getDeviceMemoryCommitment = ?*const fn (Device, DeviceMemory, [*c]DeviceSize) callconv(.c) void;
pub const PFN_bindBufferMemory = ?*const fn (Device, Buffer, DeviceMemory, DeviceSize) callconv(.c) Result;
pub const PFN_bindImageMemory = ?*const fn (Device, Image, DeviceMemory, DeviceSize) callconv(.c) Result;
pub const PFN_getBufferMemoryRequirements = ?*const fn (Device, Buffer, [*c]MemoryRequirements) callconv(.c) void;
pub const PFN_getImageMemoryRequirements = ?*const fn (Device, Image, [*c]MemoryRequirements) callconv(.c) void;
pub const PFN_getImageSparseMemoryRequirements = ?*const fn (Device, Image, [*c]u32, [*c]SparseImageMemoryRequirements) callconv(.c) void;
pub const PFN_getPhysicalDeviceSparseImageFormatProperties = ?*const fn (PhysicalDevice, Format, ImageType, SampleCountFlags, ImageUsageFlags, ImageTiling, [*c]u32, [*c]SparseImageFormatProperties) callconv(.c) void;
pub const PFN_queueBindSparse = ?*const fn (Queue, u32, [*c]const BindSparseInfo, Fence) callconv(.c) Result;
pub const PFN_createFence = ?*const fn (Device, [*c]const FenceCreateInfo, [*c]const AllocationCallbacks, [*c]Fence) callconv(.c) Result;
pub const PFN_destroyFence = ?*const fn (Device, Fence, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_resetFences = ?*const fn (Device, u32, [*c]const Fence) callconv(.c) Result;
pub const PFN_getFenceStatus = ?*const fn (Device, Fence) callconv(.c) Result;
pub const PFN_waitForFences = ?*const fn (Device, u32, [*c]const Fence, Bool32, u64) callconv(.c) Result;
pub const PFN_createSemaphore = ?*const fn (Device, [*c]const SemaphoreCreateInfo, [*c]const AllocationCallbacks, [*c]Semaphore) callconv(.c) Result;
pub const PFN_destroySemaphore = ?*const fn (Device, Semaphore, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createEvent = ?*const fn (Device, [*c]const EventCreateInfo, [*c]const AllocationCallbacks, [*c]Event) callconv(.c) Result;
pub const PFN_destroyEvent = ?*const fn (Device, Event, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getEventStatus = ?*const fn (Device, Event) callconv(.c) Result;
pub const PFN_setEvent = ?*const fn (Device, Event) callconv(.c) Result;
pub const PFN_resetEvent = ?*const fn (Device, Event) callconv(.c) Result;
pub const PFN_createQueryPool = ?*const fn (Device, [*c]const QueryPoolCreateInfo, [*c]const AllocationCallbacks, [*c]QueryPool) callconv(.c) Result;
pub const PFN_destroyQueryPool = ?*const fn (Device, QueryPool, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getQueryPoolResults = ?*const fn (Device, QueryPool, u32, u32, usize, ?*anyopaque, DeviceSize, QueryResultFlags) callconv(.c) Result;
pub const PFN_createBuffer = ?*const fn (Device, [*c]const BufferCreateInfo, [*c]const AllocationCallbacks, [*c]Buffer) callconv(.c) Result;
pub const PFN_destroyBuffer = ?*const fn (Device, Buffer, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createBufferView = ?*const fn (Device, [*c]const BufferViewCreateInfo, [*c]const AllocationCallbacks, [*c]BufferView) callconv(.c) Result;
pub const PFN_destroyBufferView = ?*const fn (Device, BufferView, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createImage = ?*const fn (Device, [*c]const ImageCreateInfo, [*c]const AllocationCallbacks, [*c]Image) callconv(.c) Result;
pub const PFN_destroyImage = ?*const fn (Device, Image, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getImageSubresourceLayout = ?*const fn (Device, Image, [*c]const ImageSubresource, [*c]SubresourceLayout) callconv(.c) void;
pub const PFN_createImageView = ?*const fn (Device, [*c]const ImageViewCreateInfo, [*c]const AllocationCallbacks, [*c]ImageView) callconv(.c) Result;
pub const PFN_destroyImageView = ?*const fn (Device, ImageView, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createShaderModule = ?*const fn (Device, [*c]const ShaderModuleCreateInfo, [*c]const AllocationCallbacks, [*c]ShaderModule) callconv(.c) Result;
pub const PFN_destroyShaderModule = ?*const fn (Device, ShaderModule, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createPipelineCache = ?*const fn (Device, [*c]const PipelineCacheCreateInfo, [*c]const AllocationCallbacks, [*c]PipelineCache) callconv(.c) Result;
pub const PFN_destroyPipelineCache = ?*const fn (Device, PipelineCache, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getPipelineCacheData = ?*const fn (Device, PipelineCache, [*c]usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_mergePipelineCaches = ?*const fn (Device, PipelineCache, u32, [*c]const PipelineCache) callconv(.c) Result;
pub const PFN_createGraphicsPipelines = ?*const fn (Device, PipelineCache, u32, [*c]const GraphicsPipelineCreateInfo, [*c]const AllocationCallbacks, [*c]Pipeline) callconv(.c) Result;
pub const PFN_createComputePipelines = ?*const fn (Device, PipelineCache, u32, [*c]const ComputePipelineCreateInfo, [*c]const AllocationCallbacks, [*c]Pipeline) callconv(.c) Result;
pub const PFN_destroyPipeline = ?*const fn (Device, Pipeline, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createPipelineLayout = ?*const fn (Device, [*c]const PipelineLayoutCreateInfo, [*c]const AllocationCallbacks, [*c]PipelineLayout) callconv(.c) Result;
pub const PFN_destroyPipelineLayout = ?*const fn (Device, PipelineLayout, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createSampler = ?*const fn (Device, [*c]const SamplerCreateInfo, [*c]const AllocationCallbacks, [*c]Sampler) callconv(.c) Result;
pub const PFN_destroySampler = ?*const fn (Device, Sampler, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createDescriptorSetLayout = ?*const fn (Device, [*c]const DescriptorSetLayoutCreateInfo, [*c]const AllocationCallbacks, [*c]DescriptorSetLayout) callconv(.c) Result;
pub const PFN_destroyDescriptorSetLayout = ?*const fn (Device, DescriptorSetLayout, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createDescriptorPool = ?*const fn (Device, [*c]const DescriptorPoolCreateInfo, [*c]const AllocationCallbacks, [*c]DescriptorPool) callconv(.c) Result;
pub const PFN_destroyDescriptorPool = ?*const fn (Device, DescriptorPool, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_resetDescriptorPool = ?*const fn (Device, DescriptorPool, DescriptorPoolResetFlags) callconv(.c) Result;
pub const PFN_allocateDescriptorSets = ?*const fn (Device, [*c]const DescriptorSetAllocateInfo, [*c]DescriptorSet) callconv(.c) Result;
pub const PFN_freeDescriptorSets = ?*const fn (Device, DescriptorPool, u32, [*c]const DescriptorSet) callconv(.c) Result;
pub const PFN_updateDescriptorSets = ?*const fn (Device, u32, [*c]const WriteDescriptorSet, u32, [*c]const CopyDescriptorSet) callconv(.c) void;
pub const PFN_createFramebuffer = ?*const fn (Device, [*c]const FramebufferCreateInfo, [*c]const AllocationCallbacks, [*c]Framebuffer) callconv(.c) Result;
pub const PFN_destroyFramebuffer = ?*const fn (Device, Framebuffer, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createRenderPass = ?*const fn (Device, [*c]const RenderPassCreateInfo, [*c]const AllocationCallbacks, [*c]RenderPass) callconv(.c) Result;
pub const PFN_destroyRenderPass = ?*const fn (Device, RenderPass, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getRenderAreaGranularity = ?*const fn (Device, RenderPass, [*c]Extent2D) callconv(.c) void;
pub const PFN_createCommandPool = ?*const fn (Device, [*c]const CommandPoolCreateInfo, [*c]const AllocationCallbacks, [*c]CommandPool) callconv(.c) Result;
pub const PFN_destroyCommandPool = ?*const fn (Device, CommandPool, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_resetCommandPool = ?*const fn (Device, CommandPool, CommandPoolResetFlags) callconv(.c) Result;
pub const PFN_allocateCommandBuffers = ?*const fn (Device, [*c]const CommandBufferAllocateInfo, [*c]CommandBuffer) callconv(.c) Result;
pub const PFN_freeCommandBuffers = ?*const fn (Device, CommandPool, u32, [*c]const CommandBuffer) callconv(.c) void;
pub const PFN_beginCommandBuffer = ?*const fn (CommandBuffer, [*c]const CommandBufferBeginInfo) callconv(.c) Result;
pub const PFN_endCommandBuffer = ?*const fn (CommandBuffer) callconv(.c) Result;
pub const PFN_resetCommandBuffer = ?*const fn (CommandBuffer, CommandBufferResetFlags) callconv(.c) Result;
pub const PFN_cmdBindPipeline = ?*const fn (CommandBuffer, PipelineBindPoint, Pipeline) callconv(.c) void;
pub const PFN_cmdSetViewport = ?*const fn (CommandBuffer, u32, u32, [*c]const Viewport) callconv(.c) void;
pub const PFN_cmdSetScissor = ?*const fn (CommandBuffer, u32, u32, [*c]const Rect2D) callconv(.c) void;
pub const PFN_cmdSetLineWidth = ?*const fn (CommandBuffer, f32) callconv(.c) void;
pub const PFN_cmdSetDepthBias = ?*const fn (CommandBuffer, f32, f32, f32) callconv(.c) void;
pub const PFN_cmdSetBlendConstants = ?*const fn (CommandBuffer, [*c]const f32) callconv(.c) void;
pub const PFN_cmdSetDepthBounds = ?*const fn (CommandBuffer, f32, f32) callconv(.c) void;
pub const PFN_cmdSetStencilCompareMask = ?*const fn (CommandBuffer, StencilFaceFlags, u32) callconv(.c) void;
pub const PFN_cmdSetStencilWriteMask = ?*const fn (CommandBuffer, StencilFaceFlags, u32) callconv(.c) void;
pub const PFN_cmdSetStencilReference = ?*const fn (CommandBuffer, StencilFaceFlags, u32) callconv(.c) void;
pub const PFN_cmdBindDescriptorSets = ?*const fn (CommandBuffer, PipelineBindPoint, PipelineLayout, u32, u32, [*c]const DescriptorSet, u32, [*c]const u32) callconv(.c) void;
pub const PFN_cmdBindIndexBuffer = ?*const fn (CommandBuffer, Buffer, DeviceSize, IndexType) callconv(.c) void;
pub const PFN_cmdBindVertexBuffers = ?*const fn (CommandBuffer, u32, u32, [*c]const Buffer, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdDraw = ?*const fn (CommandBuffer, u32, u32, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndexed = ?*const fn (CommandBuffer, u32, u32, u32, i32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndirect = ?*const fn (CommandBuffer, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndexedIndirect = ?*const fn (CommandBuffer, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDispatch = ?*const fn (CommandBuffer, u32, u32, u32) callconv(.c) void;
pub const PFN_cmdDispatchIndirect = ?*const fn (CommandBuffer, Buffer, DeviceSize) callconv(.c) void;
pub const PFN_cmdCopyBuffer = ?*const fn (CommandBuffer, Buffer, Buffer, u32, [*c]const BufferCopy) callconv(.c) void;
pub const PFN_cmdCopyImage = ?*const fn (CommandBuffer, Image, ImageLayout, Image, ImageLayout, u32, [*c]const ImageCopy) callconv(.c) void;
pub const PFN_cmdBlitImage = ?*const fn (CommandBuffer, Image, ImageLayout, Image, ImageLayout, u32, [*c]const ImageBlit, Filter) callconv(.c) void;
pub const PFN_cmdCopyBufferToImage = ?*const fn (CommandBuffer, Buffer, Image, ImageLayout, u32, [*c]const BufferImageCopy) callconv(.c) void;
pub const PFN_cmdCopyImageToBuffer = ?*const fn (CommandBuffer, Image, ImageLayout, Buffer, u32, [*c]const BufferImageCopy) callconv(.c) void;
pub const PFN_cmdUpdateBuffer = ?*const fn (CommandBuffer, Buffer, DeviceSize, DeviceSize, ?*const anyopaque) callconv(.c) void;
pub const PFN_cmdFillBuffer = ?*const fn (CommandBuffer, Buffer, DeviceSize, DeviceSize, u32) callconv(.c) void;
pub const PFN_cmdClearColorImage = ?*const fn (CommandBuffer, Image, ImageLayout, [*c]const ClearColorValue, u32, [*c]const ImageSubresourceRange) callconv(.c) void;
pub const PFN_cmdClearDepthStencilImage = ?*const fn (CommandBuffer, Image, ImageLayout, [*c]const ClearDepthStencilValue, u32, [*c]const ImageSubresourceRange) callconv(.c) void;
pub const PFN_cmdClearAttachments = ?*const fn (CommandBuffer, u32, [*c]const ClearAttachment, u32, [*c]const ClearRect) callconv(.c) void;
pub const PFN_cmdResolveImage = ?*const fn (CommandBuffer, Image, ImageLayout, Image, ImageLayout, u32, [*c]const ImageResolve) callconv(.c) void;
pub const PFN_cmdSetEvent = ?*const fn (CommandBuffer, Event, PipelineStageFlags) callconv(.c) void;
pub const PFN_cmdResetEvent = ?*const fn (CommandBuffer, Event, PipelineStageFlags) callconv(.c) void;
pub const PFN_cmdWaitEvents = ?*const fn (CommandBuffer, u32, [*c]const Event, PipelineStageFlags, PipelineStageFlags, u32, [*c]const MemoryBarrier, u32, [*c]const BufferMemoryBarrier, u32, [*c]const ImageMemoryBarrier) callconv(.c) void;
pub const PFN_cmdPipelineBarrier = ?*const fn (CommandBuffer, PipelineStageFlags, PipelineStageFlags, DependencyFlags, u32, [*c]const MemoryBarrier, u32, [*c]const BufferMemoryBarrier, u32, [*c]const ImageMemoryBarrier) callconv(.c) void;
pub const PFN_cmdBeginQuery = ?*const fn (CommandBuffer, QueryPool, u32, QueryControlFlags) callconv(.c) void;
pub const PFN_cmdEndQuery = ?*const fn (CommandBuffer, QueryPool, u32) callconv(.c) void;
pub const PFN_cmdResetQueryPool = ?*const fn (CommandBuffer, QueryPool, u32, u32) callconv(.c) void;
pub const PFN_cmdWriteTimestamp = ?*const fn (CommandBuffer, PipelineStageFlags, QueryPool, u32) callconv(.c) void;
pub const PFN_cmdCopyQueryPoolResults = ?*const fn (CommandBuffer, QueryPool, u32, u32, Buffer, DeviceSize, DeviceSize, QueryResultFlags) callconv(.c) void;
pub const PFN_cmdPushConstants = ?*const fn (CommandBuffer, PipelineLayout, ShaderStageFlags, u32, u32, ?*const anyopaque) callconv(.c) void;
pub const PFN_cmdBeginRenderPass = ?*const fn (CommandBuffer, [*c]const RenderPassBeginInfo, SubpassContents) callconv(.c) void;
pub const PFN_cmdNextSubpass = ?*const fn (CommandBuffer, SubpassContents) callconv(.c) void;
pub const PFN_cmdEndRenderPass = ?*const fn (CommandBuffer) callconv(.c) void;
pub const PFN_cmdExecuteCommands = ?*const fn (CommandBuffer, u32, [*c]const CommandBuffer) callconv(.c) void;
pub extern fn vkCreateInstance(p_create_info: [*c]const InstanceCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_instance: [*c]Instance) Result;
pub inline fn createInstance(p_create_info: [*c]const InstanceCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_instance: [*c]Instance) Result {
    return vkCreateInstance(p_create_info, p_allocator, p_instance);
}
pub extern fn vkDestroyInstance(instance: Instance, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyInstance(instance: Instance, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyInstance(instance, p_allocator);
}
pub extern fn vkEnumeratePhysicalDevices(instance: Instance, p_physical_device_count: [*c]u32, p_physical_devices: [*c]PhysicalDevice) Result;
pub inline fn enumeratePhysicalDevices(instance: Instance, p_physical_device_count: [*c]u32, p_physical_devices: [*c]PhysicalDevice) Result {
    return vkEnumeratePhysicalDevices(instance, p_physical_device_count, p_physical_devices);
}
pub extern fn vkGetPhysicalDeviceFeatures(physical_device: PhysicalDevice, p_features: [*c]PhysicalDeviceFeatures) void;
pub inline fn getPhysicalDeviceFeatures(physical_device: PhysicalDevice, p_features: [*c]PhysicalDeviceFeatures) void {
    return vkGetPhysicalDeviceFeatures(physical_device, p_features);
}
pub extern fn vkGetPhysicalDeviceFormatProperties(physical_device: PhysicalDevice, format: Format, p_format_properties: [*c]FormatProperties) void;
pub inline fn getPhysicalDeviceFormatProperties(physical_device: PhysicalDevice, format: Format, p_format_properties: [*c]FormatProperties) void {
    return vkGetPhysicalDeviceFormatProperties(physical_device, format, p_format_properties);
}
pub extern fn vkGetPhysicalDeviceImageFormatProperties(physical_device: PhysicalDevice, format: Format, @"type": ImageType, tiling: ImageTiling, usage: ImageUsageFlags, flags: ImageCreateFlags, p_image_format_properties: [*c]ImageFormatProperties) Result;
pub inline fn getPhysicalDeviceImageFormatProperties(physical_device: PhysicalDevice, format: Format, @"type": ImageType, tiling: ImageTiling, usage: ImageUsageFlags, flags: ImageCreateFlags, p_image_format_properties: [*c]ImageFormatProperties) Result {
    return getPhysicalDeviceImageFormatProperties(physical_device, format, @"type", tiling, usage, flags, p_image_format_properties);
}
pub extern fn vkGetPhysicalDeviceProperties(physical_device: PhysicalDevice, p_properties: [*c]PhysicalDeviceProperties) void;
pub inline fn getPhysicalDeviceProperties(physical_device: PhysicalDevice, p_properties: [*c]PhysicalDeviceProperties) void {
    return vkGetPhysicalDeviceProperties(physical_device, p_properties);
}

pub extern fn vkGetPhysicalDeviceQueueFamilyProperties(physical_device: PhysicalDevice, p_queue_family_property_count: [*c]u32, p_queue_family_properties: [*c]QueueFamilyProperties) void;
pub inline fn getPhysicalDeviceQueueFamilyProperties(physical_device: PhysicalDevice, p_queue_family_property_count: [*c]u32, p_queue_family_properties: [*c]QueueFamilyProperties) void {
    return vkGetPhysicalDeviceQueueFamilyProperties(physical_device, p_queue_family_property_count, p_queue_family_properties);
}
pub extern fn vkGetPhysicalDeviceMemoryProperties(physical_device: PhysicalDevice, p_memory_properties: [*c]PhysicalDeviceMemoryProperties) void;
pub inline fn getPhysicalDeviceMemoryProperties(physical_device: PhysicalDevice, p_memory_properties: [*c]PhysicalDeviceMemoryProperties) void {
    return vkGetPhysicalDeviceMemoryProperties(physical_device, p_memory_properties);
}
pub extern fn vkGetInstanceProcAddr(instance: Instance, p_name: [*c]const u8) PFN_voidFunction;
pub inline fn getInstanceProcAddr(instance: Instance, p_name: [*c]const u8) PFN_voidFunction {
    return vkGetInstanceProcAddr(instance, p_name);
}
pub extern fn vkGetDeviceProcAddr(device: Device, p_name: [*c]const u8) PFN_voidFunction;
pub inline fn getDeviceProcAddr(device: Device, p_name: [*c]const u8) PFN_voidFunction {
    return getDeviceProcAddr(device, p_name);
}
pub extern fn vkCreateDevice(physical_device: PhysicalDevice, p_create_info: [*c]const DeviceCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_device: [*c]Device) Result;
pub inline fn createDevice(physical_device: PhysicalDevice, p_create_info: [*c]const DeviceCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_device: [*c]Device) Result {
    return vkCreateDevice(physical_device, p_create_info, p_allocator, p_device);
}
pub extern fn vkDestroyDevice(device: Device, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyDevice(device: Device, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyDevice(device, p_allocator);
}
pub extern fn vkEnumerateInstanceExtensionProperties(p_layer_name: [*c]const u8, p_property_count: [*c]u32, p_properties: [*c]ExtensionProperties) Result;
pub inline fn enumerateInstanceExtensionProperties(p_layer_name: [*c]const u8, p_property_count: [*c]u32, p_properties: [*c]ExtensionProperties) Result {
    return vkEnumerateInstanceExtensionProperties(p_layer_name, p_property_count, p_properties);
}
pub extern fn vkEnumerateDeviceExtensionProperties(physical_device: PhysicalDevice, p_layer_name: [*c]const u8, p_property_count: [*c]u32, p_properties: [*c]ExtensionProperties) Result;
pub inline fn enumerateDeviceExtensionProperties(physical_device: PhysicalDevice, p_layer_name: [*c]const u8, p_property_count: [*c]u32, p_properties: [*c]ExtensionProperties) Result {
    return vkEnumerateDeviceExtensionProperties(physical_device, p_layer_name, p_property_count, p_properties);
}
pub extern fn vkEnumerateInstanceLayerProperties(p_property_count: [*c]u32, p_properties: [*c]LayerProperties) Result;
pub inline fn enumerateInstanceLayerProperties(p_property_count: [*c]u32, p_properties: [*c]LayerProperties) Result {
    return vkEnumerateInstanceLayerProperties(p_property_count, p_properties);
}
pub extern fn vkEnumerateDeviceLayerProperties(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]LayerProperties) Result;
pub inline fn enumerateDeviceLayerProperties(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]LayerProperties) Result {
    return vkEnumerateDeviceLayerProperties(physical_device, p_property_count, p_properties);
}
pub extern fn vkGetDeviceQueue(device: Device, queue_family_index: u32, queue_index: u32, p_queue: [*c]Queue) void;
pub inline fn getDeviceQueue(device: Device, queue_family_index: u32, queue_index: u32, p_queue: [*c]Queue) void {
    return vkGetDeviceQueue(device, queue_family_index, queue_index, p_queue);
}
pub extern fn vkQueueSubmit(queue: Queue, submit_count: u32, p_submits: [*c]const SubmitInfo, fence: Fence) Result;
pub inline fn queueSubmit(queue: Queue, submit_count: u32, p_submits: [*c]const SubmitInfo, fence: Fence) Result {
    return vkQueueSubmit(queue, submit_count, p_submits, fence);
}
pub extern fn vkQueueWaitIdle(queue: Queue) Result;
pub inline fn queueWaitIdle(queue: Queue) Result {
    return vkQueueWaitIdle(queue);
}
pub extern fn vkDeviceWaitIdle(device: Device) Result;
pub inline fn deviceWaitIdle(device: Device) Result {
    return vkDeviceWaitIdle(device);
}
pub extern fn vkAllocateMemory(device: Device, p_allocate_info: [*c]const MemoryAllocateInfo, p_allocator: [*c]const AllocationCallbacks, p_memory: [*c]DeviceMemory) Result;
pub inline fn allocateMemory(device: Device, p_allocate_info: [*c]const MemoryAllocateInfo, p_allocator: [*c]const AllocationCallbacks, p_memory: [*c]DeviceMemory) Result {
    return vkAllocateMemory(device, p_allocate_info, p_allocator, p_memory);
}
pub extern fn vkFreeMemory(device: Device, memory: DeviceMemory, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn freeMemory(device: Device, memory: DeviceMemory, p_allocator: [*c]const AllocationCallbacks) void {
    return vkFreeMemory(device, memory, p_allocator);
}
pub extern fn vkMapMemory(device: Device, memory: DeviceMemory, offset: DeviceSize, size: DeviceSize, flags: MemoryMapFlags, pp_data: [*c]?*anyopaque) Result;
pub inline fn mapMemory(device: Device, memory: DeviceMemory, offset: DeviceSize, size: DeviceSize, flags: MemoryMapFlags, pp_data: [*c]?*anyopaque) Result {
    return vkMapMemory(device, memory, offset, size, flags, pp_data);
}
pub extern fn vkUnmapMemory(device: Device, memory: DeviceMemory) void;
pub inline fn unmapMemory(device: Device, memory: DeviceMemory) void {
    return vkUnmapMemory(device, memory);
}
pub extern fn vkFlushMappedMemoryRanges(device: Device, memory_range_count: u32, p_memory_ranges: [*c]const MappedMemoryRange) Result;
pub inline fn flushMappedMemoryRanges(device: Device, memory_range_count: u32, p_memory_ranges: [*c]const MappedMemoryRange) Result {
    return vkFlushMappedMemoryRanges(device, memory_range_count, p_memory_ranges);
}
pub extern fn vkInvalidateMappedMemoryRanges(device: Device, memory_range_count: u32, p_memory_ranges: [*c]const MappedMemoryRange) Result;
pub inline fn invalidateMappedMemoryRanges(device: Device, memory_range_count: u32, p_memory_ranges: [*c]const MappedMemoryRange) Result {
    return vkInvalidateMappedMemoryRanges(device, memory_range_count, p_memory_ranges);
}
pub extern fn vkGetDeviceMemoryCommitment(device: Device, memory: DeviceMemory, p_committed_memory_in_bytes: [*c]DeviceSize) void;
pub inline fn getDeviceMemoryCommitment(device: Device, memory: DeviceMemory, p_committed_memory_in_bytes: [*c]DeviceSize) void {
    return vkGetDeviceMemoryCommitment(device, memory, p_committed_memory_in_bytes);
}
pub extern fn vkBindBufferMemory(device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize) Result;
pub inline fn bindBufferMemory(device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize) Result {
    return vkBindBufferMemory(device, buffer, memory, memory_offset);
}
pub extern fn vkBindImageMemory(device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize) Result;
pub inline fn bindImageMemory(device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize) Result {
    return vkBindImageMemory(device, image, memory, memory_offset);
}
pub extern fn vkGetBufferMemoryRequirements(device: Device, buffer: Buffer, p_memory_requirements: [*c]MemoryRequirements) void;
pub inline fn getBufferMemoryRequirements(device: Device, buffer: Buffer, p_memory_requirements: [*c]MemoryRequirements) void {
    return vkGetBufferMemoryRequirements(device, buffer, p_memory_requirements);
}
pub extern fn vkGetImageMemoryRequirements(device: Device, image: Image, p_memory_requirements: [*c]MemoryRequirements) void;
pub inline fn getImageMemoryRequirements(device: Device, image: Image, p_memory_requirements: [*c]MemoryRequirements) void {
    return vkGetImageMemoryRequirements(device, image, p_memory_requirements);
}
pub extern fn vkGetImageSparseMemoryRequirements(device: Device, image: Image, p_sparse_memory_requirement_count: [*c]u32, p_sparse_memory_requirements: [*c]SparseImageMemoryRequirements) void;
pub inline fn getImageSparseMemoryRequirements(device: Device, image: Image, p_sparse_memory_requirement_count: [*c]u32, p_sparse_memory_requirements: [*c]SparseImageMemoryRequirements) void {
    return vkGetImageSparseMemoryRequirements(device, image, p_sparse_memory_requirement_count, p_sparse_memory_requirements);
}
pub extern fn vkGetPhysicalDeviceSparseImageFormatProperties(physical_device: PhysicalDevice, format: Format, @"type": ImageType, samples: SampleCountFlags, usage: ImageUsageFlags, tiling: ImageTiling, p_property_count: [*c]u32, p_properties: [*c]SparseImageFormatProperties) void;
pub inline fn getPhysicalDeviceSparseImageFormatProperties(physical_device: PhysicalDevice, format: Format, @"type": ImageType, samples: SampleCountFlags, usage: ImageUsageFlags, tiling: ImageTiling, p_property_count: [*c]u32, p_properties: [*c]SparseImageFormatProperties) void {
    return vkGetPhysicalDeviceSparseImageFormatProperties(physical_device, format, @"type", samples, usage, tiling, p_property_count, p_properties);
}
pub extern fn vkQueueBindSparse(queue: Queue, bind_info_count: u32, p_bind_info: [*c]const BindSparseInfo, fence: Fence) Result;
pub inline fn queueBindSparse(queue: Queue, bind_info_count: u32, p_bind_info: [*c]const BindSparseInfo, fence: Fence) Result {
    return vkQueueBindSparse(queue, bind_info_count, p_bind_info, fence);
}
pub extern fn vkCreateFence(device: Device, p_create_info: [*c]const FenceCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_fence: [*c]Fence) Result;
pub inline fn createFence(device: Device, p_create_info: [*c]const FenceCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_fence: [*c]Fence) Result {
    return vkCreateFence(device, p_create_info, p_allocator, p_fence);
}
pub extern fn vkDestroyFence(device: Device, fence: Fence, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyFence(device: Device, fence: Fence, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyFence(device, fence, p_allocator);
}
pub extern fn vkResetFences(device: Device, fence_count: u32, p_fences: [*c]const Fence) Result;
pub inline fn resetFences(device: Device, fence_count: u32, p_fences: [*c]const Fence) Result {
    return vkResetFences(device, fence_count, p_fences);
}
pub extern fn vkGetFenceStatus(device: Device, fence: Fence) Result;
pub inline fn getFenceStatus(device: Device, fence: Fence) Result {
    return vkGetFenceStatus(device, fence);
}
pub extern fn vkWaitForFences(device: Device, fence_count: u32, p_fences: [*c]const Fence, wait_all: Bool32, timeout: u64) Result;
pub inline fn waitForFences(device: Device, fence_count: u32, p_fences: [*c]const Fence, wait_all: Bool32, timeout: u64) Result {
    return vkWaitForFences(device, fence_count, p_fences, wait_all, timeout);
}
pub extern fn vkCreateSemaphore(device: Device, p_create_info: [*c]const SemaphoreCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_semaphore: [*c]Semaphore) Result;
pub inline fn createSemaphore(device: Device, p_create_info: [*c]const SemaphoreCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_semaphore: [*c]Semaphore) Result {
    return vkCreateSemaphore(device, p_create_info, p_allocator, p_semaphore);
}
pub extern fn vkDestroySemaphore(device: Device, semaphore: Semaphore, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroySemaphore(device: Device, semaphore: Semaphore, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroySemaphore(device, semaphore, p_allocator);
}
pub extern fn vkCreateEvent(device: Device, p_create_info: [*c]const EventCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_event: [*c]Event) Result;
pub inline fn createEvent(device: Device, p_create_info: [*c]const EventCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_event: [*c]Event) Result {
    return vkCreateEvent(device, p_create_info, p_allocator, p_event);
}
pub extern fn vkDestroyEvent(device: Device, event: Event, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyEvent(device: Device, event: Event, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyEvent(device, event, p_allocator);
}
pub extern fn vkGetEventStatus(device: Device, event: Event) Result;
pub inline fn getEventStatus(device: Device, event: Event) Result {
    return vkGetEventStatus(device, event);
}
pub extern fn vkSetEvent(device: Device, event: Event) Result;
pub inline fn setEvent(device: Device, event: Event) Result {
    return vkSetEvent(device, event);
}
pub extern fn vkResetEvent(device: Device, event: Event) Result;
pub inline fn resetEvent(device: Device, event: Event) Result {
    return vkResetEvent(device, event);
}
pub extern fn vkCreateQueryPool(device: Device, p_create_info: [*c]const QueryPoolCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_query_pool: [*c]QueryPool) Result;
pub inline fn createQueryPool(device: Device, p_create_info: [*c]const QueryPoolCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_query_pool: [*c]QueryPool) Result {
    return vkCreateQueryPool(device, p_create_info, p_allocator, p_query_pool);
}
pub extern fn vkDestroyQueryPool(device: Device, query_pool: QueryPool, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyQueryPool(device: Device, query_pool: QueryPool, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyQueryPool(device, query_pool, p_allocator);
}
pub extern fn vkGetQueryPoolResults(device: Device, query_pool: QueryPool, first_query: u32, query_count: u32, data_size: usize, p_data: ?*anyopaque, stride: DeviceSize, flags: QueryResultFlags) Result;
pub inline fn getQueryPoolResults(device: Device, query_pool: QueryPool, first_query: u32, query_count: u32, data_size: usize, p_data: ?*anyopaque, stride: DeviceSize, flags: QueryResultFlags) Result {
    return vkGetQueryPoolResults(device, query_pool, first_query, query_count, data_size, p_data, stride, flags);
}
pub extern fn vkCreateBuffer(device: Device, p_create_info: [*c]const BufferCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_buffer: [*c]Buffer) Result;
pub inline fn createBuffer(device: Device, p_create_info: [*c]const BufferCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_buffer: [*c]Buffer) Result {
    return vkCreateBuffer(device, p_create_info, p_allocator, p_buffer);
}
pub extern fn vkDestroyBuffer(device: Device, buffer: Buffer, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyBuffer(device: Device, buffer: Buffer, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyBuffer(device, buffer, p_allocator);
}
pub extern fn vkCreateBufferView(device: Device, p_create_info: [*c]const BufferViewCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_view: [*c]BufferView) Result;
pub inline fn createBufferView(device: Device, p_create_info: [*c]const BufferViewCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_view: [*c]BufferView) Result {
    return vkCreateBufferView(device, p_create_info, p_allocator, p_view);
}
pub extern fn vkDestroyBufferView(device: Device, buffer_view: BufferView, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyBufferView(device: Device, buffer_view: BufferView, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyBufferView(device, buffer_view, p_allocator);
}
pub extern fn vkCreateImage(device: Device, p_create_info: [*c]const ImageCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_image: [*c]Image) Result;
pub inline fn createImage(device: Device, p_create_info: [*c]const ImageCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_image: [*c]Image) Result {
    return vkCreateImage(device, p_create_info, p_allocator, p_image);
}
pub extern fn vkDestroyImage(device: Device, image: Image, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyImage(device: Device, image: Image, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyImage(device, image, p_allocator);
}
pub extern fn vkGetImageSubresourceLayout(device: Device, image: Image, p_subresource: [*c]const ImageSubresource, p_layout: [*c]SubresourceLayout) void;
pub inline fn getImageSubresourceLayout(device: Device, image: Image, p_subresource: [*c]const ImageSubresource, p_layout: [*c]SubresourceLayout) void {
    return vkGetImageSubresourceLayout(device, image, p_subresource, p_layout);
}
pub extern fn vkCreateImageView(device: Device, p_create_info: [*c]const ImageViewCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_view: [*c]ImageView) Result;
pub inline fn createImageView(device: Device, p_create_info: [*c]const ImageViewCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_view: [*c]ImageView) Result {
    return vkCreateImageView(device, p_create_info, p_allocator, p_view);
}
pub extern fn vkDestroyImageView(device: Device, image_view: ImageView, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyImageView(device: Device, image_view: ImageView, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyImageView(device, image_view, p_allocator);
}
pub extern fn vkCreateShaderModule(device: Device, p_create_info: [*c]const ShaderModuleCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_shader_module: [*c]ShaderModule) Result;
pub inline fn createShaderModule(device: Device, p_create_info: [*c]const ShaderModuleCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_shader_module: [*c]ShaderModule) Result {
    return vkCreateShaderModule(device, p_create_info, p_allocator, p_shader_module);
}
pub extern fn vkDestroyShaderModule(device: Device, shader_module: ShaderModule, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyShaderModule(device: Device, shader_module: ShaderModule, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyShaderModule(device, shader_module, p_allocator);
}
pub extern fn vkCreatePipelineCache(device: Device, p_create_info: [*c]const PipelineCacheCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_pipeline_cache: [*c]PipelineCache) Result;
pub inline fn createPipelineCache(device: Device, p_create_info: [*c]const PipelineCacheCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_pipeline_cache: [*c]PipelineCache) Result {
    return vkCreatePipelineCache(device, p_create_info, p_allocator, p_pipeline_cache);
}
pub extern fn vkDestroyPipelineCache(device: Device, pipeline_cache: PipelineCache, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyPipelineCache(device: Device, pipeline_cache: PipelineCache, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyPipelineCache(device, pipeline_cache, p_allocator);
}
pub extern fn vkGetPipelineCacheData(device: Device, pipeline_cache: PipelineCache, p_data_size: [*c]usize, p_data: ?*anyopaque) Result;
pub inline fn getPipelineCacheData(device: Device, pipeline_cache: PipelineCache, p_data_size: [*c]usize, p_data: ?*anyopaque) Result {
    return vkGetPipelineCacheData(device, pipeline_cache, p_data_size, p_data);
}
pub extern fn vkMergePipelineCaches(device: Device, dst_cache: PipelineCache, src_cache_count: u32, p_src_caches: [*c]const PipelineCache) Result;
pub inline fn mergePipelineCaches(device: Device, dst_cache: PipelineCache, src_cache_count: u32, p_src_caches: [*c]const PipelineCache) Result {
    return vkMergePipelineCaches(device, dst_cache, src_cache_count, p_src_caches);
}
pub extern fn vkCreateGraphicsPipelines(device: Device, pipeline_cache: PipelineCache, create_info_count: u32, p_create_infos: [*c]const GraphicsPipelineCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_pipelines: [*c]Pipeline) Result;
pub inline fn createGraphicsPipelines(device: Device, pipeline_cache: PipelineCache, create_info_count: u32, p_create_infos: [*c]const GraphicsPipelineCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_pipelines: [*c]Pipeline) Result {
    return vkCreateGraphicsPipelines(device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines);
}
pub extern fn vkCreateComputePipelines(device: Device, pipeline_cache: PipelineCache, create_info_count: u32, p_create_infos: [*c]const ComputePipelineCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_pipelines: [*c]Pipeline) Result;
pub inline fn createComputePipelines(device: Device, pipeline_cache: PipelineCache, create_info_count: u32, p_create_infos: [*c]const ComputePipelineCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_pipelines: [*c]Pipeline) Result {
    return vkCreateComputePipelines(device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines);
}
pub extern fn vkDestroyPipeline(device: Device, pipeline: Pipeline, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyPipeline(device: Device, pipeline: Pipeline, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyPipeline(device, pipeline, p_allocator);
}
pub extern fn vkCreatePipelineLayout(device: Device, p_create_info: [*c]const PipelineLayoutCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_pipeline_layout: [*c]PipelineLayout) Result;
pub inline fn createPipelineLayout(device: Device, p_create_info: [*c]const PipelineLayoutCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_pipeline_layout: [*c]PipelineLayout) Result {
    return vkCreatePipelineLayout(device, p_create_info, p_allocator, p_pipeline_layout);
}
pub extern fn vkDestroyPipelineLayout(device: Device, pipeline_layout: PipelineLayout, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyPipelineLayout(device: Device, pipeline_layout: PipelineLayout, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyPipelineLayout(device, pipeline_layout, p_allocator);
}
pub extern fn vkCreateSampler(device: Device, p_create_info: [*c]const SamplerCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_sampler: [*c]Sampler) Result;
pub inline fn createSampler(device: Device, p_create_info: [*c]const SamplerCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_sampler: [*c]Sampler) Result {
    return vkCreateSampler(device, p_create_info, p_allocator, p_sampler);
}
pub extern fn vkDestroySampler(device: Device, sampler: Sampler, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroySampler(device: Device, sampler: Sampler, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroySampler(device, sampler, p_allocator);
}
pub extern fn vkCreateDescriptorSetLayout(device: Device, p_create_info: [*c]const DescriptorSetLayoutCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_set_layout: [*c]DescriptorSetLayout) Result;
pub inline fn createDescriptorSetLayout(device: Device, p_create_info: [*c]const DescriptorSetLayoutCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_set_layout: [*c]DescriptorSetLayout) Result {
    return vkCreateDescriptorSetLayout(device, p_create_info, p_allocator, p_set_layout);
}
pub extern fn vkDestroyDescriptorSetLayout(device: Device, descriptor_set_layout: DescriptorSetLayout, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyDescriptorSetLayout(device: Device, descriptor_set_layout: DescriptorSetLayout, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyDescriptorSetLayout(device, descriptor_set_layout, p_allocator);
}
pub extern fn vkCreateDescriptorPool(device: Device, p_create_info: [*c]const DescriptorPoolCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_descriptor_pool: [*c]DescriptorPool) Result;
pub inline fn createDescriptorPool(device: Device, p_create_info: [*c]const DescriptorPoolCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_descriptor_pool: [*c]DescriptorPool) Result {
    return vkCreateDescriptorPool(device, p_create_info, p_allocator, p_descriptor_pool);
}
pub extern fn vkDestroyDescriptorPool(device: Device, descriptor_pool: DescriptorPool, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyDescriptorPool(device: Device, descriptor_pool: DescriptorPool, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyDescriptorPool(device, descriptor_pool, p_allocator);
}
pub extern fn vkResetDescriptorPool(device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags) Result;
pub inline fn resetDescriptorPool(device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags) Result {
    return vkResetDescriptorPool(device, descriptor_pool, flags);
}
pub extern fn vkAllocateDescriptorSets(device: Device, p_allocate_info: [*c]const DescriptorSetAllocateInfo, p_descriptor_sets: [*c]DescriptorSet) Result;
pub inline fn allocateDescriptorSets(device: Device, p_allocate_info: [*c]const DescriptorSetAllocateInfo, p_descriptor_sets: [*c]DescriptorSet) Result {
    return vkAllocateDescriptorSets(device, p_allocate_info, p_descriptor_sets);
}
pub extern fn vkFreeDescriptorSets(device: Device, descriptor_pool: DescriptorPool, descriptor_set_count: u32, p_descriptor_sets: [*c]const DescriptorSet) Result;
pub inline fn freeDescriptorSets(device: Device, descriptor_pool: DescriptorPool, descriptor_set_count: u32, p_descriptor_sets: [*c]const DescriptorSet) Result {
    return vkFreeDescriptorSets(device, descriptor_pool, descriptor_set_count, p_descriptor_sets);
}
pub extern fn vkUpdateDescriptorSets(device: Device, descriptor_write_count: u32, p_descriptor_writes: [*c]const WriteDescriptorSet, descriptor_copy_count: u32, p_descriptor_copies: [*c]const CopyDescriptorSet) void;
pub inline fn updateDescriptorSets(device: Device, descriptor_write_count: u32, p_descriptor_writes: [*c]const WriteDescriptorSet, descriptor_copy_count: u32, p_descriptor_copies: [*c]const CopyDescriptorSet) void {
    return vkUpdateDescriptorSets(device, descriptor_write_count, p_descriptor_writes, descriptor_copy_count, p_descriptor_copies);
}
pub extern fn vkCreateFramebuffer(device: Device, p_create_info: [*c]const FramebufferCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_framebuffer: [*c]Framebuffer) Result;
pub inline fn createFramebuffer(device: Device, p_create_info: [*c]const FramebufferCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_framebuffer: [*c]Framebuffer) Result {
    return vkCreateFramebuffer(device, p_create_info, p_allocator, p_framebuffer);
}
pub extern fn vkDestroyFramebuffer(device: Device, framebuffer: Framebuffer, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyFramebuffer(device: Device, framebuffer: Framebuffer, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyFramebuffer(device, framebuffer, p_allocator);
}
pub extern fn vkCreateRenderPass(device: Device, p_create_info: [*c]const RenderPassCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_render_pass: [*c]RenderPass) Result;
pub inline fn createRenderPass(device: Device, p_create_info: [*c]const RenderPassCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_render_pass: [*c]RenderPass) Result {
    return vkCreateRenderPass(device, p_create_info, p_allocator, p_render_pass);
}
pub extern fn vkDestroyRenderPass(device: Device, render_pass: RenderPass, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyRenderPass(device: Device, render_pass: RenderPass, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyRenderPass(device, render_pass, p_allocator);
}
pub extern fn vkGetRenderAreaGranularity(device: Device, render_pass: RenderPass, p_granularity: [*c]Extent2D) void;
pub inline fn getRenderAreaGranularity(device: Device, render_pass: RenderPass, p_granularity: [*c]Extent2D) void {
    return vkGetRenderAreaGranularity(device, render_pass, p_granularity);
}
pub extern fn vkCreateCommandPool(device: Device, p_create_info: [*c]const CommandPoolCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_command_pool: [*c]CommandPool) Result;
pub inline fn createCommandPool(device: Device, p_create_info: [*c]const CommandPoolCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_command_pool: [*c]CommandPool) Result {
    return vkCreateCommandPool(device, p_create_info, p_allocator, p_command_pool);
}
pub extern fn vkDestroyCommandPool(device: Device, command_pool: CommandPool, p_allocator: [*c]const AllocationCallbacks) void;
pub inline fn destroyCommandPool(device: Device, command_pool: CommandPool, p_allocator: [*c]const AllocationCallbacks) void {
    return vkDestroyCommandPool(device, command_pool, p_allocator);
}
pub extern fn vkResetCommandPool(device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags) Result;
pub inline fn resetCommandPool(device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags) Result {
    return vkResetCommandPool(device, command_pool, flags);
}
pub extern fn vkAllocateCommandBuffers(device: Device, p_allocate_info: [*c]const CommandBufferAllocateInfo, p_command_buffers: [*c]CommandBuffer) Result;
pub inline fn allocateCommandBuffers(device: Device, p_allocate_info: [*c]const CommandBufferAllocateInfo, p_command_buffers: [*c]CommandBuffer) Result {
    return vkAllocateCommandBuffers(device, p_allocate_info, p_command_buffers);
}
pub extern fn vkFreeCommandBuffers(device: Device, command_pool: CommandPool, command_buffer_count: u32, p_command_buffers: [*c]const CommandBuffer) void;
pub inline fn freeCommandBuffers(device: Device, command_pool: CommandPool, command_buffer_count: u32, p_command_buffers: [*c]const CommandBuffer) void {
    return vkFreeCommandBuffers(device, command_pool, command_buffer_count, p_command_buffers);
}
pub extern fn vkBeginCommandBuffer(command_buffer: CommandBuffer, p_begin_info: [*c]const CommandBufferBeginInfo) Result;
pub inline fn beginCommandBuffer(command_buffer: CommandBuffer, p_begin_info: [*c]const CommandBufferBeginInfo) Result {
    return vkBeginCommandBuffer(command_buffer, p_begin_info);
}
pub extern fn vkEndCommandBuffer(command_buffer: CommandBuffer) Result;
pub inline fn endCommandBuffer(command_buffer: CommandBuffer) Result {
    return vkEndCommandBuffer(command_buffer);
}
pub extern fn vkResetCommandBuffer(command_buffer: CommandBuffer, flags: CommandBufferResetFlags) Result;
pub inline fn resetCommandBuffer(command_buffer: CommandBuffer, flags: CommandBufferResetFlags) Result {
    return vkResetCommandBuffer(command_buffer, flags);
}
pub extern fn vkCmdBindPipeline(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, pipeline: Pipeline) void;
pub inline fn cmdBindPipeline(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, pipeline: Pipeline) void {
    return vkCmdBindPipeline(command_buffer, pipeline_bind_point, pipeline);
}
pub extern fn vkCmdSetViewport(command_buffer: CommandBuffer, first_viewport: u32, viewport_count: u32, p_viewports: [*c]const Viewport) void;
pub inline fn cmdSetViewport(command_buffer: CommandBuffer, first_viewport: u32, viewport_count: u32, p_viewports: [*c]const Viewport) void {
    return vkCmdSetViewport(command_buffer, first_viewport, viewport_count, p_viewports);
}
pub extern fn vkCmdSetScissor(command_buffer: CommandBuffer, first_scissor: u32, scissor_count: u32, p_scissors: [*c]const Rect2D) void;
pub inline fn cmdSetScissor(command_buffer: CommandBuffer, first_scissor: u32, scissor_count: u32, p_scissors: [*c]const Rect2D) void {
    return vkCmdSetScissor(command_buffer, first_scissor, scissor_count, p_scissors);
}
pub extern fn vkCmdSetLineWidth(command_buffer: CommandBuffer, line_width: f32) void;
pub inline fn cmdSetLineWidth(command_buffer: CommandBuffer, line_width: f32) void {
    return vkCmdSetLineWidth(command_buffer, line_width);
}
pub extern fn vkCmdSetDepthBias(command_buffer: CommandBuffer, depth_bias_constant_factor: f32, depth_bias_clamp: f32, depth_bias_slope_factor: f32) void;
pub inline fn cmdSetDepthBias(command_buffer: CommandBuffer, depth_bias_constant_factor: f32, depth_bias_clamp: f32, depth_bias_slope_factor: f32) void {
    return vkCmdSetDepthBias(command_buffer, depth_bias_constant_factor, depth_bias_clamp, depth_bias_slope_factor);
}
pub extern fn vkCmdSetBlendConstants(command_buffer: CommandBuffer, blend_constants: [*c]const f32) void;
pub inline fn cmdSetBlendConstants(command_buffer: CommandBuffer, blend_constants: [*c]const f32) void {
    return vkCmdSetBlendConstants(command_buffer, blend_constants);
}
pub extern fn vkCmdSetDepthBounds(command_buffer: CommandBuffer, min_depth_bounds: f32, max_depth_bounds: f32) void;
pub inline fn cmdSetDepthBounds(command_buffer: CommandBuffer, min_depth_bounds: f32, max_depth_bounds: f32) void {
    return vkCmdSetDepthBounds(command_buffer, min_depth_bounds, max_depth_bounds);
}
pub extern fn vkCmdSetStencilCompareMask(command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: u32) void;
pub inline fn cmdSetStencilCompareMask(command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: u32) void {
    return vkCmdSetStencilCompareMask(command_buffer, face_mask, compare_mask);
}
pub extern fn vkCmdSetStencilWriteMask(command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: u32) void;
pub inline fn cmdSetStencilWriteMask(command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: u32) void {
    return vkCmdSetStencilWriteMask(command_buffer, face_mask, write_mask);
}
pub extern fn vkCmdSetStencilReference(command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: u32) void;
pub inline fn cmdSetStencilReference(command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: u32) void {
    return vkCmdSetStencilReference(command_buffer, face_mask, reference);
}
pub extern fn vkCmdBindDescriptorSets(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, layout: PipelineLayout, first_set: u32, descriptor_set_count: u32, p_descriptor_sets: [*c]const DescriptorSet, dynamic_offset_count: u32, p_dynamic_offsets: [*c]const u32) void;
pub inline fn cmdBindDescriptorSets(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, layout: PipelineLayout, first_set: u32, descriptor_set_count: u32, p_descriptor_sets: [*c]const DescriptorSet, dynamic_offset_count: u32, p_dynamic_offsets: [*c]const u32) void {
    return vkCmdBindDescriptorSets(command_buffer, pipeline_bind_point, layout, first_set, descriptor_set_count, p_descriptor_sets, dynamic_offset_count, p_dynamic_offsets);
}
pub extern fn vkCmdBindIndexBuffer(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, index_type: IndexType) void;
pub inline fn cmdBindIndexBuffer(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, index_type: IndexType) void {
    return vkCmdBindIndexBuffer(command_buffer, buffer, offset, index_type);
}
pub extern fn vkCmdBindVertexBuffers(command_buffer: CommandBuffer, first_binding: u32, binding_count: u32, p_buffers: [*c]const Buffer, p_offsets: [*c]const DeviceSize) void;
pub inline fn cmdBindVertexBuffers(command_buffer: CommandBuffer, first_binding: u32, binding_count: u32, p_buffers: [*c]const Buffer, p_offsets: [*c]const DeviceSize) void {
    return vkCmdBindVertexBuffers(command_buffer, first_binding, binding_count, p_buffers, p_offsets);
}
pub extern fn vkCmdDraw(command_buffer: CommandBuffer, vertex_count: u32, instance_count: u32, first_vertex: u32, first_instance: u32) void;
pub inline fn cmdDraw(command_buffer: CommandBuffer, vertex_count: u32, instance_count: u32, first_vertex: u32, first_instance: u32) void {
    return vkCmdDraw(command_buffer, vertex_count, instance_count, first_vertex, first_instance);
}
pub extern fn vkCmdDrawIndexed(command_buffer: CommandBuffer, index_count: u32, instance_count: u32, first_index: u32, vertex_offset: i32, first_instance: u32) void;
pub inline fn cmdDrawIndexed(command_buffer: CommandBuffer, index_count: u32, instance_count: u32, first_index: u32, vertex_offset: i32, first_instance: u32) void {
    return vkCmdDrawIndexed(command_buffer, index_count, instance_count, first_index, vertex_offset, first_instance);
}
pub extern fn vkCmdDrawIndirect(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, draw_count: u32, stride: u32) void;
pub inline fn cmdDrawIndirect(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, draw_count: u32, stride: u32) void {
    return vkCmdDrawIndirect(command_buffer, buffer, offset, draw_count, stride);
}
pub extern fn vkCmdDrawIndexedIndirect(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, draw_count: u32, stride: u32) void;
pub inline fn cmdDrawIndexedIndirect(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, draw_count: u32, stride: u32) void {
    return vkCmdDrawIndexedIndirect(command_buffer, buffer, offset, draw_count, stride);
}
pub extern fn vkCmdDispatch(command_buffer: CommandBuffer, group_count_x: u32, group_count_y: u32, group_count_z: u32) void;
pub inline fn cmdDispatch(command_buffer: CommandBuffer, group_count_x: u32, group_count_y: u32, group_count_z: u32) void {
    return vkCmdDispatch(command_buffer, group_count_x, group_count_y, group_count_z);
}
pub extern fn vkCmdDispatchIndirect(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize) void;
pub inline fn cmdDispatchIndirect(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize) void {
    return vkCmdDispatchIndirect(command_buffer, buffer, offset);
}
pub extern fn vkCmdCopyBuffer(command_buffer: CommandBuffer, src_buffer: Buffer, dst_buffer: Buffer, region_count: u32, p_regions: [*c]const BufferCopy) void;
pub inline fn cmdCopyBuffer(command_buffer: CommandBuffer, src_buffer: Buffer, dst_buffer: Buffer, region_count: u32, p_regions: [*c]const BufferCopy) void {
    return vkCmdCopyBuffer(command_buffer, src_buffer, dst_buffer, region_count, p_regions);
}
pub extern fn vkCmdCopyImage(command_buffer: CommandBuffer, src_image: Image, src_image_layout: ImageLayout, dst_image: Image, dst_image_layout: ImageLayout, region_count: u32, p_regions: [*c]const ImageCopy) void;
pub inline fn cmdCopyImage(command_buffer: CommandBuffer, src_image: Image, src_image_layout: ImageLayout, dst_image: Image, dst_image_layout: ImageLayout, region_count: u32, p_regions: [*c]const ImageCopy) void {
    return vkCmdCopyImage(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, region_count, p_regions);
}
pub extern fn vkCmdBlitImage(command_buffer: CommandBuffer, src_image: Image, src_image_layout: ImageLayout, dst_image: Image, dst_image_layout: ImageLayout, region_count: u32, p_regions: [*c]const ImageBlit, filter: Filter) void;
pub inline fn cmdBlitImage(command_buffer: CommandBuffer, src_image: Image, src_image_layout: ImageLayout, dst_image: Image, dst_image_layout: ImageLayout, region_count: u32, p_regions: [*c]const ImageBlit, filter: Filter) void {
    return vkCmdBlitImage(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, region_count, p_regions, filter);
}
pub extern fn vkCmdCopyBufferToImage(command_buffer: CommandBuffer, src_buffer: Buffer, dst_image: Image, dst_image_layout: ImageLayout, region_count: u32, p_regions: [*c]const BufferImageCopy) void;
pub inline fn cmdCopyBufferToImage(command_buffer: CommandBuffer, src_buffer: Buffer, dst_image: Image, dst_image_layout: ImageLayout, region_count: u32, p_regions: [*c]const BufferImageCopy) void {
    return vkCmdCopyBufferToImage(command_buffer, src_buffer, dst_image, dst_image_layout, region_count, p_regions);
}
pub extern fn vkCmdCopyImageToBuffer(command_buffer: CommandBuffer, src_image: Image, src_image_layout: ImageLayout, dst_buffer: Buffer, region_count: u32, p_regions: [*c]const BufferImageCopy) void;
pub inline fn cmdCopyImageToBuffer(command_buffer: CommandBuffer, src_image: Image, src_image_layout: ImageLayout, dst_buffer: Buffer, region_count: u32, p_regions: [*c]const BufferImageCopy) void {
    return vkCmdCopyImageToBuffer(command_buffer, src_image, src_image_layout, dst_buffer, region_count, p_regions);
}
pub extern fn vkCmdUpdateBuffer(command_buffer: CommandBuffer, dst_buffer: Buffer, dst_offset: DeviceSize, data_size: DeviceSize, p_data: ?*const anyopaque) void;
pub inline fn cmdUpdateBuffer(command_buffer: CommandBuffer, dst_buffer: Buffer, dst_offset: DeviceSize, data_size: DeviceSize, p_data: ?*const anyopaque) void {
    return vkCmdUpdateBuffer(command_buffer, dst_buffer, dst_offset, data_size, p_data);
}
pub extern fn vkCmdFillBuffer(command_buffer: CommandBuffer, dst_buffer: Buffer, dst_offset: DeviceSize, size: DeviceSize, data: u32) void;
pub inline fn cmdFillBuffer(command_buffer: CommandBuffer, dst_buffer: Buffer, dst_offset: DeviceSize, size: DeviceSize, data: u32) void {
    return vkCmdFillBuffer(command_buffer, dst_buffer, dst_offset, size, data);
}
pub extern fn vkCmdClearColorImage(command_buffer: CommandBuffer, image: Image, image_layout: ImageLayout, p_color: [*c]const ClearColorValue, range_count: u32, p_ranges: [*c]const ImageSubresourceRange) void;
pub inline fn cmdClearColorImage(command_buffer: CommandBuffer, image: Image, image_layout: ImageLayout, p_color: [*c]const ClearColorValue, range_count: u32, p_ranges: [*c]const ImageSubresourceRange) void {
    return vkCmdClearColorImage(command_buffer, image, image_layout, p_color, range_count, p_ranges);
}
pub extern fn vkCmdClearDepthStencilImage(command_buffer: CommandBuffer, image: Image, image_layout: ImageLayout, p_depth_stencil: [*c]const ClearDepthStencilValue, range_count: u32, p_ranges: [*c]const ImageSubresourceRange) void;
pub inline fn cmdClearDepthStencilImage(command_buffer: CommandBuffer, image: Image, image_layout: ImageLayout, p_depth_stencil: [*c]const ClearDepthStencilValue, range_count: u32, p_ranges: [*c]const ImageSubresourceRange) void {
    return vkCmdClearDepthStencilImage(command_buffer, image, image_layout, p_depth_stencil, range_count, p_ranges);
}
pub extern fn vkCmdClearAttachments(command_buffer: CommandBuffer, attachment_count: u32, p_attachments: [*c]const ClearAttachment, rect_count: u32, p_rects: [*c]const ClearRect) void;
pub inline fn cmdClearAttachments(command_buffer: CommandBuffer, attachment_count: u32, p_attachments: [*c]const ClearAttachment, rect_count: u32, p_rects: [*c]const ClearRect) void {
    return vkCmdClearAttachments(command_buffer, attachment_count, p_attachments, rect_count, p_rects);
}
pub extern fn vkCmdResolveImage(command_buffer: CommandBuffer, src_image: Image, src_image_layout: ImageLayout, dst_image: Image, dst_image_layout: ImageLayout, region_count: u32, p_regions: [*c]const ImageResolve) void;
pub inline fn cmdResolveImage(command_buffer: CommandBuffer, src_image: Image, src_image_layout: ImageLayout, dst_image: Image, dst_image_layout: ImageLayout, region_count: u32, p_regions: [*c]const ImageResolve) void {
    return vkCmdResolveImage(command_buffer, src_image, src_image_layout, dst_image, dst_image_layout, region_count, p_regions);
}
pub extern fn vkCmdSetEvent(command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags) void;
pub inline fn cmdSetEvent(command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags) void {
    return vkCmdSetEvent(command_buffer, event, stage_mask);
}
pub extern fn vkCmdResetEvent(command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags) void;
pub inline fn cmdResetEvent(command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags) void {
    return vkCmdResetEvent(command_buffer, event, stage_mask);
}
pub extern fn vkCmdWaitEvents(command_buffer: CommandBuffer, event_count: u32, p_events: [*c]const Event, src_stage_mask: PipelineStageFlags, dst_stage_mask: PipelineStageFlags, memory_barrier_count: u32, p_memory_barriers: [*c]const MemoryBarrier, buffer_memory_barrier_count: u32, p_buffer_memory_barriers: [*c]const BufferMemoryBarrier, image_memory_barrier_count: u32, p_image_memory_barriers: [*c]const ImageMemoryBarrier) void;
pub inline fn cmdWaitEvents(command_buffer: CommandBuffer, event_count: u32, p_events: [*c]const Event, src_stage_mask: PipelineStageFlags, dst_stage_mask: PipelineStageFlags, memory_barrier_count: u32, p_memory_barriers: [*c]const MemoryBarrier, buffer_memory_barrier_count: u32, p_buffer_memory_barriers: [*c]const BufferMemoryBarrier, image_memory_barrier_count: u32, p_image_memory_barriers: [*c]const ImageMemoryBarrier) void {
    return vkCmdWaitEvents(command_buffer, event_count, p_events, src_stage_mask, dst_stage_mask, memory_barrier_count, p_memory_barriers, buffer_memory_barrier_count, p_buffer_memory_barriers, image_memory_barrier_count, p_image_memory_barriers);
}
pub extern fn vkCmdPipelineBarrier(command_buffer: CommandBuffer, src_stage_mask: PipelineStageFlags, dst_stage_mask: PipelineStageFlags, dependency_flags: DependencyFlags, memory_barrier_count: u32, p_memory_barriers: [*c]const MemoryBarrier, buffer_memory_barrier_count: u32, p_buffer_memory_barriers: [*c]const BufferMemoryBarrier, image_memory_barrier_count: u32, p_image_memory_barriers: [*c]const ImageMemoryBarrier) void;
pub inline fn cmdPipelineBarrier(command_buffer: CommandBuffer, src_stage_mask: PipelineStageFlags, dst_stage_mask: PipelineStageFlags, dependency_flags: DependencyFlags, memory_barrier_count: u32, p_memory_barriers: [*c]const MemoryBarrier, buffer_memory_barrier_count: u32, p_buffer_memory_barriers: [*c]const BufferMemoryBarrier, image_memory_barrier_count: u32, p_image_memory_barriers: [*c]const ImageMemoryBarrier) void {
    return vkCmdPipelineBarrier(command_buffer, src_stage_mask, dst_stage_mask, dependency_flags, memory_barrier_count, p_memory_barriers, p_image_memory_barriers, buffer_memory_barrier_count, p_buffer_memory_barriers, image_memory_barrier_count, p_image_memory_barriers);
}
pub extern fn vkCmdBeginQuery(command_buffer: CommandBuffer, query_pool: QueryPool, query: u32, flags: QueryControlFlags) void;
pub inline fn cmdBeginQuery(command_buffer: CommandBuffer, query_pool: QueryPool, query: u32, flags: QueryControlFlags) void {
    return vkCmdBeginQuery(command_buffer, query_pool, query, flags);
}
pub extern fn vkCmdEndQuery(command_buffer: CommandBuffer, query_pool: QueryPool, query: u32) void;
pub inline fn cmdEndQuery(command_buffer: CommandBuffer, query_pool: QueryPool, query: u32) void {
    return vkCmdEndQuery(command_buffer, query_pool, query);
}
pub extern fn vkCmdResetQueryPool(command_buffer: CommandBuffer, query_pool: QueryPool, first_query: u32, query_count: u32) void;
pub inline fn cmdResetQueryPool(command_buffer: CommandBuffer, query_pool: QueryPool, first_query: u32, query_count: u32) void {
    return vkCmdResetQueryPool(command_buffer, query_pool, first_query, query_count);
}
pub extern fn vkCmdWriteTimestamp(command_buffer: CommandBuffer, pipeline_stage: PipelineStageFlags, query_pool: QueryPool, query: u32) void;
pub inline fn cmdWriteTimestamp(command_buffer: CommandBuffer, pipeline_stage: PipelineStageFlags, query_pool: QueryPool, query: u32) void {
    return vkCmdWriteTimestamp(command_buffer, pipeline_stage, query_pool, query);
}
pub extern fn vkCmdCopyQueryPoolResults(command_buffer: CommandBuffer, query_pool: QueryPool, first_query: u32, query_count: u32, dst_buffer: Buffer, dst_offset: DeviceSize, stride: DeviceSize, flags: QueryResultFlags) void;
pub inline fn cmdCopyQueryPoolResults(command_buffer: CommandBuffer, query_pool: QueryPool, first_query: u32, query_count: u32, dst_buffer: Buffer, dst_offset: DeviceSize, stride: DeviceSize, flags: QueryResultFlags) void {
    return vkCmdCopyQueryPoolResults(command_buffer, query_pool, first_query, query_count, dst_buffer, dst_offset, stride, flags);
}
pub extern fn vkCmdPushConstants(command_buffer: CommandBuffer, layout: PipelineLayout, stage_flags: ShaderStageFlags, offset: u32, size: u32, p_values: ?*const anyopaque) void;
pub inline fn cmdPushConstants(command_buffer: CommandBuffer, layout: PipelineLayout, stage_flags: ShaderStageFlags, offset: u32, size: u32, p_values: ?*const anyopaque) void {
    return vkCmdPushConstants(command_buffer, layout, stage_flags, offset, size, p_values);
}
pub extern fn vkCmdBeginRenderPass(command_buffer: CommandBuffer, p_render_pass_begin: [*c]const RenderPassBeginInfo, contents: SubpassContents) void;
pub inline fn cmdBeginRenderPass(command_buffer: CommandBuffer, p_render_pass_begin: [*c]const RenderPassBeginInfo, contents: SubpassContents) void {
    return vkCmdBeginRenderPass(command_buffer, p_render_pass_begin, contents);
}
pub extern fn vkCmdNextSubpass(command_buffer: CommandBuffer, contents: SubpassContents) void;
pub inline fn cmdNextSubpass(command_buffer: CommandBuffer, contents: SubpassContents) void {
    return vkCmdNextSubpass(command_buffer, contents);
}
pub extern fn vkCmdEndRenderPass(command_buffer: CommandBuffer) void;
pub inline fn cmdEndRenderPass(command_buffer: CommandBuffer) void {
    return vkCmdEndRenderPass(command_buffer);
}
pub extern fn vkCmdExecuteCommands(command_buffer: CommandBuffer, command_buffer_count: u32, p_command_buffers: [*c]const CommandBuffer) void;
pub inline fn cmdExecuteCommands(command_buffer: CommandBuffer, command_buffer_count: u32, p_command_buffers: [*c]const CommandBuffer) void {
    return vkCmdExecuteCommands(command_buffer, command_buffer_count, p_command_buffers);
}
pub const SamplerYcbcrConversion = enum(u64) { null = 0, _ };
pub const DescriptorUpdateTemplate = enum(u64) { null = 0, _ };
pub const PointClippingBehavior = enum(u32) {
    all_clip_planes_khr = 0,
    user_clip_planes_only_khr = 1,
    pub const Self = @This();
    pub const all_clip_planes = Self.all_clip_planes_khr;
    pub const user_clip_planes_only = Self.user_clip_planes_only_khr;
};
pub const TessellationDomainOrigin = enum(u32) {
    upper_left_khr = 0,
    lower_left_khr = 1,
    pub const Self = @This();
    pub const upper_left = Self.upper_left_khr;
    pub const lower_left = Self.lower_left_khr;
};
pub const SamplerYcbcrModelConversion = enum(u32) {
    rgb_identity_khr = 0,
    ycbcr_identity_khr = 1,
    ycbcr_709_khr = 2,
    ycbcr_601_khr = 3,
    ycbcr_2020_khr = 4,
    pub const Self = @This();
    pub const rgb_identity = Self.rgb_identity_khr;
    pub const ycbcr_identity = Self.ycbcr_identity_khr;
    pub const ycbcr_709 = Self.ycbcr_709_khr;
    pub const ycbcr_601 = Self.ycbcr_601_khr;
    pub const ycbcr_2020 = Self.ycbcr_2020_khr;
};
pub const SamplerYcbcrRange = enum(u32) {
    itu_full_khr = 0,
    itu_narrow_khr = 1,
    pub const Self = @This();
    pub const itu_full = Self.itu_full_khr;
    pub const itu_narrow = Self.itu_narrow_khr;
};
pub const ChromaLocation = enum(u32) {
    cosited_even_khr = 0,
    midpoint_khr = 1,
    pub const Self = @This();
    pub const cosited_even = Self.cosited_even_khr;
    pub const midpoint = Self.midpoint_khr;
};
pub const DescriptorUpdateTemplateType = enum(u32) {
    descriptor_set_khr = 0,
    push_descriptors_khr = 1,
    pub const Self = @This();
    pub const descriptor_set = Self.descriptor_set_khr;
};
pub const SubgroupFeatureFlags = enum(u32) {
    null = 0,
    basic_bit = 1,
    vote_bit = 2,
    arithmetic_bit = 4,
    ballot_bit = 8,
    shuffle_bit = 16,
    shuffle_relative_bit = 32,
    clustered_bit = 64,
    quad_bit = 128,
    partitioned_bit_nv = 256,
    rotate_bit_khr = 512,
    rotate_clustered_bit_khr = 1024,
};
pub const PeerMemoryFeatureFlags = enum(u32) {
    null = 0,
    copy_src_bit_khr = 1,
    copy_dst_bit_khr = 2,
    generic_src_bit_khr = 4,
    generic_dst_bit_khr = 8,
    pub const Self = @This();
    pub const copy_src_bit = Self.copy_src_bit_khr;
    pub const copy_dst_bit = Self.copy_dst_bit_khr;
    pub const generic_src_bit = Self.generic_src_bit_khr;
    pub const generic_dst_bit = Self.generic_dst_bit_khr;
};
pub const MemoryAllocateFlags = enum(u32) {
    null = 0,
    device_mask_bit_khr = 1,
    device_address_bit_khr = 2,
    device_address_capture_replay_bit_khr = 4,
    pub const Self = @This();
    pub const device_mask_bit = Self.device_mask_bit_khr;
    pub const device_address_bit = Self.device_address_bit_khr;
    pub const device_address_capture_replay_bit = Self.device_address_capture_replay_bit_khr;
};
pub const CommandPoolTrimFlags = Flags;
pub const DescriptorUpdateTemplateCreateFlags = Flags;
pub const ExternalMemoryHandleTypeFlags = enum(u32) {
    null = 0,
    opaque_fd_bit_khr = 1,
    opaque_win32_bit_khr = 2,
    opaque_win32_kmt_bit_khr = 4,
    d3d11_texture_bit_khr = 8,
    d3d11_texture_kmt_bit_khr = 16,
    d3d12_heap_bit_khr = 32,
    d3d12_resource_bit_khr = 64,
    host_allocation_bit_ext = 128,
    host_mapped_foreign_memory_bit_ext = 256,
    dma_buf_bit_ext = 512,
    android_hardware_buffer_bit_android = 1024,
    zircon_vmo_bit_fuchsia = 2048,
    rdma_address_bit_nv = 4096,
    screen_buffer_bit_qnx = 16384,
    pub const Self = @This();
    pub const opaque_fd_bit = Self.opaque_fd_bit_khr;
    pub const opaque_win32_bit = Self.opaque_win32_bit_khr;
    pub const opaque_win32_kmt_bit = Self.opaque_win32_kmt_bit_khr;
    pub const d3d11_texture_bit = Self.d3d11_texture_bit_khr;
    pub const d3d11_texture_kmt_bit = Self.d3d11_texture_kmt_bit_khr;
    pub const d3d12_heap_bit = Self.d3d12_heap_bit_khr;
    pub const d3d12_resource_bit = Self.d3d12_resource_bit_khr;
};
pub const ExternalMemoryFeatureFlags = enum(u32) {
    null = 0,
    dedicated_only_bit_khr = 1,
    exportable_bit_khr = 2,
    importable_bit_khr = 4,
    pub const Self = @This();
    pub const dedicated_only_bit = Self.dedicated_only_bit_khr;
    pub const exportable_bit = Self.exportable_bit_khr;
    pub const importable_bit = Self.importable_bit_khr;
};
pub const ExternalFenceHandleTypeFlags = enum(u32) {
    null = 0,
    opaque_fd_bit_khr = 1,
    opaque_win32_bit_khr = 2,
    opaque_win32_kmt_bit_khr = 4,
    sync_fd_bit_khr = 8,
    pub const Self = @This();
    pub const opaque_fd_bit = Self.opaque_fd_bit_khr;
    pub const opaque_win32_bit = Self.opaque_win32_bit_khr;
    pub const opaque_win32_kmt_bit = Self.opaque_win32_kmt_bit_khr;
    pub const sync_fd_bit = Self.sync_fd_bit_khr;
};
pub const ExternalFenceFeatureFlags = enum(u32) {
    null = 0,
    exportable_bit_khr = 1,
    importable_bit_khr = 2,
    pub const Self = @This();
    pub const exportable_bit = Self.exportable_bit_khr;
    pub const importable_bit = Self.importable_bit_khr;
};
pub const FenceImportFlags = enum(u32) {
    null = 0,
    temporary_bit_khr = 1,
    pub const Self = @This();
    pub const temporary_bit = Self.temporary_bit_khr;
};
pub const SemaphoreImportFlags = enum(u32) {
    null = 0,
    temporary_bit_khr = 1,
    pub const Self = @This();
    pub const temporary_bit = Self.temporary_bit_khr;
};
pub const ExternalSemaphoreHandleTypeFlags = enum(u32) {
    null = 0,
    opaque_fd_bit_khr = 1,
    opaque_win32_bit_khr = 2,
    opaque_win32_kmt_bit_khr = 4,
    d3d12_fence_bit_khr = 8,
    sync_fd_bit_khr = 16,
    zircon_event_bit_fuchsia = 128,
    pub const Self = @This();
    pub const opaque_fd_bit = Self.opaque_fd_bit_khr;
    pub const opaque_win32_bit = Self.opaque_win32_bit_khr;
    pub const opaque_win32_kmt_bit = Self.opaque_win32_kmt_bit_khr;
    pub const d3d11_fence_bit = Self.d3d12_fence_bit_khr;
    pub const d3d12_fence_bit = Self.d3d12_fence_bit_khr;
    pub const sync_fd_bit = Self.sync_fd_bit_khr;
};
pub const ExternalSemaphoreFeatureFlags = enum(u32) {
    null = 0,
    exportable_bit_khr = 1,
    importable_bit_khr = 2,
    pub const Self = @This();
    pub const exportable_bit = Self.exportable_bit_khr;
    pub const importable_bit = Self.importable_bit_khr;
};
pub const PhysicalDeviceSubgroupProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_subgroup_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    subgroup_size: u32 = @import("std").mem.zeroes(u32),
    supported_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    supported_operations: SubgroupFeatureFlags = @import("std").mem.zeroes(SubgroupFeatureFlags),
    quad_operations_in_all_stages: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const BindBufferMemoryInfo = extern struct {
    s_type: StructureType = StructureType.bind_buffer_memory_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    memory_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const BindImageMemoryInfo = extern struct {
    s_type: StructureType = StructureType.bind_image_memory_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    memory_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PhysicalDevice16BitStorageFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device16bit_storage_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    storage_buffer16bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_and_storage_buffer16bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_push_constant16: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_input_output16: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MemoryDedicatedRequirements = extern struct {
    s_type: StructureType = StructureType.memory_dedicated_requirements,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    prefers_dedicated_allocation: Bool32 = @import("std").mem.zeroes(Bool32),
    requires_dedicated_allocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MemoryDedicatedAllocateInfo = extern struct {
    s_type: StructureType = StructureType.memory_dedicated_allocate_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
};
pub const MemoryAllocateFlagsInfo = extern struct {
    s_type: StructureType = StructureType.memory_allocate_flags_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: MemoryAllocateFlags = @import("std").mem.zeroes(MemoryAllocateFlags),
    device_mask: u32 = @import("std").mem.zeroes(u32),
};
pub const DeviceGroupRenderPassBeginInfo = extern struct {
    s_type: StructureType = StructureType.device_group_render_pass_begin_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_mask: u32 = @import("std").mem.zeroes(u32),
    device_render_area_count: u32 = @import("std").mem.zeroes(u32),
    p_device_render_areas: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const DeviceGroupCommandBufferBeginInfo = extern struct {
    s_type: StructureType = StructureType.device_group_command_buffer_begin_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_mask: u32 = @import("std").mem.zeroes(u32),
};
pub const DeviceGroupSubmitInfo = extern struct {
    s_type: StructureType = StructureType.device_group_submit_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    wait_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_wait_semaphore_device_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    command_buffer_count: u32 = @import("std").mem.zeroes(u32),
    p_command_buffer_device_masks: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    signal_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_signal_semaphore_device_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const DeviceGroupBindSparseInfo = extern struct {
    s_type: StructureType = StructureType.device_group_bind_sparse_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    resource_device_index: u32 = @import("std").mem.zeroes(u32),
    memory_device_index: u32 = @import("std").mem.zeroes(u32),
};
pub const BindBufferMemoryDeviceGroupInfo = extern struct {
    s_type: StructureType = StructureType.bind_buffer_memory_device_group_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_index_count: u32 = @import("std").mem.zeroes(u32),
    p_device_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const BindImageMemoryDeviceGroupInfo = extern struct {
    s_type: StructureType = StructureType.bind_image_memory_device_group_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_index_count: u32 = @import("std").mem.zeroes(u32),
    p_device_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    split_instance_bind_region_count: u32 = @import("std").mem.zeroes(u32),
    p_split_instance_bind_regions: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const PhysicalDeviceGroupProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_group_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    physical_device_count: u32 = @import("std").mem.zeroes(u32),
    physical_devices: [32]PhysicalDevice = @import("std").mem.zeroes([32]PhysicalDevice),
    subset_allocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceGroupDeviceCreateInfo = extern struct {
    s_type: StructureType = StructureType.device_group_device_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    physical_device_count: u32 = @import("std").mem.zeroes(u32),
    p_physical_devices: [*c]const PhysicalDevice = @import("std").mem.zeroes([*c]const PhysicalDevice),
};
pub const BufferMemoryRequirementsInfo2 = extern struct {
    s_type: StructureType = StructureType.buffer_memory_requirements_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
};
pub const ImageMemoryRequirementsInfo2 = extern struct {
    s_type: StructureType = StructureType.image_memory_requirements_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
};
pub const ImageSparseMemoryRequirementsInfo2 = extern struct {
    s_type: StructureType = StructureType.image_sparse_memory_requirements_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
};
pub const MemoryRequirements2 = extern struct {
    s_type: StructureType = StructureType.memory_requirements2,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_requirements: MemoryRequirements = @import("std").mem.zeroes(MemoryRequirements),
};
pub const SparseImageMemoryRequirements2 = extern struct {
    s_type: StructureType = StructureType.sparse_image_memory_requirements2,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_requirements: SparseImageMemoryRequirements = @import("std").mem.zeroes(SparseImageMemoryRequirements),
};
pub const PhysicalDeviceFeatures2 = extern struct {
    s_type: StructureType = StructureType.physical_device_features2,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    features: PhysicalDeviceFeatures = @import("std").mem.zeroes(PhysicalDeviceFeatures),
};
pub const PhysicalDeviceProperties2 = extern struct {
    s_type: StructureType = StructureType.physical_device_properties2,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    properties: PhysicalDeviceProperties = @import("std").mem.zeroes(PhysicalDeviceProperties),
};
pub const FormatProperties2 = extern struct {
    s_type: StructureType = StructureType.format_properties2,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    format_properties: FormatProperties = @import("std").mem.zeroes(FormatProperties),
};
pub const ImageFormatProperties2 = extern struct {
    s_type: StructureType = StructureType.image_format_properties2,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_format_properties: ImageFormatProperties = @import("std").mem.zeroes(ImageFormatProperties),
};
pub const PhysicalDeviceImageFormatInfo2 = extern struct {
    s_type: StructureType = StructureType.physical_device_image_format_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    format: Format = @import("std").mem.zeroes(Format),
    type: ImageType = @import("std").mem.zeroes(ImageType),
    tiling: ImageTiling = @import("std").mem.zeroes(ImageTiling),
    usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    flags: ImageCreateFlags = @import("std").mem.zeroes(ImageCreateFlags),
};
pub const QueueFamilyProperties2 = extern struct {
    s_type: StructureType = StructureType.queue_family_properties2,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    queue_family_properties: QueueFamilyProperties = @import("std").mem.zeroes(QueueFamilyProperties),
};
pub const PhysicalDeviceMemoryProperties2 = extern struct {
    s_type: StructureType = StructureType.physical_device_memory_properties2,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_properties: PhysicalDeviceMemoryProperties = @import("std").mem.zeroes(PhysicalDeviceMemoryProperties),
};
pub const SparseImageFormatProperties2 = extern struct {
    s_type: StructureType = StructureType.sparse_image_format_properties2,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    properties: SparseImageFormatProperties = @import("std").mem.zeroes(SparseImageFormatProperties),
};
pub const PhysicalDeviceSparseImageFormatInfo2 = extern struct {
    s_type: StructureType = StructureType.physical_device_sparse_image_format_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    format: Format = @import("std").mem.zeroes(Format),
    type: ImageType = @import("std").mem.zeroes(ImageType),
    samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    tiling: ImageTiling = @import("std").mem.zeroes(ImageTiling),
};
pub const PhysicalDevicePointClippingProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_point_clipping_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    point_clipping_behavior: PointClippingBehavior = @import("std").mem.zeroes(PointClippingBehavior),
};
pub const InputAttachmentAspectReference = extern struct {
    subpass: u32 = @import("std").mem.zeroes(u32),
    input_attachment_index: u32 = @import("std").mem.zeroes(u32),
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
};
pub const RenderPassInputAttachmentAspectCreateInfo = extern struct {
    s_type: StructureType = StructureType.render_pass_input_attachment_aspect_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    aspect_reference_count: u32 = @import("std").mem.zeroes(u32),
    p_aspect_references: [*c]const InputAttachmentAspectReference = @import("std").mem.zeroes([*c]const InputAttachmentAspectReference),
};
pub const ImageViewUsageCreateInfo = extern struct {
    s_type: StructureType = StructureType.image_view_usage_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
};
pub const PipelineTessellationDomainOriginStateCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_tessellation_domain_origin_state_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    domain_origin: TessellationDomainOrigin = @import("std").mem.zeroes(TessellationDomainOrigin),
};
pub const RenderPassMultiviewCreateInfo = extern struct {
    s_type: StructureType = StructureType.render_pass_multiview_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    subpass_count: u32 = @import("std").mem.zeroes(u32),
    p_view_masks: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    dependency_count: u32 = @import("std").mem.zeroes(u32),
    p_view_offsets: [*c]const i32 = @import("std").mem.zeroes([*c]const i32),
    correlation_mask_count: u32 = @import("std").mem.zeroes(u32),
    p_correlation_masks: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const PhysicalDeviceMultiviewFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_multiview_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    multiview: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview_geometry_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview_tessellation_shader: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMultiviewProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_multiview_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_multiview_view_count: u32 = @import("std").mem.zeroes(u32),
    max_multiview_instance_index: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceVariablePointersFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_variable_pointers_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    variable_pointers_storage_buffer: Bool32 = @import("std").mem.zeroes(Bool32),
    variable_pointers: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVariablePointerFeatures = PhysicalDeviceVariablePointersFeatures;
pub const PhysicalDeviceProtectedMemoryFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_protected_memory_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    protected_memory: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceProtectedMemoryProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_protected_memory_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    protected_no_fault: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceQueueInfo2 = extern struct {
    s_type: StructureType = StructureType.device_queue_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DeviceQueueCreateFlags = @import("std").mem.zeroes(DeviceQueueCreateFlags),
    queue_family_index: u32 = @import("std").mem.zeroes(u32),
    queue_index: u32 = @import("std").mem.zeroes(u32),
};
pub const ProtectedSubmitInfo = extern struct {
    s_type: StructureType = StructureType.protected_submit_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    protected_submit: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SamplerYcbcrConversionCreateInfo = extern struct {
    s_type: StructureType = StructureType.sampler_ycbcr_conversion_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    format: Format = @import("std").mem.zeroes(Format),
    ycbcr_model: SamplerYcbcrModelConversion = @import("std").mem.zeroes(SamplerYcbcrModelConversion),
    ycbcr_range: SamplerYcbcrRange = @import("std").mem.zeroes(SamplerYcbcrRange),
    components: ComponentMapping = @import("std").mem.zeroes(ComponentMapping),
    x_chroma_offset: ChromaLocation = @import("std").mem.zeroes(ChromaLocation),
    y_chroma_offset: ChromaLocation = @import("std").mem.zeroes(ChromaLocation),
    chroma_filter: Filter = @import("std").mem.zeroes(Filter),
    force_explicit_reconstruction: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SamplerYcbcrConversionInfo = extern struct {
    s_type: StructureType = StructureType.sampler_ycbcr_conversion_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    conversion: SamplerYcbcrConversion = @import("std").mem.zeroes(SamplerYcbcrConversion),
};
pub const BindImagePlaneMemoryInfo = extern struct {
    s_type: StructureType = StructureType.bind_image_plane_memory_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    plane_aspect: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
};
pub const ImagePlaneMemoryRequirementsInfo = extern struct {
    s_type: StructureType = StructureType.image_plane_memory_requirements_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    plane_aspect: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
};
pub const PhysicalDeviceSamplerYcbcrConversionFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_sampler_ycbcr_conversion_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    sampler_ycbcr_conversion: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SamplerYcbcrConversionImageFormatProperties = extern struct {
    s_type: StructureType = StructureType.sampler_ycbcr_conversion_image_format_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    combined_image_sampler_descriptor_count: u32 = @import("std").mem.zeroes(u32),
};
pub const DescriptorUpdateTemplateEntry = extern struct {
    dst_binding: u32 = @import("std").mem.zeroes(u32),
    dst_array_element: u32 = @import("std").mem.zeroes(u32),
    descriptor_count: u32 = @import("std").mem.zeroes(u32),
    descriptor_type: DescriptorType = @import("std").mem.zeroes(DescriptorType),
    offset: usize = @import("std").mem.zeroes(usize),
    stride: usize = @import("std").mem.zeroes(usize),
};
pub const DescriptorUpdateTemplateCreateInfo = extern struct {
    s_type: StructureType = StructureType.descriptor_update_template_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DescriptorUpdateTemplateCreateFlags = @import("std").mem.zeroes(DescriptorUpdateTemplateCreateFlags),
    descriptor_update_entry_count: u32 = @import("std").mem.zeroes(u32),
    p_descriptor_update_entries: [*c]const DescriptorUpdateTemplateEntry = @import("std").mem.zeroes([*c]const DescriptorUpdateTemplateEntry),
    template_type: DescriptorUpdateTemplateType = @import("std").mem.zeroes(DescriptorUpdateTemplateType),
    descriptor_set_layout: DescriptorSetLayout = @import("std").mem.zeroes(DescriptorSetLayout),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    pipeline_layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    set: u32 = @import("std").mem.zeroes(u32),
};
pub const ExternalMemoryProperties = extern struct {
    external_memory_features: ExternalMemoryFeatureFlags = @import("std").mem.zeroes(ExternalMemoryFeatureFlags),
    export_from_imported_handle_types: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
    compatible_handle_types: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
};
pub const PhysicalDeviceExternalImageFormatInfo = extern struct {
    s_type: StructureType = StructureType.physical_device_external_image_format_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_type: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
};
pub const ExternalImageFormatProperties = extern struct {
    s_type: StructureType = StructureType.external_image_format_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    external_memory_properties: ExternalMemoryProperties = @import("std").mem.zeroes(ExternalMemoryProperties),
};
pub const PhysicalDeviceExternalBufferInfo = extern struct {
    s_type: StructureType = StructureType.physical_device_external_buffer_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: BufferCreateFlags = @import("std").mem.zeroes(BufferCreateFlags),
    usage: BufferUsageFlags = @import("std").mem.zeroes(BufferUsageFlags),
    handle_type: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
};
pub const ExternalBufferProperties = extern struct {
    s_type: StructureType = StructureType.external_buffer_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    external_memory_properties: ExternalMemoryProperties = @import("std").mem.zeroes(ExternalMemoryProperties),
};
pub const PhysicalDeviceIDProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_idproperties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    driver_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    device_luid: [8]u8 = @import("std").mem.zeroes([8]u8),
    device_node_mask: u32 = @import("std").mem.zeroes(u32),
    device_luidvalid: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ExternalMemoryImageCreateInfo = extern struct {
    s_type: StructureType = StructureType.external_memory_image_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
};
pub const ExternalMemoryBufferCreateInfo = extern struct {
    s_type: StructureType = StructureType.external_memory_buffer_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
};
pub const ExportMemoryAllocateInfo = extern struct {
    s_type: StructureType = StructureType.export_memory_allocate_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
};
pub const PhysicalDeviceExternalFenceInfo = extern struct {
    s_type: StructureType = StructureType.physical_device_external_fence_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_type: ExternalFenceHandleTypeFlags = @import("std").mem.zeroes(ExternalFenceHandleTypeFlags),
};
pub const ExternalFenceProperties = extern struct {
    s_type: StructureType = StructureType.external_fence_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    export_from_imported_handle_types: ExternalFenceHandleTypeFlags = @import("std").mem.zeroes(ExternalFenceHandleTypeFlags),
    compatible_handle_types: ExternalFenceHandleTypeFlags = @import("std").mem.zeroes(ExternalFenceHandleTypeFlags),
    external_fence_features: ExternalFenceFeatureFlags = @import("std").mem.zeroes(ExternalFenceFeatureFlags),
};
pub const ExportFenceCreateInfo = extern struct {
    s_type: StructureType = StructureType.export_fence_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalFenceHandleTypeFlags = @import("std").mem.zeroes(ExternalFenceHandleTypeFlags),
};
pub const ExportSemaphoreCreateInfo = extern struct {
    s_type: StructureType = StructureType.export_semaphore_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalSemaphoreHandleTypeFlags = @import("std").mem.zeroes(ExternalSemaphoreHandleTypeFlags),
};
pub const PhysicalDeviceExternalSemaphoreInfo = extern struct {
    s_type: StructureType = StructureType.physical_device_external_semaphore_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_type: ExternalSemaphoreHandleTypeFlags = @import("std").mem.zeroes(ExternalSemaphoreHandleTypeFlags),
};
pub const ExternalSemaphoreProperties = extern struct {
    s_type: StructureType = StructureType.external_semaphore_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    export_from_imported_handle_types: ExternalSemaphoreHandleTypeFlags = @import("std").mem.zeroes(ExternalSemaphoreHandleTypeFlags),
    compatible_handle_types: ExternalSemaphoreHandleTypeFlags = @import("std").mem.zeroes(ExternalSemaphoreHandleTypeFlags),
    external_semaphore_features: ExternalSemaphoreFeatureFlags = @import("std").mem.zeroes(ExternalSemaphoreFeatureFlags),
};
pub const PhysicalDeviceMaintenance3Properties = extern struct {
    s_type: StructureType = StructureType.physical_device_maintenance3properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_per_set_descriptors: u32 = @import("std").mem.zeroes(u32),
    max_memory_allocation_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const DescriptorSetLayoutSupport = extern struct {
    s_type: StructureType = StructureType.descriptor_set_layout_support,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supported: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderDrawParametersFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_draw_parameters_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_draw_parameters: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderDrawParameterFeatures = PhysicalDeviceShaderDrawParametersFeatures;
pub const PFN_enumerateInstanceVersion = ?*const fn ([*c]u32) callconv(.c) Result;
pub const PFN_bindBufferMemory2 = ?*const fn (Device, u32, [*c]const BindBufferMemoryInfo) callconv(.c) Result;
pub const PFN_bindImageMemory2 = ?*const fn (Device, u32, [*c]const BindImageMemoryInfo) callconv(.c) Result;
pub const PFN_getDeviceGroupPeerMemoryFeatures = ?*const fn (Device, u32, u32, u32, [*c]PeerMemoryFeatureFlags) callconv(.c) void;
pub const PFN_cmdSetDeviceMask = ?*const fn (CommandBuffer, u32) callconv(.c) void;
pub const PFN_cmdDispatchBase = ?*const fn (CommandBuffer, u32, u32, u32, u32, u32, u32) callconv(.c) void;
pub const PFN_enumeratePhysicalDeviceGroups = ?*const fn (Instance, [*c]u32, [*c]PhysicalDeviceGroupProperties) callconv(.c) Result;
pub const PFN_getImageMemoryRequirements2 = ?*const fn (Device, [*c]const ImageMemoryRequirementsInfo2, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getBufferMemoryRequirements2 = ?*const fn (Device, [*c]const BufferMemoryRequirementsInfo2, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getImageSparseMemoryRequirements2 = ?*const fn (Device, [*c]const ImageSparseMemoryRequirementsInfo2, [*c]u32, [*c]SparseImageMemoryRequirements2) callconv(.c) void;
pub const PFN_getPhysicalDeviceFeatures2 = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceFeatures2) callconv(.c) void;
pub const PFN_getPhysicalDeviceProperties2 = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceFormatProperties2 = ?*const fn (PhysicalDevice, Format, [*c]FormatProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceImageFormatProperties2 = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceImageFormatInfo2, [*c]ImageFormatProperties2) callconv(.c) Result;
pub const PFN_getPhysicalDeviceQueueFamilyProperties2 = ?*const fn (PhysicalDevice, [*c]u32, [*c]QueueFamilyProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceMemoryProperties2 = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceMemoryProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceSparseImageFormatProperties2 = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceSparseImageFormatInfo2, [*c]u32, [*c]SparseImageFormatProperties2) callconv(.c) void;
pub const PFN_trimCommandPool = ?*const fn (Device, CommandPool, CommandPoolTrimFlags) callconv(.c) void;
pub const PFN_getDeviceQueue2 = ?*const fn (Device, [*c]const DeviceQueueInfo2, [*c]Queue) callconv(.c) void;
pub const PFN_createSamplerYcbcrConversion = ?*const fn (Device, [*c]const SamplerYcbcrConversionCreateInfo, [*c]const AllocationCallbacks, [*c]SamplerYcbcrConversion) callconv(.c) Result;
pub const PFN_destroySamplerYcbcrConversion = ?*const fn (Device, SamplerYcbcrConversion, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createDescriptorUpdateTemplate = ?*const fn (Device, [*c]const DescriptorUpdateTemplateCreateInfo, [*c]const AllocationCallbacks, [*c]DescriptorUpdateTemplate) callconv(.c) Result;
pub const PFN_destroyDescriptorUpdateTemplate = ?*const fn (Device, DescriptorUpdateTemplate, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_updateDescriptorSetWithTemplate = ?*const fn (Device, DescriptorSet, DescriptorUpdateTemplate, ?*const anyopaque) callconv(.c) void;
pub const PFN_getPhysicalDeviceExternalBufferProperties = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceExternalBufferInfo, [*c]ExternalBufferProperties) callconv(.c) void;
pub const PFN_getPhysicalDeviceExternalFenceProperties = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceExternalFenceInfo, [*c]ExternalFenceProperties) callconv(.c) void;
pub const PFN_getPhysicalDeviceExternalSemaphoreProperties = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceExternalSemaphoreInfo, [*c]ExternalSemaphoreProperties) callconv(.c) void;
pub const PFN_getDescriptorSetLayoutSupport = ?*const fn (Device, [*c]const DescriptorSetLayoutCreateInfo, [*c]DescriptorSetLayoutSupport) callconv(.c) void;
pub extern fn enumerateInstanceVersion(p_api_version: [*c]u32) Result;
pub extern fn bindBufferMemory2(device: Device, bind_info_count: u32, p_bind_infos: [*c]const BindBufferMemoryInfo) Result;
pub extern fn bindImageMemory2(device: Device, bind_info_count: u32, p_bind_infos: [*c]const BindImageMemoryInfo) Result;
pub extern fn getDeviceGroupPeerMemoryFeatures(device: Device, heap_index: u32, local_device_index: u32, remote_device_index: u32, p_peer_memory_features: [*c]PeerMemoryFeatureFlags) void;
pub extern fn cmdSetDeviceMask(command_buffer: CommandBuffer, device_mask: u32) void;
pub extern fn cmdDispatchBase(command_buffer: CommandBuffer, base_group_x: u32, base_group_y: u32, base_group_z: u32, group_count_x: u32, group_count_y: u32, group_count_z: u32) void;
pub extern fn enumeratePhysicalDeviceGroups(instance: Instance, p_physical_device_group_count: [*c]u32, p_physical_device_group_properties: [*c]PhysicalDeviceGroupProperties) Result;
pub extern fn getImageMemoryRequirements2(device: Device, p_info: [*c]const ImageMemoryRequirementsInfo2, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getBufferMemoryRequirements2(device: Device, p_info: [*c]const BufferMemoryRequirementsInfo2, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getImageSparseMemoryRequirements2(device: Device, p_info: [*c]const ImageSparseMemoryRequirementsInfo2, p_sparse_memory_requirement_count: [*c]u32, p_sparse_memory_requirements: [*c]SparseImageMemoryRequirements2) void;
pub extern fn getPhysicalDeviceFeatures2(physical_device: PhysicalDevice, p_features: [*c]PhysicalDeviceFeatures2) void;
pub extern fn getPhysicalDeviceProperties2(physical_device: PhysicalDevice, p_properties: [*c]PhysicalDeviceProperties2) void;
pub extern fn getPhysicalDeviceFormatProperties2(physical_device: PhysicalDevice, format: Format, p_format_properties: [*c]FormatProperties2) void;
pub extern fn getPhysicalDeviceImageFormatProperties2(physical_device: PhysicalDevice, p_image_format_info: [*c]const PhysicalDeviceImageFormatInfo2, p_image_format_properties: [*c]ImageFormatProperties2) Result;
pub extern fn getPhysicalDeviceQueueFamilyProperties2(physical_device: PhysicalDevice, p_queue_family_property_count: [*c]u32, p_queue_family_properties: [*c]QueueFamilyProperties2) void;
pub extern fn getPhysicalDeviceMemoryProperties2(physical_device: PhysicalDevice, p_memory_properties: [*c]PhysicalDeviceMemoryProperties2) void;
pub extern fn getPhysicalDeviceSparseImageFormatProperties2(physical_device: PhysicalDevice, p_format_info: [*c]const PhysicalDeviceSparseImageFormatInfo2, p_property_count: [*c]u32, p_properties: [*c]SparseImageFormatProperties2) void;
pub extern fn trimCommandPool(device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags) void;
pub extern fn getDeviceQueue2(device: Device, p_queue_info: [*c]const DeviceQueueInfo2, p_queue: [*c]Queue) void;
pub extern fn createSamplerYcbcrConversion(device: Device, p_create_info: [*c]const SamplerYcbcrConversionCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_ycbcr_conversion: [*c]SamplerYcbcrConversion) Result;
pub extern fn destroySamplerYcbcrConversion(device: Device, ycbcr_conversion: SamplerYcbcrConversion, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createDescriptorUpdateTemplate(device: Device, p_create_info: [*c]const DescriptorUpdateTemplateCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_descriptor_update_template: [*c]DescriptorUpdateTemplate) Result;
pub extern fn destroyDescriptorUpdateTemplate(device: Device, descriptor_update_template: DescriptorUpdateTemplate, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn updateDescriptorSetWithTemplate(device: Device, descriptor_set: DescriptorSet, descriptor_update_template: DescriptorUpdateTemplate, p_data: ?*const anyopaque) void;
pub extern fn getPhysicalDeviceExternalBufferProperties(physical_device: PhysicalDevice, p_external_buffer_info: [*c]const PhysicalDeviceExternalBufferInfo, p_external_buffer_properties: [*c]ExternalBufferProperties) void;
pub extern fn getPhysicalDeviceExternalFenceProperties(physical_device: PhysicalDevice, p_external_fence_info: [*c]const PhysicalDeviceExternalFenceInfo, p_external_fence_properties: [*c]ExternalFenceProperties) void;
pub extern fn getPhysicalDeviceExternalSemaphoreProperties(physical_device: PhysicalDevice, p_external_semaphore_info: [*c]const PhysicalDeviceExternalSemaphoreInfo, p_external_semaphore_properties: [*c]ExternalSemaphoreProperties) void;
pub extern fn getDescriptorSetLayoutSupport(device: Device, p_create_info: [*c]const DescriptorSetLayoutCreateInfo, p_support: [*c]DescriptorSetLayoutSupport) void;
pub const DriverId = enum(u32) {
    null = 0,
    amd_proprietary = 1,
    amd_open_source = 2,
    mesa_radv = 3,
    nvidia_proprietary_khr = 4,
    intel_proprietary_windows_khr = 5,
    intel_open_source_mesa_khr = 6,
    imagination_proprietary_khr = 7,
    qualcomm_proprietary_khr = 8,
    arm_proprietary = 9,
    google_swiftshader = 10,
    ggp_proprietary = 11,
    broadcom_proprietary = 12,
    mesa_llvmpipe = 13,
    moltenvk = 14,
    coreavi_proprietary = 15,
    juice_proprietary = 16,
    verisilicon_proprietary = 17,
    mesa_turnip = 18,
    mesa_v3dv = 19,
    mesa_panvk = 20,
    samsung_proprietary = 21,
    mesa_venus = 22,
    mesa_dozen = 23,
    mesa_nvk = 24,
    imagination_open_source_mesa = 25,
    mesa_honeykrisp = 26,
    reserved_27 = 27,
    pub const Self = @This();
    pub const amd_proprietary_khr = Self.amd_proprietary;
    pub const amd_open_source_khr = Self.amd_open_source;
    pub const mesa_radv_khr = Self.mesa_radv;
    pub const nvidia_proprietary = Self.nvidia_proprietary_khr;
    pub const intel_proprietary_windows = Self.intel_proprietary_windows_khr;
    pub const intel_open_source_mesa = Self.intel_open_source_mesa_khr;
    pub const imagination_proprietary = Self.imagination_proprietary_khr;
    pub const qualcomm_proprietary = Self.qualcomm_proprietary_khr;
    pub const arm_proprietary_khr = Self.arm_proprietary;
    pub const google_swiftshader_khr = Self.google_swiftshader;
    pub const ggp_proprietary_khr = Self.ggp_proprietary;
    pub const broadcom_proprietary_khr = Self.broadcom_proprietary;
};
pub const ShaderFloatControlsIndependence = enum(u32) {
    @"32_bit_only_khr" = 0,
    all_khr = 1,
    none_khr = 2,
    pub const Self = @This();
    pub const @"32_bit_only" = Self.@"32_bit_only_khr";
    pub const all = Self.all_khr;
    pub const none = Self.none_khr;
};
pub const SamplerReductionMode = enum(u32) {
    weighted_average_ext = 0,
    min_ext = 1,
    max_ext = 2,
    weighted_average_rangeclamp_qcom = 1000521000,
    pub const Self = @This();
    pub const weighted_average = Self.weighted_average_ext;
    pub const min = Self.min_ext;
    pub const max = Self.max_ext;
};
pub const SemaphoreType = enum(u32) {
    binary_khr = 0,
    timeline_khr = 1,
    pub const Self = @This();
    pub const binary = Self.binary_khr;
    pub const timeline = Self.timeline_khr;
};
pub const ResolveModeFlags = enum(u32) {
    none_khr = 0,
    sample_zero_bit_khr = 1,
    average_bit_khr = 2,
    min_bit_khr = 4,
    max_bit_khr = 8,
    external_format_downsample_android = 16,
    pub const Self = @This();
    pub const none = Self.none_khr;
    pub const sample_zero_bit = Self.sample_zero_bit_khr;
    pub const average_bit = Self.average_bit_khr;
    pub const min_bit = Self.min_bit_khr;
    pub const max_bit = Self.max_bit_khr;
};
pub const DescriptorBindingFlags = enum(u32) {
    null = 0,
    update_after_bind_bit_ext = 1,
    update_unused_while_pending_bit_ext = 2,
    partially_bound_bit_ext = 4,
    variable_descriptor_count_bit_ext = 8,
    pub const Self = @This();
    pub const update_after_bind_bit = Self.update_after_bind_bit_ext;
    pub const update_unused_while_pending_bit = Self.update_unused_while_pending_bit_ext;
    pub const partially_bound_bit = Self.partially_bound_bit_ext;
    pub const variable_descriptor_count_bit = Self.variable_descriptor_count_bit_ext;
};
pub const SemaphoreWaitFlags = enum(u32) {
    null = 0,
    any_bit_khr = 1,
    pub const Self = @This();
    pub const any_bit = Self.any_bit_khr;
};
pub const PhysicalDeviceVulkan11Features = extern struct {
    s_type: StructureType = StructureType.physical_device_vulkan11features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    storage_buffer16bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_and_storage_buffer16bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_push_constant16: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_input_output16: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview_geometry_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview_tessellation_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    variable_pointers_storage_buffer: Bool32 = @import("std").mem.zeroes(Bool32),
    variable_pointers: Bool32 = @import("std").mem.zeroes(Bool32),
    protected_memory: Bool32 = @import("std").mem.zeroes(Bool32),
    sampler_ycbcr_conversion: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_draw_parameters: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVulkan11Properties = extern struct {
    s_type: StructureType = StructureType.physical_device_vulkan11properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    driver_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    device_luid: [8]u8 = @import("std").mem.zeroes([8]u8),
    device_node_mask: u32 = @import("std").mem.zeroes(u32),
    device_luidvalid: Bool32 = @import("std").mem.zeroes(Bool32),
    subgroup_size: u32 = @import("std").mem.zeroes(u32),
    subgroup_supported_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    subgroup_supported_operations: SubgroupFeatureFlags = @import("std").mem.zeroes(SubgroupFeatureFlags),
    subgroup_quad_operations_in_all_stages: Bool32 = @import("std").mem.zeroes(Bool32),
    point_clipping_behavior: PointClippingBehavior = @import("std").mem.zeroes(PointClippingBehavior),
    max_multiview_view_count: u32 = @import("std").mem.zeroes(u32),
    max_multiview_instance_index: u32 = @import("std").mem.zeroes(u32),
    protected_no_fault: Bool32 = @import("std").mem.zeroes(Bool32),
    max_per_set_descriptors: u32 = @import("std").mem.zeroes(u32),
    max_memory_allocation_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PhysicalDeviceVulkan12Features = extern struct {
    s_type: StructureType = StructureType.physical_device_vulkan12features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    sampler_mirror_clamp_to_edge: Bool32 = @import("std").mem.zeroes(Bool32),
    draw_indirect_count: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_buffer8bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_and_storage_buffer8bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_push_constant8: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_int64atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_int64atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_int8: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_input_attachment_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_texel_buffer_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_texel_buffer_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_sampled_image_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_input_attachment_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_texel_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_texel_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_uniform_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_sampled_image_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_storage_image_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_storage_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_uniform_texel_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_storage_texel_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_update_unused_while_pending: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_partially_bound: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_variable_descriptor_count: Bool32 = @import("std").mem.zeroes(Bool32),
    runtime_descriptor_array: Bool32 = @import("std").mem.zeroes(Bool32),
    sampler_filter_minmax: Bool32 = @import("std").mem.zeroes(Bool32),
    scalar_block_layout: Bool32 = @import("std").mem.zeroes(Bool32),
    imageless_framebuffer: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_buffer_standard_layout: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_subgroup_extended_types: Bool32 = @import("std").mem.zeroes(Bool32),
    separate_depth_stencil_layouts: Bool32 = @import("std").mem.zeroes(Bool32),
    host_query_reset: Bool32 = @import("std").mem.zeroes(Bool32),
    timeline_semaphore: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address_multi_device: Bool32 = @import("std").mem.zeroes(Bool32),
    vulkan_memory_model: Bool32 = @import("std").mem.zeroes(Bool32),
    vulkan_memory_model_device_scope: Bool32 = @import("std").mem.zeroes(Bool32),
    vulkan_memory_model_availability_visibility_chains: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_output_viewport_index: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_output_layer: Bool32 = @import("std").mem.zeroes(Bool32),
    subgroup_broadcast_dynamic_id: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ConformanceVersion = extern struct {
    major: u8 = @import("std").mem.zeroes(u8),
    minor: u8 = @import("std").mem.zeroes(u8),
    subminor: u8 = @import("std").mem.zeroes(u8),
    patch: u8 = @import("std").mem.zeroes(u8),
};
pub const PhysicalDeviceVulkan12Properties = extern struct {
    s_type: StructureType = StructureType.physical_device_vulkan12properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    driver_id: DriverId = @import("std").mem.zeroes(DriverId),
    driver_name: [256]u8 = @import("std").mem.zeroes([256]u8),
    driver_info: [256]u8 = @import("std").mem.zeroes([256]u8),
    conformance_version: ConformanceVersion = @import("std").mem.zeroes(ConformanceVersion),
    denorm_behavior_independence: ShaderFloatControlsIndependence = @import("std").mem.zeroes(ShaderFloatControlsIndependence),
    rounding_mode_independence: ShaderFloatControlsIndependence = @import("std").mem.zeroes(ShaderFloatControlsIndependence),
    shader_signed_zero_inf_nan_preserve_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_signed_zero_inf_nan_preserve_float32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_signed_zero_inf_nan_preserve_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_preserve_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_preserve_float32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_preserve_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_flush_to_zero_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_flush_to_zero_float32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_flush_to_zero_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtefloat16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtefloat32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtefloat64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtzfloat16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtzfloat32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtzfloat64: Bool32 = @import("std").mem.zeroes(Bool32),
    max_update_after_bind_descriptors_in_all_pools: u32 = @import("std").mem.zeroes(u32),
    shader_uniform_buffer_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_sampled_image_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_buffer_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_input_attachment_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    robust_buffer_access_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    quad_divergent_implicit_lod: Bool32 = @import("std").mem.zeroes(Bool32),
    max_per_stage_descriptor_update_after_bind_samplers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_uniform_buffers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_storage_buffers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_sampled_images: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_storage_images: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_input_attachments: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_update_after_bind_resources: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_samplers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_uniform_buffers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_uniform_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_storage_buffers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_storage_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_sampled_images: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_storage_images: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_input_attachments: u32 = @import("std").mem.zeroes(u32),
    supported_depth_resolve_modes: ResolveModeFlags = @import("std").mem.zeroes(ResolveModeFlags),
    supported_stencil_resolve_modes: ResolveModeFlags = @import("std").mem.zeroes(ResolveModeFlags),
    independent_resolve_none: Bool32 = @import("std").mem.zeroes(Bool32),
    independent_resolve: Bool32 = @import("std").mem.zeroes(Bool32),
    filter_minmax_single_component_formats: Bool32 = @import("std").mem.zeroes(Bool32),
    filter_minmax_image_component_mapping: Bool32 = @import("std").mem.zeroes(Bool32),
    max_timeline_semaphore_value_difference: u64 = @import("std").mem.zeroes(u64),
    framebuffer_integer_color_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
};
pub const ImageFormatListCreateInfo = extern struct {
    s_type: StructureType = StructureType.image_format_list_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    view_format_count: u32 = @import("std").mem.zeroes(u32),
    p_view_formats: [*c]const Format = @import("std").mem.zeroes([*c]const Format),
};
pub const AttachmentDescription2 = extern struct {
    s_type: StructureType = StructureType.attachment_description2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: AttachmentDescriptionFlags = @import("std").mem.zeroes(AttachmentDescriptionFlags),
    format: Format = @import("std").mem.zeroes(Format),
    samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    load_op: AttachmentLoadOp = @import("std").mem.zeroes(AttachmentLoadOp),
    store_op: AttachmentStoreOp = @import("std").mem.zeroes(AttachmentStoreOp),
    stencil_load_op: AttachmentLoadOp = @import("std").mem.zeroes(AttachmentLoadOp),
    stencil_store_op: AttachmentStoreOp = @import("std").mem.zeroes(AttachmentStoreOp),
    initial_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    final_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const AttachmentReference2 = extern struct {
    s_type: StructureType = StructureType.attachment_reference2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    attachment: u32 = @import("std").mem.zeroes(u32),
    layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    aspect_mask: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
};
pub const SubpassDescription2 = extern struct {
    s_type: StructureType = StructureType.subpass_description2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: SubpassDescriptionFlags = @import("std").mem.zeroes(SubpassDescriptionFlags),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    view_mask: u32 = @import("std").mem.zeroes(u32),
    input_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_input_attachments: [*c]const AttachmentReference2 = @import("std").mem.zeroes([*c]const AttachmentReference2),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachments: [*c]const AttachmentReference2 = @import("std").mem.zeroes([*c]const AttachmentReference2),
    p_resolve_attachments: [*c]const AttachmentReference2 = @import("std").mem.zeroes([*c]const AttachmentReference2),
    p_depth_stencil_attachment: [*c]const AttachmentReference2 = @import("std").mem.zeroes([*c]const AttachmentReference2),
    preserve_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_preserve_attachments: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const SubpassDependency2 = extern struct {
    s_type: StructureType = StructureType.subpass_dependency2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_subpass: u32 = @import("std").mem.zeroes(u32),
    dst_subpass: u32 = @import("std").mem.zeroes(u32),
    src_stage_mask: PipelineStageFlags = @import("std").mem.zeroes(PipelineStageFlags),
    dst_stage_mask: PipelineStageFlags = @import("std").mem.zeroes(PipelineStageFlags),
    src_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dst_access_mask: AccessFlags = @import("std").mem.zeroes(AccessFlags),
    dependency_flags: DependencyFlags = @import("std").mem.zeroes(DependencyFlags),
    view_offset: i32 = @import("std").mem.zeroes(i32),
};
pub const RenderPassCreateInfo2 = extern struct {
    s_type: StructureType = StructureType.render_pass_create_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: RenderPassCreateFlags = @import("std").mem.zeroes(RenderPassCreateFlags),
    attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_attachments: [*c]const AttachmentDescription2 = @import("std").mem.zeroes([*c]const AttachmentDescription2),
    subpass_count: u32 = @import("std").mem.zeroes(u32),
    p_subpasses: [*c]const SubpassDescription2 = @import("std").mem.zeroes([*c]const SubpassDescription2),
    dependency_count: u32 = @import("std").mem.zeroes(u32),
    p_dependencies: [*c]const SubpassDependency2 = @import("std").mem.zeroes([*c]const SubpassDependency2),
    correlated_view_mask_count: u32 = @import("std").mem.zeroes(u32),
    p_correlated_view_masks: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const SubpassBeginInfo = extern struct {
    s_type: StructureType = StructureType.subpass_begin_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    contents: SubpassContents = @import("std").mem.zeroes(SubpassContents),
};
pub const SubpassEndInfo = extern struct {
    s_type: StructureType = StructureType.subpass_end_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const PhysicalDevice8BitStorageFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device8bit_storage_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    storage_buffer8bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_and_storage_buffer8bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_push_constant8: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceDriverProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_driver_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    driver_id: DriverId = @import("std").mem.zeroes(DriverId),
    driver_name: [256]u8 = @import("std").mem.zeroes([256]u8),
    driver_info: [256]u8 = @import("std").mem.zeroes([256]u8),
    conformance_version: ConformanceVersion = @import("std").mem.zeroes(ConformanceVersion),
};
pub const PhysicalDeviceShaderAtomicInt64Features = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_atomic_int64features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_buffer_int64atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_int64atomics: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderFloat16Int8Features = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_float16int8features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_int8: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFloatControlsProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_float_controls_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    denorm_behavior_independence: ShaderFloatControlsIndependence = @import("std").mem.zeroes(ShaderFloatControlsIndependence),
    rounding_mode_independence: ShaderFloatControlsIndependence = @import("std").mem.zeroes(ShaderFloatControlsIndependence),
    shader_signed_zero_inf_nan_preserve_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_signed_zero_inf_nan_preserve_float32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_signed_zero_inf_nan_preserve_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_preserve_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_preserve_float32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_preserve_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_flush_to_zero_float16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_flush_to_zero_float32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_denorm_flush_to_zero_float64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtefloat16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtefloat32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtefloat64: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtzfloat16: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtzfloat32: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_rounding_mode_rtzfloat64: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DescriptorSetLayoutBindingFlagsCreateInfo = extern struct {
    s_type: StructureType = StructureType.descriptor_set_layout_binding_flags_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    binding_count: u32 = @import("std").mem.zeroes(u32),
    p_binding_flags: [*c]const DescriptorBindingFlags = @import("std").mem.zeroes([*c]const DescriptorBindingFlags),
};
pub const PhysicalDeviceDescriptorIndexingFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_descriptor_indexing_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_input_attachment_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_texel_buffer_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_texel_buffer_array_dynamic_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_sampled_image_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_input_attachment_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_uniform_texel_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_texel_buffer_array_non_uniform_indexing: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_uniform_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_sampled_image_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_storage_image_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_storage_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_uniform_texel_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_storage_texel_buffer_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_update_unused_while_pending: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_partially_bound: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_variable_descriptor_count: Bool32 = @import("std").mem.zeroes(Bool32),
    runtime_descriptor_array: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceDescriptorIndexingProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_descriptor_indexing_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_update_after_bind_descriptors_in_all_pools: u32 = @import("std").mem.zeroes(u32),
    shader_uniform_buffer_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_sampled_image_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_buffer_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_storage_image_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_input_attachment_array_non_uniform_indexing_native: Bool32 = @import("std").mem.zeroes(Bool32),
    robust_buffer_access_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    quad_divergent_implicit_lod: Bool32 = @import("std").mem.zeroes(Bool32),
    max_per_stage_descriptor_update_after_bind_samplers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_uniform_buffers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_storage_buffers: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_sampled_images: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_storage_images: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_input_attachments: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_update_after_bind_resources: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_samplers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_uniform_buffers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_uniform_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_storage_buffers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_storage_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_sampled_images: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_storage_images: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_input_attachments: u32 = @import("std").mem.zeroes(u32),
};
pub const DescriptorSetVariableDescriptorCountAllocateInfo = extern struct {
    s_type: StructureType = StructureType.descriptor_set_variable_descriptor_count_allocate_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    descriptor_set_count: u32 = @import("std").mem.zeroes(u32),
    p_descriptor_counts: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const DescriptorSetVariableDescriptorCountLayoutSupport = extern struct {
    s_type: StructureType = StructureType.descriptor_set_variable_descriptor_count_layout_support,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_variable_descriptor_count: u32 = @import("std").mem.zeroes(u32),
};
pub const SubpassDescriptionDepthStencilResolve = extern struct {
    s_type: StructureType = StructureType.subpass_description_depth_stencil_resolve,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    depth_resolve_mode: ResolveModeFlags = @import("std").mem.zeroes(ResolveModeFlags),
    stencil_resolve_mode: ResolveModeFlags = @import("std").mem.zeroes(ResolveModeFlags),
    p_depth_stencil_resolve_attachment: [*c]const AttachmentReference2 = @import("std").mem.zeroes([*c]const AttachmentReference2),
};
pub const PhysicalDeviceDepthStencilResolveProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_depth_stencil_resolve_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supported_depth_resolve_modes: ResolveModeFlags = @import("std").mem.zeroes(ResolveModeFlags),
    supported_stencil_resolve_modes: ResolveModeFlags = @import("std").mem.zeroes(ResolveModeFlags),
    independent_resolve_none: Bool32 = @import("std").mem.zeroes(Bool32),
    independent_resolve: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceScalarBlockLayoutFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_scalar_block_layout_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    scalar_block_layout: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ImageStencilUsageCreateInfo = extern struct {
    s_type: StructureType = StructureType.image_stencil_usage_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stencil_usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
};
pub const SamplerReductionModeCreateInfo = extern struct {
    s_type: StructureType = StructureType.sampler_reduction_mode_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    reduction_mode: SamplerReductionMode = @import("std").mem.zeroes(SamplerReductionMode),
};
pub const PhysicalDeviceSamplerFilterMinmaxProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_sampler_filter_minmax_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    filter_minmax_single_component_formats: Bool32 = @import("std").mem.zeroes(Bool32),
    filter_minmax_image_component_mapping: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVulkanMemoryModelFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_vulkan_memory_model_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    vulkan_memory_model: Bool32 = @import("std").mem.zeroes(Bool32),
    vulkan_memory_model_device_scope: Bool32 = @import("std").mem.zeroes(Bool32),
    vulkan_memory_model_availability_visibility_chains: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImagelessFramebufferFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_imageless_framebuffer_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    imageless_framebuffer: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const FramebufferAttachmentImageInfo = extern struct {
    s_type: StructureType = StructureType.framebuffer_attachment_image_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ImageCreateFlags = @import("std").mem.zeroes(ImageCreateFlags),
    usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
    layer_count: u32 = @import("std").mem.zeroes(u32),
    view_format_count: u32 = @import("std").mem.zeroes(u32),
    p_view_formats: [*c]const Format = @import("std").mem.zeroes([*c]const Format),
};
pub const FramebufferAttachmentsCreateInfo = extern struct {
    s_type: StructureType = StructureType.framebuffer_attachments_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    attachment_image_info_count: u32 = @import("std").mem.zeroes(u32),
    p_attachment_image_infos: [*c]const FramebufferAttachmentImageInfo = @import("std").mem.zeroes([*c]const FramebufferAttachmentImageInfo),
};
pub const RenderPassAttachmentBeginInfo = extern struct {
    s_type: StructureType = StructureType.render_pass_attachment_begin_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_attachments: [*c]const ImageView = @import("std").mem.zeroes([*c]const ImageView),
};
pub const PhysicalDeviceUniformBufferStandardLayoutFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_uniform_buffer_standard_layout_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    uniform_buffer_standard_layout: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderSubgroupExtendedTypesFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_subgroup_extended_types_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_subgroup_extended_types: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceSeparateDepthStencilLayoutsFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_separate_depth_stencil_layouts_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    separate_depth_stencil_layouts: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const AttachmentReferenceStencilLayout = extern struct {
    s_type: StructureType = StructureType.attachment_reference_stencil_layout,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    stencil_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const AttachmentDescriptionStencilLayout = extern struct {
    s_type: StructureType = StructureType.attachment_description_stencil_layout,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    stencil_initial_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    stencil_final_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const PhysicalDeviceHostQueryResetFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_host_query_reset_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    host_query_reset: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceTimelineSemaphoreFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_timeline_semaphore_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    timeline_semaphore: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceTimelineSemaphoreProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_timeline_semaphore_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_timeline_semaphore_value_difference: u64 = @import("std").mem.zeroes(u64),
};
pub const SemaphoreTypeCreateInfo = extern struct {
    s_type: StructureType = StructureType.semaphore_type_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    semaphore_type: SemaphoreType = @import("std").mem.zeroes(SemaphoreType),
    initial_value: u64 = @import("std").mem.zeroes(u64),
};
pub const TimelineSemaphoreSubmitInfo = extern struct {
    s_type: StructureType = StructureType.timeline_semaphore_submit_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    wait_semaphore_value_count: u32 = @import("std").mem.zeroes(u32),
    p_wait_semaphore_values: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
    signal_semaphore_value_count: u32 = @import("std").mem.zeroes(u32),
    p_signal_semaphore_values: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
};
pub const SemaphoreWaitInfo = extern struct {
    s_type: StructureType = StructureType.semaphore_wait_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: SemaphoreWaitFlags = @import("std").mem.zeroes(SemaphoreWaitFlags),
    semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_semaphores: [*c]const Semaphore = @import("std").mem.zeroes([*c]const Semaphore),
    p_values: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
};
pub const SemaphoreSignalInfo = extern struct {
    s_type: StructureType = StructureType.semaphore_signal_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    semaphore: Semaphore = @import("std").mem.zeroes(Semaphore),
    value: u64 = @import("std").mem.zeroes(u64),
};
pub const PhysicalDeviceBufferDeviceAddressFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_buffer_device_address_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    buffer_device_address: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address_multi_device: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const BufferDeviceAddressInfo = extern struct {
    s_type: StructureType = StructureType.buffer_device_address_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
};
pub const BufferOpaqueCaptureAddressCreateInfo = extern struct {
    s_type: StructureType = StructureType.buffer_opaque_capture_address_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    opaque_capture_address: u64 = @import("std").mem.zeroes(u64),
};
pub const MemoryOpaqueCaptureAddressAllocateInfo = extern struct {
    s_type: StructureType = StructureType.memory_opaque_capture_address_allocate_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    opaque_capture_address: u64 = @import("std").mem.zeroes(u64),
};
pub const DeviceMemoryOpaqueCaptureAddressInfo = extern struct {
    s_type: StructureType = StructureType.device_memory_opaque_capture_address_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
};
pub const PFN_cmdDrawIndirectCount = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndexedIndirectCount = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_createRenderPass2 = ?*const fn (Device, [*c]const RenderPassCreateInfo2, [*c]const AllocationCallbacks, [*c]RenderPass) callconv(.c) Result;
pub const PFN_cmdBeginRenderPass2 = ?*const fn (CommandBuffer, [*c]const RenderPassBeginInfo, [*c]const SubpassBeginInfo) callconv(.c) void;
pub const PFN_cmdNextSubpass2 = ?*const fn (CommandBuffer, [*c]const SubpassBeginInfo, [*c]const SubpassEndInfo) callconv(.c) void;
pub const PFN_cmdEndRenderPass2 = ?*const fn (CommandBuffer, [*c]const SubpassEndInfo) callconv(.c) void;
pub const PFN_resetQueryPool = ?*const fn (Device, QueryPool, u32, u32) callconv(.c) void;
pub const PFN_getSemaphoreCounterValue = ?*const fn (Device, Semaphore, [*c]u64) callconv(.c) Result;
pub const PFN_waitSemaphores = ?*const fn (Device, [*c]const SemaphoreWaitInfo, u64) callconv(.c) Result;
pub const PFN_signalSemaphore = ?*const fn (Device, [*c]const SemaphoreSignalInfo) callconv(.c) Result;
pub const PFN_getBufferDeviceAddress = ?*const fn (Device, [*c]const BufferDeviceAddressInfo) callconv(.c) DeviceAddress;
pub const PFN_getBufferOpaqueCaptureAddress = ?*const fn (Device, [*c]const BufferDeviceAddressInfo) callconv(.c) u64;
pub const PFN_getDeviceMemoryOpaqueCaptureAddress = ?*const fn (Device, [*c]const DeviceMemoryOpaqueCaptureAddressInfo) callconv(.c) u64;
pub extern fn cmdDrawIndirectCount(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_buffer_offset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub extern fn cmdDrawIndexedIndirectCount(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_buffer_offset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub extern fn createRenderPass2(device: Device, p_create_info: [*c]const RenderPassCreateInfo2, p_allocator: [*c]const AllocationCallbacks, p_render_pass: [*c]RenderPass) Result;
pub extern fn cmdBeginRenderPass2(command_buffer: CommandBuffer, p_render_pass_begin: [*c]const RenderPassBeginInfo, p_subpass_begin_info: [*c]const SubpassBeginInfo) void;
pub extern fn cmdNextSubpass2(command_buffer: CommandBuffer, p_subpass_begin_info: [*c]const SubpassBeginInfo, p_subpass_end_info: [*c]const SubpassEndInfo) void;
pub extern fn cmdEndRenderPass2(command_buffer: CommandBuffer, p_subpass_end_info: [*c]const SubpassEndInfo) void;
pub extern fn resetQueryPool(device: Device, query_pool: QueryPool, first_query: u32, query_count: u32) void;
pub extern fn getSemaphoreCounterValue(device: Device, semaphore: Semaphore, p_value: [*c]u64) Result;
pub extern fn waitSemaphores(device: Device, p_wait_info: [*c]const SemaphoreWaitInfo, timeout: u64) Result;
pub extern fn signalSemaphore(device: Device, p_signal_info: [*c]const SemaphoreSignalInfo) Result;
pub extern fn getBufferDeviceAddress(device: Device, p_info: [*c]const BufferDeviceAddressInfo) DeviceAddress;
pub extern fn getBufferOpaqueCaptureAddress(device: Device, p_info: [*c]const BufferDeviceAddressInfo) u64;
pub extern fn getDeviceMemoryOpaqueCaptureAddress(device: Device, p_info: [*c]const DeviceMemoryOpaqueCaptureAddressInfo) u64;
pub const Flags64 = u64;
pub const PrivateDataSlot = enum(u64) { null = 0, _ };
pub const PipelineCreationFeedbackFlags = enum(u32) {
    null = 0,
    valid_bit_ext = 1,
    application_pipeline_cache_hit_bit_ext = 2,
    base_pipeline_acceleration_bit_ext = 4,
    pub const Self = @This();
    pub const valid_bit = Self.valid_bit_ext;
    pub const application_pipeline_cache_hit_bit = Self.application_pipeline_cache_hit_bit_ext;
    pub const base_pipeline_acceleration_bit = Self.base_pipeline_acceleration_bit_ext;
};
pub const ToolPurposeFlags = enum(u32) {
    null = 0,
    validation_bit_ext = 1,
    profiling_bit_ext = 2,
    tracing_bit_ext = 4,
    additional_features_bit_ext = 8,
    modifying_features_bit_ext = 16,
    debug_reporting_bit_ext = 32,
    debug_markers_bit_ext = 64,
    pub const Self = @This();
    pub const validation_bit = Self.validation_bit_ext;
    pub const profiling_bit = Self.profiling_bit_ext;
    pub const tracing_bit = Self.tracing_bit_ext;
    pub const additional_features_bit = Self.additional_features_bit_ext;
    pub const modifying_features_bit = Self.modifying_features_bit_ext;
};
pub const PrivateDataSlotCreateFlags = Flags;
pub const PipelineStageFlags2 = enum(u64) {
    none = 0,
    top_of_pipe_bit = 1,
    draw_indirect_bit = 2,
    vertex_input_bit = 4,
    vertex_shader_bit = 8,
    tessellation_control_shader_bit = 16,
    tessellation_evaluation_shader_bit = 32,
    geometry_shader_bit = 64,
    fragment_shader_bit = 128,
    early_fragment_tests_bit = 256,
    late_fragment_tests_bit = 512,
    color_attachment_output_bit = 1024,
    compute_shader_bit = 2048,
    all_transfer_bit = 4096,
    bottom_of_pipe_bit = 8192,
    host_bit = 16384,
    all_graphics_bit = 32768,
    all_commands_bit = 65536,
    copy_bit = 4294967296,
    resolve_bit = 8589934592,
    blit_bit = 17179869184,
    clear_bit = 34359738368,
    index_input_bit = 68719476736,
    vertex_attribute_input_bit = 137438953472,
    pre_rasterization_shaders_bit = 274877906944,
    video_decode_bit_khr = 67108864,
    video_encode_bit_khr = 134217728,
    transform_feedback_bit_ext = 16777216,
    conditional_rendering_bit_ext = 262144,
    command_preprocess_bit_nv = 131072,
    fragment_shading_rate_attachment_bit_khr = 4194304,
    acceleration_structure_build_bit_khr = 33554432,
    ray_tracing_shader_bit_khr = 2097152,
    fragment_density_process_bit_ext = 8388608,
    task_shader_bit_nv = 524288,
    mesh_shader_bit_nv = 1048576,
    subpass_shader_bit_huawei = 549755813888,
    invocation_mask_bit_huawei = 1099511627776,
    acceleration_structure_copy_bit_khr = 268435456,
    micromap_build_bit_ext = 1073741824,
    cluster_culling_shader_bit_huawei = 2199023255552,
    optical_flow_bit_nv = 536870912,
    pub const Self = @This();
    pub const none_khr = Self.none;
    pub const top_of_pipe_bit_khr = Self.top_of_pipe_bit;
    pub const draw_indirect_bit_khr = Self.draw_indirect_bit;
    pub const vertex_input_bit_khr = Self.vertex_input_bit;
    pub const vertex_shader_bit_khr = Self.vertex_shader_bit;
    pub const tessellation_control_shader_bit_khr = Self.tessellation_control_shader_bit;
    pub const tessellation_evaluation_shader_bit_khr = Self.tessellation_evaluation_shader_bit;
    pub const geometry_shader_bit_khr = Self.geometry_shader_bit;
    pub const fragment_shader_bit_khr = Self.fragment_shader_bit;
    pub const early_fragment_tests_bit_khr = Self.early_fragment_tests_bit;
    pub const late_fragment_tests_bit_khr = Self.late_fragment_tests_bit;
    pub const color_attachment_output_bit_khr = Self.color_attachment_output_bit;
    pub const compute_shader_bit_khr = Self.compute_shader_bit;
    pub const all_transfer_bit_khr = Self.all_transfer_bit;
    pub const transfer_bit = Self.all_transfer_bit;
    pub const transfer_bit_khr = Self.all_transfer_bit;
    pub const bottom_of_pipe_bit_khr = Self.bottom_of_pipe_bit;
    pub const host_bit_khr = Self.host_bit;
    pub const all_graphics_bit_khr = Self.all_graphics_bit;
    pub const all_commands_bit_khr = Self.all_commands_bit;
    pub const copy_bit_khr = Self.copy_bit;
    pub const resolve_bit_khr = Self.resolve_bit;
    pub const blit_bit_khr = Self.blit_bit;
    pub const clear_bit_khr = Self.clear_bit;
    pub const index_input_bit_khr = Self.index_input_bit;
    pub const vertex_attribute_input_bit_khr = Self.vertex_attribute_input_bit;
    pub const pre_rasterization_shaders_bit_khr = Self.pre_rasterization_shaders_bit;
    pub const command_preprocess_bit_ext = Self.command_preprocess_bit_nv;
    pub const shading_rate_image_bit_nv = Self.fragment_shading_rate_attachment_bit_khr;
    pub const ray_tracing_shader_bit_nv = Self.ray_tracing_shader_bit_khr;
    pub const acceleration_structure_build_bit_nv = Self.acceleration_structure_build_bit_khr;
    pub const task_shader_bit_ext = Self.task_shader_bit_nv;
    pub const mesh_shader_bit_ext = Self.mesh_shader_bit_nv;
    pub const subpass_shading_bit_huawei = Self.subpass_shader_bit_huawei;
};
pub const AccessFlags2 = enum(u64) {
    none = 0,
    indirect_command_read_bit = 1,
    index_read_bit = 2,
    vertex_attribute_read_bit = 4,
    uniform_read_bit = 8,
    input_attachment_read_bit = 16,
    shader_read_bit = 32,
    shader_write_bit = 64,
    color_attachment_read_bit = 128,
    color_attachment_write_bit = 256,
    depth_stencil_attachment_read_bit = 512,
    depth_stencil_attachment_write_bit = 1024,
    transfer_read_bit = 2048,
    transfer_write_bit = 4096,
    host_read_bit = 8192,
    host_write_bit = 16384,
    memory_read_bit = 32768,
    memory_write_bit = 65536,
    shader_sampled_read_bit = 4294967296,
    shader_storage_read_bit = 8589934592,
    shader_storage_write_bit = 17179869184,
    video_decode_read_bit_khr = 34359738368,
    video_decode_write_bit_khr = 68719476736,
    video_encode_read_bit_khr = 137438953472,
    video_encode_write_bit_khr = 274877906944,
    transform_feedback_write_bit_ext = 33554432,
    transform_feedback_counter_read_bit_ext = 67108864,
    transform_feedback_counter_write_bit_ext = 134217728,
    conditional_rendering_read_bit_ext = 1048576,
    command_preprocess_read_bit_nv = 131072,
    command_preprocess_write_bit_nv = 262144,
    fragment_shading_rate_attachment_read_bit_khr = 8388608,
    acceleration_structure_read_bit_khr = 2097152,
    acceleration_structure_write_bit_khr = 4194304,
    fragment_density_map_read_bit_ext = 16777216,
    color_attachment_read_noncoherent_bit_ext = 524288,
    descriptor_buffer_read_bit_ext = 2199023255552,
    invocation_mask_read_bit_huawei = 549755813888,
    shader_binding_table_read_bit_khr = 1099511627776,
    micromap_read_bit_ext = 17592186044416,
    micromap_write_bit_ext = 35184372088832,
    optical_flow_read_bit_nv = 4398046511104,
    optical_flow_write_bit_nv = 8796093022208,
    pub const Self = @This();
    pub const none_khr = Self.none;
    pub const indirect_command_read_bit_khr = Self.indirect_command_read_bit;
    pub const index_read_bit_khr = Self.index_read_bit;
    pub const vertex_attribute_read_bit_khr = Self.vertex_attribute_read_bit;
    pub const uniform_read_bit_khr = Self.uniform_read_bit;
    pub const input_attachment_read_bit_khr = Self.input_attachment_read_bit;
    pub const shader_read_bit_khr = Self.shader_read_bit;
    pub const shader_write_bit_khr = Self.shader_write_bit;
    pub const color_attachment_read_bit_khr = Self.color_attachment_read_bit;
    pub const color_attachment_write_bit_khr = Self.color_attachment_write_bit;
    pub const depth_stencil_attachment_read_bit_khr = Self.depth_stencil_attachment_read_bit;
    pub const depth_stencil_attachment_write_bit_khr = Self.depth_stencil_attachment_write_bit;
    pub const transfer_read_bit_khr = Self.transfer_read_bit;
    pub const transfer_write_bit_khr = Self.transfer_write_bit;
    pub const host_read_bit_khr = Self.host_read_bit;
    pub const host_write_bit_khr = Self.host_write_bit;
    pub const memory_read_bit_khr = Self.memory_read_bit;
    pub const memory_write_bit_khr = Self.memory_write_bit;
    pub const shader_sampled_read_bit_khr = Self.shader_sampled_read_bit;
    pub const shader_storage_read_bit_khr = Self.shader_storage_read_bit;
    pub const shader_storage_write_bit_khr = Self.shader_storage_write_bit;
    pub const command_preprocess_read_bit_ext = Self.command_preprocess_read_bit_nv;
    pub const command_preprocess_write_bit_ext = Self.command_preprocess_write_bit_nv;
    pub const shading_rate_image_read_bit_nv = Self.fragment_shading_rate_attachment_read_bit_khr;
    pub const acceleration_structure_read_bit_nv = Self.acceleration_structure_read_bit_khr;
    pub const acceleration_structure_write_bit_nv = Self.acceleration_structure_write_bit_khr;
};
pub const SubmitFlags = enum(u32) {
    null = 0,
    protected_bit_khr = 1,
    pub const Self = @This();
    pub const protected_bit = Self.protected_bit_khr;
};
pub const RenderingFlags = enum(u32) {
    null = 0,
    contents_secondary_command_buffers_bit_khr = 1,
    suspending_bit_khr = 2,
    resuming_bit_khr = 4,
    enable_legacy_dithering_bit_ext = 8,
    contents_inline_bit_ext = 16,
    pub const Self = @This();
    pub const contents_secondary_command_buffers_bit = Self.contents_secondary_command_buffers_bit_khr;
    pub const suspending_bit = Self.suspending_bit_khr;
    pub const resuming_bit = Self.resuming_bit_khr;
    pub const contents_inline_bit_khr = Self.contents_inline_bit_ext;
};
pub const FormatFeatureFlags2 = enum(u64) {
    sampled_image_bit = 1,
    storage_image_bit = 2,
    storage_image_atomic_bit = 4,
    uniform_texel_buffer_bit = 8,
    storage_texel_buffer_bit = 16,
    storage_texel_buffer_atomic_bit = 32,
    vertex_buffer_bit = 64,
    color_attachment_bit = 128,
    color_attachment_blend_bit = 256,
    depth_stencil_attachment_bit = 512,
    blit_src_bit = 1024,
    blit_dst_bit = 2048,
    sampled_image_filter_linear_bit = 4096,
    sampled_image_filter_cubic_bit = 8192,
    transfer_src_bit = 16384,
    transfer_dst_bit = 32768,
    sampled_image_filter_minmax_bit = 65536,
    midpoint_chroma_samples_bit = 131072,
    sampled_image_ycbcr_conversion_linear_filter_bit = 262144,
    sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit = 524288,
    sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit = 1048576,
    sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit = 2097152,
    disjoint_bit = 4194304,
    cosited_chroma_samples_bit = 8388608,
    storage_read_without_format_bit = 2147483648,
    storage_write_without_format_bit = 4294967296,
    sampled_image_depth_comparison_bit = 8589934592,
    video_decode_output_bit_khr = 33554432,
    video_decode_dpb_bit_khr = 67108864,
    acceleration_structure_vertex_buffer_bit_khr = 536870912,
    fragment_density_map_bit_ext = 16777216,
    fragment_shading_rate_attachment_bit_khr = 1073741824,
    host_image_transfer_bit_ext = 70368744177664,
    video_encode_input_bit_khr = 134217728,
    video_encode_dpb_bit_khr = 268435456,
    linear_color_attachment_bit_nv = 274877906944,
    weight_image_bit_qcom = 17179869184,
    weight_sampled_image_bit_qcom = 34359738368,
    block_matching_bit_qcom = 68719476736,
    box_filter_sampled_bit_qcom = 137438953472,
    optical_flow_image_bit_nv = 1099511627776,
    optical_flow_vector_bit_nv = 2199023255552,
    optical_flow_cost_bit_nv = 4398046511104,
    pub const Self = @This();
    pub const sampled_image_bit_khr = Self.sampled_image_bit;
    pub const storage_image_bit_khr = Self.storage_image_bit;
    pub const storage_image_atomic_bit_khr = Self.storage_image_atomic_bit;
    pub const uniform_texel_buffer_bit_khr = Self.uniform_texel_buffer_bit;
    pub const storage_texel_buffer_bit_khr = Self.storage_texel_buffer_bit;
    pub const storage_texel_buffer_atomic_bit_khr = Self.storage_texel_buffer_atomic_bit;
    pub const vertex_buffer_bit_khr = Self.vertex_buffer_bit;
    pub const color_attachment_bit_khr = Self.color_attachment_bit;
    pub const color_attachment_blend_bit_khr = Self.color_attachment_blend_bit;
    pub const depth_stencil_attachment_bit_khr = Self.depth_stencil_attachment_bit;
    pub const blit_src_bit_khr = Self.blit_src_bit;
    pub const blit_dst_bit_khr = Self.blit_dst_bit;
    pub const sampled_image_filter_linear_bit_khr = Self.sampled_image_filter_linear_bit;
    pub const sampled_image_filter_cubic_bit_ext = Self.sampled_image_filter_cubic_bit;
    pub const transfer_src_bit_khr = Self.transfer_src_bit;
    pub const transfer_dst_bit_khr = Self.transfer_dst_bit;
    pub const sampled_image_filter_minmax_bit_khr = Self.sampled_image_filter_minmax_bit;
    pub const midpoint_chroma_samples_bit_khr = Self.midpoint_chroma_samples_bit;
    pub const sampled_image_ycbcr_conversion_linear_filter_bit_khr = Self.sampled_image_ycbcr_conversion_linear_filter_bit;
    pub const sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit_khr = Self.sampled_image_ycbcr_conversion_separate_reconstruction_filter_bit;
    pub const sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit_khr = Self.sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_bit;
    pub const sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit_khr = Self.sampled_image_ycbcr_conversion_chroma_reconstruction_explicit_forceable_bit;
    pub const disjoint_bit_khr = Self.disjoint_bit;
    pub const cosited_chroma_samples_bit_khr = Self.cosited_chroma_samples_bit;
    pub const storage_read_without_format_bit_khr = Self.storage_read_without_format_bit;
    pub const storage_write_without_format_bit_khr = Self.storage_write_without_format_bit;
    pub const sampled_image_depth_comparison_bit_khr = Self.sampled_image_depth_comparison_bit;
};
pub const PhysicalDeviceVulkan13Features = extern struct {
    s_type: StructureType = StructureType.physical_device_vulkan13features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    robust_image_access: Bool32 = @import("std").mem.zeroes(Bool32),
    inline_uniform_block: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_inline_uniform_block_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_creation_cache_control: Bool32 = @import("std").mem.zeroes(Bool32),
    private_data: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_demote_to_helper_invocation: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_terminate_invocation: Bool32 = @import("std").mem.zeroes(Bool32),
    subgroup_size_control: Bool32 = @import("std").mem.zeroes(Bool32),
    compute_full_subgroups: Bool32 = @import("std").mem.zeroes(Bool32),
    synchronization2: Bool32 = @import("std").mem.zeroes(Bool32),
    texture_compression_astc_hdr: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_zero_initialize_workgroup_memory: Bool32 = @import("std").mem.zeroes(Bool32),
    dynamic_rendering: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_integer_dot_product: Bool32 = @import("std").mem.zeroes(Bool32),
    maintenance4: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceVulkan13Properties = extern struct {
    s_type: StructureType = StructureType.physical_device_vulkan13properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_subgroup_size: u32 = @import("std").mem.zeroes(u32),
    max_subgroup_size: u32 = @import("std").mem.zeroes(u32),
    max_compute_workgroup_subgroups: u32 = @import("std").mem.zeroes(u32),
    required_subgroup_size_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    max_inline_uniform_block_size: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_inline_uniform_total_size: u32 = @import("std").mem.zeroes(u32),
    integer_dot_product8bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product8bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product8bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product4x8bit_packed_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product4x8bit_packed_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product4x8bit_packed_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product16bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product16bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product16bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product32bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product32bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product32bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product64bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product64bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product64bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating8bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating8bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating8bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating4x8bit_packed_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating4x8bit_packed_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating4x8bit_packed_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating16bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating16bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating16bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating32bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating32bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating32bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating64bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating64bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating64bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    storage_texel_buffer_offset_alignment_bytes: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    storage_texel_buffer_offset_single_texel_alignment: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_texel_buffer_offset_alignment_bytes: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    uniform_texel_buffer_offset_single_texel_alignment: Bool32 = @import("std").mem.zeroes(Bool32),
    max_buffer_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PipelineCreationFeedback = extern struct {
    flags: PipelineCreationFeedbackFlags = @import("std").mem.zeroes(PipelineCreationFeedbackFlags),
    duration: u64 = @import("std").mem.zeroes(u64),
};
pub const PipelineCreationFeedbackCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_creation_feedback_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_pipeline_creation_feedback: [*c]PipelineCreationFeedback = @import("std").mem.zeroes([*c]PipelineCreationFeedback),
    pipeline_stage_creation_feedback_count: u32 = @import("std").mem.zeroes(u32),
    p_pipeline_stage_creation_feedbacks: [*c]PipelineCreationFeedback = @import("std").mem.zeroes([*c]PipelineCreationFeedback),
};
pub const PhysicalDeviceShaderTerminateInvocationFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_terminate_invocation_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_terminate_invocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceToolProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_tool_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    name: [256]u8 = @import("std").mem.zeroes([256]u8),
    version: [256]u8 = @import("std").mem.zeroes([256]u8),
    purposes: ToolPurposeFlags = @import("std").mem.zeroes(ToolPurposeFlags),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    layer: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const PhysicalDeviceShaderDemoteToHelperInvocationFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_demote_to_helper_invocation_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_demote_to_helper_invocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePrivateDataFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_private_data_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    private_data: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DevicePrivateDataCreateInfo = extern struct {
    s_type: StructureType = StructureType.device_private_data_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    private_data_slot_request_count: u32 = @import("std").mem.zeroes(u32),
};
pub const PrivateDataSlotCreateInfo = extern struct {
    s_type: StructureType = StructureType.private_data_slot_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PrivateDataSlotCreateFlags = @import("std").mem.zeroes(PrivateDataSlotCreateFlags),
};
pub const PhysicalDevicePipelineCreationCacheControlFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_pipeline_creation_cache_control_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_creation_cache_control: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MemoryBarrier2 = extern struct {
    s_type: StructureType = StructureType.memory_barrier2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    src_access_mask: AccessFlags2 = @import("std").mem.zeroes(AccessFlags2),
    dst_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    dst_access_mask: AccessFlags2 = @import("std").mem.zeroes(AccessFlags2),
};
pub const BufferMemoryBarrier2 = extern struct {
    s_type: StructureType = StructureType.buffer_memory_barrier2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    src_access_mask: AccessFlags2 = @import("std").mem.zeroes(AccessFlags2),
    dst_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    dst_access_mask: AccessFlags2 = @import("std").mem.zeroes(AccessFlags2),
    src_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    dst_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const ImageMemoryBarrier2 = extern struct {
    s_type: StructureType = StructureType.image_memory_barrier2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    src_access_mask: AccessFlags2 = @import("std").mem.zeroes(AccessFlags2),
    dst_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    dst_access_mask: AccessFlags2 = @import("std").mem.zeroes(AccessFlags2),
    old_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    new_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    src_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    dst_queue_family_index: u32 = @import("std").mem.zeroes(u32),
    image: Image = @import("std").mem.zeroes(Image),
    subresource_range: ImageSubresourceRange = @import("std").mem.zeroes(ImageSubresourceRange),
};
pub const DependencyInfo = extern struct {
    s_type: StructureType = StructureType.dependency_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    dependency_flags: DependencyFlags = @import("std").mem.zeroes(DependencyFlags),
    memory_barrier_count: u32 = @import("std").mem.zeroes(u32),
    p_memory_barriers: [*c]const MemoryBarrier2 = @import("std").mem.zeroes([*c]const MemoryBarrier2),
    buffer_memory_barrier_count: u32 = @import("std").mem.zeroes(u32),
    p_buffer_memory_barriers: [*c]const BufferMemoryBarrier2 = @import("std").mem.zeroes([*c]const BufferMemoryBarrier2),
    image_memory_barrier_count: u32 = @import("std").mem.zeroes(u32),
    p_image_memory_barriers: [*c]const ImageMemoryBarrier2 = @import("std").mem.zeroes([*c]const ImageMemoryBarrier2),
};
pub const SemaphoreSubmitInfo = extern struct {
    s_type: StructureType = StructureType.semaphore_submit_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    semaphore: Semaphore = @import("std").mem.zeroes(Semaphore),
    value: u64 = @import("std").mem.zeroes(u64),
    stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    device_index: u32 = @import("std").mem.zeroes(u32),
};
pub const CommandBufferSubmitInfo = extern struct {
    s_type: StructureType = StructureType.command_buffer_submit_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    command_buffer: CommandBuffer = @import("std").mem.zeroes(CommandBuffer),
    device_mask: u32 = @import("std").mem.zeroes(u32),
};
pub const SubmitInfo2 = extern struct {
    s_type: StructureType = StructureType.submit_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: SubmitFlags = @import("std").mem.zeroes(SubmitFlags),
    wait_semaphore_info_count: u32 = @import("std").mem.zeroes(u32),
    p_wait_semaphore_infos: [*c]const SemaphoreSubmitInfo = @import("std").mem.zeroes([*c]const SemaphoreSubmitInfo),
    command_buffer_info_count: u32 = @import("std").mem.zeroes(u32),
    p_command_buffer_infos: [*c]const CommandBufferSubmitInfo = @import("std").mem.zeroes([*c]const CommandBufferSubmitInfo),
    signal_semaphore_info_count: u32 = @import("std").mem.zeroes(u32),
    p_signal_semaphore_infos: [*c]const SemaphoreSubmitInfo = @import("std").mem.zeroes([*c]const SemaphoreSubmitInfo),
};
pub const PhysicalDeviceSynchronization2Features = extern struct {
    s_type: StructureType = StructureType.physical_device_synchronization2features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    synchronization2: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceZeroInitializeWorkgroupMemoryFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_zero_initialize_workgroup_memory_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_zero_initialize_workgroup_memory: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImageRobustnessFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_image_robustness_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    robust_image_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const BufferCopy2 = extern struct {
    s_type: StructureType = StructureType.buffer_copy2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    dst_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const CopyBufferInfo2 = extern struct {
    s_type: StructureType = StructureType.copy_buffer_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    dst_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const BufferCopy2 = @import("std").mem.zeroes([*c]const BufferCopy2),
};
pub const ImageCopy2 = extern struct {
    s_type: StructureType = StructureType.image_copy2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    src_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    dst_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    dst_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const CopyImageInfo2 = extern struct {
    s_type: StructureType = StructureType.copy_image_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_image: Image = @import("std").mem.zeroes(Image),
    src_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    dst_image: Image = @import("std").mem.zeroes(Image),
    dst_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const ImageCopy2 = @import("std").mem.zeroes([*c]const ImageCopy2),
};
pub const BufferImageCopy2 = extern struct {
    s_type: StructureType = StructureType.buffer_image_copy2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    buffer_row_length: u32 = @import("std").mem.zeroes(u32),
    buffer_image_height: u32 = @import("std").mem.zeroes(u32),
    image_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    image_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    image_extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const CopyBufferToImageInfo2 = extern struct {
    s_type: StructureType = StructureType.copy_buffer_to_image_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    dst_image: Image = @import("std").mem.zeroes(Image),
    dst_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const BufferImageCopy2 = @import("std").mem.zeroes([*c]const BufferImageCopy2),
};
pub const CopyImageToBufferInfo2 = extern struct {
    s_type: StructureType = StructureType.copy_image_to_buffer_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_image: Image = @import("std").mem.zeroes(Image),
    src_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    dst_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const BufferImageCopy2 = @import("std").mem.zeroes([*c]const BufferImageCopy2),
};
pub const ImageBlit2 = extern struct {
    s_type: StructureType = StructureType.image_blit2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    src_offsets: [2]Offset3D = @import("std").mem.zeroes([2]Offset3D),
    dst_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    dst_offsets: [2]Offset3D = @import("std").mem.zeroes([2]Offset3D),
};
pub const BlitImageInfo2 = extern struct {
    s_type: StructureType = StructureType.blit_image_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_image: Image = @import("std").mem.zeroes(Image),
    src_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    dst_image: Image = @import("std").mem.zeroes(Image),
    dst_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const ImageBlit2 = @import("std").mem.zeroes([*c]const ImageBlit2),
    filter: Filter = @import("std").mem.zeroes(Filter),
};
pub const ImageResolve2 = extern struct {
    s_type: StructureType = StructureType.image_resolve2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    src_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    dst_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    dst_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const ResolveImageInfo2 = extern struct {
    s_type: StructureType = StructureType.resolve_image_info2,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_image: Image = @import("std").mem.zeroes(Image),
    src_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    dst_image: Image = @import("std").mem.zeroes(Image),
    dst_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const ImageResolve2 = @import("std").mem.zeroes([*c]const ImageResolve2),
};
pub const PhysicalDeviceSubgroupSizeControlFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_subgroup_size_control_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    subgroup_size_control: Bool32 = @import("std").mem.zeroes(Bool32),
    compute_full_subgroups: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceSubgroupSizeControlProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_subgroup_size_control_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_subgroup_size: u32 = @import("std").mem.zeroes(u32),
    max_subgroup_size: u32 = @import("std").mem.zeroes(u32),
    max_compute_workgroup_subgroups: u32 = @import("std").mem.zeroes(u32),
    required_subgroup_size_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
};
pub const PipelineShaderStageRequiredSubgroupSizeCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_shader_stage_required_subgroup_size_create_info,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    required_subgroup_size: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceInlineUniformBlockFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_inline_uniform_block_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    inline_uniform_block: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_inline_uniform_block_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceInlineUniformBlockProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_inline_uniform_block_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_inline_uniform_block_size: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_inline_uniform_blocks: u32 = @import("std").mem.zeroes(u32),
};
pub const WriteDescriptorSetInlineUniformBlock = extern struct {
    s_type: StructureType = StructureType.write_descriptor_set_inline_uniform_block,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    data_size: u32 = @import("std").mem.zeroes(u32),
    p_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const DescriptorPoolInlineUniformBlockCreateInfo = extern struct {
    s_type: StructureType = StructureType.descriptor_pool_inline_uniform_block_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    max_inline_uniform_block_bindings: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceTextureCompressionASTCHDRFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_texture_compression_astchdrfeatures,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    texture_compression_astc_hdr: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RenderingAttachmentInfo = extern struct {
    s_type: StructureType = StructureType.rendering_attachment_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image_view: ImageView = @import("std").mem.zeroes(ImageView),
    image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    resolve_mode: ResolveModeFlags = @import("std").mem.zeroes(ResolveModeFlags),
    resolve_image_view: ImageView = @import("std").mem.zeroes(ImageView),
    resolve_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    load_op: AttachmentLoadOp = @import("std").mem.zeroes(AttachmentLoadOp),
    store_op: AttachmentStoreOp = @import("std").mem.zeroes(AttachmentStoreOp),
    clear_value: ClearValue = @import("std").mem.zeroes(ClearValue),
};
pub const RenderingInfo = extern struct {
    s_type: StructureType = StructureType.rendering_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: RenderingFlags = @import("std").mem.zeroes(RenderingFlags),
    render_area: Rect2D = @import("std").mem.zeroes(Rect2D),
    layer_count: u32 = @import("std").mem.zeroes(u32),
    view_mask: u32 = @import("std").mem.zeroes(u32),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachments: [*c]const RenderingAttachmentInfo = @import("std").mem.zeroes([*c]const RenderingAttachmentInfo),
    p_depth_attachment: [*c]const RenderingAttachmentInfo = @import("std").mem.zeroes([*c]const RenderingAttachmentInfo),
    p_stencil_attachment: [*c]const RenderingAttachmentInfo = @import("std").mem.zeroes([*c]const RenderingAttachmentInfo),
};
pub const PipelineRenderingCreateInfo = extern struct {
    s_type: StructureType = StructureType.pipeline_rendering_create_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    view_mask: u32 = @import("std").mem.zeroes(u32),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachment_formats: [*c]const Format = @import("std").mem.zeroes([*c]const Format),
    depth_attachment_format: Format = @import("std").mem.zeroes(Format),
    stencil_attachment_format: Format = @import("std").mem.zeroes(Format),
};
pub const PhysicalDeviceDynamicRenderingFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_dynamic_rendering_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    dynamic_rendering: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const CommandBufferInheritanceRenderingInfo = extern struct {
    s_type: StructureType = StructureType.command_buffer_inheritance_rendering_info,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: RenderingFlags = @import("std").mem.zeroes(RenderingFlags),
    view_mask: u32 = @import("std").mem.zeroes(u32),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachment_formats: [*c]const Format = @import("std").mem.zeroes([*c]const Format),
    depth_attachment_format: Format = @import("std").mem.zeroes(Format),
    stencil_attachment_format: Format = @import("std").mem.zeroes(Format),
    rasterization_samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
};
pub const PhysicalDeviceShaderIntegerDotProductFeatures = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_integer_dot_product_features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_integer_dot_product: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderIntegerDotProductProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_integer_dot_product_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    integer_dot_product8bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product8bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product8bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product4x8bit_packed_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product4x8bit_packed_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product4x8bit_packed_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product16bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product16bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product16bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product32bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product32bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product32bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product64bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product64bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product64bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating8bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating8bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating8bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating4x8bit_packed_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating4x8bit_packed_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating4x8bit_packed_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating16bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating16bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating16bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating32bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating32bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating32bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating64bit_unsigned_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating64bit_signed_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    integer_dot_product_accumulating_saturating64bit_mixed_signedness_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceTexelBufferAlignmentProperties = extern struct {
    s_type: StructureType = StructureType.physical_device_texel_buffer_alignment_properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    storage_texel_buffer_offset_alignment_bytes: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    storage_texel_buffer_offset_single_texel_alignment: Bool32 = @import("std").mem.zeroes(Bool32),
    uniform_texel_buffer_offset_alignment_bytes: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    uniform_texel_buffer_offset_single_texel_alignment: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const FormatProperties3 = extern struct {
    s_type: StructureType = StructureType.format_properties3,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    linear_tiling_features: FormatFeatureFlags2 = @import("std").mem.zeroes(FormatFeatureFlags2),
    optimal_tiling_features: FormatFeatureFlags2 = @import("std").mem.zeroes(FormatFeatureFlags2),
    buffer_features: FormatFeatureFlags2 = @import("std").mem.zeroes(FormatFeatureFlags2),
};
pub const PhysicalDeviceMaintenance4Features = extern struct {
    s_type: StructureType = StructureType.physical_device_maintenance4features,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    maintenance4: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMaintenance4Properties = extern struct {
    s_type: StructureType = StructureType.physical_device_maintenance4properties,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_buffer_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const DeviceBufferMemoryRequirements = extern struct {
    s_type: StructureType = StructureType.device_buffer_memory_requirements,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_create_info: [*c]const BufferCreateInfo = @import("std").mem.zeroes([*c]const BufferCreateInfo),
};
pub const DeviceImageMemoryRequirements = extern struct {
    s_type: StructureType = StructureType.device_image_memory_requirements,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_create_info: [*c]const ImageCreateInfo = @import("std").mem.zeroes([*c]const ImageCreateInfo),
    plane_aspect: ImageAspectFlags = @import("std").mem.zeroes(ImageAspectFlags),
};
pub const PFN_getPhysicalDeviceToolProperties = ?*const fn (PhysicalDevice, [*c]u32, [*c]PhysicalDeviceToolProperties) callconv(.c) Result;
pub const PFN_createPrivateDataSlot = ?*const fn (Device, [*c]const PrivateDataSlotCreateInfo, [*c]const AllocationCallbacks, [*c]PrivateDataSlot) callconv(.c) Result;
pub const PFN_destroyPrivateDataSlot = ?*const fn (Device, PrivateDataSlot, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_setPrivateData = ?*const fn (Device, ObjectType, u64, PrivateDataSlot, u64) callconv(.c) Result;
pub const PFN_getPrivateData = ?*const fn (Device, ObjectType, u64, PrivateDataSlot, [*c]u64) callconv(.c) void;
pub const PFN_cmdSetEvent2 = ?*const fn (CommandBuffer, Event, [*c]const DependencyInfo) callconv(.c) void;
pub const PFN_cmdResetEvent2 = ?*const fn (CommandBuffer, Event, PipelineStageFlags2) callconv(.c) void;
pub const PFN_cmdWaitEvents2 = ?*const fn (CommandBuffer, u32, [*c]const Event, [*c]const DependencyInfo) callconv(.c) void;
pub const PFN_cmdPipelineBarrier2 = ?*const fn (CommandBuffer, [*c]const DependencyInfo) callconv(.c) void;
pub const PFN_cmdWriteTimestamp2 = ?*const fn (CommandBuffer, PipelineStageFlags2, QueryPool, u32) callconv(.c) void;
pub const PFN_queueSubmit2 = ?*const fn (Queue, u32, [*c]const SubmitInfo2, Fence) callconv(.c) Result;
pub const PFN_cmdCopyBuffer2 = ?*const fn (CommandBuffer, [*c]const CopyBufferInfo2) callconv(.c) void;
pub const PFN_cmdCopyImage2 = ?*const fn (CommandBuffer, [*c]const CopyImageInfo2) callconv(.c) void;
pub const PFN_cmdCopyBufferToImage2 = ?*const fn (CommandBuffer, [*c]const CopyBufferToImageInfo2) callconv(.c) void;
pub const PFN_cmdCopyImageToBuffer2 = ?*const fn (CommandBuffer, [*c]const CopyImageToBufferInfo2) callconv(.c) void;
pub const PFN_cmdBlitImage2 = ?*const fn (CommandBuffer, [*c]const BlitImageInfo2) callconv(.c) void;
pub const PFN_cmdResolveImage2 = ?*const fn (CommandBuffer, [*c]const ResolveImageInfo2) callconv(.c) void;
pub const PFN_cmdBeginRendering = ?*const fn (CommandBuffer, [*c]const RenderingInfo) callconv(.c) void;
pub const PFN_cmdEndRendering = ?*const fn (CommandBuffer) callconv(.c) void;
pub const PFN_cmdSetCullMode = ?*const fn (CommandBuffer, CullModeFlags) callconv(.c) void;
pub const PFN_cmdSetFrontFace = ?*const fn (CommandBuffer, FrontFace) callconv(.c) void;
pub const PFN_cmdSetPrimitiveTopology = ?*const fn (CommandBuffer, PrimitiveTopology) callconv(.c) void;
pub const PFN_cmdSetViewportWithCount = ?*const fn (CommandBuffer, u32, [*c]const Viewport) callconv(.c) void;
pub const PFN_cmdSetScissorWithCount = ?*const fn (CommandBuffer, u32, [*c]const Rect2D) callconv(.c) void;
pub const PFN_cmdBindVertexBuffers2 = ?*const fn (CommandBuffer, u32, u32, [*c]const Buffer, [*c]const DeviceSize, [*c]const DeviceSize, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdSetDepthTestEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthWriteEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthCompareOp = ?*const fn (CommandBuffer, CompareOp) callconv(.c) void;
pub const PFN_cmdSetDepthBoundsTestEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetStencilTestEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetStencilOp = ?*const fn (CommandBuffer, StencilFaceFlags, StencilOp, StencilOp, StencilOp, CompareOp) callconv(.c) void;
pub const PFN_cmdSetRasterizerDiscardEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthBiasEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetPrimitiveRestartEnable = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_getDeviceBufferMemoryRequirements = ?*const fn (Device, [*c]const DeviceBufferMemoryRequirements, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getDeviceImageMemoryRequirements = ?*const fn (Device, [*c]const DeviceImageMemoryRequirements, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getDeviceImageSparseMemoryRequirements = ?*const fn (Device, [*c]const DeviceImageMemoryRequirements, [*c]u32, [*c]SparseImageMemoryRequirements2) callconv(.c) void;
pub extern fn getPhysicalDeviceToolProperties(physical_device: PhysicalDevice, p_tool_count: [*c]u32, p_tool_properties: [*c]PhysicalDeviceToolProperties) Result;
pub extern fn createPrivateDataSlot(device: Device, p_create_info: [*c]const PrivateDataSlotCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_private_data_slot: [*c]PrivateDataSlot) Result;
pub extern fn destroyPrivateDataSlot(device: Device, private_data_slot: PrivateDataSlot, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn setPrivateData(device: Device, object_type: ObjectType, object_handle: u64, private_data_slot: PrivateDataSlot, data: u64) Result;
pub extern fn getPrivateData(device: Device, object_type: ObjectType, object_handle: u64, private_data_slot: PrivateDataSlot, p_data: [*c]u64) void;
pub extern fn cmdSetEvent2(command_buffer: CommandBuffer, event: Event, p_dependency_info: [*c]const DependencyInfo) void;
pub extern fn cmdResetEvent2(command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2) void;
pub extern fn cmdWaitEvents2(command_buffer: CommandBuffer, event_count: u32, p_events: [*c]const Event, p_dependency_infos: [*c]const DependencyInfo) void;
pub extern fn cmdPipelineBarrier2(command_buffer: CommandBuffer, p_dependency_info: [*c]const DependencyInfo) void;
pub extern fn cmdWriteTimestamp2(command_buffer: CommandBuffer, stage: PipelineStageFlags2, query_pool: QueryPool, query: u32) void;
pub extern fn queueSubmit2(queue: Queue, submit_count: u32, p_submits: [*c]const SubmitInfo2, fence: Fence) Result;
pub extern fn cmdCopyBuffer2(command_buffer: CommandBuffer, p_copy_buffer_info: [*c]const CopyBufferInfo2) void;
pub extern fn cmdCopyImage2(command_buffer: CommandBuffer, p_copy_image_info: [*c]const CopyImageInfo2) void;
pub extern fn cmdCopyBufferToImage2(command_buffer: CommandBuffer, p_copy_buffer_to_image_info: [*c]const CopyBufferToImageInfo2) void;
pub extern fn cmdCopyImageToBuffer2(command_buffer: CommandBuffer, p_copy_image_to_buffer_info: [*c]const CopyImageToBufferInfo2) void;
pub extern fn cmdBlitImage2(command_buffer: CommandBuffer, p_blit_image_info: [*c]const BlitImageInfo2) void;
pub extern fn cmdResolveImage2(command_buffer: CommandBuffer, p_resolve_image_info: [*c]const ResolveImageInfo2) void;
pub extern fn cmdBeginRendering(command_buffer: CommandBuffer, p_rendering_info: [*c]const RenderingInfo) void;
pub extern fn cmdEndRendering(command_buffer: CommandBuffer) void;
pub extern fn cmdSetCullMode(command_buffer: CommandBuffer, cull_mode: CullModeFlags) void;
pub extern fn cmdSetFrontFace(command_buffer: CommandBuffer, front_face: FrontFace) void;
pub extern fn cmdSetPrimitiveTopology(command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology) void;
pub extern fn cmdSetViewportWithCount(command_buffer: CommandBuffer, viewport_count: u32, p_viewports: [*c]const Viewport) void;
pub extern fn cmdSetScissorWithCount(command_buffer: CommandBuffer, scissor_count: u32, p_scissors: [*c]const Rect2D) void;
pub extern fn cmdBindVertexBuffers2(command_buffer: CommandBuffer, first_binding: u32, binding_count: u32, p_buffers: [*c]const Buffer, p_offsets: [*c]const DeviceSize, p_sizes: [*c]const DeviceSize, p_strides: [*c]const DeviceSize) void;
pub extern fn cmdSetDepthTestEnable(command_buffer: CommandBuffer, depth_test_enable: Bool32) void;
pub extern fn cmdSetDepthWriteEnable(command_buffer: CommandBuffer, depth_write_enable: Bool32) void;
pub extern fn cmdSetDepthCompareOp(command_buffer: CommandBuffer, depth_compare_op: CompareOp) void;
pub extern fn cmdSetDepthBoundsTestEnable(command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32) void;
pub extern fn cmdSetStencilTestEnable(command_buffer: CommandBuffer, stencil_test_enable: Bool32) void;
pub extern fn cmdSetStencilOp(command_buffer: CommandBuffer, face_mask: StencilFaceFlags, fail_op: StencilOp, pass_op: StencilOp, depth_fail_op: StencilOp, compare_op: CompareOp) void;
pub extern fn cmdSetRasterizerDiscardEnable(command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32) void;
pub extern fn cmdSetDepthBiasEnable(command_buffer: CommandBuffer, depth_bias_enable: Bool32) void;
pub extern fn cmdSetPrimitiveRestartEnable(command_buffer: CommandBuffer, primitive_restart_enable: Bool32) void;
pub extern fn getDeviceBufferMemoryRequirements(device: Device, p_info: [*c]const DeviceBufferMemoryRequirements, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getDeviceImageMemoryRequirements(device: Device, p_info: [*c]const DeviceImageMemoryRequirements, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getDeviceImageSparseMemoryRequirements(device: Device, p_info: [*c]const DeviceImageMemoryRequirements, p_sparse_memory_requirement_count: [*c]u32, p_sparse_memory_requirements: [*c]SparseImageMemoryRequirements2) void;
pub const SurfaceKHR = enum(u64) { null = 0, _ };
pub const PresentModeKHR = enum(u32) {
    immediate_khr = 0,
    mailbox_khr = 1,
    fifo_khr = 2,
    fifo_relaxed_khr = 3,
    shared_demand_refresh_khr = 1000111000,
    shared_continuous_refresh_khr = 1000111001,
};
pub const ColorSpaceKHR = enum(u32) {
    srgb_nonlinear_khr = 0,
    display_p3_nonlinear_ext = 1000104001,
    extended_srgb_linear_ext = 1000104002,
    dci_p3_linear_ext = 1000104003,
    dci_p3_nonlinear_ext = 1000104004,
    bt709_linear_ext = 1000104005,
    bt709_nonlinear_ext = 1000104006,
    bt2020_linear_ext = 1000104007,
    hdr10_st2084_ext = 1000104008,
    dolbyvision_ext = 1000104009,
    hdr10_hlg_ext = 1000104010,
    adobergb_linear_ext = 1000104011,
    adobergb_nonlinear_ext = 1000104012,
    pass_through_ext = 1000104013,
    extended_srgb_nonlinear_ext = 1000104014,
    display_native_amd = 1000213000,
    pub const Self = @This();
    pub const display_p3_linear_ext = Self.dci_p3_linear_ext;
};
pub const SurfaceTransformFlagsKHR = enum(u32) {
    null = 0,
    identity_bit_khr = 1,
    rotate_90_bit_khr = 2,
    rotate_180_bit_khr = 4,
    rotate_270_bit_khr = 8,
    horizontal_mirror_bit_khr = 16,
    horizontal_mirror_rotate_90_bit_khr = 32,
    horizontal_mirror_rotate_180_bit_khr = 64,
    horizontal_mirror_rotate_270_bit_khr = 128,
    inherit_bit_khr = 256,
};
pub const CompositeAlphaFlagsKHR = enum(u32) {
    null = 0,
    opaque_bit_khr = 1,
    pre_multiplied_bit_khr = 2,
    post_multiplied_bit_khr = 4,
    inherit_bit_khr = 8,
};
pub const SurfaceCapabilitiesKHR = extern struct {
    min_image_count: u32 = @import("std").mem.zeroes(u32),
    max_image_count: u32 = @import("std").mem.zeroes(u32),
    current_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    min_image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_image_array_layers: u32 = @import("std").mem.zeroes(u32),
    supported_transforms: SurfaceTransformFlagsKHR = @import("std").mem.zeroes(SurfaceTransformFlagsKHR),
    current_transform: SurfaceTransformFlagsKHR = @import("std").mem.zeroes(SurfaceTransformFlagsKHR),
    supported_composite_alpha: CompositeAlphaFlagsKHR = @import("std").mem.zeroes(CompositeAlphaFlagsKHR),
    supported_usage_flags: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
};
pub const SurfaceFormatKHR = extern struct {
    format: Format = @import("std").mem.zeroes(Format),
    color_space: ColorSpaceKHR = @import("std").mem.zeroes(ColorSpaceKHR),
};
pub const PFN_destroySurfaceKHR = ?*const fn (Instance, SurfaceKHR, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getPhysicalDeviceSurfaceSupportKHR = ?*const fn (PhysicalDevice, u32, SurfaceKHR, [*c]Bool32) callconv(.c) Result;
pub const PFN_getPhysicalDeviceSurfaceCapabilitiesKHR = ?*const fn (PhysicalDevice, SurfaceKHR, [*c]SurfaceCapabilitiesKHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceSurfaceFormatsKHR = ?*const fn (PhysicalDevice, SurfaceKHR, [*c]u32, [*c]SurfaceFormatKHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceSurfacePresentModesKHR = ?*const fn (PhysicalDevice, SurfaceKHR, [*c]u32, [*c]PresentModeKHR) callconv(.c) Result;
pub extern fn destroySurfaceKHR(instance: Instance, surface: SurfaceKHR, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getPhysicalDeviceSurfaceSupportKHR(physical_device: PhysicalDevice, queue_family_index: u32, surface: SurfaceKHR, p_supported: [*c]Bool32) Result;
pub extern fn getPhysicalDeviceSurfaceCapabilitiesKHR(physical_device: PhysicalDevice, surface: SurfaceKHR, p_surface_capabilities: [*c]SurfaceCapabilitiesKHR) Result;
pub extern fn getPhysicalDeviceSurfaceFormatsKHR(physical_device: PhysicalDevice, surface: SurfaceKHR, p_surface_format_count: [*c]u32, p_surface_formats: [*c]SurfaceFormatKHR) Result;
pub extern fn getPhysicalDeviceSurfacePresentModesKHR(physical_device: PhysicalDevice, surface: SurfaceKHR, p_present_mode_count: [*c]u32, p_present_modes: [*c]PresentModeKHR) Result;
pub const SwapchainKHR = enum(u64) { null = 0, _ };
pub const SwapchainCreateFlagsKHR = enum(u32) {
    null = 0,
    split_instance_bind_regions_bit_khr = 1,
    protected_bit_khr = 2,
    mutable_format_bit_khr = 4,
    deferred_memory_allocation_bit_ext = 8,
};
pub const DeviceGroupPresentModeFlagsKHR = enum(u32) {
    null = 0,
    local_bit_khr = 1,
    remote_bit_khr = 2,
    sum_bit_khr = 4,
    local_multi_device_bit_khr = 8,
};
pub const SwapchainCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.swapchain_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: SwapchainCreateFlagsKHR = @import("std").mem.zeroes(SwapchainCreateFlagsKHR),
    surface: SurfaceKHR = @import("std").mem.zeroes(SurfaceKHR),
    min_image_count: u32 = @import("std").mem.zeroes(u32),
    image_format: Format = @import("std").mem.zeroes(Format),
    image_color_space: ColorSpaceKHR = @import("std").mem.zeroes(ColorSpaceKHR),
    image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    image_array_layers: u32 = @import("std").mem.zeroes(u32),
    image_usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    image_sharing_mode: SharingMode = @import("std").mem.zeroes(SharingMode),
    queue_family_index_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_family_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    pre_transform: SurfaceTransformFlagsKHR = @import("std").mem.zeroes(SurfaceTransformFlagsKHR),
    composite_alpha: CompositeAlphaFlagsKHR = @import("std").mem.zeroes(CompositeAlphaFlagsKHR),
    present_mode: PresentModeKHR = @import("std").mem.zeroes(PresentModeKHR),
    clipped: Bool32 = @import("std").mem.zeroes(Bool32),
    old_swapchain: SwapchainKHR = @import("std").mem.zeroes(SwapchainKHR),
};
pub const PresentInfoKHR = extern struct {
    s_type: StructureType = StructureType.present_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    wait_semaphore_count: u32 = @import("std").mem.zeroes(u32),
    p_wait_semaphores: [*c]const Semaphore = @import("std").mem.zeroes([*c]const Semaphore),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_swapchains: [*c]const SwapchainKHR = @import("std").mem.zeroes([*c]const SwapchainKHR),
    p_image_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    p_results: [*c]Result = @import("std").mem.zeroes([*c]Result),
};
pub const ImageSwapchainCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.image_swapchain_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain: SwapchainKHR = @import("std").mem.zeroes(SwapchainKHR),
};
pub const BindImageMemorySwapchainInfoKHR = extern struct {
    s_type: StructureType = StructureType.bind_image_memory_swapchain_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain: SwapchainKHR = @import("std").mem.zeroes(SwapchainKHR),
    image_index: u32 = @import("std").mem.zeroes(u32),
};
pub const AcquireNextImageInfoKHR = extern struct {
    s_type: StructureType = StructureType.acquire_next_image_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain: SwapchainKHR = @import("std").mem.zeroes(SwapchainKHR),
    timeout: u64 = @import("std").mem.zeroes(u64),
    semaphore: Semaphore = @import("std").mem.zeroes(Semaphore),
    fence: Fence = @import("std").mem.zeroes(Fence),
    device_mask: u32 = @import("std").mem.zeroes(u32),
};
pub const DeviceGroupPresentCapabilitiesKHR = extern struct {
    s_type: StructureType = StructureType.device_group_present_capabilities_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_mask: [32]u32 = @import("std").mem.zeroes([32]u32),
    modes: DeviceGroupPresentModeFlagsKHR = @import("std").mem.zeroes(DeviceGroupPresentModeFlagsKHR),
};
pub const DeviceGroupPresentInfoKHR = extern struct {
    s_type: StructureType = StructureType.device_group_present_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_device_masks: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    mode: DeviceGroupPresentModeFlagsKHR = @import("std").mem.zeroes(DeviceGroupPresentModeFlagsKHR),
};
pub const DeviceGroupSwapchainCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.device_group_swapchain_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    modes: DeviceGroupPresentModeFlagsKHR = @import("std").mem.zeroes(DeviceGroupPresentModeFlagsKHR),
};
pub const PFN_createSwapchainKHR = ?*const fn (Device, [*c]const SwapchainCreateInfoKHR, [*c]const AllocationCallbacks, [*c]SwapchainKHR) callconv(.c) Result;
pub const PFN_destroySwapchainKHR = ?*const fn (Device, SwapchainKHR, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getSwapchainImagesKHR = ?*const fn (Device, SwapchainKHR, [*c]u32, [*c]Image) callconv(.c) Result;
pub const PFN_acquireNextImageKHR = ?*const fn (Device, SwapchainKHR, u64, Semaphore, Fence, [*c]u32) callconv(.c) Result;
pub const PFN_queuePresentKHR = ?*const fn (Queue, [*c]const PresentInfoKHR) callconv(.c) Result;
pub const PFN_getDeviceGroupPresentCapabilitiesKHR = ?*const fn (Device, [*c]DeviceGroupPresentCapabilitiesKHR) callconv(.c) Result;
pub const PFN_getDeviceGroupSurfacePresentModesKHR = ?*const fn (Device, SurfaceKHR, [*c]DeviceGroupPresentModeFlagsKHR) callconv(.c) Result;
pub const PFN_getPhysicalDevicePresentRectanglesKHR = ?*const fn (PhysicalDevice, SurfaceKHR, [*c]u32, [*c]Rect2D) callconv(.c) Result;
pub const PFN_acquireNextImage2KHR = ?*const fn (Device, [*c]const AcquireNextImageInfoKHR, [*c]u32) callconv(.c) Result;
pub extern fn createSwapchainKHR(device: Device, p_create_info: [*c]const SwapchainCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_swapchain: [*c]SwapchainKHR) Result;
pub extern fn destroySwapchainKHR(device: Device, swapchain: SwapchainKHR, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getSwapchainImagesKHR(device: Device, swapchain: SwapchainKHR, p_swapchain_image_count: [*c]u32, p_swapchain_images: [*c]Image) Result;
pub extern fn acquireNextImageKHR(device: Device, swapchain: SwapchainKHR, timeout: u64, semaphore: Semaphore, fence: Fence, p_image_index: [*c]u32) Result;
pub extern fn queuePresentKHR(queue: Queue, p_present_info: [*c]const PresentInfoKHR) Result;
pub extern fn getDeviceGroupPresentCapabilitiesKHR(device: Device, p_device_group_present_capabilities: [*c]DeviceGroupPresentCapabilitiesKHR) Result;
pub extern fn getDeviceGroupSurfacePresentModesKHR(device: Device, surface: SurfaceKHR, p_modes: [*c]DeviceGroupPresentModeFlagsKHR) Result;
pub extern fn getPhysicalDevicePresentRectanglesKHR(physical_device: PhysicalDevice, surface: SurfaceKHR, p_rect_count: [*c]u32, p_rects: [*c]Rect2D) Result;
pub extern fn acquireNextImage2KHR(device: Device, p_acquire_info: [*c]const AcquireNextImageInfoKHR, p_image_index: [*c]u32) Result;
pub const DisplayKHR = enum(u64) { null = 0, _ };
pub const DisplayModeKHR = enum(u64) { null = 0, _ };
pub const DisplayModeCreateFlagsKHR = Flags;
pub const DisplayPlaneAlphaFlagsKHR = enum(u32) {
    null = 0,
    opaque_bit_khr = 1,
    global_bit_khr = 2,
    per_pixel_bit_khr = 4,
    per_pixel_premultiplied_bit_khr = 8,
};
pub const DisplaySurfaceCreateFlagsKHR = Flags;
pub const DisplayModeParametersKHR = extern struct {
    visible_region: Extent2D = @import("std").mem.zeroes(Extent2D),
    refresh_rate: u32 = @import("std").mem.zeroes(u32),
};
pub const DisplayModeCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.display_mode_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DisplayModeCreateFlagsKHR = @import("std").mem.zeroes(DisplayModeCreateFlagsKHR),
    parameters: DisplayModeParametersKHR = @import("std").mem.zeroes(DisplayModeParametersKHR),
};
pub const DisplayModePropertiesKHR = extern struct {
    display_mode: DisplayModeKHR = @import("std").mem.zeroes(DisplayModeKHR),
    parameters: DisplayModeParametersKHR = @import("std").mem.zeroes(DisplayModeParametersKHR),
};
pub const DisplayPlaneCapabilitiesKHR = extern struct {
    supported_alpha: DisplayPlaneAlphaFlagsKHR = @import("std").mem.zeroes(DisplayPlaneAlphaFlagsKHR),
    min_src_position: Offset2D = @import("std").mem.zeroes(Offset2D),
    max_src_position: Offset2D = @import("std").mem.zeroes(Offset2D),
    min_src_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_src_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    min_dst_position: Offset2D = @import("std").mem.zeroes(Offset2D),
    max_dst_position: Offset2D = @import("std").mem.zeroes(Offset2D),
    min_dst_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_dst_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const DisplayPlanePropertiesKHR = extern struct {
    current_display: DisplayKHR = @import("std").mem.zeroes(DisplayKHR),
    current_stack_index: u32 = @import("std").mem.zeroes(u32),
};
pub const DisplayPropertiesKHR = extern struct {
    display: DisplayKHR = @import("std").mem.zeroes(DisplayKHR),
    display_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    physical_dimensions: Extent2D = @import("std").mem.zeroes(Extent2D),
    physical_resolution: Extent2D = @import("std").mem.zeroes(Extent2D),
    supported_transforms: SurfaceTransformFlagsKHR = @import("std").mem.zeroes(SurfaceTransformFlagsKHR),
    plane_reorder_possible: Bool32 = @import("std").mem.zeroes(Bool32),
    persistent_content: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DisplaySurfaceCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.display_surface_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DisplaySurfaceCreateFlagsKHR = @import("std").mem.zeroes(DisplaySurfaceCreateFlagsKHR),
    display_mode: DisplayModeKHR = @import("std").mem.zeroes(DisplayModeKHR),
    plane_index: u32 = @import("std").mem.zeroes(u32),
    plane_stack_index: u32 = @import("std").mem.zeroes(u32),
    transform: SurfaceTransformFlagsKHR = @import("std").mem.zeroes(SurfaceTransformFlagsKHR),
    global_alpha: f32 = @import("std").mem.zeroes(f32),
    alpha_mode: DisplayPlaneAlphaFlagsKHR = @import("std").mem.zeroes(DisplayPlaneAlphaFlagsKHR),
    image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const PFN_getPhysicalDeviceDisplayPropertiesKHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]DisplayPropertiesKHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceDisplayPlanePropertiesKHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]DisplayPlanePropertiesKHR) callconv(.c) Result;
pub const PFN_getDisplayPlaneSupportedDisplaysKHR = ?*const fn (PhysicalDevice, u32, [*c]u32, [*c]DisplayKHR) callconv(.c) Result;
pub const PFN_getDisplayModePropertiesKHR = ?*const fn (PhysicalDevice, DisplayKHR, [*c]u32, [*c]DisplayModePropertiesKHR) callconv(.c) Result;
pub const PFN_createDisplayModeKHR = ?*const fn (PhysicalDevice, DisplayKHR, [*c]const DisplayModeCreateInfoKHR, [*c]const AllocationCallbacks, [*c]DisplayModeKHR) callconv(.c) Result;
pub const PFN_getDisplayPlaneCapabilitiesKHR = ?*const fn (PhysicalDevice, DisplayModeKHR, u32, [*c]DisplayPlaneCapabilitiesKHR) callconv(.c) Result;
pub const PFN_createDisplayPlaneSurfaceKHR = ?*const fn (Instance, [*c]const DisplaySurfaceCreateInfoKHR, [*c]const AllocationCallbacks, [*c]SurfaceKHR) callconv(.c) Result;
pub extern fn getPhysicalDeviceDisplayPropertiesKHR(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]DisplayPropertiesKHR) Result;
pub extern fn getPhysicalDeviceDisplayPlanePropertiesKHR(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]DisplayPlanePropertiesKHR) Result;
pub extern fn getDisplayPlaneSupportedDisplaysKHR(physical_device: PhysicalDevice, plane_index: u32, p_display_count: [*c]u32, p_displays: [*c]DisplayKHR) Result;
pub extern fn getDisplayModePropertiesKHR(physical_device: PhysicalDevice, display: DisplayKHR, p_property_count: [*c]u32, p_properties: [*c]DisplayModePropertiesKHR) Result;
pub extern fn createDisplayModeKHR(physical_device: PhysicalDevice, display: DisplayKHR, p_create_info: [*c]const DisplayModeCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_mode: [*c]DisplayModeKHR) Result;
pub extern fn getDisplayPlaneCapabilitiesKHR(physical_device: PhysicalDevice, mode: DisplayModeKHR, plane_index: u32, p_capabilities: [*c]DisplayPlaneCapabilitiesKHR) Result;
pub extern fn createDisplayPlaneSurfaceKHR(instance: Instance, p_create_info: [*c]const DisplaySurfaceCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_surface: [*c]SurfaceKHR) Result;
pub const DisplayPresentInfoKHR = extern struct {
    s_type: StructureType = StructureType.display_present_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_rect: Rect2D = @import("std").mem.zeroes(Rect2D),
    dst_rect: Rect2D = @import("std").mem.zeroes(Rect2D),
    persistent: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_createSharedSwapchainsKHR = ?*const fn (Device, u32, [*c]const SwapchainCreateInfoKHR, [*c]const AllocationCallbacks, [*c]SwapchainKHR) callconv(.c) Result;
pub extern fn createSharedSwapchainsKHR(device: Device, swapchain_count: u32, p_create_infos: [*c]const SwapchainCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_swapchains: [*c]SwapchainKHR) Result;
pub const VideoSessionKHR = enum(u64) { null = 0, _ };
pub const VideoSessionParametersKHR = enum(u64) { null = 0, _ };
pub const QueryResultStatusKHR = enum(i32) {
    insufficient_bitstream_buffer_range_khr = -1000299000,
    error_khr = -1,
    not_ready_khr = 0,
    complete_khr = 1,
};
pub const VideoCodecOperationFlagsKHR = enum(u32) {
    none_khr = 0,
    decode_h264_bit_khr = 1,
    decode_h265_bit_khr = 2,
    decode_av1_bit_khr = 4,
    encode_h264_bit_khr = 65536,
    encode_h265_bit_khr = 131072,
};
pub const VideoChromaSubsamplingFlagsKHR = enum(u32) {
    invalid_khr = 0,
    monochrome_bit_khr = 1,
    @"420_bit_khr" = 2,
    @"422_bit_khr" = 4,
    @"444_bit_khr" = 8,
};
pub const VideoComponentBitDepthFlagsKHR = enum(u32) {
    invalid_khr = 0,
    @"8_bit_khr" = 1,
    @"10_bit_khr" = 4,
    @"12_bit_khr" = 16,
};
pub const VideoCapabilityFlagsKHR = enum(u32) {
    null = 0,
    protected_content_bit_khr = 1,
    separate_reference_images_bit_khr = 2,
};
pub const VideoSessionCreateFlagsKHR = enum(u32) {
    null = 0,
    protected_content_bit_khr = 1,
    allow_encode_parameter_optimizations_bit_khr = 2,
    inline_queries_bit_khr = 4,
};
pub const VideoSessionParametersCreateFlagsKHR = Flags;
pub const VideoBeginCodingFlagsKHR = Flags;
pub const VideoEndCodingFlagsKHR = Flags;
pub const VideoCodingControlFlagsKHR = enum(u32) {
    null = 0,
    reset_bit_khr = 1,
    encode_rate_control_bit_khr = 2,
    encode_quality_level_bit_khr = 4,
};
pub const QueueFamilyQueryResultStatusPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.queue_family_query_result_status_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    query_result_status_support: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const QueueFamilyVideoPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.queue_family_video_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    video_codec_operations: VideoCodecOperationFlagsKHR = @import("std").mem.zeroes(VideoCodecOperationFlagsKHR),
};
pub const VideoProfileInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_profile_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    video_codec_operation: VideoCodecOperationFlagsKHR = @import("std").mem.zeroes(VideoCodecOperationFlagsKHR),
    chroma_subsampling: VideoChromaSubsamplingFlagsKHR = @import("std").mem.zeroes(VideoChromaSubsamplingFlagsKHR),
    luma_bit_depth: VideoComponentBitDepthFlagsKHR = @import("std").mem.zeroes(VideoComponentBitDepthFlagsKHR),
    chroma_bit_depth: VideoComponentBitDepthFlagsKHR = @import("std").mem.zeroes(VideoComponentBitDepthFlagsKHR),
};
pub const VideoProfileListInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_profile_list_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    profile_count: u32 = @import("std").mem.zeroes(u32),
    p_profiles: [*c]const VideoProfileInfoKHR = @import("std").mem.zeroes([*c]const VideoProfileInfoKHR),
};
pub const VideoCapabilitiesKHR = extern struct {
    s_type: StructureType = StructureType.video_capabilities_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: VideoCapabilityFlagsKHR = @import("std").mem.zeroes(VideoCapabilityFlagsKHR),
    min_bitstream_buffer_offset_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    min_bitstream_buffer_size_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    picture_access_granularity: Extent2D = @import("std").mem.zeroes(Extent2D),
    min_coded_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_coded_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_dpb_slots: u32 = @import("std").mem.zeroes(u32),
    max_active_reference_pictures: u32 = @import("std").mem.zeroes(u32),
    std_header_version: ExtensionProperties = @import("std").mem.zeroes(ExtensionProperties),
};
pub const PhysicalDeviceVideoFormatInfoKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_video_format_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image_usage: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
};
pub const VideoFormatPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.video_format_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    format: Format = @import("std").mem.zeroes(Format),
    component_mapping: ComponentMapping = @import("std").mem.zeroes(ComponentMapping),
    image_create_flags: ImageCreateFlags = @import("std").mem.zeroes(ImageCreateFlags),
    image_type: ImageType = @import("std").mem.zeroes(ImageType),
    image_tiling: ImageTiling = @import("std").mem.zeroes(ImageTiling),
    image_usage_flags: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
};
pub const VideoPictureResourceInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_picture_resource_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    coded_offset: Offset2D = @import("std").mem.zeroes(Offset2D),
    coded_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    base_array_layer: u32 = @import("std").mem.zeroes(u32),
    image_view_binding: ImageView = @import("std").mem.zeroes(ImageView),
};
pub const VideoReferenceSlotInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_reference_slot_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    slot_index: i32 = @import("std").mem.zeroes(i32),
    p_picture_resource: [*c]const VideoPictureResourceInfoKHR = @import("std").mem.zeroes([*c]const VideoPictureResourceInfoKHR),
};
pub const VideoSessionMemoryRequirementsKHR = extern struct {
    s_type: StructureType = StructureType.video_session_memory_requirements_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_bind_index: u32 = @import("std").mem.zeroes(u32),
    memory_requirements: MemoryRequirements = @import("std").mem.zeroes(MemoryRequirements),
};
pub const BindVideoSessionMemoryInfoKHR = extern struct {
    s_type: StructureType = StructureType.bind_video_session_memory_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    memory_bind_index: u32 = @import("std").mem.zeroes(u32),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    memory_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    memory_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const VideoSessionCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_session_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    queue_family_index: u32 = @import("std").mem.zeroes(u32),
    flags: VideoSessionCreateFlagsKHR = @import("std").mem.zeroes(VideoSessionCreateFlagsKHR),
    p_video_profile: [*c]const VideoProfileInfoKHR = @import("std").mem.zeroes([*c]const VideoProfileInfoKHR),
    picture_format: Format = @import("std").mem.zeroes(Format),
    max_coded_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    reference_picture_format: Format = @import("std").mem.zeroes(Format),
    max_dpb_slots: u32 = @import("std").mem.zeroes(u32),
    max_active_reference_pictures: u32 = @import("std").mem.zeroes(u32),
    p_std_header_version: [*c]const ExtensionProperties = @import("std").mem.zeroes([*c]const ExtensionProperties),
};
pub const VideoSessionParametersCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_session_parameters_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: VideoSessionParametersCreateFlagsKHR = @import("std").mem.zeroes(VideoSessionParametersCreateFlagsKHR),
    video_session_parameters_template: VideoSessionParametersKHR = @import("std").mem.zeroes(VideoSessionParametersKHR),
    video_session: VideoSessionKHR = @import("std").mem.zeroes(VideoSessionKHR),
};
pub const VideoSessionParametersUpdateInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_session_parameters_update_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    update_sequence_count: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoBeginCodingInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_begin_coding_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: VideoBeginCodingFlagsKHR = @import("std").mem.zeroes(VideoBeginCodingFlagsKHR),
    video_session: VideoSessionKHR = @import("std").mem.zeroes(VideoSessionKHR),
    video_session_parameters: VideoSessionParametersKHR = @import("std").mem.zeroes(VideoSessionParametersKHR),
    reference_slot_count: u32 = @import("std").mem.zeroes(u32),
    p_reference_slots: [*c]const VideoReferenceSlotInfoKHR = @import("std").mem.zeroes([*c]const VideoReferenceSlotInfoKHR),
};
pub const VideoEndCodingInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_end_coding_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: VideoEndCodingFlagsKHR = @import("std").mem.zeroes(VideoEndCodingFlagsKHR),
};
pub const VideoCodingControlInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_coding_control_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: VideoCodingControlFlagsKHR = @import("std").mem.zeroes(VideoCodingControlFlagsKHR),
};
pub const PFN_getPhysicalDeviceVideoCapabilitiesKHR = ?*const fn (PhysicalDevice, [*c]const VideoProfileInfoKHR, [*c]VideoCapabilitiesKHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceVideoFormatPropertiesKHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceVideoFormatInfoKHR, [*c]u32, [*c]VideoFormatPropertiesKHR) callconv(.c) Result;
pub const PFN_createVideoSessionKHR = ?*const fn (Device, [*c]const VideoSessionCreateInfoKHR, [*c]const AllocationCallbacks, [*c]VideoSessionKHR) callconv(.c) Result;
pub const PFN_destroyVideoSessionKHR = ?*const fn (Device, VideoSessionKHR, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getVideoSessionMemoryRequirementsKHR = ?*const fn (Device, VideoSessionKHR, [*c]u32, [*c]VideoSessionMemoryRequirementsKHR) callconv(.c) Result;
pub const PFN_bindVideoSessionMemoryKHR = ?*const fn (Device, VideoSessionKHR, u32, [*c]const BindVideoSessionMemoryInfoKHR) callconv(.c) Result;
pub const PFN_createVideoSessionParametersKHR = ?*const fn (Device, [*c]const VideoSessionParametersCreateInfoKHR, [*c]const AllocationCallbacks, [*c]VideoSessionParametersKHR) callconv(.c) Result;
pub const PFN_updateVideoSessionParametersKHR = ?*const fn (Device, VideoSessionParametersKHR, [*c]const VideoSessionParametersUpdateInfoKHR) callconv(.c) Result;
pub const PFN_destroyVideoSessionParametersKHR = ?*const fn (Device, VideoSessionParametersKHR, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_cmdBeginVideoCodingKHR = ?*const fn (CommandBuffer, [*c]const VideoBeginCodingInfoKHR) callconv(.c) void;
pub const PFN_cmdEndVideoCodingKHR = ?*const fn (CommandBuffer, [*c]const VideoEndCodingInfoKHR) callconv(.c) void;
pub const PFN_cmdControlVideoCodingKHR = ?*const fn (CommandBuffer, [*c]const VideoCodingControlInfoKHR) callconv(.c) void;
pub extern fn getPhysicalDeviceVideoCapabilitiesKHR(physical_device: PhysicalDevice, p_video_profile: [*c]const VideoProfileInfoKHR, p_capabilities: [*c]VideoCapabilitiesKHR) Result;
pub extern fn getPhysicalDeviceVideoFormatPropertiesKHR(physical_device: PhysicalDevice, p_video_format_info: [*c]const PhysicalDeviceVideoFormatInfoKHR, p_video_format_property_count: [*c]u32, p_video_format_properties: [*c]VideoFormatPropertiesKHR) Result;
pub extern fn createVideoSessionKHR(device: Device, p_create_info: [*c]const VideoSessionCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_video_session: [*c]VideoSessionKHR) Result;
pub extern fn destroyVideoSessionKHR(device: Device, video_session: VideoSessionKHR, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getVideoSessionMemoryRequirementsKHR(device: Device, video_session: VideoSessionKHR, p_memory_requirements_count: [*c]u32, p_memory_requirements: [*c]VideoSessionMemoryRequirementsKHR) Result;
pub extern fn bindVideoSessionMemoryKHR(device: Device, video_session: VideoSessionKHR, bind_session_memory_info_count: u32, p_bind_session_memory_infos: [*c]const BindVideoSessionMemoryInfoKHR) Result;
pub extern fn createVideoSessionParametersKHR(device: Device, p_create_info: [*c]const VideoSessionParametersCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_video_session_parameters: [*c]VideoSessionParametersKHR) Result;
pub extern fn updateVideoSessionParametersKHR(device: Device, video_session_parameters: VideoSessionParametersKHR, p_update_info: [*c]const VideoSessionParametersUpdateInfoKHR) Result;
pub extern fn destroyVideoSessionParametersKHR(device: Device, video_session_parameters: VideoSessionParametersKHR, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn cmdBeginVideoCodingKHR(command_buffer: CommandBuffer, p_begin_info: [*c]const VideoBeginCodingInfoKHR) void;
pub extern fn cmdEndVideoCodingKHR(command_buffer: CommandBuffer, p_end_coding_info: [*c]const VideoEndCodingInfoKHR) void;
pub extern fn cmdControlVideoCodingKHR(command_buffer: CommandBuffer, p_coding_control_info: [*c]const VideoCodingControlInfoKHR) void;
pub const VideoDecodeCapabilityFlagsKHR = enum(u32) {
    null = 0,
    dpb_and_output_coincide_bit_khr = 1,
    dpb_and_output_distinct_bit_khr = 2,
};
pub const VideoDecodeUsageFlagsKHR = enum(u32) {
    default_khr = 0,
    transcoding_bit_khr = 1,
    offline_bit_khr = 2,
    streaming_bit_khr = 4,
};
pub const VideoDecodeFlagsKHR = Flags;
pub const VideoDecodeCapabilitiesKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_capabilities_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: VideoDecodeCapabilityFlagsKHR = @import("std").mem.zeroes(VideoDecodeCapabilityFlagsKHR),
};
pub const VideoDecodeUsageInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_usage_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    video_usage_hints: VideoDecodeUsageFlagsKHR = @import("std").mem.zeroes(VideoDecodeUsageFlagsKHR),
};
pub const VideoDecodeInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: VideoDecodeFlagsKHR = @import("std").mem.zeroes(VideoDecodeFlagsKHR),
    src_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    src_buffer_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    src_buffer_range: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    dst_picture_resource: VideoPictureResourceInfoKHR = @import("std").mem.zeroes(VideoPictureResourceInfoKHR),
    p_setup_reference_slot: [*c]const VideoReferenceSlotInfoKHR = @import("std").mem.zeroes([*c]const VideoReferenceSlotInfoKHR),
    reference_slot_count: u32 = @import("std").mem.zeroes(u32),
    p_reference_slots: [*c]const VideoReferenceSlotInfoKHR = @import("std").mem.zeroes([*c]const VideoReferenceSlotInfoKHR),
};
pub const PFN_cmdDecodeVideoKHR = ?*const fn (CommandBuffer, [*c]const VideoDecodeInfoKHR) callconv(.c) void;
pub extern fn cmdDecodeVideoKHR(command_buffer: CommandBuffer, p_decode_info: [*c]const VideoDecodeInfoKHR) void;
pub const VideoH264ChromaFormatIdc = enum(u32) {
    h264_chroma_format_idc_monochrome = 0,
    h264_chroma_format_idc_420 = 1,
    h264_chroma_format_idc_422 = 2,
    h264_chroma_format_idc_444 = 3,
    pub const Self = @This();
};
pub const VideoH264ProfileIdc = enum(u32) {
    null = 0,
    h264_profile_idc_baseline = 66,
    h264_profile_idc_main = 77,
    h264_profile_idc_high = 100,
    h264_profile_idc_high_444_predictive = 244,
    pub const Self = @This();
};
pub const VideoH264LevelIdc = enum(u32) {
    h264_level_idc_1_0 = 0,
    h264_level_idc_1_1 = 1,
    h264_level_idc_1_2 = 2,
    h264_level_idc_1_3 = 3,
    h264_level_idc_2_0 = 4,
    h264_level_idc_2_1 = 5,
    h264_level_idc_2_2 = 6,
    h264_level_idc_3_0 = 7,
    h264_level_idc_3_1 = 8,
    h264_level_idc_3_2 = 9,
    h264_level_idc_4_0 = 10,
    h264_level_idc_4_1 = 11,
    h264_level_idc_4_2 = 12,
    h264_level_idc_5_0 = 13,
    h264_level_idc_5_1 = 14,
    h264_level_idc_5_2 = 15,
    h264_level_idc_6_0 = 16,
    h264_level_idc_6_1 = 17,
    h264_level_idc_6_2 = 18,
    pub const Self = @This();
};
pub const VideoH264PocType = enum(u32) {
    h264_poc_type_0 = 0,
    h264_poc_type_1 = 1,
    h264_poc_type_2 = 2,
    pub const Self = @This();
};
pub const VideoH264AspectRatioIdc = enum(u32) {
    h264_aspect_ratio_idc_unspecified = 0,
    h264_aspect_ratio_idc_square = 1,
    h264_aspect_ratio_idc_12_11 = 2,
    h264_aspect_ratio_idc_10_11 = 3,
    h264_aspect_ratio_idc_16_11 = 4,
    h264_aspect_ratio_idc_40_33 = 5,
    h264_aspect_ratio_idc_24_11 = 6,
    h264_aspect_ratio_idc_20_11 = 7,
    h264_aspect_ratio_idc_32_11 = 8,
    h264_aspect_ratio_idc_80_33 = 9,
    h264_aspect_ratio_idc_18_11 = 10,
    h264_aspect_ratio_idc_15_11 = 11,
    h264_aspect_ratio_idc_64_33 = 12,
    h264_aspect_ratio_idc_160_99 = 13,
    h264_aspect_ratio_idc_4_3 = 14,
    h264_aspect_ratio_idc_3_2 = 15,
    h264_aspect_ratio_idc_2_1 = 16,
    h264_aspect_ratio_idc_extended_sar = 255,
    pub const Self = @This();
};
pub const VideoH264WeightedBipredIdc = enum(u32) {
    h264_weighted_bipred_idc_default = 0,
    h264_weighted_bipred_idc_explicit = 1,
    h264_weighted_bipred_idc_implicit = 2,
    pub const Self = @This();
};
pub const VideoH264ModificationOfPicNumsIdc = enum(u32) {
    h264_modification_of_pic_nums_idc_short_term_subtract = 0,
    h264_modification_of_pic_nums_idc_short_term_add = 1,
    h264_modification_of_pic_nums_idc_long_term = 2,
    h264_modification_of_pic_nums_idc_end = 3,
    pub const Self = @This();
};
pub const VideoH264MemMgmtControlOp = enum(u32) {
    h264_mem_mgmt_control_op_end = 0,
    h264_mem_mgmt_control_op_unmark_short_term = 1,
    h264_mem_mgmt_control_op_unmark_long_term = 2,
    h264_mem_mgmt_control_op_mark_long_term = 3,
    h264_mem_mgmt_control_op_set_max_long_term_index = 4,
    h264_mem_mgmt_control_op_unmark_all = 5,
    h264_mem_mgmt_control_op_mark_current_as_long_term = 6,
    pub const Self = @This();
};
pub const VideoH264CabacInitIdc = enum(u32) {
    h264_cabac_init_idc_0 = 0,
    h264_cabac_init_idc_1 = 1,
    h264_cabac_init_idc_2 = 2,
    pub const Self = @This();
};
pub const VideoH264DisableDeblockingFilterIdc = enum(u32) {
    h264_disable_deblocking_filter_idc_disabled = 0,
    h264_disable_deblocking_filter_idc_enabled = 1,
    h264_disable_deblocking_filter_idc_partial = 2,
    pub const Self = @This();
};
pub const VideoH264SliceType = enum(u32) {
    h264_slice_type_p = 0,
    h264_slice_type_b = 1,
    h264_slice_type_i = 2,
    pub const Self = @This();
};
pub const VideoH264PictureType = enum(u32) {
    h264_picture_type_p = 0,
    h264_picture_type_b = 1,
    h264_picture_type_i = 2,
    h264_picture_type_idr = 5,
    pub const Self = @This();
};
pub const VideoH264NonVclNaluType = enum(u32) {
    h264_non_vcl_nalu_type_sps = 0,
    h264_non_vcl_nalu_type_pps = 1,
    h264_non_vcl_nalu_type_aud = 2,
    h264_non_vcl_nalu_type_prefix = 3,
    h264_non_vcl_nalu_type_end_of_sequence = 4,
    h264_non_vcl_nalu_type_end_of_stream = 5,
    h264_non_vcl_nalu_type_precoded = 6,
    pub const Self = @This();
};
pub const VideoH264SpsVuiFlags = enum(u64) { null = 0, _ };
pub const VideoH264HrdParameters = extern struct {
    cpb_cnt_minus1: u8 = @import("std").mem.zeroes(u8),
    bit_rate_scale: u8 = @import("std").mem.zeroes(u8),
    cpb_size_scale: u8 = @import("std").mem.zeroes(u8),
    reserved1: u8 = @import("std").mem.zeroes(u8),
    bit_rate_value_minus1: [32]u32 = @import("std").mem.zeroes([32]u32),
    cpb_size_value_minus1: [32]u32 = @import("std").mem.zeroes([32]u32),
    cbr_flag: [32]u8 = @import("std").mem.zeroes([32]u8),
    initial_cpb_removal_delay_length_minus1: u32 = @import("std").mem.zeroes(u32),
    cpb_removal_delay_length_minus1: u32 = @import("std").mem.zeroes(u32),
    dpb_output_delay_length_minus1: u32 = @import("std").mem.zeroes(u32),
    time_offset_length: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoH264SequenceParameterSetVui = extern struct {
    flags: VideoH264SpsVuiFlags = @import("std").mem.zeroes(VideoH264SpsVuiFlags),
    aspect_ratio_idc: VideoH264AspectRatioIdc = @import("std").mem.zeroes(VideoH264AspectRatioIdc),
    sar_width: u16 = @import("std").mem.zeroes(u16),
    sar_height: u16 = @import("std").mem.zeroes(u16),
    video_format: u8 = @import("std").mem.zeroes(u8),
    colour_primaries: u8 = @import("std").mem.zeroes(u8),
    transfer_characteristics: u8 = @import("std").mem.zeroes(u8),
    matrix_coefficients: u8 = @import("std").mem.zeroes(u8),
    num_units_in_tick: u32 = @import("std").mem.zeroes(u32),
    time_scale: u32 = @import("std").mem.zeroes(u32),
    max_num_reorder_frames: u8 = @import("std").mem.zeroes(u8),
    max_dec_frame_buffering: u8 = @import("std").mem.zeroes(u8),
    chroma_sample_loc_type_top_field: u8 = @import("std").mem.zeroes(u8),
    chroma_sample_loc_type_bottom_field: u8 = @import("std").mem.zeroes(u8),
    reserved1: u32 = @import("std").mem.zeroes(u32),
    p_hrd_parameters: [*c]const VideoH264HrdParameters = @import("std").mem.zeroes([*c]const VideoH264HrdParameters),
};
pub const VideoH264SpsFlags = enum(u64) { null = 0, _ };
pub const VideoH264ScalingLists = extern struct {
    scaling_list_present_mask: u16 = @import("std").mem.zeroes(u16),
    use_default_scaling_matrix_mask: u16 = @import("std").mem.zeroes(u16),
    Scaling_list4x4: [6][16]u8 = @import("std").mem.zeroes([6][16]u8),
    Scaling_list8x8: [6][64]u8 = @import("std").mem.zeroes([6][64]u8),
};
pub const VideoH264SequenceParameterSet = extern struct {
    flags: VideoH264SpsFlags = @import("std").mem.zeroes(VideoH264SpsFlags),
    profile_idc: VideoH264ProfileIdc = @import("std").mem.zeroes(VideoH264ProfileIdc),
    level_idc: VideoH264LevelIdc = @import("std").mem.zeroes(VideoH264LevelIdc),
    chroma_format_idc: VideoH264ChromaFormatIdc = @import("std").mem.zeroes(VideoH264ChromaFormatIdc),
    seq_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    bit_depth_luma_minus8: u8 = @import("std").mem.zeroes(u8),
    bit_depth_chroma_minus8: u8 = @import("std").mem.zeroes(u8),
    log2_max_frame_num_minus4: u8 = @import("std").mem.zeroes(u8),
    pic_order_cnt_type: VideoH264PocType = @import("std").mem.zeroes(VideoH264PocType),
    offset_for_non_ref_pic: i32 = @import("std").mem.zeroes(i32),
    offset_for_top_to_bottom_field: i32 = @import("std").mem.zeroes(i32),
    log2_max_pic_order_cnt_lsb_minus4: u8 = @import("std").mem.zeroes(u8),
    num_ref_frames_in_pic_order_cnt_cycle: u8 = @import("std").mem.zeroes(u8),
    max_num_ref_frames: u8 = @import("std").mem.zeroes(u8),
    reserved1: u8 = @import("std").mem.zeroes(u8),
    pic_width_in_mbs_minus1: u32 = @import("std").mem.zeroes(u32),
    pic_height_in_map_units_minus1: u32 = @import("std").mem.zeroes(u32),
    frame_crop_left_offset: u32 = @import("std").mem.zeroes(u32),
    frame_crop_right_offset: u32 = @import("std").mem.zeroes(u32),
    frame_crop_top_offset: u32 = @import("std").mem.zeroes(u32),
    frame_crop_bottom_offset: u32 = @import("std").mem.zeroes(u32),
    reserved2: u32 = @import("std").mem.zeroes(u32),
    p_offset_for_ref_frame: [*c]const i32 = @import("std").mem.zeroes([*c]const i32),
    p_scaling_lists: [*c]const VideoH264ScalingLists = @import("std").mem.zeroes([*c]const VideoH264ScalingLists),
    p_sequence_parameter_set_vui: ?*const VideoH264SequenceParameterSetVui = @import("std").mem.zeroes(?*const VideoH264SequenceParameterSetVui),
};
pub const VideoH264PpsFlags = enum(u64) { null = 0, _ };
pub const VideoH264PictureParameterSet = extern struct {
    flags: VideoH264PpsFlags = @import("std").mem.zeroes(VideoH264PpsFlags),
    seq_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    pic_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    num_ref_idx_l0_default_active_minus1: u8 = @import("std").mem.zeroes(u8),
    num_ref_idx_l1_default_active_minus1: u8 = @import("std").mem.zeroes(u8),
    weighted_bipred_idc: VideoH264WeightedBipredIdc = @import("std").mem.zeroes(VideoH264WeightedBipredIdc),
    pic_init_qp_minus26: i8 = @import("std").mem.zeroes(i8),
    pic_init_qs_minus26: i8 = @import("std").mem.zeroes(i8),
    chroma_qp_index_offset: i8 = @import("std").mem.zeroes(i8),
    second_chroma_qp_index_offset: i8 = @import("std").mem.zeroes(i8),
    p_scaling_lists: [*c]const VideoH264ScalingLists = @import("std").mem.zeroes([*c]const VideoH264ScalingLists),
};
pub const VideoEncodeH264WeightTableFlags = extern struct {
    luma_weight_l0_flag: u32 = @import("std").mem.zeroes(u32),
    chroma_weight_l0_flag: u32 = @import("std").mem.zeroes(u32),
    luma_weight_l1_flag: u32 = @import("std").mem.zeroes(u32),
    chroma_weight_l1_flag: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoEncodeH264WeightTable = extern struct {
    flags: VideoEncodeH264WeightTableFlags = @import("std").mem.zeroes(VideoEncodeH264WeightTableFlags),
    luma_log2_weight_denom: u8 = @import("std").mem.zeroes(u8),
    chroma_log2_weight_denom: u8 = @import("std").mem.zeroes(u8),
    luma_weight_l0: [32]i8 = @import("std").mem.zeroes([32]i8),
    luma_offset_l0: [32]i8 = @import("std").mem.zeroes([32]i8),
    chroma_weight_l0: [32][2]i8 = @import("std").mem.zeroes([32][2]i8),
    chroma_offset_l0: [32][2]i8 = @import("std").mem.zeroes([32][2]i8),
    luma_weight_l1: [32]i8 = @import("std").mem.zeroes([32]i8),
    luma_offset_l1: [32]i8 = @import("std").mem.zeroes([32]i8),
    chroma_weight_l1: [32][2]i8 = @import("std").mem.zeroes([32][2]i8),
    chroma_offset_l1: [32][2]i8 = @import("std").mem.zeroes([32][2]i8),
};
pub const VideoEncodeH264SliceHeaderFlags = enum(u64) { null = 0, _ };
pub const VideoEncodeH264PictureInfoFlags = enum(u64) { null = 0, _ };
pub const VideoEncodeH264ReferenceInfoFlags = enum(u64) { null = 0, _ };
pub const VideoEncodeH264ReferenceListsInfoFlags = enum(u64) { null = 0, _ };
pub const VideoEncodeH264RefListModEntry = extern struct {
    modification_of_pic_nums_idc: VideoH264ModificationOfPicNumsIdc = @import("std").mem.zeroes(VideoH264ModificationOfPicNumsIdc),
    abs_diff_pic_num_minus1: u16 = @import("std").mem.zeroes(u16),
    long_term_pic_num: u16 = @import("std").mem.zeroes(u16),
};
pub const VideoEncodeH264RefPicMarkingEntry = extern struct {
    memory_management_control_operation: VideoH264MemMgmtControlOp = @import("std").mem.zeroes(VideoH264MemMgmtControlOp),
    difference_of_pic_nums_minus1: u16 = @import("std").mem.zeroes(u16),
    long_term_pic_num: u16 = @import("std").mem.zeroes(u16),
    long_term_frame_idx: u16 = @import("std").mem.zeroes(u16),
    max_long_term_frame_idx_plus1: u16 = @import("std").mem.zeroes(u16),
};
pub const VideoEncodeH264ReferenceListsInfo = extern struct {
    flags: VideoEncodeH264ReferenceListsInfoFlags = @import("std").mem.zeroes(VideoEncodeH264ReferenceListsInfoFlags),
    num_ref_idx_l0_active_minus1: u8 = @import("std").mem.zeroes(u8),
    num_ref_idx_l1_active_minus1: u8 = @import("std").mem.zeroes(u8),
    Ref_pic_list0: [32]u8 = @import("std").mem.zeroes([32]u8),
    Ref_pic_list1: [32]u8 = @import("std").mem.zeroes([32]u8),
    ref_list0mod_op_count: u8 = @import("std").mem.zeroes(u8),
    ref_list1mod_op_count: u8 = @import("std").mem.zeroes(u8),
    ref_pic_marking_op_count: u8 = @import("std").mem.zeroes(u8),
    reserved1: [7]u8 = @import("std").mem.zeroes([7]u8),
    p_ref_list0mod_operations: [*c]const VideoEncodeH264RefListModEntry = @import("std").mem.zeroes([*c]const VideoEncodeH264RefListModEntry),
    p_ref_list1mod_operations: [*c]const VideoEncodeH264RefListModEntry = @import("std").mem.zeroes([*c]const VideoEncodeH264RefListModEntry),
    p_ref_pic_marking_operations: [*c]const VideoEncodeH264RefPicMarkingEntry = @import("std").mem.zeroes([*c]const VideoEncodeH264RefPicMarkingEntry),
};
pub const VideoEncodeH264PictureInfo = extern struct {
    flags: VideoEncodeH264PictureInfoFlags = @import("std").mem.zeroes(VideoEncodeH264PictureInfoFlags),
    seq_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    pic_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    idr_pic_id: u16 = @import("std").mem.zeroes(u16),
    primary_pic_type: VideoH264PictureType = @import("std").mem.zeroes(VideoH264PictureType),
    frame_num: u32 = @import("std").mem.zeroes(u32),
    Pic_order_cnt: i32 = @import("std").mem.zeroes(i32),
    temporal_id: u8 = @import("std").mem.zeroes(u8),
    reserved1: [3]u8 = @import("std").mem.zeroes([3]u8),
    p_ref_lists: ?*const VideoEncodeH264ReferenceListsInfo = @import("std").mem.zeroes(?*const VideoEncodeH264ReferenceListsInfo),
};
pub const VideoEncodeH264ReferenceInfo = extern struct {
    flags: VideoEncodeH264ReferenceInfoFlags = @import("std").mem.zeroes(VideoEncodeH264ReferenceInfoFlags),
    primary_pic_type: VideoH264PictureType = @import("std").mem.zeroes(VideoH264PictureType),
    Frame_num: u32 = @import("std").mem.zeroes(u32),
    Pic_order_cnt: i32 = @import("std").mem.zeroes(i32),
    long_term_pic_num: u16 = @import("std").mem.zeroes(u16),
    long_term_frame_idx: u16 = @import("std").mem.zeroes(u16),
    temporal_id: u8 = @import("std").mem.zeroes(u8),
};
pub const VideoEncodeH264SliceHeader = extern struct {
    flags: VideoEncodeH264SliceHeaderFlags = @import("std").mem.zeroes(VideoEncodeH264SliceHeaderFlags),
    first_mb_in_slice: u32 = @import("std").mem.zeroes(u32),
    slice_type: VideoH264SliceType = @import("std").mem.zeroes(VideoH264SliceType),
    slice_alpha_c0_offset_div2: i8 = @import("std").mem.zeroes(i8),
    slice_beta_offset_div2: i8 = @import("std").mem.zeroes(i8),
    slice_qp_delta: i8 = @import("std").mem.zeroes(i8),
    reserved1: u8 = @import("std").mem.zeroes(u8),
    cabac_init_idc: VideoH264CabacInitIdc = @import("std").mem.zeroes(VideoH264CabacInitIdc),
    disable_deblocking_filter_idc: VideoH264DisableDeblockingFilterIdc = @import("std").mem.zeroes(VideoH264DisableDeblockingFilterIdc),
    p_weight_table: [*c]const VideoEncodeH264WeightTable = @import("std").mem.zeroes([*c]const VideoEncodeH264WeightTable),
};
pub const VideoEncodeH264CapabilityFlagsKHR = enum(u32) {
    null = 0,
    h264_capability_hrd_compliance_bit_khr = 1,
    h264_capability_prediction_weight_table_generated_bit_khr = 2,
    h264_capability_row_unaligned_slice_bit_khr = 4,
    h264_capability_different_slice_type_bit_khr = 8,
    h264_capability_b_frame_in_l0_list_bit_khr = 16,
    h264_capability_b_frame_in_l1_list_bit_khr = 32,
    h264_capability_per_picture_type_min_max_qp_bit_khr = 64,
    h264_capability_per_slice_constant_qp_bit_khr = 128,
    h264_capability_generate_prefix_nalu_bit_khr = 256,
};
pub const VideoEncodeH264StdFlagsKHR = enum(u32) {
    null = 0,
    h264_std_separate_color_plane_flag_set_bit_khr = 1,
    h264_std_qpprime_y_zero_transform_bypass_flag_set_bit_khr = 2,
    h264_std_scaling_matrix_present_flag_set_bit_khr = 4,
    h264_std_chroma_qp_index_offset_bit_khr = 8,
    h264_std_second_chroma_qp_index_offset_bit_khr = 16,
    h264_std_pic_init_qp_minus26_bit_khr = 32,
    h264_std_weighted_pred_flag_set_bit_khr = 64,
    h264_std_weighted_bipred_idc_explicit_bit_khr = 128,
    h264_std_weighted_bipred_idc_implicit_bit_khr = 256,
    h264_std_transform_8x8_mode_flag_set_bit_khr = 512,
    h264_std_direct_spatial_mv_pred_flag_unset_bit_khr = 1024,
    h264_std_entropy_coding_mode_flag_unset_bit_khr = 2048,
    h264_std_entropy_coding_mode_flag_set_bit_khr = 4096,
    h264_std_direct_8x8_inference_flag_unset_bit_khr = 8192,
    h264_std_constrained_intra_pred_flag_set_bit_khr = 16384,
    h264_std_deblocking_filter_disabled_bit_khr = 32768,
    h264_std_deblocking_filter_enabled_bit_khr = 65536,
    h264_std_deblocking_filter_partial_bit_khr = 131072,
    h264_std_slice_qp_delta_bit_khr = 524288,
    h264_std_different_slice_qp_delta_bit_khr = 1048576,
};
pub const VideoEncodeH264RateControlFlagsKHR = enum(u32) {
    null = 0,
    h264_rate_control_attempt_hrd_compliance_bit_khr = 1,
    h264_rate_control_regular_gop_bit_khr = 2,
    h264_rate_control_reference_pattern_flat_bit_khr = 4,
    h264_rate_control_reference_pattern_dyadic_bit_khr = 8,
    h264_rate_control_temporal_layer_pattern_dyadic_bit_khr = 16,
};
pub const VideoEncodeH264CapabilitiesKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264capabilities_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: VideoEncodeH264CapabilityFlagsKHR = @import("std").mem.zeroes(VideoEncodeH264CapabilityFlagsKHR),
    max_level_idc: VideoH264LevelIdc = @import("std").mem.zeroes(VideoH264LevelIdc),
    max_slice_count: u32 = @import("std").mem.zeroes(u32),
    max_ppicture_l0reference_count: u32 = @import("std").mem.zeroes(u32),
    max_bpicture_l0reference_count: u32 = @import("std").mem.zeroes(u32),
    max_l1reference_count: u32 = @import("std").mem.zeroes(u32),
    max_temporal_layer_count: u32 = @import("std").mem.zeroes(u32),
    expect_dyadic_temporal_layer_pattern: Bool32 = @import("std").mem.zeroes(Bool32),
    min_qp: i32 = @import("std").mem.zeroes(i32),
    max_qp: i32 = @import("std").mem.zeroes(i32),
    prefers_gop_remaining_frames: Bool32 = @import("std").mem.zeroes(Bool32),
    requires_gop_remaining_frames: Bool32 = @import("std").mem.zeroes(Bool32),
    std_syntax_flags: VideoEncodeH264StdFlagsKHR = @import("std").mem.zeroes(VideoEncodeH264StdFlagsKHR),
};
pub const VideoEncodeH264QpKHR = extern struct {
    qp_i: i32 = @import("std").mem.zeroes(i32),
    qp_p: i32 = @import("std").mem.zeroes(i32),
    qp_b: i32 = @import("std").mem.zeroes(i32),
};
pub const VideoEncodeH264QualityLevelPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264quality_level_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    preferred_rate_control_flags: VideoEncodeH264RateControlFlagsKHR = @import("std").mem.zeroes(VideoEncodeH264RateControlFlagsKHR),
    preferred_gop_frame_count: u32 = @import("std").mem.zeroes(u32),
    preferred_idr_period: u32 = @import("std").mem.zeroes(u32),
    preferred_consecutive_bframe_count: u32 = @import("std").mem.zeroes(u32),
    preferred_temporal_layer_count: u32 = @import("std").mem.zeroes(u32),
    preferred_constant_qp: VideoEncodeH264QpKHR = @import("std").mem.zeroes(VideoEncodeH264QpKHR),
    preferred_max_l0reference_count: u32 = @import("std").mem.zeroes(u32),
    preferred_max_l1reference_count: u32 = @import("std").mem.zeroes(u32),
    preferred_std_entropy_coding_mode_flag: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const VideoEncodeH264SessionCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264session_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    use_max_level_idc: Bool32 = @import("std").mem.zeroes(Bool32),
    max_level_idc: VideoH264LevelIdc = @import("std").mem.zeroes(VideoH264LevelIdc),
};
pub const VideoEncodeH264SessionParametersAddInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264session_parameters_add_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    std_spscount: u32 = @import("std").mem.zeroes(u32),
    p_std_spss: ?*const VideoH264SequenceParameterSet = @import("std").mem.zeroes(?*const VideoH264SequenceParameterSet),
    std_ppscount: u32 = @import("std").mem.zeroes(u32),
    p_std_ppss: ?*const VideoH264PictureParameterSet = @import("std").mem.zeroes(?*const VideoH264PictureParameterSet),
};
pub const VideoEncodeH264SessionParametersCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264session_parameters_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    max_std_spscount: u32 = @import("std").mem.zeroes(u32),
    max_std_ppscount: u32 = @import("std").mem.zeroes(u32),
    p_parameters_add_info: [*c]const VideoEncodeH264SessionParametersAddInfoKHR = @import("std").mem.zeroes([*c]const VideoEncodeH264SessionParametersAddInfoKHR),
};
pub const VideoEncodeH264SessionParametersGetInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264session_parameters_get_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    write_std_sps: Bool32 = @import("std").mem.zeroes(Bool32),
    write_std_pps: Bool32 = @import("std").mem.zeroes(Bool32),
    std_spsid: u32 = @import("std").mem.zeroes(u32),
    std_ppsid: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoEncodeH264SessionParametersFeedbackInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264session_parameters_feedback_info_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    has_std_spsoverrides: Bool32 = @import("std").mem.zeroes(Bool32),
    has_std_ppsoverrides: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const VideoEncodeH264NaluSliceInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264nalu_slice_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    constant_qp: i32 = @import("std").mem.zeroes(i32),
    p_std_slice_header: ?*const VideoEncodeH264SliceHeader = @import("std").mem.zeroes(?*const VideoEncodeH264SliceHeader),
};
pub const VideoEncodeH264PictureInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264picture_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    nalu_slice_entry_count: u32 = @import("std").mem.zeroes(u32),
    p_nalu_slice_entries: [*c]const VideoEncodeH264NaluSliceInfoKHR = @import("std").mem.zeroes([*c]const VideoEncodeH264NaluSliceInfoKHR),
    p_std_picture_info: ?*const VideoEncodeH264PictureInfo = @import("std").mem.zeroes(?*const VideoEncodeH264PictureInfo),
    generate_prefix_nalu: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const VideoEncodeH264DpbSlotInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264dpb_slot_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_std_reference_info: ?*const VideoEncodeH264ReferenceInfo = @import("std").mem.zeroes(?*const VideoEncodeH264ReferenceInfo),
};
pub const VideoEncodeH264ProfileInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264profile_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    std_profile_idc: VideoH264ProfileIdc = @import("std").mem.zeroes(VideoH264ProfileIdc),
};
pub const VideoEncodeH264RateControlInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264rate_control_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: VideoEncodeH264RateControlFlagsKHR = @import("std").mem.zeroes(VideoEncodeH264RateControlFlagsKHR),
    gop_frame_count: u32 = @import("std").mem.zeroes(u32),
    idr_period: u32 = @import("std").mem.zeroes(u32),
    consecutive_bframe_count: u32 = @import("std").mem.zeroes(u32),
    temporal_layer_count: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoEncodeH264FrameSizeKHR = extern struct {
    frame_isize: u32 = @import("std").mem.zeroes(u32),
    frame_psize: u32 = @import("std").mem.zeroes(u32),
    frame_bsize: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoEncodeH264RateControlLayerInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264rate_control_layer_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    use_min_qp: Bool32 = @import("std").mem.zeroes(Bool32),
    min_qp: VideoEncodeH264QpKHR = @import("std").mem.zeroes(VideoEncodeH264QpKHR),
    use_max_qp: Bool32 = @import("std").mem.zeroes(Bool32),
    max_qp: VideoEncodeH264QpKHR = @import("std").mem.zeroes(VideoEncodeH264QpKHR),
    use_max_frame_size: Bool32 = @import("std").mem.zeroes(Bool32),
    max_frame_size: VideoEncodeH264FrameSizeKHR = @import("std").mem.zeroes(VideoEncodeH264FrameSizeKHR),
};
pub const VideoEncodeH264GopRemainingFrameInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h264gop_remaining_frame_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    use_gop_remaining_frames: Bool32 = @import("std").mem.zeroes(Bool32),
    gop_remaining_i: u32 = @import("std").mem.zeroes(u32),
    gop_remaining_p: u32 = @import("std").mem.zeroes(u32),
    gop_remaining_b: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoH265ChromaFormatIdc = enum(u32) {
    h265_chroma_format_idc_monochrome = 0,
    h265_chroma_format_idc_420 = 1,
    h265_chroma_format_idc_422 = 2,
    h265_chroma_format_idc_444 = 3,
    pub const Self = @This();
};
pub const VideoH265ProfileIdc = enum(u32) {
    null = 0,
    h265_profile_idc_main = 1,
    h265_profile_idc_main_10 = 2,
    h265_profile_idc_main_still_picture = 3,
    h265_profile_idc_format_range_extensions = 4,
    h265_profile_idc_scc_extensions = 9,
    pub const Self = @This();
};
pub const VideoH265LevelIdc = enum(u32) {
    h265_level_idc_1_0 = 0,
    h265_level_idc_2_0 = 1,
    h265_level_idc_2_1 = 2,
    h265_level_idc_3_0 = 3,
    h265_level_idc_3_1 = 4,
    h265_level_idc_4_0 = 5,
    h265_level_idc_4_1 = 6,
    h265_level_idc_5_0 = 7,
    h265_level_idc_5_1 = 8,
    h265_level_idc_5_2 = 9,
    h265_level_idc_6_0 = 10,
    h265_level_idc_6_1 = 11,
    h265_level_idc_6_2 = 12,
    pub const Self = @This();
};
pub const VideoH265SliceType = enum(u32) {
    h265_slice_type_b = 0,
    h265_slice_type_p = 1,
    h265_slice_type_i = 2,
    pub const Self = @This();
};
pub const VideoH265PictureType = enum(u32) {
    h265_picture_type_p = 0,
    h265_picture_type_b = 1,
    h265_picture_type_i = 2,
    h265_picture_type_idr = 3,
    pub const Self = @This();
};
pub const VideoH265AspectRatioIdc = enum(u32) {
    h265_aspect_ratio_idc_unspecified = 0,
    h265_aspect_ratio_idc_square = 1,
    h265_aspect_ratio_idc_12_11 = 2,
    h265_aspect_ratio_idc_10_11 = 3,
    h265_aspect_ratio_idc_16_11 = 4,
    h265_aspect_ratio_idc_40_33 = 5,
    h265_aspect_ratio_idc_24_11 = 6,
    h265_aspect_ratio_idc_20_11 = 7,
    h265_aspect_ratio_idc_32_11 = 8,
    h265_aspect_ratio_idc_80_33 = 9,
    h265_aspect_ratio_idc_18_11 = 10,
    h265_aspect_ratio_idc_15_11 = 11,
    h265_aspect_ratio_idc_64_33 = 12,
    h265_aspect_ratio_idc_160_99 = 13,
    h265_aspect_ratio_idc_4_3 = 14,
    h265_aspect_ratio_idc_3_2 = 15,
    h265_aspect_ratio_idc_2_1 = 16,
    h265_aspect_ratio_idc_extended_sar = 255,
    pub const Self = @This();
};
pub const VideoH265DecPicBufMgr = extern struct {
    max_latency_increase_plus1: [7]u32 = @import("std").mem.zeroes([7]u32),
    max_dec_pic_buffering_minus1: [7]u8 = @import("std").mem.zeroes([7]u8),
    max_num_reorder_pics: [7]u8 = @import("std").mem.zeroes([7]u8),
};
pub const VideoH265SubLayerHrdParameters = extern struct {
    bit_rate_value_minus1: [32]u32 = @import("std").mem.zeroes([32]u32),
    cpb_size_value_minus1: [32]u32 = @import("std").mem.zeroes([32]u32),
    cpb_size_du_value_minus1: [32]u32 = @import("std").mem.zeroes([32]u32),
    bit_rate_du_value_minus1: [32]u32 = @import("std").mem.zeroes([32]u32),
    cbr_flag: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoH265HrdFlags = enum(u64) { null = 0, _ };
pub const VideoH265HrdParameters = extern struct {
    flags: VideoH265HrdFlags = @import("std").mem.zeroes(VideoH265HrdFlags),
    tick_divisor_minus2: u8 = @import("std").mem.zeroes(u8),
    du_cpb_removal_delay_increment_length_minus1: u8 = @import("std").mem.zeroes(u8),
    dpb_output_delay_du_length_minus1: u8 = @import("std").mem.zeroes(u8),
    bit_rate_scale: u8 = @import("std").mem.zeroes(u8),
    cpb_size_scale: u8 = @import("std").mem.zeroes(u8),
    cpb_size_du_scale: u8 = @import("std").mem.zeroes(u8),
    initial_cpb_removal_delay_length_minus1: u8 = @import("std").mem.zeroes(u8),
    au_cpb_removal_delay_length_minus1: u8 = @import("std").mem.zeroes(u8),
    dpb_output_delay_length_minus1: u8 = @import("std").mem.zeroes(u8),
    cpb_cnt_minus1: [7]u8 = @import("std").mem.zeroes([7]u8),
    elemental_duration_in_tc_minus1: [7]u16 = @import("std").mem.zeroes([7]u16),
    reserved: [3]u16 = @import("std").mem.zeroes([3]u16),
    p_sub_layer_hrd_parameters_nal: [*c]const VideoH265SubLayerHrdParameters = @import("std").mem.zeroes([*c]const VideoH265SubLayerHrdParameters),
    p_sub_layer_hrd_parameters_vcl: [*c]const VideoH265SubLayerHrdParameters = @import("std").mem.zeroes([*c]const VideoH265SubLayerHrdParameters),
};
pub const VideoH265VpsFlags = enum(u64) { null = 0, _ };
pub const VideoH265ProfileTierLevelFlags = enum(u64) { null = 0, _ };
pub const VideoH265ProfileTierLevel = extern struct {
    flags: VideoH265ProfileTierLevelFlags = @import("std").mem.zeroes(VideoH265ProfileTierLevelFlags),
    general_profile_idc: VideoH265ProfileIdc = @import("std").mem.zeroes(VideoH265ProfileIdc),
    general_level_idc: VideoH265LevelIdc = @import("std").mem.zeroes(VideoH265LevelIdc),
};
pub const VideoH265VideoParameterSet = extern struct {
    flags: VideoH265VpsFlags = @import("std").mem.zeroes(VideoH265VpsFlags),
    vps_video_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    vps_max_sub_layers_minus1: u8 = @import("std").mem.zeroes(u8),
    reserved1: u8 = @import("std").mem.zeroes(u8),
    reserved2: u8 = @import("std").mem.zeroes(u8),
    vps_num_units_in_tick: u32 = @import("std").mem.zeroes(u32),
    vps_time_scale: u32 = @import("std").mem.zeroes(u32),
    vps_num_ticks_poc_diff_one_minus1: u32 = @import("std").mem.zeroes(u32),
    reserved3: u32 = @import("std").mem.zeroes(u32),
    p_dec_pic_buf_mgr: [*c]const VideoH265DecPicBufMgr = @import("std").mem.zeroes([*c]const VideoH265DecPicBufMgr),
    p_hrd_parameters: ?*const VideoH265HrdParameters = @import("std").mem.zeroes(?*const VideoH265HrdParameters),
    p_profile_tier_level: ?*const VideoH265ProfileTierLevel = @import("std").mem.zeroes(?*const VideoH265ProfileTierLevel),
};
pub const VideoH265ScalingLists = extern struct {
    Scaling_list4x4: [6][16]u8 = @import("std").mem.zeroes([6][16]u8),
    Scaling_list8x8: [6][64]u8 = @import("std").mem.zeroes([6][64]u8),
    Scaling_list16x16: [6][64]u8 = @import("std").mem.zeroes([6][64]u8),
    Scaling_list32x32: [2][64]u8 = @import("std").mem.zeroes([2][64]u8),
    Scaling_list_dccoef16x16: [6]u8 = @import("std").mem.zeroes([6]u8),
    Scaling_list_dccoef32x32: [2]u8 = @import("std").mem.zeroes([2]u8),
};
pub const VideoH265SpsVuiFlags = enum(u64) { null = 0, _ };
pub const VideoH265SequenceParameterSetVui = extern struct {
    flags: VideoH265SpsVuiFlags = @import("std").mem.zeroes(VideoH265SpsVuiFlags),
    aspect_ratio_idc: VideoH265AspectRatioIdc = @import("std").mem.zeroes(VideoH265AspectRatioIdc),
    sar_width: u16 = @import("std").mem.zeroes(u16),
    sar_height: u16 = @import("std").mem.zeroes(u16),
    video_format: u8 = @import("std").mem.zeroes(u8),
    colour_primaries: u8 = @import("std").mem.zeroes(u8),
    transfer_characteristics: u8 = @import("std").mem.zeroes(u8),
    matrix_coeffs: u8 = @import("std").mem.zeroes(u8),
    chroma_sample_loc_type_top_field: u8 = @import("std").mem.zeroes(u8),
    chroma_sample_loc_type_bottom_field: u8 = @import("std").mem.zeroes(u8),
    reserved1: u8 = @import("std").mem.zeroes(u8),
    reserved2: u8 = @import("std").mem.zeroes(u8),
    def_disp_win_left_offset: u16 = @import("std").mem.zeroes(u16),
    def_disp_win_right_offset: u16 = @import("std").mem.zeroes(u16),
    def_disp_win_top_offset: u16 = @import("std").mem.zeroes(u16),
    def_disp_win_bottom_offset: u16 = @import("std").mem.zeroes(u16),
    vui_num_units_in_tick: u32 = @import("std").mem.zeroes(u32),
    vui_time_scale: u32 = @import("std").mem.zeroes(u32),
    vui_num_ticks_poc_diff_one_minus1: u32 = @import("std").mem.zeroes(u32),
    min_spatial_segmentation_idc: u16 = @import("std").mem.zeroes(u16),
    reserved3: u16 = @import("std").mem.zeroes(u16),
    max_bytes_per_pic_denom: u8 = @import("std").mem.zeroes(u8),
    max_bits_per_min_cu_denom: u8 = @import("std").mem.zeroes(u8),
    log2_max_mv_length_horizontal: u8 = @import("std").mem.zeroes(u8),
    log2_max_mv_length_vertical: u8 = @import("std").mem.zeroes(u8),
    p_hrd_parameters: ?*const VideoH265HrdParameters = @import("std").mem.zeroes(?*const VideoH265HrdParameters),
};
pub const VideoH265PredictorPaletteEntries = extern struct {
    Predictor_palette_entries: [3][128]u16 = @import("std").mem.zeroes([3][128]u16),
};
pub const VideoH265SpsFlags = enum(u64) { null = 0, _ };
pub const VideoH265ShortTermRefPicSetFlags = enum(u64) { null = 0, _ };
pub const VideoH265ShortTermRefPicSet = extern struct {
    flags: VideoH265ShortTermRefPicSetFlags = @import("std").mem.zeroes(VideoH265ShortTermRefPicSetFlags),
    delta_idx_minus1: u32 = @import("std").mem.zeroes(u32),
    use_delta_flag: u16 = @import("std").mem.zeroes(u16),
    abs_delta_rps_minus1: u16 = @import("std").mem.zeroes(u16),
    used_by_curr_pic_flag: u16 = @import("std").mem.zeroes(u16),
    used_by_curr_pic_s0_flag: u16 = @import("std").mem.zeroes(u16),
    used_by_curr_pic_s1_flag: u16 = @import("std").mem.zeroes(u16),
    reserved1: u16 = @import("std").mem.zeroes(u16),
    reserved2: u8 = @import("std").mem.zeroes(u8),
    reserved3: u8 = @import("std").mem.zeroes(u8),
    num_negative_pics: u8 = @import("std").mem.zeroes(u8),
    num_positive_pics: u8 = @import("std").mem.zeroes(u8),
    delta_poc_s0_minus1: [16]u16 = @import("std").mem.zeroes([16]u16),
    delta_poc_s1_minus1: [16]u16 = @import("std").mem.zeroes([16]u16),
};
pub const VideoH265LongTermRefPicsSps = extern struct {
    used_by_curr_pic_lt_sps_flag: u32 = @import("std").mem.zeroes(u32),
    lt_ref_pic_poc_lsb_sps: [32]u32 = @import("std").mem.zeroes([32]u32),
};
pub const VideoH265SequenceParameterSet = extern struct {
    flags: VideoH265SpsFlags = @import("std").mem.zeroes(VideoH265SpsFlags),
    chroma_format_idc: VideoH265ChromaFormatIdc = @import("std").mem.zeroes(VideoH265ChromaFormatIdc),
    pic_width_in_luma_samples: u32 = @import("std").mem.zeroes(u32),
    pic_height_in_luma_samples: u32 = @import("std").mem.zeroes(u32),
    sps_video_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    sps_max_sub_layers_minus1: u8 = @import("std").mem.zeroes(u8),
    sps_seq_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    bit_depth_luma_minus8: u8 = @import("std").mem.zeroes(u8),
    bit_depth_chroma_minus8: u8 = @import("std").mem.zeroes(u8),
    log2_max_pic_order_cnt_lsb_minus4: u8 = @import("std").mem.zeroes(u8),
    log2_min_luma_coding_block_size_minus3: u8 = @import("std").mem.zeroes(u8),
    log2_diff_max_min_luma_coding_block_size: u8 = @import("std").mem.zeroes(u8),
    log2_min_luma_transform_block_size_minus2: u8 = @import("std").mem.zeroes(u8),
    log2_diff_max_min_luma_transform_block_size: u8 = @import("std").mem.zeroes(u8),
    max_transform_hierarchy_depth_inter: u8 = @import("std").mem.zeroes(u8),
    max_transform_hierarchy_depth_intra: u8 = @import("std").mem.zeroes(u8),
    num_short_term_ref_pic_sets: u8 = @import("std").mem.zeroes(u8),
    num_long_term_ref_pics_sps: u8 = @import("std").mem.zeroes(u8),
    pcm_sample_bit_depth_luma_minus1: u8 = @import("std").mem.zeroes(u8),
    pcm_sample_bit_depth_chroma_minus1: u8 = @import("std").mem.zeroes(u8),
    log2_min_pcm_luma_coding_block_size_minus3: u8 = @import("std").mem.zeroes(u8),
    log2_diff_max_min_pcm_luma_coding_block_size: u8 = @import("std").mem.zeroes(u8),
    reserved1: u8 = @import("std").mem.zeroes(u8),
    reserved2: u8 = @import("std").mem.zeroes(u8),
    palette_max_size: u8 = @import("std").mem.zeroes(u8),
    delta_palette_max_predictor_size: u8 = @import("std").mem.zeroes(u8),
    motion_vector_resolution_control_idc: u8 = @import("std").mem.zeroes(u8),
    sps_num_palette_predictor_initializers_minus1: u8 = @import("std").mem.zeroes(u8),
    conf_win_left_offset: u32 = @import("std").mem.zeroes(u32),
    conf_win_right_offset: u32 = @import("std").mem.zeroes(u32),
    conf_win_top_offset: u32 = @import("std").mem.zeroes(u32),
    conf_win_bottom_offset: u32 = @import("std").mem.zeroes(u32),
    p_profile_tier_level: ?*const VideoH265ProfileTierLevel = @import("std").mem.zeroes(?*const VideoH265ProfileTierLevel),
    p_dec_pic_buf_mgr: [*c]const VideoH265DecPicBufMgr = @import("std").mem.zeroes([*c]const VideoH265DecPicBufMgr),
    p_scaling_lists: [*c]const VideoH265ScalingLists = @import("std").mem.zeroes([*c]const VideoH265ScalingLists),
    p_short_term_ref_pic_set: ?*const VideoH265ShortTermRefPicSet = @import("std").mem.zeroes(?*const VideoH265ShortTermRefPicSet),
    p_long_term_ref_pics_sps: [*c]const VideoH265LongTermRefPicsSps = @import("std").mem.zeroes([*c]const VideoH265LongTermRefPicsSps),
    p_sequence_parameter_set_vui: ?*const VideoH265SequenceParameterSetVui = @import("std").mem.zeroes(?*const VideoH265SequenceParameterSetVui),
    p_predictor_palette_entries: [*c]const VideoH265PredictorPaletteEntries = @import("std").mem.zeroes([*c]const VideoH265PredictorPaletteEntries),
};
pub const VideoH265PpsFlags = enum(u64) { null = 0, _ };
pub const VideoH265PictureParameterSet = extern struct {
    flags: VideoH265PpsFlags = @import("std").mem.zeroes(VideoH265PpsFlags),
    pps_pic_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    pps_seq_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    sps_video_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    num_extra_slice_header_bits: u8 = @import("std").mem.zeroes(u8),
    num_ref_idx_l0_default_active_minus1: u8 = @import("std").mem.zeroes(u8),
    num_ref_idx_l1_default_active_minus1: u8 = @import("std").mem.zeroes(u8),
    init_qp_minus26: i8 = @import("std").mem.zeroes(i8),
    diff_cu_qp_delta_depth: u8 = @import("std").mem.zeroes(u8),
    pps_cb_qp_offset: i8 = @import("std").mem.zeroes(i8),
    pps_cr_qp_offset: i8 = @import("std").mem.zeroes(i8),
    pps_beta_offset_div2: i8 = @import("std").mem.zeroes(i8),
    pps_tc_offset_div2: i8 = @import("std").mem.zeroes(i8),
    log2_parallel_merge_level_minus2: u8 = @import("std").mem.zeroes(u8),
    log2_max_transform_skip_block_size_minus2: u8 = @import("std").mem.zeroes(u8),
    diff_cu_chroma_qp_offset_depth: u8 = @import("std").mem.zeroes(u8),
    chroma_qp_offset_list_len_minus1: u8 = @import("std").mem.zeroes(u8),
    cb_qp_offset_list: [6]i8 = @import("std").mem.zeroes([6]i8),
    cr_qp_offset_list: [6]i8 = @import("std").mem.zeroes([6]i8),
    log2_sao_offset_scale_luma: u8 = @import("std").mem.zeroes(u8),
    log2_sao_offset_scale_chroma: u8 = @import("std").mem.zeroes(u8),
    pps_act_y_qp_offset_plus5: i8 = @import("std").mem.zeroes(i8),
    pps_act_cb_qp_offset_plus5: i8 = @import("std").mem.zeroes(i8),
    pps_act_cr_qp_offset_plus3: i8 = @import("std").mem.zeroes(i8),
    pps_num_palette_predictor_initializers: u8 = @import("std").mem.zeroes(u8),
    luma_bit_depth_entry_minus8: u8 = @import("std").mem.zeroes(u8),
    chroma_bit_depth_entry_minus8: u8 = @import("std").mem.zeroes(u8),
    num_tile_columns_minus1: u8 = @import("std").mem.zeroes(u8),
    num_tile_rows_minus1: u8 = @import("std").mem.zeroes(u8),
    reserved1: u8 = @import("std").mem.zeroes(u8),
    reserved2: u8 = @import("std").mem.zeroes(u8),
    column_width_minus1: [19]u16 = @import("std").mem.zeroes([19]u16),
    row_height_minus1: [21]u16 = @import("std").mem.zeroes([21]u16),
    reserved3: u32 = @import("std").mem.zeroes(u32),
    p_scaling_lists: [*c]const VideoH265ScalingLists = @import("std").mem.zeroes([*c]const VideoH265ScalingLists),
    p_predictor_palette_entries: [*c]const VideoH265PredictorPaletteEntries = @import("std").mem.zeroes([*c]const VideoH265PredictorPaletteEntries),
};
pub const VideoEncodeH265WeightTableFlags = extern struct {
    luma_weight_l0_flag: u16 = @import("std").mem.zeroes(u16),
    chroma_weight_l0_flag: u16 = @import("std").mem.zeroes(u16),
    luma_weight_l1_flag: u16 = @import("std").mem.zeroes(u16),
    chroma_weight_l1_flag: u16 = @import("std").mem.zeroes(u16),
};
pub const VideoEncodeH265WeightTable = extern struct {
    flags: VideoEncodeH265WeightTableFlags = @import("std").mem.zeroes(VideoEncodeH265WeightTableFlags),
    luma_log2_weight_denom: u8 = @import("std").mem.zeroes(u8),
    delta_chroma_log2_weight_denom: i8 = @import("std").mem.zeroes(i8),
    delta_luma_weight_l0: [15]i8 = @import("std").mem.zeroes([15]i8),
    luma_offset_l0: [15]i8 = @import("std").mem.zeroes([15]i8),
    delta_chroma_weight_l0: [15][2]i8 = @import("std").mem.zeroes([15][2]i8),
    delta_chroma_offset_l0: [15][2]i8 = @import("std").mem.zeroes([15][2]i8),
    delta_luma_weight_l1: [15]i8 = @import("std").mem.zeroes([15]i8),
    luma_offset_l1: [15]i8 = @import("std").mem.zeroes([15]i8),
    delta_chroma_weight_l1: [15][2]i8 = @import("std").mem.zeroes([15][2]i8),
    delta_chroma_offset_l1: [15][2]i8 = @import("std").mem.zeroes([15][2]i8),
};
pub const VideoEncodeH265SliceSegmentHeaderFlags = enum(u64) { null = 0, _ };
pub const VideoEncodeH265SliceSegmentHeader = extern struct {
    flags: VideoEncodeH265SliceSegmentHeaderFlags = @import("std").mem.zeroes(VideoEncodeH265SliceSegmentHeaderFlags),
    slice_type: VideoH265SliceType = @import("std").mem.zeroes(VideoH265SliceType),
    slice_segment_address: u32 = @import("std").mem.zeroes(u32),
    collocated_ref_idx: u8 = @import("std").mem.zeroes(u8),
    Max_num_merge_cand: u8 = @import("std").mem.zeroes(u8),
    slice_cb_qp_offset: i8 = @import("std").mem.zeroes(i8),
    slice_cr_qp_offset: i8 = @import("std").mem.zeroes(i8),
    slice_beta_offset_div2: i8 = @import("std").mem.zeroes(i8),
    slice_tc_offset_div2: i8 = @import("std").mem.zeroes(i8),
    slice_act_y_qp_offset: i8 = @import("std").mem.zeroes(i8),
    slice_act_cb_qp_offset: i8 = @import("std").mem.zeroes(i8),
    slice_act_cr_qp_offset: i8 = @import("std").mem.zeroes(i8),
    slice_qp_delta: i8 = @import("std").mem.zeroes(i8),
    reserved1: u16 = @import("std").mem.zeroes(u16),
    p_weight_table: [*c]const VideoEncodeH265WeightTable = @import("std").mem.zeroes([*c]const VideoEncodeH265WeightTable),
};
pub const VideoEncodeH265ReferenceListsInfoFlags = enum(u64) { null = 0, _ };
pub const VideoEncodeH265ReferenceListsInfo = extern struct {
    flags: VideoEncodeH265ReferenceListsInfoFlags = @import("std").mem.zeroes(VideoEncodeH265ReferenceListsInfoFlags),
    num_ref_idx_l0_active_minus1: u8 = @import("std").mem.zeroes(u8),
    num_ref_idx_l1_active_minus1: u8 = @import("std").mem.zeroes(u8),
    Ref_pic_list0: [15]u8 = @import("std").mem.zeroes([15]u8),
    Ref_pic_list1: [15]u8 = @import("std").mem.zeroes([15]u8),
    list_entry_l0: [15]u8 = @import("std").mem.zeroes([15]u8),
    list_entry_l1: [15]u8 = @import("std").mem.zeroes([15]u8),
};
pub const VideoEncodeH265PictureInfoFlags = enum(u64) { null = 0, _ };
pub const VideoEncodeH265LongTermRefPics = extern struct {
    num_long_term_sps: u8 = @import("std").mem.zeroes(u8),
    num_long_term_pics: u8 = @import("std").mem.zeroes(u8),
    lt_idx_sps: [32]u8 = @import("std").mem.zeroes([32]u8),
    poc_lsb_lt: [16]u8 = @import("std").mem.zeroes([16]u8),
    used_by_curr_pic_lt_flag: u16 = @import("std").mem.zeroes(u16),
    delta_poc_msb_present_flag: [48]u8 = @import("std").mem.zeroes([48]u8),
    delta_poc_msb_cycle_lt: [48]u8 = @import("std").mem.zeroes([48]u8),
};
pub const VideoEncodeH265PictureInfo = extern struct {
    flags: VideoEncodeH265PictureInfoFlags = @import("std").mem.zeroes(VideoEncodeH265PictureInfoFlags),
    pic_type: VideoH265PictureType = @import("std").mem.zeroes(VideoH265PictureType),
    sps_video_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    pps_seq_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    pps_pic_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    short_term_ref_pic_set_idx: u8 = @import("std").mem.zeroes(u8),
    Pic_order_cnt_val: i32 = @import("std").mem.zeroes(i32),
    Temporal_id: u8 = @import("std").mem.zeroes(u8),
    reserved1: [7]u8 = @import("std").mem.zeroes([7]u8),
    p_ref_lists: ?*const VideoEncodeH265ReferenceListsInfo = @import("std").mem.zeroes(?*const VideoEncodeH265ReferenceListsInfo),
    p_short_term_ref_pic_set: ?*const VideoH265ShortTermRefPicSet = @import("std").mem.zeroes(?*const VideoH265ShortTermRefPicSet),
    p_long_term_ref_pics: [*c]const VideoEncodeH265LongTermRefPics = @import("std").mem.zeroes([*c]const VideoEncodeH265LongTermRefPics),
};
pub const VideoEncodeH265ReferenceInfoFlags = enum(u64) { null = 0, _ };
pub const VideoEncodeH265ReferenceInfo = extern struct {
    flags: VideoEncodeH265ReferenceInfoFlags = @import("std").mem.zeroes(VideoEncodeH265ReferenceInfoFlags),
    pic_type: VideoH265PictureType = @import("std").mem.zeroes(VideoH265PictureType),
    Pic_order_cnt_val: i32 = @import("std").mem.zeroes(i32),
    Temporal_id: u8 = @import("std").mem.zeroes(u8),
};
pub const VideoEncodeH265CapabilityFlagsKHR = enum(u32) {
    null = 0,
    h265_capability_hrd_compliance_bit_khr = 1,
    h265_capability_prediction_weight_table_generated_bit_khr = 2,
    h265_capability_row_unaligned_slice_segment_bit_khr = 4,
    h265_capability_different_slice_segment_type_bit_khr = 8,
    h265_capability_b_frame_in_l0_list_bit_khr = 16,
    h265_capability_b_frame_in_l1_list_bit_khr = 32,
    h265_capability_per_picture_type_min_max_qp_bit_khr = 64,
    h265_capability_per_slice_segment_constant_qp_bit_khr = 128,
    h265_capability_multiple_tiles_per_slice_segment_bit_khr = 256,
    h265_capability_multiple_slice_segments_per_tile_bit_khr = 512,
};
pub const VideoEncodeH265StdFlagsKHR = enum(u32) {
    null = 0,
    h265_std_separate_color_plane_flag_set_bit_khr = 1,
    h265_std_sample_adaptive_offset_enabled_flag_set_bit_khr = 2,
    h265_std_scaling_list_data_present_flag_set_bit_khr = 4,
    h265_std_pcm_enabled_flag_set_bit_khr = 8,
    h265_std_sps_temporal_mvp_enabled_flag_set_bit_khr = 16,
    h265_std_init_qp_minus26_bit_khr = 32,
    h265_std_weighted_pred_flag_set_bit_khr = 64,
    h265_std_weighted_bipred_flag_set_bit_khr = 128,
    h265_std_log2_parallel_merge_level_minus2_bit_khr = 256,
    h265_std_sign_data_hiding_enabled_flag_set_bit_khr = 512,
    h265_std_transform_skip_enabled_flag_set_bit_khr = 1024,
    h265_std_transform_skip_enabled_flag_unset_bit_khr = 2048,
    h265_std_pps_slice_chroma_qp_offsets_present_flag_set_bit_khr = 4096,
    h265_std_transquant_bypass_enabled_flag_set_bit_khr = 8192,
    h265_std_constrained_intra_pred_flag_set_bit_khr = 16384,
    h265_std_entropy_coding_sync_enabled_flag_set_bit_khr = 32768,
    h265_std_deblocking_filter_override_enabled_flag_set_bit_khr = 65536,
    h265_std_dependent_slice_segments_enabled_flag_set_bit_khr = 131072,
    h265_std_dependent_slice_segment_flag_set_bit_khr = 262144,
    h265_std_slice_qp_delta_bit_khr = 524288,
    h265_std_different_slice_qp_delta_bit_khr = 1048576,
};
pub const VideoEncodeH265CtbSizeFlagsKHR = enum(u32) {
    null = 0,
    h265_ctb_size_16_bit_khr = 1,
    h265_ctb_size_32_bit_khr = 2,
    h265_ctb_size_64_bit_khr = 4,
};
pub const VideoEncodeH265TransformBlockSizeFlagsKHR = enum(u32) {
    null = 0,
    h265_transform_block_size_4_bit_khr = 1,
    h265_transform_block_size_8_bit_khr = 2,
    h265_transform_block_size_16_bit_khr = 4,
    h265_transform_block_size_32_bit_khr = 8,
};
pub const VideoEncodeH265RateControlFlagsKHR = enum(u32) {
    null = 0,
    h265_rate_control_attempt_hrd_compliance_bit_khr = 1,
    h265_rate_control_regular_gop_bit_khr = 2,
    h265_rate_control_reference_pattern_flat_bit_khr = 4,
    h265_rate_control_reference_pattern_dyadic_bit_khr = 8,
    h265_rate_control_temporal_sub_layer_pattern_dyadic_bit_khr = 16,
};
pub const VideoEncodeH265CapabilitiesKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265capabilities_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: VideoEncodeH265CapabilityFlagsKHR = @import("std").mem.zeroes(VideoEncodeH265CapabilityFlagsKHR),
    max_level_idc: VideoH265LevelIdc = @import("std").mem.zeroes(VideoH265LevelIdc),
    max_slice_segment_count: u32 = @import("std").mem.zeroes(u32),
    max_tiles: Extent2D = @import("std").mem.zeroes(Extent2D),
    ctb_sizes: VideoEncodeH265CtbSizeFlagsKHR = @import("std").mem.zeroes(VideoEncodeH265CtbSizeFlagsKHR),
    transform_block_sizes: VideoEncodeH265TransformBlockSizeFlagsKHR = @import("std").mem.zeroes(VideoEncodeH265TransformBlockSizeFlagsKHR),
    max_ppicture_l0reference_count: u32 = @import("std").mem.zeroes(u32),
    max_bpicture_l0reference_count: u32 = @import("std").mem.zeroes(u32),
    max_l1reference_count: u32 = @import("std").mem.zeroes(u32),
    max_sub_layer_count: u32 = @import("std").mem.zeroes(u32),
    expect_dyadic_temporal_sub_layer_pattern: Bool32 = @import("std").mem.zeroes(Bool32),
    min_qp: i32 = @import("std").mem.zeroes(i32),
    max_qp: i32 = @import("std").mem.zeroes(i32),
    prefers_gop_remaining_frames: Bool32 = @import("std").mem.zeroes(Bool32),
    requires_gop_remaining_frames: Bool32 = @import("std").mem.zeroes(Bool32),
    std_syntax_flags: VideoEncodeH265StdFlagsKHR = @import("std").mem.zeroes(VideoEncodeH265StdFlagsKHR),
};
pub const VideoEncodeH265SessionCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265session_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    use_max_level_idc: Bool32 = @import("std").mem.zeroes(Bool32),
    max_level_idc: VideoH265LevelIdc = @import("std").mem.zeroes(VideoH265LevelIdc),
};
pub const VideoEncodeH265QpKHR = extern struct {
    qp_i: i32 = @import("std").mem.zeroes(i32),
    qp_p: i32 = @import("std").mem.zeroes(i32),
    qp_b: i32 = @import("std").mem.zeroes(i32),
};
pub const VideoEncodeH265QualityLevelPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265quality_level_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    preferred_rate_control_flags: VideoEncodeH265RateControlFlagsKHR = @import("std").mem.zeroes(VideoEncodeH265RateControlFlagsKHR),
    preferred_gop_frame_count: u32 = @import("std").mem.zeroes(u32),
    preferred_idr_period: u32 = @import("std").mem.zeroes(u32),
    preferred_consecutive_bframe_count: u32 = @import("std").mem.zeroes(u32),
    preferred_sub_layer_count: u32 = @import("std").mem.zeroes(u32),
    preferred_constant_qp: VideoEncodeH265QpKHR = @import("std").mem.zeroes(VideoEncodeH265QpKHR),
    preferred_max_l0reference_count: u32 = @import("std").mem.zeroes(u32),
    preferred_max_l1reference_count: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoEncodeH265SessionParametersAddInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265session_parameters_add_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    std_vpscount: u32 = @import("std").mem.zeroes(u32),
    p_std_vpss: ?*const VideoH265VideoParameterSet = @import("std").mem.zeroes(?*const VideoH265VideoParameterSet),
    std_spscount: u32 = @import("std").mem.zeroes(u32),
    p_std_spss: ?*const VideoH265SequenceParameterSet = @import("std").mem.zeroes(?*const VideoH265SequenceParameterSet),
    std_ppscount: u32 = @import("std").mem.zeroes(u32),
    p_std_ppss: ?*const VideoH265PictureParameterSet = @import("std").mem.zeroes(?*const VideoH265PictureParameterSet),
};
pub const VideoEncodeH265SessionParametersCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265session_parameters_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    max_std_vpscount: u32 = @import("std").mem.zeroes(u32),
    max_std_spscount: u32 = @import("std").mem.zeroes(u32),
    max_std_ppscount: u32 = @import("std").mem.zeroes(u32),
    p_parameters_add_info: [*c]const VideoEncodeH265SessionParametersAddInfoKHR = @import("std").mem.zeroes([*c]const VideoEncodeH265SessionParametersAddInfoKHR),
};
pub const VideoEncodeH265SessionParametersGetInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265session_parameters_get_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    write_std_vps: Bool32 = @import("std").mem.zeroes(Bool32),
    write_std_sps: Bool32 = @import("std").mem.zeroes(Bool32),
    write_std_pps: Bool32 = @import("std").mem.zeroes(Bool32),
    std_vpsid: u32 = @import("std").mem.zeroes(u32),
    std_spsid: u32 = @import("std").mem.zeroes(u32),
    std_ppsid: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoEncodeH265SessionParametersFeedbackInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265session_parameters_feedback_info_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    has_std_vpsoverrides: Bool32 = @import("std").mem.zeroes(Bool32),
    has_std_spsoverrides: Bool32 = @import("std").mem.zeroes(Bool32),
    has_std_ppsoverrides: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const VideoEncodeH265NaluSliceSegmentInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265nalu_slice_segment_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    constant_qp: i32 = @import("std").mem.zeroes(i32),
    p_std_slice_segment_header: ?*const VideoEncodeH265SliceSegmentHeader = @import("std").mem.zeroes(?*const VideoEncodeH265SliceSegmentHeader),
};
pub const VideoEncodeH265PictureInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265picture_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    nalu_slice_segment_entry_count: u32 = @import("std").mem.zeroes(u32),
    p_nalu_slice_segment_entries: [*c]const VideoEncodeH265NaluSliceSegmentInfoKHR = @import("std").mem.zeroes([*c]const VideoEncodeH265NaluSliceSegmentInfoKHR),
    p_std_picture_info: ?*const VideoEncodeH265PictureInfo = @import("std").mem.zeroes(?*const VideoEncodeH265PictureInfo),
};
pub const VideoEncodeH265DpbSlotInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265dpb_slot_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_std_reference_info: ?*const VideoEncodeH265ReferenceInfo = @import("std").mem.zeroes(?*const VideoEncodeH265ReferenceInfo),
};
pub const VideoEncodeH265ProfileInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265profile_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    std_profile_idc: VideoH265ProfileIdc = @import("std").mem.zeroes(VideoH265ProfileIdc),
};
pub const VideoEncodeH265RateControlInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265rate_control_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: VideoEncodeH265RateControlFlagsKHR = @import("std").mem.zeroes(VideoEncodeH265RateControlFlagsKHR),
    gop_frame_count: u32 = @import("std").mem.zeroes(u32),
    idr_period: u32 = @import("std").mem.zeroes(u32),
    consecutive_bframe_count: u32 = @import("std").mem.zeroes(u32),
    sub_layer_count: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoEncodeH265FrameSizeKHR = extern struct {
    frame_isize: u32 = @import("std").mem.zeroes(u32),
    frame_psize: u32 = @import("std").mem.zeroes(u32),
    frame_bsize: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoEncodeH265RateControlLayerInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265rate_control_layer_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    use_min_qp: Bool32 = @import("std").mem.zeroes(Bool32),
    min_qp: VideoEncodeH265QpKHR = @import("std").mem.zeroes(VideoEncodeH265QpKHR),
    use_max_qp: Bool32 = @import("std").mem.zeroes(Bool32),
    max_qp: VideoEncodeH265QpKHR = @import("std").mem.zeroes(VideoEncodeH265QpKHR),
    use_max_frame_size: Bool32 = @import("std").mem.zeroes(Bool32),
    max_frame_size: VideoEncodeH265FrameSizeKHR = @import("std").mem.zeroes(VideoEncodeH265FrameSizeKHR),
};
pub const VideoEncodeH265GopRemainingFrameInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_h265gop_remaining_frame_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    use_gop_remaining_frames: Bool32 = @import("std").mem.zeroes(Bool32),
    gop_remaining_i: u32 = @import("std").mem.zeroes(u32),
    gop_remaining_p: u32 = @import("std").mem.zeroes(u32),
    gop_remaining_b: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoDecodeH264FieldOrderCount = enum(u32) {
    h264_field_order_count_top = 0,
    h264_field_order_count_bottom = 1,
    pub const Self = @This();
};
pub const VideoDecodeH264PictureInfoFlags = enum(u64) { null = 0, _ };
pub const VideoDecodeH264PictureInfo = extern struct {
    flags: VideoDecodeH264PictureInfoFlags = @import("std").mem.zeroes(VideoDecodeH264PictureInfoFlags),
    seq_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    pic_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    reserved1: u8 = @import("std").mem.zeroes(u8),
    reserved2: u8 = @import("std").mem.zeroes(u8),
    frame_num: u16 = @import("std").mem.zeroes(u16),
    idr_pic_id: u16 = @import("std").mem.zeroes(u16),
    Pic_order_cnt: [2]i32 = @import("std").mem.zeroes([2]i32),
};
pub const VideoDecodeH264ReferenceInfoFlags = enum(u64) { null = 0, _ };
pub const VideoDecodeH264ReferenceInfo = extern struct {
    flags: VideoDecodeH264ReferenceInfoFlags = @import("std").mem.zeroes(VideoDecodeH264ReferenceInfoFlags),
    Frame_num: u16 = @import("std").mem.zeroes(u16),
    reserved: u16 = @import("std").mem.zeroes(u16),
    Pic_order_cnt: [2]i32 = @import("std").mem.zeroes([2]i32),
};
pub const VideoDecodeH264PictureLayoutFlagsKHR = enum(u32) {
    h264_picture_layout_progressive_khr = 0,
    h264_picture_layout_interlaced_interleaved_lines_bit_khr = 1,
    h264_picture_layout_interlaced_separate_planes_bit_khr = 2,
};
pub const VideoDecodeH264ProfileInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_h264profile_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    std_profile_idc: VideoH264ProfileIdc = @import("std").mem.zeroes(VideoH264ProfileIdc),
    picture_layout: VideoDecodeH264PictureLayoutFlagsKHR = @import("std").mem.zeroes(VideoDecodeH264PictureLayoutFlagsKHR),
};
pub const VideoDecodeH264CapabilitiesKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_h264capabilities_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_level_idc: VideoH264LevelIdc = @import("std").mem.zeroes(VideoH264LevelIdc),
    field_offset_granularity: Offset2D = @import("std").mem.zeroes(Offset2D),
};
pub const VideoDecodeH264SessionParametersAddInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_h264session_parameters_add_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    std_spscount: u32 = @import("std").mem.zeroes(u32),
    p_std_spss: ?*const VideoH264SequenceParameterSet = @import("std").mem.zeroes(?*const VideoH264SequenceParameterSet),
    std_ppscount: u32 = @import("std").mem.zeroes(u32),
    p_std_ppss: ?*const VideoH264PictureParameterSet = @import("std").mem.zeroes(?*const VideoH264PictureParameterSet),
};
pub const VideoDecodeH264SessionParametersCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_h264session_parameters_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    max_std_spscount: u32 = @import("std").mem.zeroes(u32),
    max_std_ppscount: u32 = @import("std").mem.zeroes(u32),
    p_parameters_add_info: [*c]const VideoDecodeH264SessionParametersAddInfoKHR = @import("std").mem.zeroes([*c]const VideoDecodeH264SessionParametersAddInfoKHR),
};
pub const VideoDecodeH264PictureInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_h264picture_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_std_picture_info: ?*const VideoDecodeH264PictureInfo = @import("std").mem.zeroes(?*const VideoDecodeH264PictureInfo),
    slice_count: u32 = @import("std").mem.zeroes(u32),
    p_slice_offsets: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const VideoDecodeH264DpbSlotInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_h264dpb_slot_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_std_reference_info: ?*const VideoDecodeH264ReferenceInfo = @import("std").mem.zeroes(?*const VideoDecodeH264ReferenceInfo),
};
pub const RenderingFlagsKHR = RenderingFlags;
pub const RenderingInfoKHR = RenderingInfo;
pub const RenderingAttachmentInfoKHR = RenderingAttachmentInfo;
pub const PipelineRenderingCreateInfoKHR = PipelineRenderingCreateInfo;
pub const PhysicalDeviceDynamicRenderingFeaturesKHR = PhysicalDeviceDynamicRenderingFeatures;
pub const CommandBufferInheritanceRenderingInfoKHR = CommandBufferInheritanceRenderingInfo;
pub const RenderingFragmentShadingRateAttachmentInfoKHR = extern struct {
    s_type: StructureType = StructureType.rendering_fragment_shading_rate_attachment_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image_view: ImageView = @import("std").mem.zeroes(ImageView),
    image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    shading_rate_attachment_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const RenderingFragmentDensityMapAttachmentInfoEXT = extern struct {
    s_type: StructureType = StructureType.rendering_fragment_density_map_attachment_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image_view: ImageView = @import("std").mem.zeroes(ImageView),
    image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
};
pub const AttachmentSampleCountInfoAMD = extern struct {
    s_type: StructureType = StructureType.attachment_sample_count_info_amd,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachment_samples: [*c]const SampleCountFlags = @import("std").mem.zeroes([*c]const SampleCountFlags),
    depth_stencil_attachment_samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
};
pub const AttachmentSampleCountInfoNV = AttachmentSampleCountInfoAMD;
pub const MultiviewPerViewAttributesInfoNVX = extern struct {
    s_type: StructureType = StructureType.multiview_per_view_attributes_info_nvx,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    per_view_attributes: Bool32 = @import("std").mem.zeroes(Bool32),
    per_view_attributes_position_xonly: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdBeginRenderingKHR = ?*const fn (CommandBuffer, [*c]const RenderingInfo) callconv(.c) void;
pub const PFN_cmdEndRenderingKHR = ?*const fn (CommandBuffer) callconv(.c) void;
pub extern fn cmdBeginRenderingKHR(command_buffer: CommandBuffer, p_rendering_info: [*c]const RenderingInfo) void;
pub extern fn cmdEndRenderingKHR(command_buffer: CommandBuffer) void;
pub const RenderPassMultiviewCreateInfoKHR = RenderPassMultiviewCreateInfo;
pub const PhysicalDeviceMultiviewFeaturesKHR = PhysicalDeviceMultiviewFeatures;
pub const PhysicalDeviceMultiviewPropertiesKHR = PhysicalDeviceMultiviewProperties;
pub const PhysicalDeviceFeatures2KHR = PhysicalDeviceFeatures2;
pub const PhysicalDeviceProperties2KHR = PhysicalDeviceProperties2;
pub const FormatProperties2KHR = FormatProperties2;
pub const ImageFormatProperties2KHR = ImageFormatProperties2;
pub const PhysicalDeviceImageFormatInfo2KHR = PhysicalDeviceImageFormatInfo2;
pub const QueueFamilyProperties2KHR = QueueFamilyProperties2;
pub const PhysicalDeviceMemoryProperties2KHR = PhysicalDeviceMemoryProperties2;
pub const SparseImageFormatProperties2KHR = SparseImageFormatProperties2;
pub const PhysicalDeviceSparseImageFormatInfo2KHR = PhysicalDeviceSparseImageFormatInfo2;
pub const PFN_getPhysicalDeviceFeatures2KHR = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceFeatures2) callconv(.c) void;
pub const PFN_getPhysicalDeviceProperties2KHR = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceFormatProperties2KHR = ?*const fn (PhysicalDevice, Format, [*c]FormatProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceImageFormatProperties2KHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceImageFormatInfo2, [*c]ImageFormatProperties2) callconv(.c) Result;
pub const PFN_getPhysicalDeviceQueueFamilyProperties2KHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]QueueFamilyProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceMemoryProperties2KHR = ?*const fn (PhysicalDevice, [*c]PhysicalDeviceMemoryProperties2) callconv(.c) void;
pub const PFN_getPhysicalDeviceSparseImageFormatProperties2KHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceSparseImageFormatInfo2, [*c]u32, [*c]SparseImageFormatProperties2) callconv(.c) void;
pub extern fn getPhysicalDeviceFeatures2KHR(physical_device: PhysicalDevice, p_features: [*c]PhysicalDeviceFeatures2) void;
pub extern fn getPhysicalDeviceProperties2KHR(physical_device: PhysicalDevice, p_properties: [*c]PhysicalDeviceProperties2) void;
pub extern fn getPhysicalDeviceFormatProperties2KHR(physical_device: PhysicalDevice, format: Format, p_format_properties: [*c]FormatProperties2) void;
pub extern fn getPhysicalDeviceImageFormatProperties2KHR(physical_device: PhysicalDevice, p_image_format_info: [*c]const PhysicalDeviceImageFormatInfo2, p_image_format_properties: [*c]ImageFormatProperties2) Result;
pub extern fn getPhysicalDeviceQueueFamilyProperties2KHR(physical_device: PhysicalDevice, p_queue_family_property_count: [*c]u32, p_queue_family_properties: [*c]QueueFamilyProperties2) void;
pub extern fn getPhysicalDeviceMemoryProperties2KHR(physical_device: PhysicalDevice, p_memory_properties: [*c]PhysicalDeviceMemoryProperties2) void;
pub extern fn getPhysicalDeviceSparseImageFormatProperties2KHR(physical_device: PhysicalDevice, p_format_info: [*c]const PhysicalDeviceSparseImageFormatInfo2, p_property_count: [*c]u32, p_properties: [*c]SparseImageFormatProperties2) void;
pub const PeerMemoryFeatureFlagsKHR = PeerMemoryFeatureFlags;
pub const MemoryAllocateFlagsKHR = MemoryAllocateFlags;
pub const MemoryAllocateFlagsInfoKHR = MemoryAllocateFlagsInfo;
pub const DeviceGroupRenderPassBeginInfoKHR = DeviceGroupRenderPassBeginInfo;
pub const DeviceGroupCommandBufferBeginInfoKHR = DeviceGroupCommandBufferBeginInfo;
pub const DeviceGroupSubmitInfoKHR = DeviceGroupSubmitInfo;
pub const DeviceGroupBindSparseInfoKHR = DeviceGroupBindSparseInfo;
pub const BindBufferMemoryDeviceGroupInfoKHR = BindBufferMemoryDeviceGroupInfo;
pub const BindImageMemoryDeviceGroupInfoKHR = BindImageMemoryDeviceGroupInfo;
pub const PFN_getDeviceGroupPeerMemoryFeaturesKHR = ?*const fn (Device, u32, u32, u32, [*c]PeerMemoryFeatureFlags) callconv(.c) void;
pub const PFN_cmdSetDeviceMaskKHR = ?*const fn (CommandBuffer, u32) callconv(.c) void;
pub const PFN_cmdDispatchBaseKHR = ?*const fn (CommandBuffer, u32, u32, u32, u32, u32, u32) callconv(.c) void;
pub extern fn getDeviceGroupPeerMemoryFeaturesKHR(device: Device, heap_index: u32, local_device_index: u32, remote_device_index: u32, p_peer_memory_features: [*c]PeerMemoryFeatureFlags) void;
pub extern fn cmdSetDeviceMaskKHR(command_buffer: CommandBuffer, device_mask: u32) void;
pub extern fn cmdDispatchBaseKHR(command_buffer: CommandBuffer, base_group_x: u32, base_group_y: u32, base_group_z: u32, group_count_x: u32, group_count_y: u32, group_count_z: u32) void;
pub const CommandPoolTrimFlagsKHR = CommandPoolTrimFlags;
pub const PFN_trimCommandPoolKHR = ?*const fn (Device, CommandPool, CommandPoolTrimFlags) callconv(.c) void;
pub extern fn trimCommandPoolKHR(device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags) void;
pub const PhysicalDeviceGroupPropertiesKHR = PhysicalDeviceGroupProperties;
pub const DeviceGroupDeviceCreateInfoKHR = DeviceGroupDeviceCreateInfo;
pub const PFN_enumeratePhysicalDeviceGroupsKHR = ?*const fn (Instance, [*c]u32, [*c]PhysicalDeviceGroupProperties) callconv(.c) Result;
pub extern fn enumeratePhysicalDeviceGroupsKHR(instance: Instance, p_physical_device_group_count: [*c]u32, p_physical_device_group_properties: [*c]PhysicalDeviceGroupProperties) Result;
pub const ExternalMemoryHandleTypeFlagsKHR = ExternalMemoryHandleTypeFlags;
pub const ExternalMemoryFeatureFlagsKHR = ExternalMemoryFeatureFlags;
pub const ExternalMemoryPropertiesKHR = ExternalMemoryProperties;
pub const PhysicalDeviceExternalImageFormatInfoKHR = PhysicalDeviceExternalImageFormatInfo;
pub const ExternalImageFormatPropertiesKHR = ExternalImageFormatProperties;
pub const PhysicalDeviceExternalBufferInfoKHR = PhysicalDeviceExternalBufferInfo;
pub const ExternalBufferPropertiesKHR = ExternalBufferProperties;
pub const PhysicalDeviceIDPropertiesKHR = PhysicalDeviceIDProperties;
pub const PFN_getPhysicalDeviceExternalBufferPropertiesKHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceExternalBufferInfo, [*c]ExternalBufferProperties) callconv(.c) void;
pub extern fn getPhysicalDeviceExternalBufferPropertiesKHR(physical_device: PhysicalDevice, p_external_buffer_info: [*c]const PhysicalDeviceExternalBufferInfo, p_external_buffer_properties: [*c]ExternalBufferProperties) void;
pub const ExternalMemoryImageCreateInfoKHR = ExternalMemoryImageCreateInfo;
pub const ExternalMemoryBufferCreateInfoKHR = ExternalMemoryBufferCreateInfo;
pub const ExportMemoryAllocateInfoKHR = ExportMemoryAllocateInfo;
pub const ImportMemoryFdInfoKHR = extern struct {
    s_type: StructureType = StructureType.import_memory_fd_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_type: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
    fd: c_int = @import("std").mem.zeroes(c_int),
};
pub const MemoryFdPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.memory_fd_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_type_bits: u32 = @import("std").mem.zeroes(u32),
};
pub const MemoryGetFdInfoKHR = extern struct {
    s_type: StructureType = StructureType.memory_get_fd_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    handle_type: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
};
pub const PFN_getMemoryFdKHR = ?*const fn (Device, [*c]const MemoryGetFdInfoKHR, [*c]c_int) callconv(.c) Result;
pub const PFN_getMemoryFdPropertiesKHR = ?*const fn (Device, ExternalMemoryHandleTypeFlags, c_int, [*c]MemoryFdPropertiesKHR) callconv(.c) Result;
pub extern fn getMemoryFdKHR(device: Device, p_get_fd_info: [*c]const MemoryGetFdInfoKHR, p_fd: [*c]c_int) Result;
pub extern fn getMemoryFdPropertiesKHR(device: Device, handle_type: ExternalMemoryHandleTypeFlags, fd: c_int, p_memory_fd_properties: [*c]MemoryFdPropertiesKHR) Result;
pub const ExternalSemaphoreHandleTypeFlagsKHR = ExternalSemaphoreHandleTypeFlags;
pub const ExternalSemaphoreFeatureFlagsKHR = ExternalSemaphoreFeatureFlags;
pub const PhysicalDeviceExternalSemaphoreInfoKHR = PhysicalDeviceExternalSemaphoreInfo;
pub const ExternalSemaphorePropertiesKHR = ExternalSemaphoreProperties;
pub const PFN_getPhysicalDeviceExternalSemaphorePropertiesKHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceExternalSemaphoreInfo, [*c]ExternalSemaphoreProperties) callconv(.c) void;
pub extern fn getPhysicalDeviceExternalSemaphorePropertiesKHR(physical_device: PhysicalDevice, p_external_semaphore_info: [*c]const PhysicalDeviceExternalSemaphoreInfo, p_external_semaphore_properties: [*c]ExternalSemaphoreProperties) void;
pub const SemaphoreImportFlagsKHR = SemaphoreImportFlags;
pub const ExportSemaphoreCreateInfoKHR = ExportSemaphoreCreateInfo;
pub const ImportSemaphoreFdInfoKHR = extern struct {
    s_type: StructureType = StructureType.import_semaphore_fd_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    semaphore: Semaphore = @import("std").mem.zeroes(Semaphore),
    flags: SemaphoreImportFlags = @import("std").mem.zeroes(SemaphoreImportFlags),
    handle_type: ExternalSemaphoreHandleTypeFlags = @import("std").mem.zeroes(ExternalSemaphoreHandleTypeFlags),
    fd: c_int = @import("std").mem.zeroes(c_int),
};
pub const SemaphoreGetFdInfoKHR = extern struct {
    s_type: StructureType = StructureType.semaphore_get_fd_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    semaphore: Semaphore = @import("std").mem.zeroes(Semaphore),
    handle_type: ExternalSemaphoreHandleTypeFlags = @import("std").mem.zeroes(ExternalSemaphoreHandleTypeFlags),
};
pub const PFN_importSemaphoreFdKHR = ?*const fn (Device, [*c]const ImportSemaphoreFdInfoKHR) callconv(.c) Result;
pub const PFN_getSemaphoreFdKHR = ?*const fn (Device, [*c]const SemaphoreGetFdInfoKHR, [*c]c_int) callconv(.c) Result;
pub extern fn importSemaphoreFdKHR(device: Device, p_import_semaphore_fd_info: [*c]const ImportSemaphoreFdInfoKHR) Result;
pub extern fn getSemaphoreFdKHR(device: Device, p_get_fd_info: [*c]const SemaphoreGetFdInfoKHR, p_fd: [*c]c_int) Result;
pub const PhysicalDevicePushDescriptorPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_push_descriptor_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_push_descriptors: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdPushDescriptorSetKHR = ?*const fn (CommandBuffer, PipelineBindPoint, PipelineLayout, u32, u32, [*c]const WriteDescriptorSet) callconv(.c) void;
pub const PFN_cmdPushDescriptorSetWithTemplateKHR = ?*const fn (CommandBuffer, DescriptorUpdateTemplate, PipelineLayout, u32, ?*const anyopaque) callconv(.c) void;
pub extern fn cmdPushDescriptorSetKHR(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, layout: PipelineLayout, set: u32, descriptor_write_count: u32, p_descriptor_writes: [*c]const WriteDescriptorSet) void;
pub extern fn cmdPushDescriptorSetWithTemplateKHR(command_buffer: CommandBuffer, descriptor_update_template: DescriptorUpdateTemplate, layout: PipelineLayout, set: u32, p_data: ?*const anyopaque) void;
pub const PhysicalDeviceShaderFloat16Int8FeaturesKHR = PhysicalDeviceShaderFloat16Int8Features;
pub const PhysicalDeviceFloat16Int8FeaturesKHR = PhysicalDeviceShaderFloat16Int8Features;
pub const PhysicalDevice16BitStorageFeaturesKHR = PhysicalDevice16BitStorageFeatures;
pub const RectLayerKHR = extern struct {
    offset: Offset2D = @import("std").mem.zeroes(Offset2D),
    extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    layer: u32 = @import("std").mem.zeroes(u32),
};
pub const PresentRegionKHR = extern struct {
    rectangle_count: u32 = @import("std").mem.zeroes(u32),
    p_rectangles: [*c]const RectLayerKHR = @import("std").mem.zeroes([*c]const RectLayerKHR),
};
pub const PresentRegionsKHR = extern struct {
    s_type: StructureType = StructureType.present_regions_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const PresentRegionKHR = @import("std").mem.zeroes([*c]const PresentRegionKHR),
};
pub const DescriptorUpdateTemplateKHR = DescriptorUpdateTemplate;
pub const DescriptorUpdateTemplateTypeKHR = DescriptorUpdateTemplateType;
pub const DescriptorUpdateTemplateCreateFlagsKHR = DescriptorUpdateTemplateCreateFlags;
pub const DescriptorUpdateTemplateEntryKHR = DescriptorUpdateTemplateEntry;
pub const DescriptorUpdateTemplateCreateInfoKHR = DescriptorUpdateTemplateCreateInfo;
pub const PFN_createDescriptorUpdateTemplateKHR = ?*const fn (Device, [*c]const DescriptorUpdateTemplateCreateInfo, [*c]const AllocationCallbacks, [*c]DescriptorUpdateTemplate) callconv(.c) Result;
pub const PFN_destroyDescriptorUpdateTemplateKHR = ?*const fn (Device, DescriptorUpdateTemplate, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_updateDescriptorSetWithTemplateKHR = ?*const fn (Device, DescriptorSet, DescriptorUpdateTemplate, ?*const anyopaque) callconv(.c) void;
pub extern fn createDescriptorUpdateTemplateKHR(device: Device, p_create_info: [*c]const DescriptorUpdateTemplateCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_descriptor_update_template: [*c]DescriptorUpdateTemplate) Result;
pub extern fn destroyDescriptorUpdateTemplateKHR(device: Device, descriptor_update_template: DescriptorUpdateTemplate, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn updateDescriptorSetWithTemplateKHR(device: Device, descriptor_set: DescriptorSet, descriptor_update_template: DescriptorUpdateTemplate, p_data: ?*const anyopaque) void;
pub const PhysicalDeviceImagelessFramebufferFeaturesKHR = PhysicalDeviceImagelessFramebufferFeatures;
pub const FramebufferAttachmentsCreateInfoKHR = FramebufferAttachmentsCreateInfo;
pub const FramebufferAttachmentImageInfoKHR = FramebufferAttachmentImageInfo;
pub const RenderPassAttachmentBeginInfoKHR = RenderPassAttachmentBeginInfo;
pub const RenderPassCreateInfo2KHR = RenderPassCreateInfo2;
pub const AttachmentDescription2KHR = AttachmentDescription2;
pub const AttachmentReference2KHR = AttachmentReference2;
pub const SubpassDescription2KHR = SubpassDescription2;
pub const SubpassDependency2KHR = SubpassDependency2;
pub const SubpassBeginInfoKHR = SubpassBeginInfo;
pub const SubpassEndInfoKHR = SubpassEndInfo;
pub const PFN_createRenderPass2KHR = ?*const fn (Device, [*c]const RenderPassCreateInfo2, [*c]const AllocationCallbacks, [*c]RenderPass) callconv(.c) Result;
pub const PFN_cmdBeginRenderPass2KHR = ?*const fn (CommandBuffer, [*c]const RenderPassBeginInfo, [*c]const SubpassBeginInfo) callconv(.c) void;
pub const PFN_cmdNextSubpass2KHR = ?*const fn (CommandBuffer, [*c]const SubpassBeginInfo, [*c]const SubpassEndInfo) callconv(.c) void;
pub const PFN_cmdEndRenderPass2KHR = ?*const fn (CommandBuffer, [*c]const SubpassEndInfo) callconv(.c) void;
pub extern fn createRenderPass2KHR(device: Device, p_create_info: [*c]const RenderPassCreateInfo2, p_allocator: [*c]const AllocationCallbacks, p_render_pass: [*c]RenderPass) Result;
pub extern fn cmdBeginRenderPass2KHR(command_buffer: CommandBuffer, p_render_pass_begin: [*c]const RenderPassBeginInfo, p_subpass_begin_info: [*c]const SubpassBeginInfo) void;
pub extern fn cmdNextSubpass2KHR(command_buffer: CommandBuffer, p_subpass_begin_info: [*c]const SubpassBeginInfo, p_subpass_end_info: [*c]const SubpassEndInfo) void;
pub extern fn cmdEndRenderPass2KHR(command_buffer: CommandBuffer, p_subpass_end_info: [*c]const SubpassEndInfo) void;
pub const SharedPresentSurfaceCapabilitiesKHR = extern struct {
    s_type: StructureType = StructureType.shared_present_surface_capabilities_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shared_present_supported_usage_flags: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
};
pub const PFN_getSwapchainStatusKHR = ?*const fn (Device, SwapchainKHR) callconv(.c) Result;
pub extern fn getSwapchainStatusKHR(device: Device, swapchain: SwapchainKHR) Result;
pub const ExternalFenceHandleTypeFlagsKHR = ExternalFenceHandleTypeFlags;
pub const ExternalFenceFeatureFlagsKHR = ExternalFenceFeatureFlags;
pub const PhysicalDeviceExternalFenceInfoKHR = PhysicalDeviceExternalFenceInfo;
pub const ExternalFencePropertiesKHR = ExternalFenceProperties;
pub const PFN_getPhysicalDeviceExternalFencePropertiesKHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceExternalFenceInfo, [*c]ExternalFenceProperties) callconv(.c) void;
pub extern fn getPhysicalDeviceExternalFencePropertiesKHR(physical_device: PhysicalDevice, p_external_fence_info: [*c]const PhysicalDeviceExternalFenceInfo, p_external_fence_properties: [*c]ExternalFenceProperties) void;
pub const FenceImportFlagsKHR = FenceImportFlags;
pub const ExportFenceCreateInfoKHR = ExportFenceCreateInfo;
pub const ImportFenceFdInfoKHR = extern struct {
    s_type: StructureType = StructureType.import_fence_fd_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    fence: Fence = @import("std").mem.zeroes(Fence),
    flags: FenceImportFlags = @import("std").mem.zeroes(FenceImportFlags),
    handle_type: ExternalFenceHandleTypeFlags = @import("std").mem.zeroes(ExternalFenceHandleTypeFlags),
    fd: c_int = @import("std").mem.zeroes(c_int),
};
pub const FenceGetFdInfoKHR = extern struct {
    s_type: StructureType = StructureType.fence_get_fd_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    fence: Fence = @import("std").mem.zeroes(Fence),
    handle_type: ExternalFenceHandleTypeFlags = @import("std").mem.zeroes(ExternalFenceHandleTypeFlags),
};
pub const PFN_importFenceFdKHR = ?*const fn (Device, [*c]const ImportFenceFdInfoKHR) callconv(.c) Result;
pub const PFN_getFenceFdKHR = ?*const fn (Device, [*c]const FenceGetFdInfoKHR, [*c]c_int) callconv(.c) Result;
pub extern fn importFenceFdKHR(device: Device, p_import_fence_fd_info: [*c]const ImportFenceFdInfoKHR) Result;
pub extern fn getFenceFdKHR(device: Device, p_get_fd_info: [*c]const FenceGetFdInfoKHR, p_fd: [*c]c_int) Result;
pub const PerformanceCounterUnitKHR = enum(u32) {
    generic_khr = 0,
    percentage_khr = 1,
    nanoseconds_khr = 2,
    bytes_khr = 3,
    bytes_per_second_khr = 4,
    kelvin_khr = 5,
    watts_khr = 6,
    volts_khr = 7,
    amps_khr = 8,
    hertz_khr = 9,
    cycles_khr = 10,
};
pub const PerformanceCounterScopeKHR = enum(u32) {
    null = 0,
};
pub const PerformanceCounterStorageKHR = enum(u32) {
    int32_khr = 0,
    int64_khr = 1,
    uint32_khr = 2,
    uint64_khr = 3,
    float32_khr = 4,
    float64_khr = 5,
};
pub const PerformanceCounterDescriptionFlagsKHR = enum(u32) {
    null = 0,
    performance_impacting_khr = 1,
    concurrently_impacted_khr = 2,
    pub const Self = @This();
    pub const performance_impacting_bit_khr = Self.performance_impacting_khr;
    pub const concurrently_impacted_bit_khr = Self.concurrently_impacted_khr;
};
pub const AcquireProfilingLockFlagsKHR = enum(u32) {
    null = 0,
};
pub const PhysicalDevicePerformanceQueryFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_performance_query_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    performance_counter_query_pools: Bool32 = @import("std").mem.zeroes(Bool32),
    performance_counter_multiple_query_pools: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePerformanceQueryPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_performance_query_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    allow_command_buffer_query_copies: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PerformanceCounterKHR = extern struct {
    s_type: StructureType = StructureType.performance_counter_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    unit: PerformanceCounterUnitKHR = @import("std").mem.zeroes(PerformanceCounterUnitKHR),
    scope: PerformanceCounterScopeKHR = @import("std").mem.zeroes(PerformanceCounterScopeKHR),
    storage: PerformanceCounterStorageKHR = @import("std").mem.zeroes(PerformanceCounterStorageKHR),
    uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const PerformanceCounterDescriptionKHR = extern struct {
    s_type: StructureType = StructureType.performance_counter_description_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: PerformanceCounterDescriptionFlagsKHR = @import("std").mem.zeroes(PerformanceCounterDescriptionFlagsKHR),
    name: [256]u8 = @import("std").mem.zeroes([256]u8),
    category: [256]u8 = @import("std").mem.zeroes([256]u8),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const QueryPoolPerformanceCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.query_pool_performance_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    queue_family_index: u32 = @import("std").mem.zeroes(u32),
    counter_index_count: u32 = @import("std").mem.zeroes(u32),
    p_counter_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const PerformanceCounterResultKHR = extern union {
    int32: i32,
    int64: i64,
    uint32: u32,
    uint64: u64,
    float32: f32,
    float64: f64,
};
pub const AcquireProfilingLockInfoKHR = extern struct {
    s_type: StructureType = StructureType.acquire_profiling_lock_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: AcquireProfilingLockFlagsKHR = @import("std").mem.zeroes(AcquireProfilingLockFlagsKHR),
    timeout: u64 = @import("std").mem.zeroes(u64),
};
pub const PerformanceQuerySubmitInfoKHR = extern struct {
    s_type: StructureType = StructureType.performance_query_submit_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    counter_pass_index: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR = ?*const fn (PhysicalDevice, u32, [*c]u32, [*c]PerformanceCounterKHR, [*c]PerformanceCounterDescriptionKHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR = ?*const fn (PhysicalDevice, [*c]const QueryPoolPerformanceCreateInfoKHR, [*c]u32) callconv(.c) void;
pub const PFN_acquireProfilingLockKHR = ?*const fn (Device, [*c]const AcquireProfilingLockInfoKHR) callconv(.c) Result;
pub const PFN_releaseProfilingLockKHR = ?*const fn (Device) callconv(.c) void;
pub extern fn enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR(physical_device: PhysicalDevice, queue_family_index: u32, p_counter_count: [*c]u32, p_counters: [*c]PerformanceCounterKHR, p_counter_descriptions: [*c]PerformanceCounterDescriptionKHR) Result;
pub extern fn getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR(physical_device: PhysicalDevice, p_performance_query_create_info: [*c]const QueryPoolPerformanceCreateInfoKHR, p_num_passes: [*c]u32) void;
pub extern fn acquireProfilingLockKHR(device: Device, p_info: [*c]const AcquireProfilingLockInfoKHR) Result;
pub extern fn releaseProfilingLockKHR(device: Device) void;
pub const PointClippingBehaviorKHR = PointClippingBehavior;
pub const TessellationDomainOriginKHR = TessellationDomainOrigin;
pub const PhysicalDevicePointClippingPropertiesKHR = PhysicalDevicePointClippingProperties;
pub const RenderPassInputAttachmentAspectCreateInfoKHR = RenderPassInputAttachmentAspectCreateInfo;
pub const InputAttachmentAspectReferenceKHR = InputAttachmentAspectReference;
pub const ImageViewUsageCreateInfoKHR = ImageViewUsageCreateInfo;
pub const PipelineTessellationDomainOriginStateCreateInfoKHR = PipelineTessellationDomainOriginStateCreateInfo;
pub const PhysicalDeviceSurfaceInfo2KHR = extern struct {
    s_type: StructureType = StructureType.physical_device_surface_info2khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    surface: SurfaceKHR = @import("std").mem.zeroes(SurfaceKHR),
};
pub const SurfaceCapabilities2KHR = extern struct {
    s_type: StructureType = StructureType.surface_capabilities2khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    surface_capabilities: SurfaceCapabilitiesKHR = @import("std").mem.zeroes(SurfaceCapabilitiesKHR),
};
pub const SurfaceFormat2KHR = extern struct {
    s_type: StructureType = StructureType.surface_format2khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    surface_format: SurfaceFormatKHR = @import("std").mem.zeroes(SurfaceFormatKHR),
};
pub const PFN_getPhysicalDeviceSurfaceCapabilities2KHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceSurfaceInfo2KHR, [*c]SurfaceCapabilities2KHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceSurfaceFormats2KHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceSurfaceInfo2KHR, [*c]u32, [*c]SurfaceFormat2KHR) callconv(.c) Result;
pub extern fn getPhysicalDeviceSurfaceCapabilities2KHR(physical_device: PhysicalDevice, p_surface_info: [*c]const PhysicalDeviceSurfaceInfo2KHR, p_surface_capabilities: [*c]SurfaceCapabilities2KHR) Result;
pub extern fn getPhysicalDeviceSurfaceFormats2KHR(physical_device: PhysicalDevice, p_surface_info: [*c]const PhysicalDeviceSurfaceInfo2KHR, p_surface_format_count: [*c]u32, p_surface_formats: [*c]SurfaceFormat2KHR) Result;
pub const PhysicalDeviceVariablePointerFeaturesKHR = PhysicalDeviceVariablePointersFeatures;
pub const PhysicalDeviceVariablePointersFeaturesKHR = PhysicalDeviceVariablePointersFeatures;
pub const DisplayProperties2KHR = extern struct {
    s_type: StructureType = StructureType.display_properties2khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    display_properties: DisplayPropertiesKHR = @import("std").mem.zeroes(DisplayPropertiesKHR),
};
pub const DisplayPlaneProperties2KHR = extern struct {
    s_type: StructureType = StructureType.display_plane_properties2khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    display_plane_properties: DisplayPlanePropertiesKHR = @import("std").mem.zeroes(DisplayPlanePropertiesKHR),
};
pub const DisplayModeProperties2KHR = extern struct {
    s_type: StructureType = StructureType.display_mode_properties2khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    display_mode_properties: DisplayModePropertiesKHR = @import("std").mem.zeroes(DisplayModePropertiesKHR),
};
pub const DisplayPlaneInfo2KHR = extern struct {
    s_type: StructureType = StructureType.display_plane_info2khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    mode: DisplayModeKHR = @import("std").mem.zeroes(DisplayModeKHR),
    plane_index: u32 = @import("std").mem.zeroes(u32),
};
pub const DisplayPlaneCapabilities2KHR = extern struct {
    s_type: StructureType = StructureType.display_plane_capabilities2khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    capabilities: DisplayPlaneCapabilitiesKHR = @import("std").mem.zeroes(DisplayPlaneCapabilitiesKHR),
};
pub const PFN_getPhysicalDeviceDisplayProperties2KHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]DisplayProperties2KHR) callconv(.c) Result;
pub const PFN_getPhysicalDeviceDisplayPlaneProperties2KHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]DisplayPlaneProperties2KHR) callconv(.c) Result;
pub const PFN_getDisplayModeProperties2KHR = ?*const fn (PhysicalDevice, DisplayKHR, [*c]u32, [*c]DisplayModeProperties2KHR) callconv(.c) Result;
pub const PFN_getDisplayPlaneCapabilities2KHR = ?*const fn (PhysicalDevice, [*c]const DisplayPlaneInfo2KHR, [*c]DisplayPlaneCapabilities2KHR) callconv(.c) Result;
pub extern fn getPhysicalDeviceDisplayProperties2KHR(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]DisplayProperties2KHR) Result;
pub extern fn getPhysicalDeviceDisplayPlaneProperties2KHR(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]DisplayPlaneProperties2KHR) Result;
pub extern fn getDisplayModeProperties2KHR(physical_device: PhysicalDevice, display: DisplayKHR, p_property_count: [*c]u32, p_properties: [*c]DisplayModeProperties2KHR) Result;
pub extern fn getDisplayPlaneCapabilities2KHR(physical_device: PhysicalDevice, p_display_plane_info: [*c]const DisplayPlaneInfo2KHR, p_capabilities: [*c]DisplayPlaneCapabilities2KHR) Result;
pub const MemoryDedicatedRequirementsKHR = MemoryDedicatedRequirements;
pub const MemoryDedicatedAllocateInfoKHR = MemoryDedicatedAllocateInfo;
pub const BufferMemoryRequirementsInfo2KHR = BufferMemoryRequirementsInfo2;
pub const ImageMemoryRequirementsInfo2KHR = ImageMemoryRequirementsInfo2;
pub const ImageSparseMemoryRequirementsInfo2KHR = ImageSparseMemoryRequirementsInfo2;
pub const MemoryRequirements2KHR = MemoryRequirements2;
pub const SparseImageMemoryRequirements2KHR = SparseImageMemoryRequirements2;
pub const PFN_getImageMemoryRequirements2KHR = ?*const fn (Device, [*c]const ImageMemoryRequirementsInfo2, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getBufferMemoryRequirements2KHR = ?*const fn (Device, [*c]const BufferMemoryRequirementsInfo2, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getImageSparseMemoryRequirements2KHR = ?*const fn (Device, [*c]const ImageSparseMemoryRequirementsInfo2, [*c]u32, [*c]SparseImageMemoryRequirements2) callconv(.c) void;
pub extern fn getImageMemoryRequirements2KHR(device: Device, p_info: [*c]const ImageMemoryRequirementsInfo2, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getBufferMemoryRequirements2KHR(device: Device, p_info: [*c]const BufferMemoryRequirementsInfo2, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getImageSparseMemoryRequirements2KHR(device: Device, p_info: [*c]const ImageSparseMemoryRequirementsInfo2, p_sparse_memory_requirement_count: [*c]u32, p_sparse_memory_requirements: [*c]SparseImageMemoryRequirements2) void;
pub const ImageFormatListCreateInfoKHR = ImageFormatListCreateInfo;
pub const SamplerYcbcrConversionKHR = SamplerYcbcrConversion;
pub const SamplerYcbcrModelConversionKHR = SamplerYcbcrModelConversion;
pub const SamplerYcbcrRangeKHR = SamplerYcbcrRange;
pub const ChromaLocationKHR = ChromaLocation;
pub const SamplerYcbcrConversionCreateInfoKHR = SamplerYcbcrConversionCreateInfo;
pub const SamplerYcbcrConversionInfoKHR = SamplerYcbcrConversionInfo;
pub const BindImagePlaneMemoryInfoKHR = BindImagePlaneMemoryInfo;
pub const ImagePlaneMemoryRequirementsInfoKHR = ImagePlaneMemoryRequirementsInfo;
pub const PhysicalDeviceSamplerYcbcrConversionFeaturesKHR = PhysicalDeviceSamplerYcbcrConversionFeatures;
pub const SamplerYcbcrConversionImageFormatPropertiesKHR = SamplerYcbcrConversionImageFormatProperties;
pub const PFN_createSamplerYcbcrConversionKHR = ?*const fn (Device, [*c]const SamplerYcbcrConversionCreateInfo, [*c]const AllocationCallbacks, [*c]SamplerYcbcrConversion) callconv(.c) Result;
pub const PFN_destroySamplerYcbcrConversionKHR = ?*const fn (Device, SamplerYcbcrConversion, [*c]const AllocationCallbacks) callconv(.c) void;
pub extern fn createSamplerYcbcrConversionKHR(device: Device, p_create_info: [*c]const SamplerYcbcrConversionCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_ycbcr_conversion: [*c]SamplerYcbcrConversion) Result;
pub extern fn destroySamplerYcbcrConversionKHR(device: Device, ycbcr_conversion: SamplerYcbcrConversion, p_allocator: [*c]const AllocationCallbacks) void;
pub const BindBufferMemoryInfoKHR = BindBufferMemoryInfo;
pub const BindImageMemoryInfoKHR = BindImageMemoryInfo;
pub const PFN_bindBufferMemory2KHR = ?*const fn (Device, u32, [*c]const BindBufferMemoryInfo) callconv(.c) Result;
pub const PFN_bindImageMemory2KHR = ?*const fn (Device, u32, [*c]const BindImageMemoryInfo) callconv(.c) Result;
pub extern fn bindBufferMemory2KHR(device: Device, bind_info_count: u32, p_bind_infos: [*c]const BindBufferMemoryInfo) Result;
pub extern fn bindImageMemory2KHR(device: Device, bind_info_count: u32, p_bind_infos: [*c]const BindImageMemoryInfo) Result;
pub const PhysicalDeviceMaintenance3PropertiesKHR = PhysicalDeviceMaintenance3Properties;
pub const DescriptorSetLayoutSupportKHR = DescriptorSetLayoutSupport;
pub const PFN_getDescriptorSetLayoutSupportKHR = ?*const fn (Device, [*c]const DescriptorSetLayoutCreateInfo, [*c]DescriptorSetLayoutSupport) callconv(.c) void;
pub extern fn getDescriptorSetLayoutSupportKHR(device: Device, p_create_info: [*c]const DescriptorSetLayoutCreateInfo, p_support: [*c]DescriptorSetLayoutSupport) void;
pub const PFN_cmdDrawIndirectCountKHR = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndexedIndirectCountKHR = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub extern fn cmdDrawIndirectCountKHR(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_buffer_offset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub extern fn cmdDrawIndexedIndirectCountKHR(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_buffer_offset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub const PhysicalDeviceShaderSubgroupExtendedTypesFeaturesKHR = PhysicalDeviceShaderSubgroupExtendedTypesFeatures;
pub const PhysicalDevice8BitStorageFeaturesKHR = PhysicalDevice8BitStorageFeatures;
pub const PhysicalDeviceShaderAtomicInt64FeaturesKHR = PhysicalDeviceShaderAtomicInt64Features;
pub const PhysicalDeviceShaderClockFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_clock_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_subgroup_clock: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_device_clock: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const VideoDecodeH265PictureInfoFlags = enum(u64) { null = 0, _ };
pub const VideoDecodeH265PictureInfo = extern struct {
    flags: VideoDecodeH265PictureInfoFlags = @import("std").mem.zeroes(VideoDecodeH265PictureInfoFlags),
    sps_video_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    pps_seq_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    pps_pic_parameter_set_id: u8 = @import("std").mem.zeroes(u8),
    Num_delta_pocs_of_ref_rps_idx: u8 = @import("std").mem.zeroes(u8),
    Pic_order_cnt_val: i32 = @import("std").mem.zeroes(i32),
    Num_bits_for_stref_pic_set_in_slice: u16 = @import("std").mem.zeroes(u16),
    reserved: u16 = @import("std").mem.zeroes(u16),
    Ref_pic_set_st_curr_before: [8]u8 = @import("std").mem.zeroes([8]u8),
    Ref_pic_set_st_curr_after: [8]u8 = @import("std").mem.zeroes([8]u8),
    Ref_pic_set_lt_curr: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const VideoDecodeH265ReferenceInfoFlags = enum(u64) { null = 0, _ };
pub const VideoDecodeH265ReferenceInfo = extern struct {
    flags: VideoDecodeH265ReferenceInfoFlags = @import("std").mem.zeroes(VideoDecodeH265ReferenceInfoFlags),
    Pic_order_cnt_val: i32 = @import("std").mem.zeroes(i32),
};
pub const VideoDecodeH265ProfileInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_h265profile_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    std_profile_idc: VideoH265ProfileIdc = @import("std").mem.zeroes(VideoH265ProfileIdc),
};
pub const VideoDecodeH265CapabilitiesKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_h265capabilities_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_level_idc: VideoH265LevelIdc = @import("std").mem.zeroes(VideoH265LevelIdc),
};
pub const VideoDecodeH265SessionParametersAddInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_h265session_parameters_add_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    std_vpscount: u32 = @import("std").mem.zeroes(u32),
    p_std_vpss: ?*const VideoH265VideoParameterSet = @import("std").mem.zeroes(?*const VideoH265VideoParameterSet),
    std_spscount: u32 = @import("std").mem.zeroes(u32),
    p_std_spss: ?*const VideoH265SequenceParameterSet = @import("std").mem.zeroes(?*const VideoH265SequenceParameterSet),
    std_ppscount: u32 = @import("std").mem.zeroes(u32),
    p_std_ppss: ?*const VideoH265PictureParameterSet = @import("std").mem.zeroes(?*const VideoH265PictureParameterSet),
};
pub const VideoDecodeH265SessionParametersCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_h265session_parameters_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    max_std_vpscount: u32 = @import("std").mem.zeroes(u32),
    max_std_spscount: u32 = @import("std").mem.zeroes(u32),
    max_std_ppscount: u32 = @import("std").mem.zeroes(u32),
    p_parameters_add_info: [*c]const VideoDecodeH265SessionParametersAddInfoKHR = @import("std").mem.zeroes([*c]const VideoDecodeH265SessionParametersAddInfoKHR),
};
pub const VideoDecodeH265PictureInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_h265picture_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_std_picture_info: ?*const VideoDecodeH265PictureInfo = @import("std").mem.zeroes(?*const VideoDecodeH265PictureInfo),
    slice_segment_count: u32 = @import("std").mem.zeroes(u32),
    p_slice_segment_offsets: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const VideoDecodeH265DpbSlotInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_h265dpb_slot_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_std_reference_info: ?*const VideoDecodeH265ReferenceInfo = @import("std").mem.zeroes(?*const VideoDecodeH265ReferenceInfo),
};
pub const QueueGlobalPriorityKHR = enum(u32) {
    null = 0,
    low_ext = 128,
    medium_ext = 256,
    high_ext = 512,
    realtime_ext = 1024,
    pub const Self = @This();
    pub const low_khr = Self.low_ext;
    pub const medium_khr = Self.medium_ext;
    pub const high_khr = Self.high_ext;
    pub const realtime_khr = Self.realtime_ext;
};
pub const DeviceQueueGlobalPriorityCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.device_queue_global_priority_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    global_priority: QueueGlobalPriorityKHR = @import("std").mem.zeroes(QueueGlobalPriorityKHR),
};
pub const PhysicalDeviceGlobalPriorityQueryFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_global_priority_query_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    global_priority_query: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const QueueFamilyGlobalPriorityPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.queue_family_global_priority_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    priority_count: u32 = @import("std").mem.zeroes(u32),
    priorities: [16]QueueGlobalPriorityKHR = @import("std").mem.zeroes([16]QueueGlobalPriorityKHR),
};
pub const DriverIdKHR = DriverId;
pub const ConformanceVersionKHR = ConformanceVersion;
pub const PhysicalDeviceDriverPropertiesKHR = PhysicalDeviceDriverProperties;
pub const ShaderFloatControlsIndependenceKHR = ShaderFloatControlsIndependence;
pub const PhysicalDeviceFloatControlsPropertiesKHR = PhysicalDeviceFloatControlsProperties;
pub const ResolveModeFlagsKHR = ResolveModeFlags;
pub const SubpassDescriptionDepthStencilResolveKHR = SubpassDescriptionDepthStencilResolve;
pub const PhysicalDeviceDepthStencilResolvePropertiesKHR = PhysicalDeviceDepthStencilResolveProperties;
pub const SemaphoreTypeKHR = SemaphoreType;
pub const SemaphoreWaitFlagsKHR = SemaphoreWaitFlags;
pub const PhysicalDeviceTimelineSemaphoreFeaturesKHR = PhysicalDeviceTimelineSemaphoreFeatures;
pub const PhysicalDeviceTimelineSemaphorePropertiesKHR = PhysicalDeviceTimelineSemaphoreProperties;
pub const SemaphoreTypeCreateInfoKHR = SemaphoreTypeCreateInfo;
pub const TimelineSemaphoreSubmitInfoKHR = TimelineSemaphoreSubmitInfo;
pub const SemaphoreWaitInfoKHR = SemaphoreWaitInfo;
pub const SemaphoreSignalInfoKHR = SemaphoreSignalInfo;
pub const PFN_getSemaphoreCounterValueKHR = ?*const fn (Device, Semaphore, [*c]u64) callconv(.c) Result;
pub const PFN_waitSemaphoresKHR = ?*const fn (Device, [*c]const SemaphoreWaitInfo, u64) callconv(.c) Result;
pub const PFN_signalSemaphoreKHR = ?*const fn (Device, [*c]const SemaphoreSignalInfo) callconv(.c) Result;
pub extern fn getSemaphoreCounterValueKHR(device: Device, semaphore: Semaphore, p_value: [*c]u64) Result;
pub extern fn waitSemaphoresKHR(device: Device, p_wait_info: [*c]const SemaphoreWaitInfo, timeout: u64) Result;
pub extern fn signalSemaphoreKHR(device: Device, p_signal_info: [*c]const SemaphoreSignalInfo) Result;
pub const PhysicalDeviceVulkanMemoryModelFeaturesKHR = PhysicalDeviceVulkanMemoryModelFeatures;
pub const PhysicalDeviceShaderTerminateInvocationFeaturesKHR = PhysicalDeviceShaderTerminateInvocationFeatures;
pub const FragmentShadingRateCombinerOpKHR = enum(u32) {
    keep_khr = 0,
    replace_khr = 1,
    min_khr = 2,
    max_khr = 3,
    mul_khr = 4,
};
pub const FragmentShadingRateAttachmentInfoKHR = extern struct {
    s_type: StructureType = StructureType.fragment_shading_rate_attachment_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_fragment_shading_rate_attachment: [*c]const AttachmentReference2 = @import("std").mem.zeroes([*c]const AttachmentReference2),
    shading_rate_attachment_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const PipelineFragmentShadingRateStateCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_fragment_shading_rate_state_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    fragment_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    combiner_ops: [2]FragmentShadingRateCombinerOpKHR = @import("std").mem.zeroes([2]FragmentShadingRateCombinerOpKHR),
};
pub const PhysicalDeviceFragmentShadingRateFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_shading_rate_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_fragment_shading_rate: Bool32 = @import("std").mem.zeroes(Bool32),
    primitive_fragment_shading_rate: Bool32 = @import("std").mem.zeroes(Bool32),
    attachment_fragment_shading_rate: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentShadingRatePropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_shading_rate_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_fragment_shading_rate_attachment_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_fragment_shading_rate_attachment_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_fragment_shading_rate_attachment_texel_size_aspect_ratio: u32 = @import("std").mem.zeroes(u32),
    primitive_fragment_shading_rate_with_multiple_viewports: Bool32 = @import("std").mem.zeroes(Bool32),
    layered_shading_rate_attachments: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_non_trivial_combiner_ops: Bool32 = @import("std").mem.zeroes(Bool32),
    max_fragment_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_fragment_size_aspect_ratio: u32 = @import("std").mem.zeroes(u32),
    max_fragment_shading_rate_coverage_samples: u32 = @import("std").mem.zeroes(u32),
    max_fragment_shading_rate_rasterization_samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    fragment_shading_rate_with_shader_depth_stencil_writes: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_with_sample_mask: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_with_shader_sample_mask: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_with_conservative_rasterization: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_with_fragment_shader_interlock: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_with_custom_sample_locations: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shading_rate_strict_multiply_combiner: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentShadingRateKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_shading_rate_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    fragment_size: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const PFN_getPhysicalDeviceFragmentShadingRatesKHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]PhysicalDeviceFragmentShadingRateKHR) callconv(.c) Result;
pub const PFN_cmdSetFragmentShadingRateKHR = ?*const fn (CommandBuffer, [*c]const Extent2D, [*c]const FragmentShadingRateCombinerOpKHR) callconv(.c) void;
pub extern fn getPhysicalDeviceFragmentShadingRatesKHR(physical_device: PhysicalDevice, p_fragment_shading_rate_count: [*c]u32, p_fragment_shading_rates: [*c]PhysicalDeviceFragmentShadingRateKHR) Result;
pub extern fn cmdSetFragmentShadingRateKHR(command_buffer: CommandBuffer, p_fragment_size: [*c]const Extent2D, combiner_ops: [*c]const FragmentShadingRateCombinerOpKHR) void;
pub const PhysicalDeviceDynamicRenderingLocalReadFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_dynamic_rendering_local_read_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    dynamic_rendering_local_read: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RenderingAttachmentLocationInfoKHR = extern struct {
    s_type: StructureType = StructureType.rendering_attachment_location_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachment_locations: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const RenderingInputAttachmentIndexInfoKHR = extern struct {
    s_type: StructureType = StructureType.rendering_input_attachment_index_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachment_input_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    p_depth_input_attachment_index: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    p_stencil_input_attachment_index: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const PFN_cmdSetRenderingAttachmentLocationsKHR = ?*const fn (CommandBuffer, [*c]const RenderingAttachmentLocationInfoKHR) callconv(.c) void;
pub const PFN_cmdSetRenderingInputAttachmentIndicesKHR = ?*const fn (CommandBuffer, [*c]const RenderingInputAttachmentIndexInfoKHR) callconv(.c) void;
pub extern fn cmdSetRenderingAttachmentLocationsKHR(command_buffer: CommandBuffer, p_location_info: [*c]const RenderingAttachmentLocationInfoKHR) void;
pub extern fn cmdSetRenderingInputAttachmentIndicesKHR(command_buffer: CommandBuffer, p_input_attachment_index_info: [*c]const RenderingInputAttachmentIndexInfoKHR) void;
pub const PhysicalDeviceShaderQuadControlFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_quad_control_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_quad_control: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SurfaceProtectedCapabilitiesKHR = extern struct {
    s_type: StructureType = StructureType.surface_protected_capabilities_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    supports_protected: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceSeparateDepthStencilLayoutsFeaturesKHR = PhysicalDeviceSeparateDepthStencilLayoutsFeatures;
pub const AttachmentReferenceStencilLayoutKHR = AttachmentReferenceStencilLayout;
pub const AttachmentDescriptionStencilLayoutKHR = AttachmentDescriptionStencilLayout;
pub const PhysicalDevicePresentWaitFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_present_wait_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_wait: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_waitForPresentKHR = ?*const fn (Device, SwapchainKHR, u64, u64) callconv(.c) Result;
pub extern fn waitForPresentKHR(device: Device, swapchain: SwapchainKHR, present_id: u64, timeout: u64) Result;
pub const PhysicalDeviceUniformBufferStandardLayoutFeaturesKHR = PhysicalDeviceUniformBufferStandardLayoutFeatures;
pub const PhysicalDeviceBufferDeviceAddressFeaturesKHR = PhysicalDeviceBufferDeviceAddressFeatures;
pub const BufferDeviceAddressInfoKHR = BufferDeviceAddressInfo;
pub const BufferOpaqueCaptureAddressCreateInfoKHR = BufferOpaqueCaptureAddressCreateInfo;
pub const MemoryOpaqueCaptureAddressAllocateInfoKHR = MemoryOpaqueCaptureAddressAllocateInfo;
pub const DeviceMemoryOpaqueCaptureAddressInfoKHR = DeviceMemoryOpaqueCaptureAddressInfo;
pub const PFN_getBufferDeviceAddressKHR = ?*const fn (Device, [*c]const BufferDeviceAddressInfo) callconv(.c) DeviceAddress;
pub const PFN_getBufferOpaqueCaptureAddressKHR = ?*const fn (Device, [*c]const BufferDeviceAddressInfo) callconv(.c) u64;
pub const PFN_getDeviceMemoryOpaqueCaptureAddressKHR = ?*const fn (Device, [*c]const DeviceMemoryOpaqueCaptureAddressInfo) callconv(.c) u64;
pub extern fn getBufferDeviceAddressKHR(device: Device, p_info: [*c]const BufferDeviceAddressInfo) DeviceAddress;
pub extern fn getBufferOpaqueCaptureAddressKHR(device: Device, p_info: [*c]const BufferDeviceAddressInfo) u64;
pub extern fn getDeviceMemoryOpaqueCaptureAddressKHR(device: Device, p_info: [*c]const DeviceMemoryOpaqueCaptureAddressInfo) u64;
pub const DeferredOperationKHR = enum(u64) { null = 0, _ };
pub const PFN_createDeferredOperationKHR = ?*const fn (Device, [*c]const AllocationCallbacks, [*c]DeferredOperationKHR) callconv(.c) Result;
pub const PFN_destroyDeferredOperationKHR = ?*const fn (Device, DeferredOperationKHR, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getDeferredOperationMaxConcurrencyKHR = ?*const fn (Device, DeferredOperationKHR) callconv(.c) u32;
pub const PFN_getDeferredOperationResultKHR = ?*const fn (Device, DeferredOperationKHR) callconv(.c) Result;
pub const PFN_deferredOperationJoinKHR = ?*const fn (Device, DeferredOperationKHR) callconv(.c) Result;
pub extern fn createDeferredOperationKHR(device: Device, p_allocator: [*c]const AllocationCallbacks, p_deferred_operation: [*c]DeferredOperationKHR) Result;
pub extern fn destroyDeferredOperationKHR(device: Device, operation: DeferredOperationKHR, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getDeferredOperationMaxConcurrencyKHR(device: Device, operation: DeferredOperationKHR) u32;
pub extern fn getDeferredOperationResultKHR(device: Device, operation: DeferredOperationKHR) Result;
pub extern fn deferredOperationJoinKHR(device: Device, operation: DeferredOperationKHR) Result;
pub const PipelineExecutableStatisticFormatKHR = enum(u32) {
    bool32_khr = 0,
    int64_khr = 1,
    uint64_khr = 2,
    float64_khr = 3,
};
pub const PhysicalDevicePipelineExecutablePropertiesFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_pipeline_executable_properties_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_executable_info: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineInfoKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
};
pub const PipelineExecutablePropertiesKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_executable_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    name: [256]u8 = @import("std").mem.zeroes([256]u8),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    subgroup_size: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineExecutableInfoKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_executable_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
    executable_index: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineExecutableStatisticValueKHR = extern union {
    b32: Bool32,
    i64: i64,
    u64: u64,
    f64: f64,
};
pub const PipelineExecutableStatisticKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_executable_statistic_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    name: [256]u8 = @import("std").mem.zeroes([256]u8),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    format: PipelineExecutableStatisticFormatKHR = @import("std").mem.zeroes(PipelineExecutableStatisticFormatKHR),
    value: PipelineExecutableStatisticValueKHR = @import("std").mem.zeroes(PipelineExecutableStatisticValueKHR),
};
pub const PipelineExecutableInternalRepresentationKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_executable_internal_representation_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    name: [256]u8 = @import("std").mem.zeroes([256]u8),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    is_text: Bool32 = @import("std").mem.zeroes(Bool32),
    data_size: usize = @import("std").mem.zeroes(usize),
    p_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PFN_getPipelineExecutablePropertiesKHR = ?*const fn (Device, [*c]const PipelineInfoKHR, [*c]u32, [*c]PipelineExecutablePropertiesKHR) callconv(.c) Result;
pub const PFN_getPipelineExecutableStatisticsKHR = ?*const fn (Device, [*c]const PipelineExecutableInfoKHR, [*c]u32, [*c]PipelineExecutableStatisticKHR) callconv(.c) Result;
pub const PFN_getPipelineExecutableInternalRepresentationsKHR = ?*const fn (Device, [*c]const PipelineExecutableInfoKHR, [*c]u32, [*c]PipelineExecutableInternalRepresentationKHR) callconv(.c) Result;
pub extern fn getPipelineExecutablePropertiesKHR(device: Device, p_pipeline_info: [*c]const PipelineInfoKHR, p_executable_count: [*c]u32, p_properties: [*c]PipelineExecutablePropertiesKHR) Result;
pub extern fn getPipelineExecutableStatisticsKHR(device: Device, p_executable_info: [*c]const PipelineExecutableInfoKHR, p_statistic_count: [*c]u32, p_statistics: [*c]PipelineExecutableStatisticKHR) Result;
pub extern fn getPipelineExecutableInternalRepresentationsKHR(device: Device, p_executable_info: [*c]const PipelineExecutableInfoKHR, p_internal_representation_count: [*c]u32, p_internal_representations: [*c]PipelineExecutableInternalRepresentationKHR) Result;
pub const MemoryUnmapFlagsKHR = enum(u32) {
    null = 0,
    reserve_bit_ext = 1,
};
pub const MemoryMapInfoKHR = extern struct {
    s_type: StructureType = StructureType.memory_map_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: MemoryMapFlags = @import("std").mem.zeroes(MemoryMapFlags),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const MemoryUnmapInfoKHR = extern struct {
    s_type: StructureType = StructureType.memory_unmap_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: MemoryUnmapFlagsKHR = @import("std").mem.zeroes(MemoryUnmapFlagsKHR),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
};
pub const PFN_mapMemory2KHR = ?*const fn (Device, [*c]const MemoryMapInfoKHR, [*c]?*anyopaque) callconv(.c) Result;
pub const PFN_unmapMemory2KHR = ?*const fn (Device, [*c]const MemoryUnmapInfoKHR) callconv(.c) Result;
pub extern fn mapMemory2KHR(device: Device, p_memory_map_info: [*c]const MemoryMapInfoKHR, pp_data: [*c]?*anyopaque) Result;
pub extern fn unmapMemory2KHR(device: Device, p_memory_unmap_info: [*c]const MemoryUnmapInfoKHR) Result;
pub const PhysicalDeviceShaderIntegerDotProductFeaturesKHR = PhysicalDeviceShaderIntegerDotProductFeatures;
pub const PhysicalDeviceShaderIntegerDotProductPropertiesKHR = PhysicalDeviceShaderIntegerDotProductProperties;
pub const PipelineLibraryCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_library_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    library_count: u32 = @import("std").mem.zeroes(u32),
    p_libraries: [*c]const Pipeline = @import("std").mem.zeroes([*c]const Pipeline),
};
pub const PresentIdKHR = extern struct {
    s_type: StructureType = StructureType.present_id_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_present_ids: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
};
pub const PhysicalDevicePresentIdFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_present_id_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_id: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const VideoEncodeTuningModeKHR = enum(u32) {
    default_khr = 0,
    high_quality_khr = 1,
    low_latency_khr = 2,
    ultra_low_latency_khr = 3,
    lossless_khr = 4,
};
pub const VideoEncodeFlagsKHR = Flags;
pub const VideoEncodeCapabilityFlagsKHR = enum(u32) {
    null = 0,
    preceding_externally_encoded_bytes_bit_khr = 1,
    insufficient_bitstream_buffer_range_detection_bit_khr = 2,
};
pub const VideoEncodeRateControlModeFlagsKHR = enum(u32) {
    default_khr = 0,
    disabled_bit_khr = 1,
    cbr_bit_khr = 2,
    vbr_bit_khr = 4,
};
pub const VideoEncodeFeedbackFlagsKHR = enum(u32) {
    null = 0,
    tream_buffer_offset_bit_khr = 1,
    tream_bytes_written_bit_khr = 2,
    tream_has_overrides_bit_khr = 4,
};
pub const VideoEncodeUsageFlagsKHR = enum(u32) {
    default_khr = 0,
    transcoding_bit_khr = 1,
    streaming_bit_khr = 2,
    recording_bit_khr = 4,
    conferencing_bit_khr = 8,
};
pub const VideoEncodeContentFlagsKHR = enum(u32) {
    default_khr = 0,
    camera_bit_khr = 1,
    desktop_bit_khr = 2,
    rendered_bit_khr = 4,
};
pub const VideoEncodeRateControlFlagsKHR = Flags;
pub const VideoEncodeInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: VideoEncodeFlagsKHR = @import("std").mem.zeroes(VideoEncodeFlagsKHR),
    dst_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    dst_buffer_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    dst_buffer_range: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    src_picture_resource: VideoPictureResourceInfoKHR = @import("std").mem.zeroes(VideoPictureResourceInfoKHR),
    p_setup_reference_slot: [*c]const VideoReferenceSlotInfoKHR = @import("std").mem.zeroes([*c]const VideoReferenceSlotInfoKHR),
    reference_slot_count: u32 = @import("std").mem.zeroes(u32),
    p_reference_slots: [*c]const VideoReferenceSlotInfoKHR = @import("std").mem.zeroes([*c]const VideoReferenceSlotInfoKHR),
    preceding_externally_encoded_bytes: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoEncodeCapabilitiesKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_capabilities_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: VideoEncodeCapabilityFlagsKHR = @import("std").mem.zeroes(VideoEncodeCapabilityFlagsKHR),
    rate_control_modes: VideoEncodeRateControlModeFlagsKHR = @import("std").mem.zeroes(VideoEncodeRateControlModeFlagsKHR),
    max_rate_control_layers: u32 = @import("std").mem.zeroes(u32),
    max_bitrate: u64 = @import("std").mem.zeroes(u64),
    max_quality_levels: u32 = @import("std").mem.zeroes(u32),
    encode_input_picture_granularity: Extent2D = @import("std").mem.zeroes(Extent2D),
    supported_encode_feedback_flags: VideoEncodeFeedbackFlagsKHR = @import("std").mem.zeroes(VideoEncodeFeedbackFlagsKHR),
};
pub const QueryPoolVideoEncodeFeedbackCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.query_pool_video_encode_feedback_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    encode_feedback_flags: VideoEncodeFeedbackFlagsKHR = @import("std").mem.zeroes(VideoEncodeFeedbackFlagsKHR),
};
pub const VideoEncodeUsageInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_usage_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    video_usage_hints: VideoEncodeUsageFlagsKHR = @import("std").mem.zeroes(VideoEncodeUsageFlagsKHR),
    video_content_hints: VideoEncodeContentFlagsKHR = @import("std").mem.zeroes(VideoEncodeContentFlagsKHR),
    tuning_mode: VideoEncodeTuningModeKHR = @import("std").mem.zeroes(VideoEncodeTuningModeKHR),
};
pub const VideoEncodeRateControlLayerInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_rate_control_layer_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    average_bitrate: u64 = @import("std").mem.zeroes(u64),
    max_bitrate: u64 = @import("std").mem.zeroes(u64),
    frame_rate_numerator: u32 = @import("std").mem.zeroes(u32),
    frame_rate_denominator: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoEncodeRateControlInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_rate_control_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: VideoEncodeRateControlFlagsKHR = @import("std").mem.zeroes(VideoEncodeRateControlFlagsKHR),
    rate_control_mode: VideoEncodeRateControlModeFlagsKHR = @import("std").mem.zeroes(VideoEncodeRateControlModeFlagsKHR),
    layer_count: u32 = @import("std").mem.zeroes(u32),
    p_layers: [*c]const VideoEncodeRateControlLayerInfoKHR = @import("std").mem.zeroes([*c]const VideoEncodeRateControlLayerInfoKHR),
    virtual_buffer_size_in_ms: u32 = @import("std").mem.zeroes(u32),
    initial_virtual_buffer_size_in_ms: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceVideoEncodeQualityLevelInfoKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_video_encode_quality_level_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_video_profile: [*c]const VideoProfileInfoKHR = @import("std").mem.zeroes([*c]const VideoProfileInfoKHR),
    quality_level: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoEncodeQualityLevelPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_quality_level_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    preferred_rate_control_mode: VideoEncodeRateControlModeFlagsKHR = @import("std").mem.zeroes(VideoEncodeRateControlModeFlagsKHR),
    preferred_rate_control_layer_count: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoEncodeQualityLevelInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_quality_level_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    quality_level: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoEncodeSessionParametersGetInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_session_parameters_get_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    video_session_parameters: VideoSessionParametersKHR = @import("std").mem.zeroes(VideoSessionParametersKHR),
};
pub const VideoEncodeSessionParametersFeedbackInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_encode_session_parameters_feedback_info_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    has_overrides: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_getPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR = ?*const fn (PhysicalDevice, [*c]const PhysicalDeviceVideoEncodeQualityLevelInfoKHR, [*c]VideoEncodeQualityLevelPropertiesKHR) callconv(.c) Result;
pub const PFN_getEncodedVideoSessionParametersKHR = ?*const fn (Device, [*c]const VideoEncodeSessionParametersGetInfoKHR, [*c]VideoEncodeSessionParametersFeedbackInfoKHR, [*c]usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_cmdEncodeVideoKHR = ?*const fn (CommandBuffer, [*c]const VideoEncodeInfoKHR) callconv(.c) void;
pub extern fn getPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR(physical_device: PhysicalDevice, p_quality_level_info: [*c]const PhysicalDeviceVideoEncodeQualityLevelInfoKHR, p_quality_level_properties: [*c]VideoEncodeQualityLevelPropertiesKHR) Result;
pub extern fn getEncodedVideoSessionParametersKHR(device: Device, p_video_session_parameters_info: [*c]const VideoEncodeSessionParametersGetInfoKHR, p_feedback_info: [*c]VideoEncodeSessionParametersFeedbackInfoKHR, p_data_size: [*c]usize, p_data: ?*anyopaque) Result;
pub extern fn cmdEncodeVideoKHR(command_buffer: CommandBuffer, p_encode_info: [*c]const VideoEncodeInfoKHR) void;
pub const SubmitFlagsKHR = SubmitFlags;
pub const MemoryBarrier2KHR = MemoryBarrier2;
pub const BufferMemoryBarrier2KHR = BufferMemoryBarrier2;
pub const ImageMemoryBarrier2KHR = ImageMemoryBarrier2;
pub const DependencyInfoKHR = DependencyInfo;
pub const SubmitInfo2KHR = SubmitInfo2;
pub const SemaphoreSubmitInfoKHR = SemaphoreSubmitInfo;
pub const CommandBufferSubmitInfoKHR = CommandBufferSubmitInfo;
pub const PhysicalDeviceSynchronization2FeaturesKHR = PhysicalDeviceSynchronization2Features;
pub const QueueFamilyCheckpointProperties2NV = extern struct {
    s_type: StructureType = StructureType.queue_family_checkpoint_properties2nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    checkpoint_execution_stage_mask: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
};
pub const CheckpointData2NV = extern struct {
    s_type: StructureType = StructureType.checkpoint_data2nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    stage: PipelineStageFlags2 = @import("std").mem.zeroes(PipelineStageFlags2),
    p_checkpoint_marker: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PFN_cmdSetEvent2KHR = ?*const fn (CommandBuffer, Event, [*c]const DependencyInfo) callconv(.c) void;
pub const PFN_cmdResetEvent2KHR = ?*const fn (CommandBuffer, Event, PipelineStageFlags2) callconv(.c) void;
pub const PFN_cmdWaitEvents2KHR = ?*const fn (CommandBuffer, u32, [*c]const Event, [*c]const DependencyInfo) callconv(.c) void;
pub const PFN_cmdPipelineBarrier2KHR = ?*const fn (CommandBuffer, [*c]const DependencyInfo) callconv(.c) void;
pub const PFN_cmdWriteTimestamp2KHR = ?*const fn (CommandBuffer, PipelineStageFlags2, QueryPool, u32) callconv(.c) void;
pub const PFN_queueSubmit2KHR = ?*const fn (Queue, u32, [*c]const SubmitInfo2, Fence) callconv(.c) Result;
pub const PFN_cmdWriteBufferMarker2AMD = ?*const fn (CommandBuffer, PipelineStageFlags2, Buffer, DeviceSize, u32) callconv(.c) void;
pub const PFN_getQueueCheckpointData2NV = ?*const fn (Queue, [*c]u32, [*c]CheckpointData2NV) callconv(.c) void;
pub extern fn cmdSetEvent2KHR(command_buffer: CommandBuffer, event: Event, p_dependency_info: [*c]const DependencyInfo) void;
pub extern fn cmdResetEvent2KHR(command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2) void;
pub extern fn cmdWaitEvents2KHR(command_buffer: CommandBuffer, event_count: u32, p_events: [*c]const Event, p_dependency_infos: [*c]const DependencyInfo) void;
pub extern fn cmdPipelineBarrier2KHR(command_buffer: CommandBuffer, p_dependency_info: [*c]const DependencyInfo) void;
pub extern fn cmdWriteTimestamp2KHR(command_buffer: CommandBuffer, stage: PipelineStageFlags2, query_pool: QueryPool, query: u32) void;
pub extern fn queueSubmit2KHR(queue: Queue, submit_count: u32, p_submits: [*c]const SubmitInfo2, fence: Fence) Result;
pub extern fn cmdWriteBufferMarker2AMD(command_buffer: CommandBuffer, stage: PipelineStageFlags2, dst_buffer: Buffer, dst_offset: DeviceSize, marker: u32) void;
pub extern fn getQueueCheckpointData2NV(queue: Queue, p_checkpoint_data_count: [*c]u32, p_checkpoint_data: [*c]CheckpointData2NV) void;
pub const PhysicalDeviceFragmentShaderBarycentricFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_shader_barycentric_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_shader_barycentric: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentShaderBarycentricPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_shader_barycentric_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    tri_strip_vertex_order_independent_of_provoking_vertex: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderSubgroupUniformControlFlowFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_subgroup_uniform_control_flow_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_subgroup_uniform_control_flow: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceZeroInitializeWorkgroupMemoryFeaturesKHR = PhysicalDeviceZeroInitializeWorkgroupMemoryFeatures;
pub const PhysicalDeviceWorkgroupMemoryExplicitLayoutFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_workgroup_memory_explicit_layout_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    workgroup_memory_explicit_layout: Bool32 = @import("std").mem.zeroes(Bool32),
    workgroup_memory_explicit_layout_scalar_block_layout: Bool32 = @import("std").mem.zeroes(Bool32),
    workgroup_memory_explicit_layout8bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
    workgroup_memory_explicit_layout16bit_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const CopyBufferInfo2KHR = CopyBufferInfo2;
pub const CopyImageInfo2KHR = CopyImageInfo2;
pub const CopyBufferToImageInfo2KHR = CopyBufferToImageInfo2;
pub const CopyImageToBufferInfo2KHR = CopyImageToBufferInfo2;
pub const BlitImageInfo2KHR = BlitImageInfo2;
pub const ResolveImageInfo2KHR = ResolveImageInfo2;
pub const BufferCopy2KHR = BufferCopy2;
pub const ImageCopy2KHR = ImageCopy2;
pub const ImageBlit2KHR = ImageBlit2;
pub const BufferImageCopy2KHR = BufferImageCopy2;
pub const ImageResolve2KHR = ImageResolve2;
pub const PFN_cmdCopyBuffer2KHR = ?*const fn (CommandBuffer, [*c]const CopyBufferInfo2) callconv(.c) void;
pub const PFN_cmdCopyImage2KHR = ?*const fn (CommandBuffer, [*c]const CopyImageInfo2) callconv(.c) void;
pub const PFN_cmdCopyBufferToImage2KHR = ?*const fn (CommandBuffer, [*c]const CopyBufferToImageInfo2) callconv(.c) void;
pub const PFN_cmdCopyImageToBuffer2KHR = ?*const fn (CommandBuffer, [*c]const CopyImageToBufferInfo2) callconv(.c) void;
pub const PFN_cmdBlitImage2KHR = ?*const fn (CommandBuffer, [*c]const BlitImageInfo2) callconv(.c) void;
pub const PFN_cmdResolveImage2KHR = ?*const fn (CommandBuffer, [*c]const ResolveImageInfo2) callconv(.c) void;
pub extern fn cmdCopyBuffer2KHR(command_buffer: CommandBuffer, p_copy_buffer_info: [*c]const CopyBufferInfo2) void;
pub extern fn cmdCopyImage2KHR(command_buffer: CommandBuffer, p_copy_image_info: [*c]const CopyImageInfo2) void;
pub extern fn cmdCopyBufferToImage2KHR(command_buffer: CommandBuffer, p_copy_buffer_to_image_info: [*c]const CopyBufferToImageInfo2) void;
pub extern fn cmdCopyImageToBuffer2KHR(command_buffer: CommandBuffer, p_copy_image_to_buffer_info: [*c]const CopyImageToBufferInfo2) void;
pub extern fn cmdBlitImage2KHR(command_buffer: CommandBuffer, p_blit_image_info: [*c]const BlitImageInfo2) void;
pub extern fn cmdResolveImage2KHR(command_buffer: CommandBuffer, p_resolve_image_info: [*c]const ResolveImageInfo2) void;
pub const FormatProperties3KHR = FormatProperties3;
pub const PhysicalDeviceRayTracingMaintenance1FeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_ray_tracing_maintenance1features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_maintenance1: Bool32 = @import("std").mem.zeroes(Bool32),
    ray_tracing_pipeline_trace_rays_indirect2: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const TraceRaysIndirectCommand2KHR = extern struct {
    raygen_shader_record_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    raygen_shader_record_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    miss_shader_binding_table_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    miss_shader_binding_table_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    miss_shader_binding_table_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    hit_shader_binding_table_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    hit_shader_binding_table_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    hit_shader_binding_table_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    callable_shader_binding_table_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    callable_shader_binding_table_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    callable_shader_binding_table_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
    depth: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdTraceRaysIndirect2KHR = ?*const fn (CommandBuffer, DeviceAddress) callconv(.c) void;
pub extern fn cmdTraceRaysIndirect2KHR(command_buffer: CommandBuffer, indirect_device_address: DeviceAddress) void;
pub const PhysicalDeviceMaintenance4FeaturesKHR = PhysicalDeviceMaintenance4Features;
pub const PhysicalDeviceMaintenance4PropertiesKHR = PhysicalDeviceMaintenance4Properties;
pub const DeviceBufferMemoryRequirementsKHR = DeviceBufferMemoryRequirements;
pub const DeviceImageMemoryRequirementsKHR = DeviceImageMemoryRequirements;
pub const PFN_getDeviceBufferMemoryRequirementsKHR = ?*const fn (Device, [*c]const DeviceBufferMemoryRequirements, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getDeviceImageMemoryRequirementsKHR = ?*const fn (Device, [*c]const DeviceImageMemoryRequirements, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_getDeviceImageSparseMemoryRequirementsKHR = ?*const fn (Device, [*c]const DeviceImageMemoryRequirements, [*c]u32, [*c]SparseImageMemoryRequirements2) callconv(.c) void;
pub extern fn getDeviceBufferMemoryRequirementsKHR(device: Device, p_info: [*c]const DeviceBufferMemoryRequirements, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getDeviceImageMemoryRequirementsKHR(device: Device, p_info: [*c]const DeviceImageMemoryRequirements, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn getDeviceImageSparseMemoryRequirementsKHR(device: Device, p_info: [*c]const DeviceImageMemoryRequirements, p_sparse_memory_requirement_count: [*c]u32, p_sparse_memory_requirements: [*c]SparseImageMemoryRequirements2) void;
pub const PhysicalDeviceShaderSubgroupRotateFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_subgroup_rotate_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_subgroup_rotate: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_subgroup_rotate_clustered: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderMaximalReconvergenceFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_maximal_reconvergence_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_maximal_reconvergence: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineCreateFlags2KHR = enum(u64) {
    disable_optimization_bit_khr = 1,
    allow_derivatives_bit_khr = 2,
    derivative_bit_khr = 4,
    enable_legacy_dithering_bit_ext = 17179869184,
    view_index_from_device_index_bit_khr = 8,
    dispatch_base_bit_khr = 16,
    defer_compile_bit_nv = 32,
    capture_statistics_bit_khr = 64,
    capture_internal_representations_bit_khr = 128,
    fail_on_pipeline_compile_required_bit_khr = 256,
    early_return_on_failure_bit_khr = 512,
    link_time_optimization_bit_ext = 1024,
    retain_link_time_optimization_info_bit_ext = 8388608,
    library_bit_khr = 2048,
    ray_tracing_skip_triangles_bit_khr = 4096,
    ray_tracing_skip_aabbs_bit_khr = 8192,
    ray_tracing_no_null_any_hit_shaders_bit_khr = 16384,
    ray_tracing_no_null_closest_hit_shaders_bit_khr = 32768,
    ray_tracing_no_null_miss_shaders_bit_khr = 65536,
    ray_tracing_no_null_intersection_shaders_bit_khr = 131072,
    ray_tracing_shader_group_handle_capture_replay_bit_khr = 524288,
    indirect_bindable_bit_nv = 262144,
    ray_tracing_allow_motion_bit_nv = 1048576,
    rendering_fragment_shading_rate_attachment_bit_khr = 2097152,
    rendering_fragment_density_map_attachment_bit_ext = 4194304,
    ray_tracing_opacity_micromap_bit_ext = 16777216,
    color_attachment_feedback_loop_bit_ext = 33554432,
    depth_stencil_attachment_feedback_loop_bit_ext = 67108864,
    no_protected_access_bit_ext = 134217728,
    protected_access_only_bit_ext = 1073741824,
    ray_tracing_displacement_micromap_bit_nv = 268435456,
    descriptor_buffer_bit_ext = 536870912,
    capture_data_bit_khr = 2147483648,
    indirect_bindable_bit_ext = 274877906944,
};
pub const BufferUsageFlags2KHR = enum(u64) {
    transfer_src_bit_khr = 1,
    transfer_dst_bit_khr = 2,
    uniform_texel_buffer_bit_khr = 4,
    storage_texel_buffer_bit_khr = 8,
    uniform_buffer_bit_khr = 16,
    storage_buffer_bit_khr = 32,
    index_buffer_bit_khr = 64,
    vertex_buffer_bit_khr = 128,
    indirect_buffer_bit_khr = 256,
    execution_graph_scratch_bit_amdx = 33554432,
    conditional_rendering_bit_ext = 512,
    shader_binding_table_bit_khr = 1024,
    transform_feedback_buffer_bit_ext = 2048,
    transform_feedback_counter_buffer_bit_ext = 4096,
    video_decode_src_bit_khr = 8192,
    video_decode_dst_bit_khr = 16384,
    video_encode_dst_bit_khr = 32768,
    video_encode_src_bit_khr = 65536,
    shader_device_address_bit_khr = 131072,
    acceleration_structure_build_input_read_only_bit_khr = 524288,
    acceleration_structure_storage_bit_khr = 1048576,
    sampler_descriptor_buffer_bit_ext = 2097152,
    resource_descriptor_buffer_bit_ext = 4194304,
    push_descriptors_descriptor_buffer_bit_ext = 67108864,
    micromap_build_input_read_only_bit_ext = 8388608,
    micromap_storage_bit_ext = 16777216,
    preprocess_buffer_bit_ext = 2147483648,
    pub const Self = @This();
    pub const ray_tracing_bit_nv = Self.shader_binding_table_bit_khr;
};
pub const PhysicalDeviceMaintenance5FeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_maintenance5features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    maintenance5: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMaintenance5PropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_maintenance5properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    early_fragment_multisample_coverage_after_sample_counting: Bool32 = @import("std").mem.zeroes(Bool32),
    early_fragment_sample_mask_test_before_sample_counting: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_stencil_swizzle_one_support: Bool32 = @import("std").mem.zeroes(Bool32),
    polygon_mode_point_size: Bool32 = @import("std").mem.zeroes(Bool32),
    non_strict_single_pixel_wide_lines_use_parallelogram: Bool32 = @import("std").mem.zeroes(Bool32),
    non_strict_wide_lines_use_parallelogram: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RenderingAreaInfoKHR = extern struct {
    s_type: StructureType = StructureType.rendering_area_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    view_mask: u32 = @import("std").mem.zeroes(u32),
    color_attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_attachment_formats: [*c]const Format = @import("std").mem.zeroes([*c]const Format),
    depth_attachment_format: Format = @import("std").mem.zeroes(Format),
    stencil_attachment_format: Format = @import("std").mem.zeroes(Format),
};
pub const ImageSubresource2KHR = extern struct {
    s_type: StructureType = StructureType.image_subresource2khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_subresource: ImageSubresource = @import("std").mem.zeroes(ImageSubresource),
};
pub const DeviceImageSubresourceInfoKHR = extern struct {
    s_type: StructureType = StructureType.device_image_subresource_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_create_info: [*c]const ImageCreateInfo = @import("std").mem.zeroes([*c]const ImageCreateInfo),
    p_subresource: [*c]const ImageSubresource2KHR = @import("std").mem.zeroes([*c]const ImageSubresource2KHR),
};
pub const SubresourceLayout2KHR = extern struct {
    s_type: StructureType = StructureType.subresource_layout2khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    subresource_layout: SubresourceLayout = @import("std").mem.zeroes(SubresourceLayout),
};
pub const PipelineCreateFlags2CreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_create_flags2create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCreateFlags2KHR = @import("std").mem.zeroes(PipelineCreateFlags2KHR),
};
pub const BufferUsageFlags2CreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.buffer_usage_flags2create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    usage: BufferUsageFlags2KHR = @import("std").mem.zeroes(BufferUsageFlags2KHR),
};
pub const PFN_cmdBindIndexBuffer2KHR = ?*const fn (CommandBuffer, Buffer, DeviceSize, DeviceSize, IndexType) callconv(.c) void;
pub const PFN_getRenderingAreaGranularityKHR = ?*const fn (Device, [*c]const RenderingAreaInfoKHR, [*c]Extent2D) callconv(.c) void;
pub const PFN_getDeviceImageSubresourceLayoutKHR = ?*const fn (Device, [*c]const DeviceImageSubresourceInfoKHR, [*c]SubresourceLayout2KHR) callconv(.c) void;
pub const PFN_getImageSubresourceLayout2KHR = ?*const fn (Device, Image, [*c]const ImageSubresource2KHR, [*c]SubresourceLayout2KHR) callconv(.c) void;
pub extern fn cmdBindIndexBuffer2KHR(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, size: DeviceSize, index_type: IndexType) void;
pub extern fn getRenderingAreaGranularityKHR(device: Device, p_rendering_area_info: [*c]const RenderingAreaInfoKHR, p_granularity: [*c]Extent2D) void;
pub extern fn getDeviceImageSubresourceLayoutKHR(device: Device, p_info: [*c]const DeviceImageSubresourceInfoKHR, p_layout: [*c]SubresourceLayout2KHR) void;
pub extern fn getImageSubresourceLayout2KHR(device: Device, image: Image, p_subresource: [*c]const ImageSubresource2KHR, p_layout: [*c]SubresourceLayout2KHR) void;
pub const PhysicalDeviceRayTracingPositionFetchFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_ray_tracing_position_fetch_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_position_fetch: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineBinaryKHR = enum(u64) { null = 0, _ };
pub const PhysicalDevicePipelineBinaryFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_pipeline_binary_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_binaries: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePipelineBinaryPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_pipeline_binary_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_binary_internal_cache: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_binary_internal_cache_control: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_binary_prefers_internal_cache: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_binary_precompiled_internal_cache: Bool32 = @import("std").mem.zeroes(Bool32),
    pipeline_binary_compressed_data: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DevicePipelineBinaryInternalCacheControlKHR = extern struct {
    s_type: StructureType = StructureType.device_pipeline_binary_internal_cache_control_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    disable_internal_cache: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineBinaryKeyKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_binary_key_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    key_size: u32 = @import("std").mem.zeroes(u32),
    key: [32]u8 = @import("std").mem.zeroes([32]u8),
};
pub const PipelineBinaryDataKHR = extern struct {
    data_size: usize = @import("std").mem.zeroes(usize),
    p_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PipelineBinaryKeysAndDataKHR = extern struct {
    binary_count: u32 = @import("std").mem.zeroes(u32),
    p_pipeline_binary_keys: [*c]const PipelineBinaryKeyKHR = @import("std").mem.zeroes([*c]const PipelineBinaryKeyKHR),
    p_pipeline_binary_data: [*c]const PipelineBinaryDataKHR = @import("std").mem.zeroes([*c]const PipelineBinaryDataKHR),
};
pub const PipelineCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_create_info_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PipelineBinaryCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_binary_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_keys_and_data_info: [*c]const PipelineBinaryKeysAndDataKHR = @import("std").mem.zeroes([*c]const PipelineBinaryKeysAndDataKHR),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
    p_pipeline_create_info: [*c]const PipelineCreateInfoKHR = @import("std").mem.zeroes([*c]const PipelineCreateInfoKHR),
};
pub const PipelineBinaryInfoKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_binary_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    binary_count: u32 = @import("std").mem.zeroes(u32),
    p_pipeline_binaries: [*c]const PipelineBinaryKHR = @import("std").mem.zeroes([*c]const PipelineBinaryKHR),
};
pub const ReleaseCapturedPipelineDataInfoKHR = extern struct {
    s_type: StructureType = StructureType.release_captured_pipeline_data_info_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
};
pub const PipelineBinaryDataInfoKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_binary_data_info_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_binary: PipelineBinaryKHR = @import("std").mem.zeroes(PipelineBinaryKHR),
};
pub const PipelineBinaryHandlesInfoKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_binary_handles_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    pipeline_binary_count: u32 = @import("std").mem.zeroes(u32),
    p_pipeline_binaries: [*c]PipelineBinaryKHR = @import("std").mem.zeroes([*c]PipelineBinaryKHR),
};
pub const PFN_createPipelineBinariesKHR = ?*const fn (Device, [*c]const PipelineBinaryCreateInfoKHR, [*c]const AllocationCallbacks, [*c]PipelineBinaryHandlesInfoKHR) callconv(.c) Result;
pub const PFN_destroyPipelineBinaryKHR = ?*const fn (Device, PipelineBinaryKHR, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getPipelineKeyKHR = ?*const fn (Device, [*c]const PipelineCreateInfoKHR, [*c]PipelineBinaryKeyKHR) callconv(.c) Result;
pub const PFN_getPipelineBinaryDataKHR = ?*const fn (Device, [*c]const PipelineBinaryDataInfoKHR, [*c]PipelineBinaryKeyKHR, [*c]usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_releaseCapturedPipelineDataKHR = ?*const fn (Device, [*c]const ReleaseCapturedPipelineDataInfoKHR, [*c]const AllocationCallbacks) callconv(.c) Result;
pub extern fn createPipelineBinariesKHR(device: Device, p_create_info: [*c]const PipelineBinaryCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_binaries: [*c]PipelineBinaryHandlesInfoKHR) Result;
pub extern fn destroyPipelineBinaryKHR(device: Device, pipeline_binary: PipelineBinaryKHR, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getPipelineKeyKHR(device: Device, p_pipeline_create_info: [*c]const PipelineCreateInfoKHR, p_pipeline_key: [*c]PipelineBinaryKeyKHR) Result;
pub extern fn getPipelineBinaryDataKHR(device: Device, p_info: [*c]const PipelineBinaryDataInfoKHR, p_pipeline_binary_key: [*c]PipelineBinaryKeyKHR, p_pipeline_binary_data_size: [*c]usize, p_pipeline_binary_data: ?*anyopaque) Result;
pub extern fn releaseCapturedPipelineDataKHR(device: Device, p_info: [*c]const ReleaseCapturedPipelineDataInfoKHR, p_allocator: [*c]const AllocationCallbacks) Result;
pub const ComponentTypeKHR = enum(u32) {
    float16_nv = 0,
    float32_nv = 1,
    float64_nv = 2,
    sint8_nv = 3,
    sint16_nv = 4,
    sint32_nv = 5,
    sint64_nv = 6,
    uint8_nv = 7,
    uint16_nv = 8,
    uint32_nv = 9,
    uint64_nv = 10,
    pub const Self = @This();
    pub const float16_khr = Self.float16_nv;
    pub const float32_khr = Self.float32_nv;
    pub const float64_khr = Self.float64_nv;
    pub const sint8_khr = Self.sint8_nv;
    pub const sint16_khr = Self.sint16_nv;
    pub const sint32_khr = Self.sint32_nv;
    pub const sint64_khr = Self.sint64_nv;
    pub const uint8_khr = Self.uint8_nv;
    pub const uint16_khr = Self.uint16_nv;
    pub const uint32_khr = Self.uint32_nv;
    pub const uint64_khr = Self.uint64_nv;
};
pub const ScopeKHR = enum(u32) {
    null = 0,
    device_nv = 1,
    workgroup_nv = 2,
    subgroup_nv = 3,
    queue_family_nv = 5,
    pub const Self = @This();
    pub const device_khr = Self.device_nv;
    pub const workgroup_khr = Self.workgroup_nv;
    pub const subgroup_khr = Self.subgroup_nv;
    pub const queue_family_khr = Self.queue_family_nv;
};
pub const CooperativeMatrixPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.cooperative_matrix_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    Msize: u32 = @import("std").mem.zeroes(u32),
    Nsize: u32 = @import("std").mem.zeroes(u32),
    Ksize: u32 = @import("std").mem.zeroes(u32),
    Atype: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    Btype: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    Ctype: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    Result_type: ComponentTypeKHR = @import("std").mem.zeroes(ComponentTypeKHR),
    saturating_accumulation: Bool32 = @import("std").mem.zeroes(Bool32),
    scope: ScopeKHR = @import("std").mem.zeroes(ScopeKHR),
};
pub const PhysicalDeviceCooperativeMatrixFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_cooperative_matrix_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cooperative_matrix: Bool32 = @import("std").mem.zeroes(Bool32),
    cooperative_matrix_robust_buffer_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceCooperativeMatrixPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_cooperative_matrix_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cooperative_matrix_supported_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
};
pub const PFN_getPhysicalDeviceCooperativeMatrixPropertiesKHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]CooperativeMatrixPropertiesKHR) callconv(.c) Result;
pub extern fn getPhysicalDeviceCooperativeMatrixPropertiesKHR(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]CooperativeMatrixPropertiesKHR) Result;
pub const PhysicalDeviceComputeShaderDerivativesFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_compute_shader_derivatives_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    compute_derivative_group_quads: Bool32 = @import("std").mem.zeroes(Bool32),
    compute_derivative_group_linear: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceComputeShaderDerivativesPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_compute_shader_derivatives_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    mesh_and_task_shader_derivatives: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const VideoAV1Profile = enum(u32) {
    av1_profile_main = 0,
    av1_profile_high = 1,
    av1_profile_professional = 2,
    pub const Self = @This();
};
pub const VideoAV1Level = enum(u32) {
    av1_level_2_0 = 0,
    av1_level_2_1 = 1,
    av1_level_2_2 = 2,
    av1_level_2_3 = 3,
    av1_level_3_0 = 4,
    av1_level_3_1 = 5,
    av1_level_3_2 = 6,
    av1_level_3_3 = 7,
    av1_level_4_0 = 8,
    av1_level_4_1 = 9,
    av1_level_4_2 = 10,
    av1_level_4_3 = 11,
    av1_level_5_0 = 12,
    av1_level_5_1 = 13,
    av1_level_5_2 = 14,
    av1_level_5_3 = 15,
    av1_level_6_0 = 16,
    av1_level_6_1 = 17,
    av1_level_6_2 = 18,
    av1_level_6_3 = 19,
    av1_level_7_0 = 20,
    av1_level_7_1 = 21,
    av1_level_7_2 = 22,
    av1_level_7_3 = 23,
    pub const Self = @This();
};
pub const VideoAV1FrameType = enum(u32) {
    av1_frame_type_key = 0,
    av1_frame_type_inter = 1,
    av1_frame_type_intra_only = 2,
    av1_frame_type_switch = 3,
    pub const Self = @This();
};
pub const VideoAV1ReferenceName = enum(u32) {
    av1_reference_name_intra_frame = 0,
    av1_reference_name_last_frame = 1,
    av1_reference_name_last2_frame = 2,
    av1_reference_name_last3_frame = 3,
    av1_reference_name_golden_frame = 4,
    av1_reference_name_bwdref_frame = 5,
    av1_reference_name_altref2_frame = 6,
    av1_reference_name_altref_frame = 7,
    pub const Self = @This();
};
pub const VideoAV1InterpolationFilter = enum(u32) {
    av1_interpolation_filter_eighttap = 0,
    av1_interpolation_filter_eighttap_smooth = 1,
    av1_interpolation_filter_eighttap_sharp = 2,
    av1_interpolation_filter_bilinear = 3,
    av1_interpolation_filter_switchable = 4,
    pub const Self = @This();
};
pub const VideoAV1TxMode = enum(u32) {
    av1_tx_mode_only_4x4 = 0,
    av1_tx_mode_largest = 1,
    av1_tx_mode_select = 2,
    pub const Self = @This();
};
pub const VideoAV1FrameRestorationType = enum(u32) {
    av1_frame_restoration_type_none = 0,
    av1_frame_restoration_type_wiener = 1,
    av1_frame_restoration_type_sgrproj = 2,
    av1_frame_restoration_type_switchable = 3,
    pub const Self = @This();
};
pub const VideoAV1ColorPrimaries = enum(u32) {
    null = 0,
    av1_color_primaries_bt_709 = 1,
    av1_color_primaries_bt_unspecified = 2,
    av1_color_primaries_bt_470_m = 4,
    av1_color_primaries_bt_470_b_g = 5,
    av1_color_primaries_bt_601 = 6,
    av1_color_primaries_smpte_240 = 7,
    av1_color_primaries_generic_film = 8,
    av1_color_primaries_bt_2020 = 9,
    av1_color_primaries_xyz = 10,
    av1_color_primaries_smpte_431 = 11,
    av1_color_primaries_smpte_432 = 12,
    av1_color_primaries_ebu_3213 = 22,
    pub const Self = @This();
};
pub const VideoAV1TransferCharacteristics = enum(u32) {
    av1_transfer_characteristics_reserved_0 = 0,
    av1_transfer_characteristics_bt_709 = 1,
    av1_transfer_characteristics_unspecified = 2,
    av1_transfer_characteristics_reserved_3 = 3,
    av1_transfer_characteristics_bt_470_m = 4,
    av1_transfer_characteristics_bt_470_b_g = 5,
    av1_transfer_characteristics_bt_601 = 6,
    av1_transfer_characteristics_smpte_240 = 7,
    av1_transfer_characteristics_linear = 8,
    av1_transfer_characteristics_log_100 = 9,
    av1_transfer_characteristics_log_100_sqrt10 = 10,
    av1_transfer_characteristics_iec_61966 = 11,
    av1_transfer_characteristics_bt_1361 = 12,
    av1_transfer_characteristics_srgb = 13,
    av1_transfer_characteristics_bt_2020_10_bit = 14,
    av1_transfer_characteristics_bt_2020_12_bit = 15,
    av1_transfer_characteristics_smpte_2084 = 16,
    av1_transfer_characteristics_smpte_428 = 17,
    av1_transfer_characteristics_hlg = 18,
    pub const Self = @This();
};
pub const VideoAV1MatrixCoefficients = enum(u32) {
    av1_matrix_coefficients_identity = 0,
    av1_matrix_coefficients_bt_709 = 1,
    av1_matrix_coefficients_unspecified = 2,
    av1_matrix_coefficients_reserved_3 = 3,
    av1_matrix_coefficients_fcc = 4,
    av1_matrix_coefficients_bt_470_b_g = 5,
    av1_matrix_coefficients_bt_601 = 6,
    av1_matrix_coefficients_smpte_240 = 7,
    av1_matrix_coefficients_smpte_ycgco = 8,
    av1_matrix_coefficients_bt_2020_ncl = 9,
    av1_matrix_coefficients_bt_2020_cl = 10,
    av1_matrix_coefficients_smpte_2085 = 11,
    av1_matrix_coefficients_chromat_ncl = 12,
    av1_matrix_coefficients_chromat_cl = 13,
    av1_matrix_coefficients_ictcp = 14,
    pub const Self = @This();
};
pub const VideoAV1ChromaSamplePosition = enum(u32) {
    av1_chroma_sample_position_unknown = 0,
    av1_chroma_sample_position_vertical = 1,
    av1_chroma_sample_position_colocated = 2,
    av1_chroma_sample_position_reserved = 3,
    pub const Self = @This();
};
pub const VideoAV1ColorConfigFlags = enum(u64) { null = 0, _ };
pub const VideoAV1ColorConfig = extern struct {
    flags: VideoAV1ColorConfigFlags = @import("std").mem.zeroes(VideoAV1ColorConfigFlags),
    Bit_depth: u8 = @import("std").mem.zeroes(u8),
    subsampling_x: u8 = @import("std").mem.zeroes(u8),
    subsampling_y: u8 = @import("std").mem.zeroes(u8),
    reserved1: u8 = @import("std").mem.zeroes(u8),
    color_primaries: VideoAV1ColorPrimaries = @import("std").mem.zeroes(VideoAV1ColorPrimaries),
    transfer_characteristics: VideoAV1TransferCharacteristics = @import("std").mem.zeroes(VideoAV1TransferCharacteristics),
    matrix_coefficients: VideoAV1MatrixCoefficients = @import("std").mem.zeroes(VideoAV1MatrixCoefficients),
    chroma_sample_position: VideoAV1ChromaSamplePosition = @import("std").mem.zeroes(VideoAV1ChromaSamplePosition),
};
pub const VideoAV1TimingInfoFlags = enum(u64) { null = 0, _ };
pub const VideoAV1TimingInfo = extern struct {
    flags: VideoAV1TimingInfoFlags = @import("std").mem.zeroes(VideoAV1TimingInfoFlags),
    num_units_in_display_tick: u32 = @import("std").mem.zeroes(u32),
    time_scale: u32 = @import("std").mem.zeroes(u32),
    num_ticks_per_picture_minus_1: u32 = @import("std").mem.zeroes(u32),
};
pub const VideoAV1LoopFilterFlags = enum(u64) { null = 0, _ };
pub const VideoAV1LoopFilter = extern struct {
    flags: VideoAV1LoopFilterFlags = @import("std").mem.zeroes(VideoAV1LoopFilterFlags),
    loop_filter_level: [4]u8 = @import("std").mem.zeroes([4]u8),
    loop_filter_sharpness: u8 = @import("std").mem.zeroes(u8),
    update_ref_delta: u8 = @import("std").mem.zeroes(u8),
    loop_filter_ref_deltas: [8]i8 = @import("std").mem.zeroes([8]i8),
    update_mode_delta: u8 = @import("std").mem.zeroes(u8),
    loop_filter_mode_deltas: [2]i8 = @import("std").mem.zeroes([2]i8),
};
pub const VideoAV1QuantizationFlags = enum(u64) { null = 0, _ };
pub const VideoAV1Quantization = extern struct {
    flags: VideoAV1QuantizationFlags = @import("std").mem.zeroes(VideoAV1QuantizationFlags),
    base_q_idx: u8 = @import("std").mem.zeroes(u8),
    Delta_qydc: i8 = @import("std").mem.zeroes(i8),
    Delta_qudc: i8 = @import("std").mem.zeroes(i8),
    Delta_quac: i8 = @import("std").mem.zeroes(i8),
    Delta_qvdc: i8 = @import("std").mem.zeroes(i8),
    Delta_qvac: i8 = @import("std").mem.zeroes(i8),
    qm_y: u8 = @import("std").mem.zeroes(u8),
    qm_u: u8 = @import("std").mem.zeroes(u8),
    qm_v: u8 = @import("std").mem.zeroes(u8),
};
pub const VideoAV1Segmentation = extern struct {
    Feature_enabled: [8]u8 = @import("std").mem.zeroes([8]u8),
    Feature_data: [8][8]i16 = @import("std").mem.zeroes([8][8]i16),
};
pub const VideoAV1TileInfoFlags = enum(u64) { null = 0, _ };
pub const VideoAV1TileInfo = extern struct {
    flags: VideoAV1TileInfoFlags = @import("std").mem.zeroes(VideoAV1TileInfoFlags),
    Tile_cols: u8 = @import("std").mem.zeroes(u8),
    Tile_rows: u8 = @import("std").mem.zeroes(u8),
    context_update_tile_id: u16 = @import("std").mem.zeroes(u16),
    tile_size_bytes_minus_1: u8 = @import("std").mem.zeroes(u8),
    reserved1: [7]u8 = @import("std").mem.zeroes([7]u8),
    p_mi_col_starts: [*c]const u16 = @import("std").mem.zeroes([*c]const u16),
    p_mi_row_starts: [*c]const u16 = @import("std").mem.zeroes([*c]const u16),
    p_width_in_sbs_minus1: [*c]const u16 = @import("std").mem.zeroes([*c]const u16),
    p_height_in_sbs_minus1: [*c]const u16 = @import("std").mem.zeroes([*c]const u16),
};
pub const VideoAV1CDEF = extern struct {
    cdef_damping_minus_3: u8 = @import("std").mem.zeroes(u8),
    cdef_bits: u8 = @import("std").mem.zeroes(u8),
    cdef_y_pri_strength: [8]u8 = @import("std").mem.zeroes([8]u8),
    cdef_y_sec_strength: [8]u8 = @import("std").mem.zeroes([8]u8),
    cdef_uv_pri_strength: [8]u8 = @import("std").mem.zeroes([8]u8),
    cdef_uv_sec_strength: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const VideoAV1LoopRestoration = extern struct {
    Frame_restoration_type: [3]VideoAV1FrameRestorationType = @import("std").mem.zeroes([3]VideoAV1FrameRestorationType),
    Loop_restoration_size: [3]u16 = @import("std").mem.zeroes([3]u16),
};
pub const VideoAV1GlobalMotion = extern struct {
    Gm_type: [8]u8 = @import("std").mem.zeroes([8]u8),
    gm_params: [8][6]i32 = @import("std").mem.zeroes([8][6]i32),
};
pub const VideoAV1FilmGrainFlags = enum(u64) { null = 0, _ };
pub const VideoAV1FilmGrain = extern struct {
    flags: VideoAV1FilmGrainFlags = @import("std").mem.zeroes(VideoAV1FilmGrainFlags),
    grain_scaling_minus_8: u8 = @import("std").mem.zeroes(u8),
    ar_coeff_lag: u8 = @import("std").mem.zeroes(u8),
    ar_coeff_shift_minus_6: u8 = @import("std").mem.zeroes(u8),
    grain_scale_shift: u8 = @import("std").mem.zeroes(u8),
    grain_seed: u16 = @import("std").mem.zeroes(u16),
    film_grain_params_ref_idx: u8 = @import("std").mem.zeroes(u8),
    num_y_points: u8 = @import("std").mem.zeroes(u8),
    point_y_value: [14]u8 = @import("std").mem.zeroes([14]u8),
    point_y_scaling: [14]u8 = @import("std").mem.zeroes([14]u8),
    num_cb_points: u8 = @import("std").mem.zeroes(u8),
    point_cb_value: [10]u8 = @import("std").mem.zeroes([10]u8),
    point_cb_scaling: [10]u8 = @import("std").mem.zeroes([10]u8),
    num_cr_points: u8 = @import("std").mem.zeroes(u8),
    point_cr_value: [10]u8 = @import("std").mem.zeroes([10]u8),
    point_cr_scaling: [10]u8 = @import("std").mem.zeroes([10]u8),
    ar_coeffs_y_plus_128: [24]i8 = @import("std").mem.zeroes([24]i8),
    ar_coeffs_cb_plus_128: [25]i8 = @import("std").mem.zeroes([25]i8),
    ar_coeffs_cr_plus_128: [25]i8 = @import("std").mem.zeroes([25]i8),
    cb_mult: u8 = @import("std").mem.zeroes(u8),
    cb_luma_mult: u8 = @import("std").mem.zeroes(u8),
    cb_offset: u16 = @import("std").mem.zeroes(u16),
    cr_mult: u8 = @import("std").mem.zeroes(u8),
    cr_luma_mult: u8 = @import("std").mem.zeroes(u8),
    cr_offset: u16 = @import("std").mem.zeroes(u16),
};
pub const VideoAV1SequenceHeaderFlags = enum(u64) { null = 0, _ };
pub const VideoAV1SequenceHeader = extern struct {
    flags: VideoAV1SequenceHeaderFlags = @import("std").mem.zeroes(VideoAV1SequenceHeaderFlags),
    seq_profile: VideoAV1Profile = @import("std").mem.zeroes(VideoAV1Profile),
    frame_width_bits_minus_1: u8 = @import("std").mem.zeroes(u8),
    frame_height_bits_minus_1: u8 = @import("std").mem.zeroes(u8),
    max_frame_width_minus_1: u16 = @import("std").mem.zeroes(u16),
    max_frame_height_minus_1: u16 = @import("std").mem.zeroes(u16),
    delta_frame_id_length_minus_2: u8 = @import("std").mem.zeroes(u8),
    additional_frame_id_length_minus_1: u8 = @import("std").mem.zeroes(u8),
    order_hint_bits_minus_1: u8 = @import("std").mem.zeroes(u8),
    seq_force_integer_mv: u8 = @import("std").mem.zeroes(u8),
    seq_force_screen_content_tools: u8 = @import("std").mem.zeroes(u8),
    reserved1: [5]u8 = @import("std").mem.zeroes([5]u8),
    p_color_config: ?*const VideoAV1ColorConfig = @import("std").mem.zeroes(?*const VideoAV1ColorConfig),
    p_timing_info: ?*const VideoAV1TimingInfo = @import("std").mem.zeroes(?*const VideoAV1TimingInfo),
};
pub const VideoDecodeAV1PictureInfoFlags = enum(u64) { null = 0, _ };
pub const VideoDecodeAV1PictureInfo = extern struct {
    flags: VideoDecodeAV1PictureInfoFlags = @import("std").mem.zeroes(VideoDecodeAV1PictureInfoFlags),
    frame_type: VideoAV1FrameType = @import("std").mem.zeroes(VideoAV1FrameType),
    current_frame_id: u32 = @import("std").mem.zeroes(u32),
    Order_hint: u8 = @import("std").mem.zeroes(u8),
    primary_ref_frame: u8 = @import("std").mem.zeroes(u8),
    refresh_frame_flags: u8 = @import("std").mem.zeroes(u8),
    reserved1: u8 = @import("std").mem.zeroes(u8),
    interpolation_filter: VideoAV1InterpolationFilter = @import("std").mem.zeroes(VideoAV1InterpolationFilter),
    Tx_mode: VideoAV1TxMode = @import("std").mem.zeroes(VideoAV1TxMode),
    delta_q_res: u8 = @import("std").mem.zeroes(u8),
    delta_lf_res: u8 = @import("std").mem.zeroes(u8),
    Skip_mode_frame: [2]u8 = @import("std").mem.zeroes([2]u8),
    coded_denom: u8 = @import("std").mem.zeroes(u8),
    reserved2: [3]u8 = @import("std").mem.zeroes([3]u8),
    Order_hints: [8]u8 = @import("std").mem.zeroes([8]u8),
    expected_frame_id: [8]u32 = @import("std").mem.zeroes([8]u32),
    p_tile_info: ?*const VideoAV1TileInfo = @import("std").mem.zeroes(?*const VideoAV1TileInfo),
    p_quantization: ?*const VideoAV1Quantization = @import("std").mem.zeroes(?*const VideoAV1Quantization),
    p_segmentation: [*c]const VideoAV1Segmentation = @import("std").mem.zeroes([*c]const VideoAV1Segmentation),
    p_loop_filter: ?*const VideoAV1LoopFilter = @import("std").mem.zeroes(?*const VideoAV1LoopFilter),
    p_cdef: [*c]const VideoAV1CDEF = @import("std").mem.zeroes([*c]const VideoAV1CDEF),
    p_loop_restoration: [*c]const VideoAV1LoopRestoration = @import("std").mem.zeroes([*c]const VideoAV1LoopRestoration),
    p_global_motion: [*c]const VideoAV1GlobalMotion = @import("std").mem.zeroes([*c]const VideoAV1GlobalMotion),
    p_film_grain: ?*const VideoAV1FilmGrain = @import("std").mem.zeroes(?*const VideoAV1FilmGrain),
};
pub const VideoDecodeAV1ReferenceInfoFlags = enum(u64) { null = 0, _ };
pub const VideoDecodeAV1ReferenceInfo = extern struct {
    flags: VideoDecodeAV1ReferenceInfoFlags = @import("std").mem.zeroes(VideoDecodeAV1ReferenceInfoFlags),
    frame_type: u8 = @import("std").mem.zeroes(u8),
    Ref_frame_sign_bias: u8 = @import("std").mem.zeroes(u8),
    Order_hint: u8 = @import("std").mem.zeroes(u8),
    Saved_order_hints: [8]u8 = @import("std").mem.zeroes([8]u8),
};
pub const VideoDecodeAV1ProfileInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_av1profile_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    std_profile: VideoAV1Profile = @import("std").mem.zeroes(VideoAV1Profile),
    film_grain_support: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const VideoDecodeAV1CapabilitiesKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_av1capabilities_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_level: VideoAV1Level = @import("std").mem.zeroes(VideoAV1Level),
};
pub const VideoDecodeAV1SessionParametersCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_av1session_parameters_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_std_sequence_header: ?*const VideoAV1SequenceHeader = @import("std").mem.zeroes(?*const VideoAV1SequenceHeader),
};
pub const VideoDecodeAV1PictureInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_av1picture_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_std_picture_info: ?*const VideoDecodeAV1PictureInfo = @import("std").mem.zeroes(?*const VideoDecodeAV1PictureInfo),
    reference_name_slot_indices: [7]i32 = @import("std").mem.zeroes([7]i32),
    frame_header_offset: u32 = @import("std").mem.zeroes(u32),
    tile_count: u32 = @import("std").mem.zeroes(u32),
    p_tile_offsets: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    p_tile_sizes: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const VideoDecodeAV1DpbSlotInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_decode_av1dpb_slot_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_std_reference_info: ?*const VideoDecodeAV1ReferenceInfo = @import("std").mem.zeroes(?*const VideoDecodeAV1ReferenceInfo),
};
pub const PhysicalDeviceVideoMaintenance1FeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_video_maintenance1features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    video_maintenance1: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const VideoInlineQueryInfoKHR = extern struct {
    s_type: StructureType = StructureType.video_inline_query_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    query_pool: QueryPool = @import("std").mem.zeroes(QueryPool),
    first_query: u32 = @import("std").mem.zeroes(u32),
    query_count: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceVertexAttributeDivisorPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_vertex_attribute_divisor_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_vertex_attrib_divisor: u32 = @import("std").mem.zeroes(u32),
    supports_non_zero_first_instance: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const VertexInputBindingDivisorDescriptionKHR = extern struct {
    binding: u32 = @import("std").mem.zeroes(u32),
    divisor: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineVertexInputDivisorStateCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_vertex_input_divisor_state_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    vertex_binding_divisor_count: u32 = @import("std").mem.zeroes(u32),
    p_vertex_binding_divisors: [*c]const VertexInputBindingDivisorDescriptionKHR = @import("std").mem.zeroes([*c]const VertexInputBindingDivisorDescriptionKHR),
};
pub const PhysicalDeviceVertexAttributeDivisorFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_vertex_attribute_divisor_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    vertex_attribute_instance_rate_divisor: Bool32 = @import("std").mem.zeroes(Bool32),
    vertex_attribute_instance_rate_zero_divisor: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderFloatControls2FeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_float_controls2features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_float_controls2: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceIndexTypeUint8FeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_index_type_uint8features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    index_type_uint8: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const LineRasterizationModeKHR = enum(u32) {
    default_ext = 0,
    rectangular_ext = 1,
    bresenham_ext = 2,
    rectangular_smooth_ext = 3,
    pub const Self = @This();
    pub const default_khr = Self.default_ext;
    pub const rectangular_khr = Self.rectangular_ext;
    pub const bresenham_khr = Self.bresenham_ext;
    pub const rectangular_smooth_khr = Self.rectangular_smooth_ext;
};
pub const PhysicalDeviceLineRasterizationFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_line_rasterization_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    rectangular_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    bresenham_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    smooth_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    stippled_rectangular_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    stippled_bresenham_lines: Bool32 = @import("std").mem.zeroes(Bool32),
    stippled_smooth_lines: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceLineRasterizationPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_line_rasterization_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    line_sub_pixel_precision_bits: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineRasterizationLineStateCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.pipeline_rasterization_line_state_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    line_rasterization_mode: LineRasterizationModeKHR = @import("std").mem.zeroes(LineRasterizationModeKHR),
    stippled_line_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    line_stipple_factor: u32 = @import("std").mem.zeroes(u32),
    line_stipple_pattern: u16 = @import("std").mem.zeroes(u16),
};
pub const PFN_cmdSetLineStippleKHR = ?*const fn (CommandBuffer, u32, u16) callconv(.c) void;
pub extern fn cmdSetLineStippleKHR(command_buffer: CommandBuffer, line_stipple_factor: u32, line_stipple_pattern: u16) void;
pub const TimeDomainKHR = enum(u32) {
    device_ext = 0,
    clock_monotonic_ext = 1,
    clock_monotonic_raw_ext = 2,
    query_performance_counter_ext = 3,
    pub const Self = @This();
    pub const device_khr = Self.device_ext;
    pub const clock_monotonic_khr = Self.clock_monotonic_ext;
    pub const clock_monotonic_raw_khr = Self.clock_monotonic_raw_ext;
    pub const query_performance_counter_khr = Self.query_performance_counter_ext;
};
pub const CalibratedTimestampInfoKHR = extern struct {
    s_type: StructureType = StructureType.calibrated_timestamp_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    time_domain: TimeDomainKHR = @import("std").mem.zeroes(TimeDomainKHR),
};
pub const PFN_getPhysicalDeviceCalibrateableTimeDomainsKHR = ?*const fn (PhysicalDevice, [*c]u32, [*c]TimeDomainKHR) callconv(.c) Result;
pub const PFN_getCalibratedTimestampsKHR = ?*const fn (Device, u32, [*c]const CalibratedTimestampInfoKHR, [*c]u64, [*c]u64) callconv(.c) Result;
pub extern fn getPhysicalDeviceCalibrateableTimeDomainsKHR(physical_device: PhysicalDevice, p_time_domain_count: [*c]u32, p_time_domains: [*c]TimeDomainKHR) Result;
pub extern fn getCalibratedTimestampsKHR(device: Device, timestamp_count: u32, p_timestamp_infos: [*c]const CalibratedTimestampInfoKHR, p_timestamps: [*c]u64, p_max_deviation: [*c]u64) Result;
pub const PhysicalDeviceShaderExpectAssumeFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_expect_assume_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_expect_assume: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMaintenance6FeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_maintenance6features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    maintenance6: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMaintenance6PropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_maintenance6properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    block_texel_view_compatible_multiple_layers: Bool32 = @import("std").mem.zeroes(Bool32),
    max_combined_image_sampler_descriptor_count: u32 = @import("std").mem.zeroes(u32),
    fragment_shading_rate_clamp_combiner_inputs: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const BindMemoryStatusKHR = extern struct {
    s_type: StructureType = StructureType.bind_memory_status_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_result: [*c]Result = @import("std").mem.zeroes([*c]Result),
};
pub const BindDescriptorSetsInfoKHR = extern struct {
    s_type: StructureType = StructureType.bind_descriptor_sets_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    first_set: u32 = @import("std").mem.zeroes(u32),
    descriptor_set_count: u32 = @import("std").mem.zeroes(u32),
    p_descriptor_sets: [*c]const DescriptorSet = @import("std").mem.zeroes([*c]const DescriptorSet),
    dynamic_offset_count: u32 = @import("std").mem.zeroes(u32),
    p_dynamic_offsets: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const PushConstantsInfoKHR = extern struct {
    s_type: StructureType = StructureType.push_constants_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    offset: u32 = @import("std").mem.zeroes(u32),
    size: u32 = @import("std").mem.zeroes(u32),
    p_values: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const PushDescriptorSetInfoKHR = extern struct {
    s_type: StructureType = StructureType.push_descriptor_set_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    set: u32 = @import("std").mem.zeroes(u32),
    descriptor_write_count: u32 = @import("std").mem.zeroes(u32),
    p_descriptor_writes: [*c]const WriteDescriptorSet = @import("std").mem.zeroes([*c]const WriteDescriptorSet),
};
pub const PushDescriptorSetWithTemplateInfoKHR = extern struct {
    s_type: StructureType = StructureType.push_descriptor_set_with_template_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    descriptor_update_template: DescriptorUpdateTemplate = @import("std").mem.zeroes(DescriptorUpdateTemplate),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    set: u32 = @import("std").mem.zeroes(u32),
    p_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const SetDescriptorBufferOffsetsInfoEXT = extern struct {
    s_type: StructureType = StructureType.set_descriptor_buffer_offsets_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    first_set: u32 = @import("std").mem.zeroes(u32),
    set_count: u32 = @import("std").mem.zeroes(u32),
    p_buffer_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
    p_offsets: [*c]const DeviceSize = @import("std").mem.zeroes([*c]const DeviceSize),
};
pub const BindDescriptorBufferEmbeddedSamplersInfoEXT = extern struct {
    s_type: StructureType = StructureType.bind_descriptor_buffer_embedded_samplers_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    set: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdBindDescriptorSets2KHR = ?*const fn (CommandBuffer, [*c]const BindDescriptorSetsInfoKHR) callconv(.c) void;
pub const PFN_cmdPushConstants2KHR = ?*const fn (CommandBuffer, [*c]const PushConstantsInfoKHR) callconv(.c) void;
pub const PFN_cmdPushDescriptorSet2KHR = ?*const fn (CommandBuffer, [*c]const PushDescriptorSetInfoKHR) callconv(.c) void;
pub const PFN_cmdPushDescriptorSetWithTemplate2KHR = ?*const fn (CommandBuffer, [*c]const PushDescriptorSetWithTemplateInfoKHR) callconv(.c) void;
pub const PFN_cmdSetDescriptorBufferOffsets2EXT = ?*const fn (CommandBuffer, [*c]const SetDescriptorBufferOffsetsInfoEXT) callconv(.c) void;
pub const PFN_cmdBindDescriptorBufferEmbeddedSamplers2EXT = ?*const fn (CommandBuffer, [*c]const BindDescriptorBufferEmbeddedSamplersInfoEXT) callconv(.c) void;
pub extern fn cmdBindDescriptorSets2KHR(command_buffer: CommandBuffer, p_bind_descriptor_sets_info: [*c]const BindDescriptorSetsInfoKHR) void;
pub extern fn cmdPushConstants2KHR(command_buffer: CommandBuffer, p_push_constants_info: [*c]const PushConstantsInfoKHR) void;
pub extern fn cmdPushDescriptorSet2KHR(command_buffer: CommandBuffer, p_push_descriptor_set_info: [*c]const PushDescriptorSetInfoKHR) void;
pub extern fn cmdPushDescriptorSetWithTemplate2KHR(command_buffer: CommandBuffer, p_push_descriptor_set_with_template_info: [*c]const PushDescriptorSetWithTemplateInfoKHR) void;
pub extern fn cmdSetDescriptorBufferOffsets2EXT(command_buffer: CommandBuffer, p_set_descriptor_buffer_offsets_info: [*c]const SetDescriptorBufferOffsetsInfoEXT) void;
pub extern fn cmdBindDescriptorBufferEmbeddedSamplers2EXT(command_buffer: CommandBuffer, p_bind_descriptor_buffer_embedded_samplers_info: [*c]const BindDescriptorBufferEmbeddedSamplersInfoEXT) void;
pub const PhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_relaxed_extended_instruction_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_relaxed_extended_instruction: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceLayeredApiKHR = enum(u32) {
    vulkan_khr = 0,
    d3d12_khr = 1,
    metal_khr = 2,
    opengl_khr = 3,
    opengles_khr = 4,
};
pub const PhysicalDeviceMaintenance7FeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_maintenance7features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    maintenance7: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMaintenance7PropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_maintenance7properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    robust_fragment_shading_rate_attachment_access: Bool32 = @import("std").mem.zeroes(Bool32),
    separate_depth_stencil_attachment_access: Bool32 = @import("std").mem.zeroes(Bool32),
    max_descriptor_set_total_uniform_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_total_storage_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_total_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_total_uniform_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_total_storage_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_total_buffers_dynamic: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceLayeredApiPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_layered_api_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    vendor_id: u32 = @import("std").mem.zeroes(u32),
    device_id: u32 = @import("std").mem.zeroes(u32),
    layered_api: PhysicalDeviceLayeredApiKHR = @import("std").mem.zeroes(PhysicalDeviceLayeredApiKHR),
    device_name: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const PhysicalDeviceLayeredApiPropertiesListKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_layered_api_properties_list_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    layered_api_count: u32 = @import("std").mem.zeroes(u32),
    p_layered_apis: [*c]PhysicalDeviceLayeredApiPropertiesKHR = @import("std").mem.zeroes([*c]PhysicalDeviceLayeredApiPropertiesKHR),
};
pub const PhysicalDeviceLayeredApiVulkanPropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_layered_api_vulkan_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    properties: PhysicalDeviceProperties2 = @import("std").mem.zeroes(PhysicalDeviceProperties2),
};
pub const DebugReportCallbackEXT = enum(u64) { null = 0, _ };
pub const DebugReportObjectTypeEXT = enum(u32) {
    unknown_ext = 0,
    instance_ext = 1,
    physical_device_ext = 2,
    device_ext = 3,
    queue_ext = 4,
    semaphore_ext = 5,
    command_buffer_ext = 6,
    fence_ext = 7,
    device_memory_ext = 8,
    buffer_ext = 9,
    image_ext = 10,
    event_ext = 11,
    query_pool_ext = 12,
    buffer_view_ext = 13,
    image_view_ext = 14,
    shader_module_ext = 15,
    pipeline_cache_ext = 16,
    pipeline_layout_ext = 17,
    render_pass_ext = 18,
    pipeline_ext = 19,
    descriptor_set_layout_ext = 20,
    sampler_ext = 21,
    descriptor_pool_ext = 22,
    descriptor_set_ext = 23,
    framebuffer_ext = 24,
    command_pool_ext = 25,
    surface_khr_ext = 26,
    swapchain_khr_ext = 27,
    debug_report_callback_ext_ext = 28,
    display_khr_ext = 29,
    display_mode_khr_ext = 30,
    validation_cache_ext_ext = 33,
    cu_module_nvx_ext = 1000029000,
    cu_function_nvx_ext = 1000029001,
    descriptor_update_template_ext = 1000085000,
    acceleration_structure_khr_ext = 1000150000,
    sampler_ycbcr_conversion_ext = 1000156000,
    acceleration_structure_nv_ext = 1000165000,
    cuda_module_nv_ext = 1000307000,
    cuda_function_nv_ext = 1000307001,
    buffer_collection_fuchsia_ext = 1000366000,
    pub const Self = @This();
    pub const debug_report_ext = Self.debug_report_callback_ext_ext;
    pub const validation_cache_ext = Self.validation_cache_ext_ext;
    pub const descriptor_update_template_khr_ext = Self.descriptor_update_template_ext;
    pub const sampler_ycbcr_conversion_khr_ext = Self.sampler_ycbcr_conversion_ext;
};
pub const DebugReportFlagsEXT = enum(u32) {
    null = 0,
    information_bit_ext = 1,
    warning_bit_ext = 2,
    performance_warning_bit_ext = 4,
    error_bit_ext = 8,
    debug_bit_ext = 16,
};
pub const PFN_debugReportCallbackEXT = ?*const fn (DebugReportFlagsEXT, DebugReportObjectTypeEXT, u64, usize, i32, [*c]const u8, [*c]const u8, ?*anyopaque) callconv(.c) Bool32;
pub const DebugReportCallbackCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.debug_report_callback_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DebugReportFlagsEXT = @import("std").mem.zeroes(DebugReportFlagsEXT),
    pfn_callback: PFN_debugReportCallbackEXT = @import("std").mem.zeroes(PFN_debugReportCallbackEXT),
    p_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PFN_createDebugReportCallbackEXT = ?*const fn (Instance, [*c]const DebugReportCallbackCreateInfoEXT, [*c]const AllocationCallbacks, [*c]DebugReportCallbackEXT) callconv(.c) Result;
pub const PFN_destroyDebugReportCallbackEXT = ?*const fn (Instance, DebugReportCallbackEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_debugReportMessageEXT = ?*const fn (Instance, DebugReportFlagsEXT, DebugReportObjectTypeEXT, u64, usize, i32, [*c]const u8, [*c]const u8) callconv(.c) void;
pub extern fn createDebugReportCallbackEXT(instance: Instance, p_create_info: [*c]const DebugReportCallbackCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_callback: [*c]DebugReportCallbackEXT) Result;
pub extern fn destroyDebugReportCallbackEXT(instance: Instance, callback: DebugReportCallbackEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn debugReportMessageEXT(instance: Instance, flags: DebugReportFlagsEXT, object_type: DebugReportObjectTypeEXT, object: u64, location: usize, message_code: i32, p_layer_prefix: [*c]const u8, p_message: [*c]const u8) void;
pub const RasterizationOrderAMD = enum(u32) {
    strict_amd = 0,
    relaxed_amd = 1,
};
pub const PipelineRasterizationStateRasterizationOrderAMD = extern struct {
    s_type: StructureType = StructureType.pipeline_rasterization_state_rasterization_order_amd,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    rasterization_order: RasterizationOrderAMD = @import("std").mem.zeroes(RasterizationOrderAMD),
};
pub const DebugMarkerObjectNameInfoEXT = extern struct {
    s_type: StructureType = StructureType.debug_marker_object_name_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    object_type: DebugReportObjectTypeEXT = @import("std").mem.zeroes(DebugReportObjectTypeEXT),
    object: u64 = @import("std").mem.zeroes(u64),
    p_object_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const DebugMarkerObjectTagInfoEXT = extern struct {
    s_type: StructureType = StructureType.debug_marker_object_tag_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    object_type: DebugReportObjectTypeEXT = @import("std").mem.zeroes(DebugReportObjectTypeEXT),
    object: u64 = @import("std").mem.zeroes(u64),
    tag_name: u64 = @import("std").mem.zeroes(u64),
    tag_size: usize = @import("std").mem.zeroes(usize),
    p_tag: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const DebugMarkerMarkerInfoEXT = extern struct {
    s_type: StructureType = StructureType.debug_marker_marker_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_marker_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    color: [4]f32 = @import("std").mem.zeroes([4]f32),
};
pub const PFN_debugMarkerSetObjectTagEXT = ?*const fn (Device, [*c]const DebugMarkerObjectTagInfoEXT) callconv(.c) Result;
pub const PFN_debugMarkerSetObjectNameEXT = ?*const fn (Device, [*c]const DebugMarkerObjectNameInfoEXT) callconv(.c) Result;
pub const PFN_cmdDebugMarkerBeginEXT = ?*const fn (CommandBuffer, [*c]const DebugMarkerMarkerInfoEXT) callconv(.c) void;
pub const PFN_cmdDebugMarkerEndEXT = ?*const fn (CommandBuffer) callconv(.c) void;
pub const PFN_cmdDebugMarkerInsertEXT = ?*const fn (CommandBuffer, [*c]const DebugMarkerMarkerInfoEXT) callconv(.c) void;
pub extern fn debugMarkerSetObjectTagEXT(device: Device, p_tag_info: [*c]const DebugMarkerObjectTagInfoEXT) Result;
pub extern fn debugMarkerSetObjectNameEXT(device: Device, p_name_info: [*c]const DebugMarkerObjectNameInfoEXT) Result;
pub extern fn cmdDebugMarkerBeginEXT(command_buffer: CommandBuffer, p_marker_info: [*c]const DebugMarkerMarkerInfoEXT) void;
pub extern fn cmdDebugMarkerEndEXT(command_buffer: CommandBuffer) void;
pub extern fn cmdDebugMarkerInsertEXT(command_buffer: CommandBuffer, p_marker_info: [*c]const DebugMarkerMarkerInfoEXT) void;
pub const DedicatedAllocationImageCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.dedicated_allocation_image_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    dedicated_allocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DedicatedAllocationBufferCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.dedicated_allocation_buffer_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    dedicated_allocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DedicatedAllocationMemoryAllocateInfoNV = extern struct {
    s_type: StructureType = StructureType.dedicated_allocation_memory_allocate_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
};
pub const PipelineRasterizationStateStreamCreateFlagsEXT = Flags;
pub const PhysicalDeviceTransformFeedbackFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_transform_feedback_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    transform_feedback: Bool32 = @import("std").mem.zeroes(Bool32),
    geometry_streams: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceTransformFeedbackPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_transform_feedback_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_transform_feedback_streams: u32 = @import("std").mem.zeroes(u32),
    max_transform_feedback_buffers: u32 = @import("std").mem.zeroes(u32),
    max_transform_feedback_buffer_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    max_transform_feedback_stream_data_size: u32 = @import("std").mem.zeroes(u32),
    max_transform_feedback_buffer_data_size: u32 = @import("std").mem.zeroes(u32),
    max_transform_feedback_buffer_data_stride: u32 = @import("std").mem.zeroes(u32),
    transform_feedback_queries: Bool32 = @import("std").mem.zeroes(Bool32),
    transform_feedback_streams_lines_triangles: Bool32 = @import("std").mem.zeroes(Bool32),
    transform_feedback_rasterization_stream_select: Bool32 = @import("std").mem.zeroes(Bool32),
    transform_feedback_draw: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineRasterizationStateStreamCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.pipeline_rasterization_state_stream_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineRasterizationStateStreamCreateFlagsEXT = @import("std").mem.zeroes(PipelineRasterizationStateStreamCreateFlagsEXT),
    rasterization_stream: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdBindTransformFeedbackBuffersEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const Buffer, [*c]const DeviceSize, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdBeginTransformFeedbackEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const Buffer, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdEndTransformFeedbackEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const Buffer, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdBeginQueryIndexedEXT = ?*const fn (CommandBuffer, QueryPool, u32, QueryControlFlags, u32) callconv(.c) void;
pub const PFN_cmdEndQueryIndexedEXT = ?*const fn (CommandBuffer, QueryPool, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndirectByteCountEXT = ?*const fn (CommandBuffer, u32, u32, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub extern fn cmdBindTransformFeedbackBuffersEXT(command_buffer: CommandBuffer, first_binding: u32, binding_count: u32, p_buffers: [*c]const Buffer, p_offsets: [*c]const DeviceSize, p_sizes: [*c]const DeviceSize) void;
pub extern fn cmdBeginTransformFeedbackEXT(command_buffer: CommandBuffer, first_counter_buffer: u32, counter_buffer_count: u32, p_counter_buffers: [*c]const Buffer, p_counter_buffer_offsets: [*c]const DeviceSize) void;
pub extern fn cmdEndTransformFeedbackEXT(command_buffer: CommandBuffer, first_counter_buffer: u32, counter_buffer_count: u32, p_counter_buffers: [*c]const Buffer, p_counter_buffer_offsets: [*c]const DeviceSize) void;
pub extern fn cmdBeginQueryIndexedEXT(command_buffer: CommandBuffer, query_pool: QueryPool, query: u32, flags: QueryControlFlags, index: u32) void;
pub extern fn cmdEndQueryIndexedEXT(command_buffer: CommandBuffer, query_pool: QueryPool, query: u32, index: u32) void;
pub extern fn cmdDrawIndirectByteCountEXT(command_buffer: CommandBuffer, instance_count: u32, first_instance: u32, counter_buffer: Buffer, counter_buffer_offset: DeviceSize, counter_offset: u32, vertex_stride: u32) void;
pub const CuModuleNVX = enum(u64) { null = 0, _ };
pub const CuFunctionNVX = enum(u64) { null = 0, _ };
pub const CuModuleCreateInfoNVX = extern struct {
    s_type: StructureType = StructureType.cu_module_create_info_nvx,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    data_size: usize = @import("std").mem.zeroes(usize),
    p_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const CuFunctionCreateInfoNVX = extern struct {
    s_type: StructureType = StructureType.cu_function_create_info_nvx,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    module: CuModuleNVX = @import("std").mem.zeroes(CuModuleNVX),
    p_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const CuLaunchInfoNVX = extern struct {
    s_type: StructureType = StructureType.cu_launch_info_nvx,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    function: CuFunctionNVX = @import("std").mem.zeroes(CuFunctionNVX),
    grid_dim_x: u32 = @import("std").mem.zeroes(u32),
    grid_dim_y: u32 = @import("std").mem.zeroes(u32),
    grid_dim_z: u32 = @import("std").mem.zeroes(u32),
    block_dim_x: u32 = @import("std").mem.zeroes(u32),
    block_dim_y: u32 = @import("std").mem.zeroes(u32),
    block_dim_z: u32 = @import("std").mem.zeroes(u32),
    shared_mem_bytes: u32 = @import("std").mem.zeroes(u32),
    param_count: usize = @import("std").mem.zeroes(usize),
    p_params: [*c]const ?*const anyopaque = @import("std").mem.zeroes([*c]const ?*const anyopaque),
    extra_count: usize = @import("std").mem.zeroes(usize),
    p_extras: [*c]const ?*const anyopaque = @import("std").mem.zeroes([*c]const ?*const anyopaque),
};
pub const PFN_createCuModuleNVX = ?*const fn (Device, [*c]const CuModuleCreateInfoNVX, [*c]const AllocationCallbacks, [*c]CuModuleNVX) callconv(.c) Result;
pub const PFN_createCuFunctionNVX = ?*const fn (Device, [*c]const CuFunctionCreateInfoNVX, [*c]const AllocationCallbacks, [*c]CuFunctionNVX) callconv(.c) Result;
pub const PFN_destroyCuModuleNVX = ?*const fn (Device, CuModuleNVX, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_destroyCuFunctionNVX = ?*const fn (Device, CuFunctionNVX, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_cmdCuLaunchKernelNVX = ?*const fn (CommandBuffer, [*c]const CuLaunchInfoNVX) callconv(.c) void;
pub extern fn createCuModuleNVX(device: Device, p_create_info: [*c]const CuModuleCreateInfoNVX, p_allocator: [*c]const AllocationCallbacks, p_module: [*c]CuModuleNVX) Result;
pub extern fn createCuFunctionNVX(device: Device, p_create_info: [*c]const CuFunctionCreateInfoNVX, p_allocator: [*c]const AllocationCallbacks, p_function: [*c]CuFunctionNVX) Result;
pub extern fn destroyCuModuleNVX(device: Device, module: CuModuleNVX, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn destroyCuFunctionNVX(device: Device, function: CuFunctionNVX, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn cmdCuLaunchKernelNVX(command_buffer: CommandBuffer, p_launch_info: [*c]const CuLaunchInfoNVX) void;
pub const ImageViewHandleInfoNVX = extern struct {
    s_type: StructureType = StructureType.image_view_handle_info_nvx,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image_view: ImageView = @import("std").mem.zeroes(ImageView),
    descriptor_type: DescriptorType = @import("std").mem.zeroes(DescriptorType),
    sampler: Sampler = @import("std").mem.zeroes(Sampler),
};
pub const ImageViewAddressPropertiesNVX = extern struct {
    s_type: StructureType = StructureType.image_view_address_properties_nvx,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PFN_getImageViewHandleNVX = ?*const fn (Device, [*c]const ImageViewHandleInfoNVX) callconv(.c) u32;
pub const PFN_getImageViewAddressNVX = ?*const fn (Device, ImageView, [*c]ImageViewAddressPropertiesNVX) callconv(.c) Result;
pub extern fn getImageViewHandleNVX(device: Device, p_info: [*c]const ImageViewHandleInfoNVX) u32;
pub extern fn getImageViewAddressNVX(device: Device, image_view: ImageView, p_properties: [*c]ImageViewAddressPropertiesNVX) Result;
pub const PFN_cmdDrawIndirectCountAMD = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawIndexedIndirectCountAMD = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub extern fn cmdDrawIndirectCountAMD(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_buffer_offset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub extern fn cmdDrawIndexedIndirectCountAMD(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_buffer_offset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub const TextureLODGatherFormatPropertiesAMD = extern struct {
    s_type: StructureType = StructureType.texture_lodgather_format_properties_amd,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supports_texture_gather_lodbias_amd: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ShaderInfoTypeAMD = enum(u32) {
    statistics_amd = 0,
    binary_amd = 1,
    disassembly_amd = 2,
};
pub const ShaderResourceUsageAMD = extern struct {
    num_used_vgprs: u32 = @import("std").mem.zeroes(u32),
    num_used_sgprs: u32 = @import("std").mem.zeroes(u32),
    lds_size_per_local_work_group: u32 = @import("std").mem.zeroes(u32),
    lds_usage_size_in_bytes: usize = @import("std").mem.zeroes(usize),
    scratch_mem_usage_in_bytes: usize = @import("std").mem.zeroes(usize),
};
pub const ShaderStatisticsInfoAMD = extern struct {
    shader_stage_mask: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    resource_usage: ShaderResourceUsageAMD = @import("std").mem.zeroes(ShaderResourceUsageAMD),
    num_physical_vgprs: u32 = @import("std").mem.zeroes(u32),
    num_physical_sgprs: u32 = @import("std").mem.zeroes(u32),
    num_available_vgprs: u32 = @import("std").mem.zeroes(u32),
    num_available_sgprs: u32 = @import("std").mem.zeroes(u32),
    compute_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
};
pub const PFN_getShaderInfoAMD = ?*const fn (Device, Pipeline, ShaderStageFlags, ShaderInfoTypeAMD, [*c]usize, ?*anyopaque) callconv(.c) Result;
pub extern fn getShaderInfoAMD(device: Device, pipeline: Pipeline, shader_stage: ShaderStageFlags, info_type: ShaderInfoTypeAMD, p_info_size: [*c]usize, p_info: ?*anyopaque) Result;
pub const PhysicalDeviceCornerSampledImageFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_corner_sampled_image_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    corner_sampled_image: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ExternalMemoryHandleTypeFlagsNV = enum(u32) {
    null = 0,
    opaque_win32_bit_nv = 1,
    opaque_win32_kmt_bit_nv = 2,
    d3d11_image_bit_nv = 4,
    d3d11_image_kmt_bit_nv = 8,
};
pub const ExternalMemoryFeatureFlagsNV = enum(u32) {
    null = 0,
    dedicated_only_bit_nv = 1,
    exportable_bit_nv = 2,
    importable_bit_nv = 4,
};
pub const ExternalImageFormatPropertiesNV = extern struct {
    image_format_properties: ImageFormatProperties = @import("std").mem.zeroes(ImageFormatProperties),
    external_memory_features: ExternalMemoryFeatureFlagsNV = @import("std").mem.zeroes(ExternalMemoryFeatureFlagsNV),
    export_from_imported_handle_types: ExternalMemoryHandleTypeFlagsNV = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagsNV),
    compatible_handle_types: ExternalMemoryHandleTypeFlagsNV = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagsNV),
};
pub const PFN_getPhysicalDeviceExternalImageFormatPropertiesNV = ?*const fn (PhysicalDevice, Format, ImageType, ImageTiling, ImageUsageFlags, ImageCreateFlags, ExternalMemoryHandleTypeFlagsNV, [*c]ExternalImageFormatPropertiesNV) callconv(.c) Result;
pub extern fn getPhysicalDeviceExternalImageFormatPropertiesNV(physical_device: PhysicalDevice, format: Format, @"type": ImageType, tiling: ImageTiling, usage: ImageUsageFlags, flags: ImageCreateFlags, external_handle_type: ExternalMemoryHandleTypeFlagsNV, p_external_image_format_properties: [*c]ExternalImageFormatPropertiesNV) Result;
pub const ExternalMemoryImageCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.external_memory_image_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalMemoryHandleTypeFlagsNV = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagsNV),
};
pub const ExportMemoryAllocateInfoNV = extern struct {
    s_type: StructureType = StructureType.export_memory_allocate_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_types: ExternalMemoryHandleTypeFlagsNV = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlagsNV),
};
pub const ValidationCheckEXT = enum(u32) {
    all_ext = 0,
    shaders_ext = 1,
};
pub const ValidationFlagsEXT = extern struct {
    s_type: StructureType = StructureType.validation_flags_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    disabled_validation_check_count: u32 = @import("std").mem.zeroes(u32),
    p_disabled_validation_checks: [*c]const ValidationCheckEXT = @import("std").mem.zeroes([*c]const ValidationCheckEXT),
};
pub const PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT = PhysicalDeviceTextureCompressionASTCHDRFeatures;
pub const ImageViewASTCDecodeModeEXT = extern struct {
    s_type: StructureType = StructureType.image_view_astcdecode_mode_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    decode_mode: Format = @import("std").mem.zeroes(Format),
};
pub const PhysicalDeviceASTCDecodeFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_astcdecode_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    decode_mode_shared_exponent: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineRobustnessBufferBehaviorEXT = enum(u32) {
    device_default_ext = 0,
    disabled_ext = 1,
    robust_buffer_access_ext = 2,
    robust_buffer_access_2_ext = 3,
};
pub const PipelineRobustnessImageBehaviorEXT = enum(u32) {
    device_default_ext = 0,
    disabled_ext = 1,
    robust_image_access_ext = 2,
    robust_image_access_2_ext = 3,
};
pub const PhysicalDevicePipelineRobustnessFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_pipeline_robustness_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_robustness: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePipelineRobustnessPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_pipeline_robustness_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    default_robustness_storage_buffers: PipelineRobustnessBufferBehaviorEXT = @import("std").mem.zeroes(PipelineRobustnessBufferBehaviorEXT),
    default_robustness_uniform_buffers: PipelineRobustnessBufferBehaviorEXT = @import("std").mem.zeroes(PipelineRobustnessBufferBehaviorEXT),
    default_robustness_vertex_inputs: PipelineRobustnessBufferBehaviorEXT = @import("std").mem.zeroes(PipelineRobustnessBufferBehaviorEXT),
    default_robustness_images: PipelineRobustnessImageBehaviorEXT = @import("std").mem.zeroes(PipelineRobustnessImageBehaviorEXT),
};
pub const PipelineRobustnessCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.pipeline_robustness_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    storage_buffers: PipelineRobustnessBufferBehaviorEXT = @import("std").mem.zeroes(PipelineRobustnessBufferBehaviorEXT),
    uniform_buffers: PipelineRobustnessBufferBehaviorEXT = @import("std").mem.zeroes(PipelineRobustnessBufferBehaviorEXT),
    vertex_inputs: PipelineRobustnessBufferBehaviorEXT = @import("std").mem.zeroes(PipelineRobustnessBufferBehaviorEXT),
    images: PipelineRobustnessImageBehaviorEXT = @import("std").mem.zeroes(PipelineRobustnessImageBehaviorEXT),
};
pub const ConditionalRenderingFlagsEXT = enum(u32) {
    null = 0,
    inverted_bit_ext = 1,
};
pub const ConditionalRenderingBeginInfoEXT = extern struct {
    s_type: StructureType = StructureType.conditional_rendering_begin_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    flags: ConditionalRenderingFlagsEXT = @import("std").mem.zeroes(ConditionalRenderingFlagsEXT),
};
pub const PhysicalDeviceConditionalRenderingFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_conditional_rendering_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    conditional_rendering: Bool32 = @import("std").mem.zeroes(Bool32),
    inherited_conditional_rendering: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const CommandBufferInheritanceConditionalRenderingInfoEXT = extern struct {
    s_type: StructureType = StructureType.command_buffer_inheritance_conditional_rendering_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    conditional_rendering_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdBeginConditionalRenderingEXT = ?*const fn (CommandBuffer, [*c]const ConditionalRenderingBeginInfoEXT) callconv(.c) void;
pub const PFN_cmdEndConditionalRenderingEXT = ?*const fn (CommandBuffer) callconv(.c) void;
pub extern fn cmdBeginConditionalRenderingEXT(command_buffer: CommandBuffer, p_conditional_rendering_begin: [*c]const ConditionalRenderingBeginInfoEXT) void;
pub extern fn cmdEndConditionalRenderingEXT(command_buffer: CommandBuffer) void;
pub const ViewportWScalingNV = extern struct {
    xcoeff: f32 = @import("std").mem.zeroes(f32),
    ycoeff: f32 = @import("std").mem.zeroes(f32),
};
pub const PipelineViewportWScalingStateCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.pipeline_viewport_wscaling_state_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    viewport_wscaling_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    viewport_count: u32 = @import("std").mem.zeroes(u32),
    p_viewport_wscalings: [*c]const ViewportWScalingNV = @import("std").mem.zeroes([*c]const ViewportWScalingNV),
};
pub const PFN_cmdSetViewportWScalingNV = ?*const fn (CommandBuffer, u32, u32, [*c]const ViewportWScalingNV) callconv(.c) void;
pub extern fn cmdSetViewportWScalingNV(command_buffer: CommandBuffer, first_viewport: u32, viewport_count: u32, p_viewport_wscalings: [*c]const ViewportWScalingNV) void;
pub const PFN_releaseDisplayEXT = ?*const fn (PhysicalDevice, DisplayKHR) callconv(.c) Result;
pub extern fn releaseDisplayEXT(physical_device: PhysicalDevice, display: DisplayKHR) Result;
pub const SurfaceCounterFlagsEXT = enum(u32) {
    null = 0,
    vblank_ext = 1,
    pub const Self = @This();
    pub const vblank_bit_ext = Self.vblank_ext;
};
pub const SurfaceCapabilities2EXT = extern struct {
    s_type: StructureType = StructureType.surface_capabilities2ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_image_count: u32 = @import("std").mem.zeroes(u32),
    max_image_count: u32 = @import("std").mem.zeroes(u32),
    current_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    min_image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_image_array_layers: u32 = @import("std").mem.zeroes(u32),
    supported_transforms: SurfaceTransformFlagsKHR = @import("std").mem.zeroes(SurfaceTransformFlagsKHR),
    current_transform: SurfaceTransformFlagsKHR = @import("std").mem.zeroes(SurfaceTransformFlagsKHR),
    supported_composite_alpha: CompositeAlphaFlagsKHR = @import("std").mem.zeroes(CompositeAlphaFlagsKHR),
    supported_usage_flags: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    supported_surface_counters: SurfaceCounterFlagsEXT = @import("std").mem.zeroes(SurfaceCounterFlagsEXT),
};
pub const PFN_getPhysicalDeviceSurfaceCapabilities2EXT = ?*const fn (PhysicalDevice, SurfaceKHR, [*c]SurfaceCapabilities2EXT) callconv(.c) Result;
pub extern fn getPhysicalDeviceSurfaceCapabilities2EXT(physical_device: PhysicalDevice, surface: SurfaceKHR, p_surface_capabilities: [*c]SurfaceCapabilities2EXT) Result;
pub const DisplayPowerStateEXT = enum(u32) {
    off_ext = 0,
    suspend_ext = 1,
    on_ext = 2,
};
pub const DeviceEventTypeEXT = enum(u32) {
    display_hotplug_ext = 0,
};
pub const DisplayEventTypeEXT = enum(u32) {
    first_pixel_out_ext = 0,
};
pub const DisplayPowerInfoEXT = extern struct {
    s_type: StructureType = StructureType.display_power_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    power_state: DisplayPowerStateEXT = @import("std").mem.zeroes(DisplayPowerStateEXT),
};
pub const DeviceEventInfoEXT = extern struct {
    s_type: StructureType = StructureType.device_event_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_event: DeviceEventTypeEXT = @import("std").mem.zeroes(DeviceEventTypeEXT),
};
pub const DisplayEventInfoEXT = extern struct {
    s_type: StructureType = StructureType.display_event_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    display_event: DisplayEventTypeEXT = @import("std").mem.zeroes(DisplayEventTypeEXT),
};
pub const SwapchainCounterCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.swapchain_counter_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    surface_counters: SurfaceCounterFlagsEXT = @import("std").mem.zeroes(SurfaceCounterFlagsEXT),
};
pub const PFN_displayPowerControlEXT = ?*const fn (Device, DisplayKHR, [*c]const DisplayPowerInfoEXT) callconv(.c) Result;
pub const PFN_registerDeviceEventEXT = ?*const fn (Device, [*c]const DeviceEventInfoEXT, [*c]const AllocationCallbacks, [*c]Fence) callconv(.c) Result;
pub const PFN_registerDisplayEventEXT = ?*const fn (Device, DisplayKHR, [*c]const DisplayEventInfoEXT, [*c]const AllocationCallbacks, [*c]Fence) callconv(.c) Result;
pub const PFN_getSwapchainCounterEXT = ?*const fn (Device, SwapchainKHR, SurfaceCounterFlagsEXT, [*c]u64) callconv(.c) Result;
pub extern fn displayPowerControlEXT(device: Device, display: DisplayKHR, p_display_power_info: [*c]const DisplayPowerInfoEXT) Result;
pub extern fn registerDeviceEventEXT(device: Device, p_device_event_info: [*c]const DeviceEventInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_fence: [*c]Fence) Result;
pub extern fn registerDisplayEventEXT(device: Device, display: DisplayKHR, p_display_event_info: [*c]const DisplayEventInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_fence: [*c]Fence) Result;
pub extern fn getSwapchainCounterEXT(device: Device, swapchain: SwapchainKHR, counter: SurfaceCounterFlagsEXT, p_counter_value: [*c]u64) Result;
pub const RefreshCycleDurationGOOGLE = extern struct {
    refresh_duration: u64 = @import("std").mem.zeroes(u64),
};
pub const PastPresentationTimingGOOGLE = extern struct {
    present_id: u32 = @import("std").mem.zeroes(u32),
    desired_present_time: u64 = @import("std").mem.zeroes(u64),
    actual_present_time: u64 = @import("std").mem.zeroes(u64),
    earliest_present_time: u64 = @import("std").mem.zeroes(u64),
    present_margin: u64 = @import("std").mem.zeroes(u64),
};
pub const PresentTimeGOOGLE = extern struct {
    present_id: u32 = @import("std").mem.zeroes(u32),
    desired_present_time: u64 = @import("std").mem.zeroes(u64),
};
pub const PresentTimesInfoGOOGLE = extern struct {
    s_type: StructureType = StructureType.present_times_info_google,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_times: [*c]const PresentTimeGOOGLE = @import("std").mem.zeroes([*c]const PresentTimeGOOGLE),
};
pub const PFN_getRefreshCycleDurationGOOGLE = ?*const fn (Device, SwapchainKHR, [*c]RefreshCycleDurationGOOGLE) callconv(.c) Result;
pub const PFN_getPastPresentationTimingGOOGLE = ?*const fn (Device, SwapchainKHR, [*c]u32, [*c]PastPresentationTimingGOOGLE) callconv(.c) Result;
pub extern fn getRefreshCycleDurationGOOGLE(device: Device, swapchain: SwapchainKHR, p_display_timing_properties: [*c]RefreshCycleDurationGOOGLE) Result;
pub extern fn getPastPresentationTimingGOOGLE(device: Device, swapchain: SwapchainKHR, p_presentation_timing_count: [*c]u32, p_presentation_timings: [*c]PastPresentationTimingGOOGLE) Result;
pub const PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX = extern struct {
    s_type: StructureType = StructureType.physical_device_multiview_per_view_attributes_properties_nvx,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    per_view_position_all_components: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ViewportCoordinateSwizzleNV = enum(u32) {
    positive_x_nv = 0,
    negative_x_nv = 1,
    positive_y_nv = 2,
    negative_y_nv = 3,
    positive_z_nv = 4,
    negative_z_nv = 5,
    positive_w_nv = 6,
    negative_w_nv = 7,
};
pub const PipelineViewportSwizzleStateCreateFlagsNV = Flags;
pub const ViewportSwizzleNV = extern struct {
    x: ViewportCoordinateSwizzleNV = @import("std").mem.zeroes(ViewportCoordinateSwizzleNV),
    y: ViewportCoordinateSwizzleNV = @import("std").mem.zeroes(ViewportCoordinateSwizzleNV),
    z: ViewportCoordinateSwizzleNV = @import("std").mem.zeroes(ViewportCoordinateSwizzleNV),
    w: ViewportCoordinateSwizzleNV = @import("std").mem.zeroes(ViewportCoordinateSwizzleNV),
};
pub const PipelineViewportSwizzleStateCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.pipeline_viewport_swizzle_state_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineViewportSwizzleStateCreateFlagsNV = @import("std").mem.zeroes(PipelineViewportSwizzleStateCreateFlagsNV),
    viewport_count: u32 = @import("std").mem.zeroes(u32),
    p_viewport_swizzles: [*c]const ViewportSwizzleNV = @import("std").mem.zeroes([*c]const ViewportSwizzleNV),
};
pub const DiscardRectangleModeEXT = enum(u32) {
    inclusive_ext = 0,
    exclusive_ext = 1,
};
pub const PipelineDiscardRectangleStateCreateFlagsEXT = Flags;
pub const PhysicalDeviceDiscardRectanglePropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_discard_rectangle_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_discard_rectangles: u32 = @import("std").mem.zeroes(u32),
};
pub const PipelineDiscardRectangleStateCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.pipeline_discard_rectangle_state_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineDiscardRectangleStateCreateFlagsEXT = @import("std").mem.zeroes(PipelineDiscardRectangleStateCreateFlagsEXT),
    discard_rectangle_mode: DiscardRectangleModeEXT = @import("std").mem.zeroes(DiscardRectangleModeEXT),
    discard_rectangle_count: u32 = @import("std").mem.zeroes(u32),
    p_discard_rectangles: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const PFN_cmdSetDiscardRectangleEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const Rect2D) callconv(.c) void;
pub const PFN_cmdSetDiscardRectangleEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDiscardRectangleModeEXT = ?*const fn (CommandBuffer, DiscardRectangleModeEXT) callconv(.c) void;
pub extern fn cmdSetDiscardRectangleEXT(command_buffer: CommandBuffer, first_discard_rectangle: u32, discard_rectangle_count: u32, p_discard_rectangles: [*c]const Rect2D) void;
pub extern fn cmdSetDiscardRectangleEnableEXT(command_buffer: CommandBuffer, discard_rectangle_enable: Bool32) void;
pub extern fn cmdSetDiscardRectangleModeEXT(command_buffer: CommandBuffer, discard_rectangle_mode: DiscardRectangleModeEXT) void;
pub const ConservativeRasterizationModeEXT = enum(u32) {
    disabled_ext = 0,
    overestimate_ext = 1,
    underestimate_ext = 2,
};
pub const PipelineRasterizationConservativeStateCreateFlagsEXT = Flags;
pub const PhysicalDeviceConservativeRasterizationPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_conservative_rasterization_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    primitive_overestimation_size: f32 = @import("std").mem.zeroes(f32),
    max_extra_primitive_overestimation_size: f32 = @import("std").mem.zeroes(f32),
    extra_primitive_overestimation_size_granularity: f32 = @import("std").mem.zeroes(f32),
    primitive_underestimation: Bool32 = @import("std").mem.zeroes(Bool32),
    conservative_point_and_line_rasterization: Bool32 = @import("std").mem.zeroes(Bool32),
    degenerate_triangles_rasterized: Bool32 = @import("std").mem.zeroes(Bool32),
    degenerate_lines_rasterized: Bool32 = @import("std").mem.zeroes(Bool32),
    fully_covered_fragment_shader_input_variable: Bool32 = @import("std").mem.zeroes(Bool32),
    conservative_rasterization_post_depth_coverage: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineRasterizationConservativeStateCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.pipeline_rasterization_conservative_state_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineRasterizationConservativeStateCreateFlagsEXT = @import("std").mem.zeroes(PipelineRasterizationConservativeStateCreateFlagsEXT),
    conservative_rasterization_mode: ConservativeRasterizationModeEXT = @import("std").mem.zeroes(ConservativeRasterizationModeEXT),
    extra_primitive_overestimation_size: f32 = @import("std").mem.zeroes(f32),
};
pub const PipelineRasterizationDepthClipStateCreateFlagsEXT = Flags;
pub const PhysicalDeviceDepthClipEnableFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_depth_clip_enable_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    depth_clip_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineRasterizationDepthClipStateCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.pipeline_rasterization_depth_clip_state_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineRasterizationDepthClipStateCreateFlagsEXT = @import("std").mem.zeroes(PipelineRasterizationDepthClipStateCreateFlagsEXT),
    depth_clip_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const XYColorEXT = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
};
pub const HdrMetadataEXT = extern struct {
    s_type: StructureType = StructureType.hdr_metadata_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    display_primary_red: XYColorEXT = @import("std").mem.zeroes(XYColorEXT),
    display_primary_green: XYColorEXT = @import("std").mem.zeroes(XYColorEXT),
    display_primary_blue: XYColorEXT = @import("std").mem.zeroes(XYColorEXT),
    white_point: XYColorEXT = @import("std").mem.zeroes(XYColorEXT),
    max_luminance: f32 = @import("std").mem.zeroes(f32),
    min_luminance: f32 = @import("std").mem.zeroes(f32),
    max_content_light_level: f32 = @import("std").mem.zeroes(f32),
    max_frame_average_light_level: f32 = @import("std").mem.zeroes(f32),
};
pub const PFN_setHdrMetadataEXT = ?*const fn (Device, u32, [*c]const SwapchainKHR, [*c]const HdrMetadataEXT) callconv(.c) void;
pub extern fn setHdrMetadataEXT(device: Device, swapchain_count: u32, p_swapchains: [*c]const SwapchainKHR, p_metadata: [*c]const HdrMetadataEXT) void;
pub const PhysicalDeviceRelaxedLineRasterizationFeaturesIMG = extern struct {
    s_type: StructureType = StructureType.physical_device_relaxed_line_rasterization_features_img,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    relaxed_line_rasterization: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DebugUtilsMessengerEXT = enum(u64) { null = 0, _ };
pub const DebugUtilsMessengerCallbackDataFlagsEXT = Flags;
pub const DebugUtilsMessageSeverityFlagsEXT = enum(u32) {
    null = 0,
    verbose_bit_ext = 1,
    info_bit_ext = 16,
    warning_bit_ext = 256,
    error_bit_ext = 4096,
};
pub const DebugUtilsMessageTypeFlagsEXT = enum(u32) {
    null = 0,
    general_bit_ext = 1,
    validation_bit_ext = 2,
    performance_bit_ext = 4,
    device_address_binding_bit_ext = 8,
};
pub const DebugUtilsMessengerCreateFlagsEXT = Flags;
pub const DebugUtilsLabelEXT = extern struct {
    s_type: StructureType = StructureType.debug_utils_label_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_label_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    color: [4]f32 = @import("std").mem.zeroes([4]f32),
};
pub const DebugUtilsObjectNameInfoEXT = extern struct {
    s_type: StructureType = StructureType.debug_utils_object_name_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    object_type: ObjectType = @import("std").mem.zeroes(ObjectType),
    object_handle: u64 = @import("std").mem.zeroes(u64),
    p_object_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const DebugUtilsMessengerCallbackDataEXT = extern struct {
    s_type: StructureType = StructureType.debug_utils_messenger_callback_data_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DebugUtilsMessengerCallbackDataFlagsEXT = @import("std").mem.zeroes(DebugUtilsMessengerCallbackDataFlagsEXT),
    p_message_id_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    message_id_number: i32 = @import("std").mem.zeroes(i32),
    p_message: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    queue_label_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_labels: [*c]const DebugUtilsLabelEXT = @import("std").mem.zeroes([*c]const DebugUtilsLabelEXT),
    cmd_buf_label_count: u32 = @import("std").mem.zeroes(u32),
    p_cmd_buf_labels: [*c]const DebugUtilsLabelEXT = @import("std").mem.zeroes([*c]const DebugUtilsLabelEXT),
    object_count: u32 = @import("std").mem.zeroes(u32),
    p_objects: [*c]const DebugUtilsObjectNameInfoEXT = @import("std").mem.zeroes([*c]const DebugUtilsObjectNameInfoEXT),
};
pub const PFN_debugUtilsMessengerCallbackEXT = ?*const fn (DebugUtilsMessageSeverityFlagsEXT, DebugUtilsMessageTypeFlagsEXT, [*c]const DebugUtilsMessengerCallbackDataEXT, ?*anyopaque) callconv(.c) Bool32;
pub const DebugUtilsMessengerCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.debug_utils_messenger_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DebugUtilsMessengerCreateFlagsEXT = @import("std").mem.zeroes(DebugUtilsMessengerCreateFlagsEXT),
    message_severity: DebugUtilsMessageSeverityFlagsEXT = @import("std").mem.zeroes(DebugUtilsMessageSeverityFlagsEXT),
    message_type: DebugUtilsMessageTypeFlagsEXT = @import("std").mem.zeroes(DebugUtilsMessageTypeFlagsEXT),
    pfn_user_callback: PFN_debugUtilsMessengerCallbackEXT = @import("std").mem.zeroes(PFN_debugUtilsMessengerCallbackEXT),
    p_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const DebugUtilsObjectTagInfoEXT = extern struct {
    s_type: StructureType = StructureType.debug_utils_object_tag_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    object_type: ObjectType = @import("std").mem.zeroes(ObjectType),
    object_handle: u64 = @import("std").mem.zeroes(u64),
    tag_name: u64 = @import("std").mem.zeroes(u64),
    tag_size: usize = @import("std").mem.zeroes(usize),
    p_tag: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const PFN_setDebugUtilsObjectNameEXT = ?*const fn (Device, [*c]const DebugUtilsObjectNameInfoEXT) callconv(.c) Result;
pub const PFN_setDebugUtilsObjectTagEXT = ?*const fn (Device, [*c]const DebugUtilsObjectTagInfoEXT) callconv(.c) Result;
pub const PFN_queueBeginDebugUtilsLabelEXT = ?*const fn (Queue, [*c]const DebugUtilsLabelEXT) callconv(.c) void;
pub const PFN_queueEndDebugUtilsLabelEXT = ?*const fn (Queue) callconv(.c) void;
pub const PFN_queueInsertDebugUtilsLabelEXT = ?*const fn (Queue, [*c]const DebugUtilsLabelEXT) callconv(.c) void;
pub const PFN_cmdBeginDebugUtilsLabelEXT = ?*const fn (CommandBuffer, [*c]const DebugUtilsLabelEXT) callconv(.c) void;
pub const PFN_cmdEndDebugUtilsLabelEXT = ?*const fn (CommandBuffer) callconv(.c) void;
pub const PFN_cmdInsertDebugUtilsLabelEXT = ?*const fn (CommandBuffer, [*c]const DebugUtilsLabelEXT) callconv(.c) void;
pub const PFN_createDebugUtilsMessengerEXT = ?*const fn (Instance, [*c]const DebugUtilsMessengerCreateInfoEXT, [*c]const AllocationCallbacks, [*c]DebugUtilsMessengerEXT) callconv(.c) Result;
pub const PFN_destroyDebugUtilsMessengerEXT = ?*const fn (Instance, DebugUtilsMessengerEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_submitDebugUtilsMessageEXT = ?*const fn (Instance, DebugUtilsMessageSeverityFlagsEXT, DebugUtilsMessageTypeFlagsEXT, [*c]const DebugUtilsMessengerCallbackDataEXT) callconv(.c) void;
pub extern fn setDebugUtilsObjectNameEXT(device: Device, p_name_info: [*c]const DebugUtilsObjectNameInfoEXT) Result;
pub extern fn setDebugUtilsObjectTagEXT(device: Device, p_tag_info: [*c]const DebugUtilsObjectTagInfoEXT) Result;
pub extern fn queueBeginDebugUtilsLabelEXT(queue: Queue, p_label_info: [*c]const DebugUtilsLabelEXT) void;
pub extern fn queueEndDebugUtilsLabelEXT(queue: Queue) void;
pub extern fn queueInsertDebugUtilsLabelEXT(queue: Queue, p_label_info: [*c]const DebugUtilsLabelEXT) void;
pub extern fn cmdBeginDebugUtilsLabelEXT(command_buffer: CommandBuffer, p_label_info: [*c]const DebugUtilsLabelEXT) void;
pub extern fn cmdEndDebugUtilsLabelEXT(command_buffer: CommandBuffer) void;
pub extern fn cmdInsertDebugUtilsLabelEXT(command_buffer: CommandBuffer, p_label_info: [*c]const DebugUtilsLabelEXT) void;
pub extern fn createDebugUtilsMessengerEXT(instance: Instance, p_create_info: [*c]const DebugUtilsMessengerCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_messenger: [*c]DebugUtilsMessengerEXT) Result;
pub extern fn destroyDebugUtilsMessengerEXT(instance: Instance, messenger: DebugUtilsMessengerEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn submitDebugUtilsMessageEXT(instance: Instance, message_severity: DebugUtilsMessageSeverityFlagsEXT, message_types: DebugUtilsMessageTypeFlagsEXT, p_callback_data: [*c]const DebugUtilsMessengerCallbackDataEXT) void;
pub const SamplerReductionModeEXT = SamplerReductionMode;
pub const SamplerReductionModeCreateInfoEXT = SamplerReductionModeCreateInfo;
pub const PhysicalDeviceSamplerFilterMinmaxPropertiesEXT = PhysicalDeviceSamplerFilterMinmaxProperties;
pub const PhysicalDeviceInlineUniformBlockFeaturesEXT = PhysicalDeviceInlineUniformBlockFeatures;
pub const PhysicalDeviceInlineUniformBlockPropertiesEXT = PhysicalDeviceInlineUniformBlockProperties;
pub const WriteDescriptorSetInlineUniformBlockEXT = WriteDescriptorSetInlineUniformBlock;
pub const DescriptorPoolInlineUniformBlockCreateInfoEXT = DescriptorPoolInlineUniformBlockCreateInfo;
pub const SampleLocationEXT = extern struct {
    x: f32 = @import("std").mem.zeroes(f32),
    y: f32 = @import("std").mem.zeroes(f32),
};
pub const SampleLocationsInfoEXT = extern struct {
    s_type: StructureType = StructureType.sample_locations_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    sample_locations_per_pixel: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    sample_location_grid_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    sample_locations_count: u32 = @import("std").mem.zeroes(u32),
    p_sample_locations: [*c]const SampleLocationEXT = @import("std").mem.zeroes([*c]const SampleLocationEXT),
};
pub const AttachmentSampleLocationsEXT = extern struct {
    attachment_index: u32 = @import("std").mem.zeroes(u32),
    sample_locations_info: SampleLocationsInfoEXT = @import("std").mem.zeroes(SampleLocationsInfoEXT),
};
pub const SubpassSampleLocationsEXT = extern struct {
    subpass_index: u32 = @import("std").mem.zeroes(u32),
    sample_locations_info: SampleLocationsInfoEXT = @import("std").mem.zeroes(SampleLocationsInfoEXT),
};
pub const RenderPassSampleLocationsBeginInfoEXT = extern struct {
    s_type: StructureType = StructureType.render_pass_sample_locations_begin_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    attachment_initial_sample_locations_count: u32 = @import("std").mem.zeroes(u32),
    p_attachment_initial_sample_locations: [*c]const AttachmentSampleLocationsEXT = @import("std").mem.zeroes([*c]const AttachmentSampleLocationsEXT),
    post_subpass_sample_locations_count: u32 = @import("std").mem.zeroes(u32),
    p_post_subpass_sample_locations: [*c]const SubpassSampleLocationsEXT = @import("std").mem.zeroes([*c]const SubpassSampleLocationsEXT),
};
pub const PipelineSampleLocationsStateCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.pipeline_sample_locations_state_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    sample_locations_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    sample_locations_info: SampleLocationsInfoEXT = @import("std").mem.zeroes(SampleLocationsInfoEXT),
};
pub const PhysicalDeviceSampleLocationsPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_sample_locations_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    sample_location_sample_counts: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    max_sample_location_grid_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    sample_location_coordinate_range: [2]f32 = @import("std").mem.zeroes([2]f32),
    sample_location_sub_pixel_bits: u32 = @import("std").mem.zeroes(u32),
    variable_sample_locations: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MultisamplePropertiesEXT = extern struct {
    s_type: StructureType = StructureType.multisample_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_sample_location_grid_size: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const PFN_cmdSetSampleLocationsEXT = ?*const fn (CommandBuffer, [*c]const SampleLocationsInfoEXT) callconv(.c) void;
pub const PFN_getPhysicalDeviceMultisamplePropertiesEXT = ?*const fn (PhysicalDevice, SampleCountFlags, [*c]MultisamplePropertiesEXT) callconv(.c) void;
pub extern fn cmdSetSampleLocationsEXT(command_buffer: CommandBuffer, p_sample_locations_info: [*c]const SampleLocationsInfoEXT) void;
pub extern fn getPhysicalDeviceMultisamplePropertiesEXT(physical_device: PhysicalDevice, samples: SampleCountFlags, p_multisample_properties: [*c]MultisamplePropertiesEXT) void;
pub const BlendOverlapEXT = enum(u32) {
    uncorrelated_ext = 0,
    disjoint_ext = 1,
    conjoint_ext = 2,
};
pub const PhysicalDeviceBlendOperationAdvancedFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_blend_operation_advanced_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    advanced_blend_coherent_operations: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceBlendOperationAdvancedPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_blend_operation_advanced_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    advanced_blend_max_color_attachments: u32 = @import("std").mem.zeroes(u32),
    advanced_blend_independent_blend: Bool32 = @import("std").mem.zeroes(Bool32),
    advanced_blend_non_premultiplied_src_color: Bool32 = @import("std").mem.zeroes(Bool32),
    advanced_blend_non_premultiplied_dst_color: Bool32 = @import("std").mem.zeroes(Bool32),
    advanced_blend_correlated_overlap: Bool32 = @import("std").mem.zeroes(Bool32),
    advanced_blend_all_operations: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineColorBlendAdvancedStateCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.pipeline_color_blend_advanced_state_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src_premultiplied: Bool32 = @import("std").mem.zeroes(Bool32),
    dst_premultiplied: Bool32 = @import("std").mem.zeroes(Bool32),
    blend_overlap: BlendOverlapEXT = @import("std").mem.zeroes(BlendOverlapEXT),
};
pub const PipelineCoverageToColorStateCreateFlagsNV = Flags;
pub const PipelineCoverageToColorStateCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.pipeline_coverage_to_color_state_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCoverageToColorStateCreateFlagsNV = @import("std").mem.zeroes(PipelineCoverageToColorStateCreateFlagsNV),
    coverage_to_color_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    coverage_to_color_location: u32 = @import("std").mem.zeroes(u32),
};
pub const CoverageModulationModeNV = enum(u32) {
    none_nv = 0,
    rgb_nv = 1,
    alpha_nv = 2,
    rgba_nv = 3,
};
pub const PipelineCoverageModulationStateCreateFlagsNV = Flags;
pub const PipelineCoverageModulationStateCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.pipeline_coverage_modulation_state_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCoverageModulationStateCreateFlagsNV = @import("std").mem.zeroes(PipelineCoverageModulationStateCreateFlagsNV),
    coverage_modulation_mode: CoverageModulationModeNV = @import("std").mem.zeroes(CoverageModulationModeNV),
    coverage_modulation_table_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    coverage_modulation_table_count: u32 = @import("std").mem.zeroes(u32),
    p_coverage_modulation_table: [*c]const f32 = @import("std").mem.zeroes([*c]const f32),
};
pub const PhysicalDeviceShaderSMBuiltinsPropertiesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_smbuiltins_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_smcount: u32 = @import("std").mem.zeroes(u32),
    shader_warps_per_sm: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceShaderSMBuiltinsFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_smbuiltins_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_smbuiltins: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DrmFormatModifierPropertiesEXT = extern struct {
    drm_format_modifier: u64 = @import("std").mem.zeroes(u64),
    drm_format_modifier_plane_count: u32 = @import("std").mem.zeroes(u32),
    drm_format_modifier_tiling_features: FormatFeatureFlags = @import("std").mem.zeroes(FormatFeatureFlags),
};
pub const DrmFormatModifierPropertiesListEXT = extern struct {
    s_type: StructureType = StructureType.drm_format_modifier_properties_list_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    drm_format_modifier_count: u32 = @import("std").mem.zeroes(u32),
    p_drm_format_modifier_properties: [*c]DrmFormatModifierPropertiesEXT = @import("std").mem.zeroes([*c]DrmFormatModifierPropertiesEXT),
};
pub const PhysicalDeviceImageDrmFormatModifierInfoEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_image_drm_format_modifier_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    drm_format_modifier: u64 = @import("std").mem.zeroes(u64),
    sharing_mode: SharingMode = @import("std").mem.zeroes(SharingMode),
    queue_family_index_count: u32 = @import("std").mem.zeroes(u32),
    p_queue_family_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const ImageDrmFormatModifierListCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.image_drm_format_modifier_list_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    drm_format_modifier_count: u32 = @import("std").mem.zeroes(u32),
    p_drm_format_modifiers: [*c]const u64 = @import("std").mem.zeroes([*c]const u64),
};
pub const ImageDrmFormatModifierExplicitCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.image_drm_format_modifier_explicit_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    drm_format_modifier: u64 = @import("std").mem.zeroes(u64),
    drm_format_modifier_plane_count: u32 = @import("std").mem.zeroes(u32),
    p_plane_layouts: [*c]const SubresourceLayout = @import("std").mem.zeroes([*c]const SubresourceLayout),
};
pub const ImageDrmFormatModifierPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.image_drm_format_modifier_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    drm_format_modifier: u64 = @import("std").mem.zeroes(u64),
};
pub const DrmFormatModifierProperties2EXT = extern struct {
    drm_format_modifier: u64 = @import("std").mem.zeroes(u64),
    drm_format_modifier_plane_count: u32 = @import("std").mem.zeroes(u32),
    drm_format_modifier_tiling_features: FormatFeatureFlags2 = @import("std").mem.zeroes(FormatFeatureFlags2),
};
pub const DrmFormatModifierPropertiesList2EXT = extern struct {
    s_type: StructureType = StructureType.drm_format_modifier_properties_list2ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    drm_format_modifier_count: u32 = @import("std").mem.zeroes(u32),
    p_drm_format_modifier_properties: [*c]DrmFormatModifierProperties2EXT = @import("std").mem.zeroes([*c]DrmFormatModifierProperties2EXT),
};
pub const PFN_getImageDrmFormatModifierPropertiesEXT = ?*const fn (Device, Image, [*c]ImageDrmFormatModifierPropertiesEXT) callconv(.c) Result;
pub extern fn getImageDrmFormatModifierPropertiesEXT(device: Device, image: Image, p_properties: [*c]ImageDrmFormatModifierPropertiesEXT) Result;
pub const ValidationCacheEXT = enum(u64) { null = 0, _ };
pub const ValidationCacheHeaderVersionEXT = enum(u32) {
    null = 0,
    one_ext = 1,
};
pub const ValidationCacheCreateFlagsEXT = Flags;
pub const ValidationCacheCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.validation_cache_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ValidationCacheCreateFlagsEXT = @import("std").mem.zeroes(ValidationCacheCreateFlagsEXT),
    initial_data_size: usize = @import("std").mem.zeroes(usize),
    p_initial_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const ShaderModuleValidationCacheCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.shader_module_validation_cache_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    validation_cache: ValidationCacheEXT = @import("std").mem.zeroes(ValidationCacheEXT),
};
pub const PFN_createValidationCacheEXT = ?*const fn (Device, [*c]const ValidationCacheCreateInfoEXT, [*c]const AllocationCallbacks, [*c]ValidationCacheEXT) callconv(.c) Result;
pub const PFN_destroyValidationCacheEXT = ?*const fn (Device, ValidationCacheEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_mergeValidationCachesEXT = ?*const fn (Device, ValidationCacheEXT, u32, [*c]const ValidationCacheEXT) callconv(.c) Result;
pub const PFN_getValidationCacheDataEXT = ?*const fn (Device, ValidationCacheEXT, [*c]usize, ?*anyopaque) callconv(.c) Result;
pub extern fn createValidationCacheEXT(device: Device, p_create_info: [*c]const ValidationCacheCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_validation_cache: [*c]ValidationCacheEXT) Result;
pub extern fn destroyValidationCacheEXT(device: Device, validation_cache: ValidationCacheEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn mergeValidationCachesEXT(device: Device, dst_cache: ValidationCacheEXT, src_cache_count: u32, p_src_caches: [*c]const ValidationCacheEXT) Result;
pub extern fn getValidationCacheDataEXT(device: Device, validation_cache: ValidationCacheEXT, p_data_size: [*c]usize, p_data: ?*anyopaque) Result;
pub const DescriptorBindingFlagsEXT = DescriptorBindingFlags;
pub const DescriptorSetLayoutBindingFlagsCreateInfoEXT = DescriptorSetLayoutBindingFlagsCreateInfo;
pub const PhysicalDeviceDescriptorIndexingFeaturesEXT = PhysicalDeviceDescriptorIndexingFeatures;
pub const PhysicalDeviceDescriptorIndexingPropertiesEXT = PhysicalDeviceDescriptorIndexingProperties;
pub const DescriptorSetVariableDescriptorCountAllocateInfoEXT = DescriptorSetVariableDescriptorCountAllocateInfo;
pub const DescriptorSetVariableDescriptorCountLayoutSupportEXT = DescriptorSetVariableDescriptorCountLayoutSupport;
pub const ShadingRatePaletteEntryNV = enum(u32) {
    no_invocations_nv = 0,
    @"16_invocations_per_pixel_nv" = 1,
    @"8_invocations_per_pixel_nv" = 2,
    @"4_invocations_per_pixel_nv" = 3,
    @"2_invocations_per_pixel_nv" = 4,
    @"1_invocation_per_pixel_nv" = 5,
    @"1_invocation_per_2x1_pixels_nv" = 6,
    @"1_invocation_per_1x2_pixels_nv" = 7,
    @"1_invocation_per_2x2_pixels_nv" = 8,
    @"1_invocation_per_4x2_pixels_nv" = 9,
    @"1_invocation_per_2x4_pixels_nv" = 10,
    @"1_invocation_per_4x4_pixels_nv" = 11,
};
pub const CoarseSampleOrderTypeNV = enum(u32) {
    default_nv = 0,
    custom_nv = 1,
    pixel_major_nv = 2,
    sample_major_nv = 3,
};
pub const ShadingRatePaletteNV = extern struct {
    shading_rate_palette_entry_count: u32 = @import("std").mem.zeroes(u32),
    p_shading_rate_palette_entries: [*c]const ShadingRatePaletteEntryNV = @import("std").mem.zeroes([*c]const ShadingRatePaletteEntryNV),
};
pub const PipelineViewportShadingRateImageStateCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.pipeline_viewport_shading_rate_image_state_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    shading_rate_image_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    viewport_count: u32 = @import("std").mem.zeroes(u32),
    p_shading_rate_palettes: [*c]const ShadingRatePaletteNV = @import("std").mem.zeroes([*c]const ShadingRatePaletteNV),
};
pub const PhysicalDeviceShadingRateImageFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_shading_rate_image_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shading_rate_image: Bool32 = @import("std").mem.zeroes(Bool32),
    shading_rate_coarse_sample_order: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShadingRateImagePropertiesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_shading_rate_image_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shading_rate_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    shading_rate_palette_size: u32 = @import("std").mem.zeroes(u32),
    shading_rate_max_coarse_samples: u32 = @import("std").mem.zeroes(u32),
};
pub const CoarseSampleLocationNV = extern struct {
    pixel_x: u32 = @import("std").mem.zeroes(u32),
    pixel_y: u32 = @import("std").mem.zeroes(u32),
    sample: u32 = @import("std").mem.zeroes(u32),
};
pub const CoarseSampleOrderCustomNV = extern struct {
    shading_rate: ShadingRatePaletteEntryNV = @import("std").mem.zeroes(ShadingRatePaletteEntryNV),
    sample_count: u32 = @import("std").mem.zeroes(u32),
    sample_location_count: u32 = @import("std").mem.zeroes(u32),
    p_sample_locations: [*c]const CoarseSampleLocationNV = @import("std").mem.zeroes([*c]const CoarseSampleLocationNV),
};
pub const PipelineViewportCoarseSampleOrderStateCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.pipeline_viewport_coarse_sample_order_state_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    sample_order_type: CoarseSampleOrderTypeNV = @import("std").mem.zeroes(CoarseSampleOrderTypeNV),
    custom_sample_order_count: u32 = @import("std").mem.zeroes(u32),
    p_custom_sample_orders: [*c]const CoarseSampleOrderCustomNV = @import("std").mem.zeroes([*c]const CoarseSampleOrderCustomNV),
};
pub const PFN_cmdBindShadingRateImageNV = ?*const fn (CommandBuffer, ImageView, ImageLayout) callconv(.c) void;
pub const PFN_cmdSetViewportShadingRatePaletteNV = ?*const fn (CommandBuffer, u32, u32, [*c]const ShadingRatePaletteNV) callconv(.c) void;
pub const PFN_cmdSetCoarseSampleOrderNV = ?*const fn (CommandBuffer, CoarseSampleOrderTypeNV, u32, [*c]const CoarseSampleOrderCustomNV) callconv(.c) void;
pub extern fn cmdBindShadingRateImageNV(command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout) void;
pub extern fn cmdSetViewportShadingRatePaletteNV(command_buffer: CommandBuffer, first_viewport: u32, viewport_count: u32, p_shading_rate_palettes: [*c]const ShadingRatePaletteNV) void;
pub extern fn cmdSetCoarseSampleOrderNV(command_buffer: CommandBuffer, sample_order_type: CoarseSampleOrderTypeNV, custom_sample_order_count: u32, p_custom_sample_orders: [*c]const CoarseSampleOrderCustomNV) void;
pub const AccelerationStructureNV = enum(u64) { null = 0, _ };
pub const RayTracingShaderGroupTypeKHR = enum(u32) {
    general_nv = 0,
    triangles_hit_group_nv = 1,
    procedural_hit_group_nv = 2,
    pub const Self = @This();
    pub const general_khr = Self.general_nv;
    pub const triangles_hit_group_khr = Self.triangles_hit_group_nv;
    pub const procedural_hit_group_khr = Self.procedural_hit_group_nv;
};
pub const RayTracingShaderGroupTypeNV = RayTracingShaderGroupTypeKHR;
pub const GeometryTypeKHR = enum(u32) {
    triangles_nv = 0,
    aabbs_nv = 1,
    instances_khr = 2,
    pub const Self = @This();
    pub const triangles_khr = Self.triangles_nv;
    pub const aabbs_khr = Self.aabbs_nv;
};
pub const GeometryTypeNV = GeometryTypeKHR;
pub const AccelerationStructureTypeKHR = enum(u32) {
    top_level_nv = 0,
    bottom_level_nv = 1,
    generic_khr = 2,
    pub const Self = @This();
    pub const top_level_khr = Self.top_level_nv;
    pub const bottom_level_khr = Self.bottom_level_nv;
};
pub const AccelerationStructureTypeNV = AccelerationStructureTypeKHR;
pub const CopyAccelerationStructureModeKHR = enum(u32) {
    clone_nv = 0,
    compact_nv = 1,
    serialize_khr = 2,
    deserialize_khr = 3,
    pub const Self = @This();
    pub const clone_khr = Self.clone_nv;
    pub const compact_khr = Self.compact_nv;
};
pub const CopyAccelerationStructureModeNV = CopyAccelerationStructureModeKHR;
pub const AccelerationStructureMemoryRequirementsTypeNV = enum(u32) {
    object_nv = 0,
    build_scratch_nv = 1,
    update_scratch_nv = 2,
};
pub const GeometryFlagsKHR = enum(u32) {
    null = 0,
    opaque_bit_nv = 1,
    no_duplicate_any_hit_invocation_bit_nv = 2,
    pub const Self = @This();
    pub const opaque_bit_khr = Self.opaque_bit_nv;
    pub const no_duplicate_any_hit_invocation_bit_khr = Self.no_duplicate_any_hit_invocation_bit_nv;
};
pub const GeometryFlagsNV = GeometryFlagsKHR;
pub const GeometryInstanceFlagsKHR = enum(u32) {
    null = 0,
    triangle_cull_disable_bit_nv = 1,
    triangle_front_counterclockwise_bit_nv = 2,
    force_opaque_bit_nv = 4,
    force_no_opaque_bit_nv = 8,
    force_opacity_micromap_2_state_ext = 16,
    disable_opacity_micromaps_ext = 32,
    pub const Self = @This();
    pub const triangle_facing_cull_disable_bit_khr = Self.triangle_cull_disable_bit_nv;
    pub const triangle_front_counterclockwise_bit_khr = Self.triangle_front_counterclockwise_bit_nv;
    pub const triangle_flip_facing_bit_khr = Self.triangle_front_counterclockwise_bit_nv;
    pub const force_opaque_bit_khr = Self.force_opaque_bit_nv;
    pub const force_no_opaque_bit_khr = Self.force_no_opaque_bit_nv;
};
pub const GeometryInstanceFlagsNV = GeometryInstanceFlagsKHR;
pub const BuildAccelerationStructureFlagsKHR = enum(u32) {
    null = 0,
    allow_update_bit_nv = 1,
    allow_compaction_bit_nv = 2,
    prefer_fast_trace_bit_nv = 4,
    prefer_fast_build_bit_nv = 8,
    low_memory_bit_nv = 16,
    motion_bit_nv = 32,
    allow_opacity_micromap_update_ext = 64,
    allow_disable_opacity_micromaps_ext = 128,
    allow_opacity_micromap_data_update_ext = 256,
    allow_data_access_khr = 2048,
    pub const Self = @This();
    pub const allow_update_bit_khr = Self.allow_update_bit_nv;
    pub const allow_compaction_bit_khr = Self.allow_compaction_bit_nv;
    pub const prefer_fast_trace_bit_khr = Self.prefer_fast_trace_bit_nv;
    pub const prefer_fast_build_bit_khr = Self.prefer_fast_build_bit_nv;
    pub const low_memory_bit_khr = Self.low_memory_bit_nv;
};
pub const BuildAccelerationStructureFlagsNV = BuildAccelerationStructureFlagsKHR;
pub const RayTracingShaderGroupCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.ray_tracing_shader_group_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: RayTracingShaderGroupTypeKHR = @import("std").mem.zeroes(RayTracingShaderGroupTypeKHR),
    general_shader: u32 = @import("std").mem.zeroes(u32),
    closest_hit_shader: u32 = @import("std").mem.zeroes(u32),
    any_hit_shader: u32 = @import("std").mem.zeroes(u32),
    intersection_shader: u32 = @import("std").mem.zeroes(u32),
};
pub const RayTracingPipelineCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.ray_tracing_pipeline_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCreateFlags = @import("std").mem.zeroes(PipelineCreateFlags),
    stage_count: u32 = @import("std").mem.zeroes(u32),
    p_stages: [*c]const PipelineShaderStageCreateInfo = @import("std").mem.zeroes([*c]const PipelineShaderStageCreateInfo),
    group_count: u32 = @import("std").mem.zeroes(u32),
    p_groups: [*c]const RayTracingShaderGroupCreateInfoNV = @import("std").mem.zeroes([*c]const RayTracingShaderGroupCreateInfoNV),
    max_recursion_depth: u32 = @import("std").mem.zeroes(u32),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    base_pipeline_handle: Pipeline = @import("std").mem.zeroes(Pipeline),
    base_pipeline_index: i32 = @import("std").mem.zeroes(i32),
};
pub const GeometryTrianglesNV = extern struct {
    s_type: StructureType = StructureType.geometry_triangles_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    vertex_data: Buffer = @import("std").mem.zeroes(Buffer),
    vertex_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    vertex_count: u32 = @import("std").mem.zeroes(u32),
    vertex_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    vertex_format: Format = @import("std").mem.zeroes(Format),
    index_data: Buffer = @import("std").mem.zeroes(Buffer),
    index_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    index_count: u32 = @import("std").mem.zeroes(u32),
    index_type: IndexType = @import("std").mem.zeroes(IndexType),
    transform_data: Buffer = @import("std").mem.zeroes(Buffer),
    transform_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const GeometryAABBNV = extern struct {
    s_type: StructureType = StructureType.geometry_aabbnv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    aabb_data: Buffer = @import("std").mem.zeroes(Buffer),
    num_aabbs: u32 = @import("std").mem.zeroes(u32),
    stride: u32 = @import("std").mem.zeroes(u32),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const GeometryDataNV = extern struct {
    triangles: GeometryTrianglesNV = @import("std").mem.zeroes(GeometryTrianglesNV),
    aabbs: GeometryAABBNV = @import("std").mem.zeroes(GeometryAABBNV),
};
pub const GeometryNV = extern struct {
    s_type: StructureType = StructureType.geometry_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    geometry_type: GeometryTypeKHR = @import("std").mem.zeroes(GeometryTypeKHR),
    geometry: GeometryDataNV = @import("std").mem.zeroes(GeometryDataNV),
    flags: GeometryFlagsKHR = @import("std").mem.zeroes(GeometryFlagsKHR),
};
pub const AccelerationStructureInfoNV = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: AccelerationStructureTypeNV = @import("std").mem.zeroes(AccelerationStructureTypeNV),
    flags: BuildAccelerationStructureFlagsNV = @import("std").mem.zeroes(BuildAccelerationStructureFlagsNV),
    instance_count: u32 = @import("std").mem.zeroes(u32),
    geometry_count: u32 = @import("std").mem.zeroes(u32),
    p_geometries: [*c]const GeometryNV = @import("std").mem.zeroes([*c]const GeometryNV),
};
pub const AccelerationStructureCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    compacted_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    info: AccelerationStructureInfoNV = @import("std").mem.zeroes(AccelerationStructureInfoNV),
};
pub const BindAccelerationStructureMemoryInfoNV = extern struct {
    s_type: StructureType = StructureType.bind_acceleration_structure_memory_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acceleration_structure: AccelerationStructureNV = @import("std").mem.zeroes(AccelerationStructureNV),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    memory_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    device_index_count: u32 = @import("std").mem.zeroes(u32),
    p_device_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const WriteDescriptorSetAccelerationStructureNV = extern struct {
    s_type: StructureType = StructureType.write_descriptor_set_acceleration_structure_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acceleration_structure_count: u32 = @import("std").mem.zeroes(u32),
    p_acceleration_structures: [*c]const AccelerationStructureNV = @import("std").mem.zeroes([*c]const AccelerationStructureNV),
};
pub const AccelerationStructureMemoryRequirementsInfoNV = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_memory_requirements_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: AccelerationStructureMemoryRequirementsTypeNV = @import("std").mem.zeroes(AccelerationStructureMemoryRequirementsTypeNV),
    acceleration_structure: AccelerationStructureNV = @import("std").mem.zeroes(AccelerationStructureNV),
};
pub const PhysicalDeviceRayTracingPropertiesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_ray_tracing_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_group_handle_size: u32 = @import("std").mem.zeroes(u32),
    max_recursion_depth: u32 = @import("std").mem.zeroes(u32),
    max_shader_group_stride: u32 = @import("std").mem.zeroes(u32),
    shader_group_base_alignment: u32 = @import("std").mem.zeroes(u32),
    max_geometry_count: u64 = @import("std").mem.zeroes(u64),
    max_instance_count: u64 = @import("std").mem.zeroes(u64),
    max_triangle_count: u64 = @import("std").mem.zeroes(u64),
    max_descriptor_set_acceleration_structures: u32 = @import("std").mem.zeroes(u32),
};
pub const TransformMatrixKHR = extern struct {
    matrix: [3][4]f32 = @import("std").mem.zeroes([3][4]f32),
};
pub const TransformMatrixNV = TransformMatrixKHR;
pub const AabbPositionsKHR = extern struct {
    min_x: f32 = @import("std").mem.zeroes(f32),
    min_y: f32 = @import("std").mem.zeroes(f32),
    min_z: f32 = @import("std").mem.zeroes(f32),
    max_x: f32 = @import("std").mem.zeroes(f32),
    max_y: f32 = @import("std").mem.zeroes(f32),
    max_z: f32 = @import("std").mem.zeroes(f32),
};
pub const AabbPositionsNV = AabbPositionsKHR;
pub const AccelerationStructureInstanceKHR = enum(u64) { null = 0, _ };
pub const AccelerationStructureInstanceNV = AccelerationStructureInstanceKHR;
pub const PFN_createAccelerationStructureNV = ?*const fn (Device, [*c]const AccelerationStructureCreateInfoNV, [*c]const AllocationCallbacks, [*c]AccelerationStructureNV) callconv(.c) Result;
pub const PFN_destroyAccelerationStructureNV = ?*const fn (Device, AccelerationStructureNV, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getAccelerationStructureMemoryRequirementsNV = ?*const fn (Device, [*c]const AccelerationStructureMemoryRequirementsInfoNV, [*c]MemoryRequirements2KHR) callconv(.c) void;
pub const PFN_bindAccelerationStructureMemoryNV = ?*const fn (Device, u32, [*c]const BindAccelerationStructureMemoryInfoNV) callconv(.c) Result;
pub const PFN_cmdBuildAccelerationStructureNV = ?*const fn (CommandBuffer, [*c]const AccelerationStructureInfoNV, Buffer, DeviceSize, Bool32, AccelerationStructureNV, AccelerationStructureNV, Buffer, DeviceSize) callconv(.c) void;
pub const PFN_cmdCopyAccelerationStructureNV = ?*const fn (CommandBuffer, AccelerationStructureNV, AccelerationStructureNV, CopyAccelerationStructureModeKHR) callconv(.c) void;
pub const PFN_cmdTraceRaysNV = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, DeviceSize, Buffer, DeviceSize, DeviceSize, Buffer, DeviceSize, DeviceSize, u32, u32, u32) callconv(.c) void;
pub const PFN_createRayTracingPipelinesNV = ?*const fn (Device, PipelineCache, u32, [*c]const RayTracingPipelineCreateInfoNV, [*c]const AllocationCallbacks, [*c]Pipeline) callconv(.c) Result;
pub const PFN_getRayTracingShaderGroupHandlesKHR = ?*const fn (Device, Pipeline, u32, u32, usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_getRayTracingShaderGroupHandlesNV = ?*const fn (Device, Pipeline, u32, u32, usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_getAccelerationStructureHandleNV = ?*const fn (Device, AccelerationStructureNV, usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_cmdWriteAccelerationStructuresPropertiesNV = ?*const fn (CommandBuffer, u32, [*c]const AccelerationStructureNV, QueryType, QueryPool, u32) callconv(.c) void;
pub const PFN_compileDeferredNV = ?*const fn (Device, Pipeline, u32) callconv(.c) Result;
pub extern fn createAccelerationStructureNV(device: Device, p_create_info: [*c]const AccelerationStructureCreateInfoNV, p_allocator: [*c]const AllocationCallbacks, p_acceleration_structure: [*c]AccelerationStructureNV) Result;
pub extern fn destroyAccelerationStructureNV(device: Device, acceleration_structure: AccelerationStructureNV, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getAccelerationStructureMemoryRequirementsNV(device: Device, p_info: [*c]const AccelerationStructureMemoryRequirementsInfoNV, p_memory_requirements: [*c]MemoryRequirements2KHR) void;
pub extern fn bindAccelerationStructureMemoryNV(device: Device, bind_info_count: u32, p_bind_infos: [*c]const BindAccelerationStructureMemoryInfoNV) Result;
pub extern fn cmdBuildAccelerationStructureNV(command_buffer: CommandBuffer, p_info: [*c]const AccelerationStructureInfoNV, instance_data: Buffer, instance_offset: DeviceSize, update: Bool32, dst: AccelerationStructureNV, src: AccelerationStructureNV, scratch: Buffer, scratch_offset: DeviceSize) void;
pub extern fn cmdCopyAccelerationStructureNV(command_buffer: CommandBuffer, dst: AccelerationStructureNV, src: AccelerationStructureNV, mode: CopyAccelerationStructureModeKHR) void;
pub extern fn cmdTraceRaysNV(command_buffer: CommandBuffer, raygen_shader_binding_table_buffer: Buffer, raygen_shader_binding_offset: DeviceSize, miss_shader_binding_table_buffer: Buffer, miss_shader_binding_offset: DeviceSize, miss_shader_binding_stride: DeviceSize, hit_shader_binding_table_buffer: Buffer, hit_shader_binding_offset: DeviceSize, hit_shader_binding_stride: DeviceSize, callable_shader_binding_table_buffer: Buffer, callable_shader_binding_offset: DeviceSize, callable_shader_binding_stride: DeviceSize, width: u32, height: u32, depth: u32) void;
pub extern fn createRayTracingPipelinesNV(device: Device, pipeline_cache: PipelineCache, create_info_count: u32, p_create_infos: [*c]const RayTracingPipelineCreateInfoNV, p_allocator: [*c]const AllocationCallbacks, p_pipelines: [*c]Pipeline) Result;
pub extern fn getRayTracingShaderGroupHandlesKHR(device: Device, pipeline: Pipeline, first_group: u32, group_count: u32, data_size: usize, p_data: ?*anyopaque) Result;
pub extern fn getRayTracingShaderGroupHandlesNV(device: Device, pipeline: Pipeline, first_group: u32, group_count: u32, data_size: usize, p_data: ?*anyopaque) Result;
pub extern fn getAccelerationStructureHandleNV(device: Device, acceleration_structure: AccelerationStructureNV, data_size: usize, p_data: ?*anyopaque) Result;
pub extern fn cmdWriteAccelerationStructuresPropertiesNV(command_buffer: CommandBuffer, acceleration_structure_count: u32, p_acceleration_structures: [*c]const AccelerationStructureNV, query_type: QueryType, query_pool: QueryPool, first_query: u32) void;
pub extern fn compileDeferredNV(device: Device, pipeline: Pipeline, shader: u32) Result;
pub const PhysicalDeviceRepresentativeFragmentTestFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_representative_fragment_test_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    representative_fragment_test: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineRepresentativeFragmentTestStateCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.pipeline_representative_fragment_test_state_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    representative_fragment_test_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImageViewImageFormatInfoEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_image_view_image_format_info_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_view_type: ImageViewType = @import("std").mem.zeroes(ImageViewType),
};
pub const FilterCubicImageViewImageFormatPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.filter_cubic_image_view_image_format_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    filter_cubic: Bool32 = @import("std").mem.zeroes(Bool32),
    filter_cubic_minmax: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const QueueGlobalPriorityEXT = QueueGlobalPriorityKHR;
pub const DeviceQueueGlobalPriorityCreateInfoEXT = DeviceQueueGlobalPriorityCreateInfoKHR;
pub const ImportMemoryHostPointerInfoEXT = extern struct {
    s_type: StructureType = StructureType.import_memory_host_pointer_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    handle_type: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
    p_host_pointer: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const MemoryHostPointerPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.memory_host_pointer_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_type_bits: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceExternalMemoryHostPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_external_memory_host_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_imported_host_pointer_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PFN_getMemoryHostPointerPropertiesEXT = ?*const fn (Device, ExternalMemoryHandleTypeFlags, ?*const anyopaque, [*c]MemoryHostPointerPropertiesEXT) callconv(.c) Result;
pub extern fn getMemoryHostPointerPropertiesEXT(device: Device, handle_type: ExternalMemoryHandleTypeFlags, p_host_pointer: ?*const anyopaque, p_memory_host_pointer_properties: [*c]MemoryHostPointerPropertiesEXT) Result;
pub const PFN_cmdWriteBufferMarkerAMD = ?*const fn (CommandBuffer, PipelineStageFlags, Buffer, DeviceSize, u32) callconv(.c) void;
pub extern fn cmdWriteBufferMarkerAMD(command_buffer: CommandBuffer, pipeline_stage: PipelineStageFlags, dst_buffer: Buffer, dst_offset: DeviceSize, marker: u32) void;
pub const PipelineCompilerControlFlagsAMD = enum(u32) {
    null = 0,
};
pub const PipelineCompilerControlCreateInfoAMD = extern struct {
    s_type: StructureType = StructureType.pipeline_compiler_control_create_info_amd,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    compiler_control_flags: PipelineCompilerControlFlagsAMD = @import("std").mem.zeroes(PipelineCompilerControlFlagsAMD),
};
pub const TimeDomainEXT = TimeDomainKHR;
pub const CalibratedTimestampInfoEXT = CalibratedTimestampInfoKHR;
pub const PFN_getPhysicalDeviceCalibrateableTimeDomainsEXT = ?*const fn (PhysicalDevice, [*c]u32, [*c]TimeDomainKHR) callconv(.c) Result;
pub const PFN_getCalibratedTimestampsEXT = ?*const fn (Device, u32, [*c]const CalibratedTimestampInfoKHR, [*c]u64, [*c]u64) callconv(.c) Result;
pub extern fn getPhysicalDeviceCalibrateableTimeDomainsEXT(physical_device: PhysicalDevice, p_time_domain_count: [*c]u32, p_time_domains: [*c]TimeDomainKHR) Result;
pub extern fn getCalibratedTimestampsEXT(device: Device, timestamp_count: u32, p_timestamp_infos: [*c]const CalibratedTimestampInfoKHR, p_timestamps: [*c]u64, p_max_deviation: [*c]u64) Result;
pub const PhysicalDeviceShaderCorePropertiesAMD = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_core_properties_amd,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_engine_count: u32 = @import("std").mem.zeroes(u32),
    shader_arrays_per_engine_count: u32 = @import("std").mem.zeroes(u32),
    compute_units_per_shader_array: u32 = @import("std").mem.zeroes(u32),
    simd_per_compute_unit: u32 = @import("std").mem.zeroes(u32),
    wavefronts_per_simd: u32 = @import("std").mem.zeroes(u32),
    wavefront_size: u32 = @import("std").mem.zeroes(u32),
    sgprs_per_simd: u32 = @import("std").mem.zeroes(u32),
    min_sgpr_allocation: u32 = @import("std").mem.zeroes(u32),
    max_sgpr_allocation: u32 = @import("std").mem.zeroes(u32),
    sgpr_allocation_granularity: u32 = @import("std").mem.zeroes(u32),
    vgprs_per_simd: u32 = @import("std").mem.zeroes(u32),
    min_vgpr_allocation: u32 = @import("std").mem.zeroes(u32),
    max_vgpr_allocation: u32 = @import("std").mem.zeroes(u32),
    vgpr_allocation_granularity: u32 = @import("std").mem.zeroes(u32),
};
pub const MemoryOverallocationBehaviorAMD = enum(u32) {
    default_amd = 0,
    allowed_amd = 1,
    disallowed_amd = 2,
};
pub const DeviceMemoryOverallocationCreateInfoAMD = extern struct {
    s_type: StructureType = StructureType.device_memory_overallocation_create_info_amd,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    overallocation_behavior: MemoryOverallocationBehaviorAMD = @import("std").mem.zeroes(MemoryOverallocationBehaviorAMD),
};
pub const PhysicalDeviceVertexAttributeDivisorPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_vertex_attribute_divisor_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_vertex_attrib_divisor: u32 = @import("std").mem.zeroes(u32),
};
pub const VertexInputBindingDivisorDescriptionEXT = VertexInputBindingDivisorDescriptionKHR;
pub const PipelineVertexInputDivisorStateCreateInfoEXT = PipelineVertexInputDivisorStateCreateInfoKHR;
pub const PhysicalDeviceVertexAttributeDivisorFeaturesEXT = PhysicalDeviceVertexAttributeDivisorFeaturesKHR;
pub const PipelineCreationFeedbackFlagsEXT = PipelineCreationFeedbackFlags;
pub const PipelineCreationFeedbackCreateInfoEXT = PipelineCreationFeedbackCreateInfo;
pub const PipelineCreationFeedbackEXT = PipelineCreationFeedback;
pub const PhysicalDeviceComputeShaderDerivativesFeaturesNV = PhysicalDeviceComputeShaderDerivativesFeaturesKHR;
pub const PhysicalDeviceMeshShaderFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_mesh_shader_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    task_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    mesh_shader: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMeshShaderPropertiesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_mesh_shader_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_draw_mesh_tasks_count: u32 = @import("std").mem.zeroes(u32),
    max_task_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    max_task_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_task_total_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_task_output_count: u32 = @import("std").mem.zeroes(u32),
    max_mesh_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    max_mesh_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_mesh_total_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_vertices: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_primitives: u32 = @import("std").mem.zeroes(u32),
    max_mesh_multiview_view_count: u32 = @import("std").mem.zeroes(u32),
    mesh_output_per_vertex_granularity: u32 = @import("std").mem.zeroes(u32),
    mesh_output_per_primitive_granularity: u32 = @import("std").mem.zeroes(u32),
};
pub const DrawMeshTasksIndirectCommandNV = extern struct {
    task_count: u32 = @import("std").mem.zeroes(u32),
    first_task: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdDrawMeshTasksNV = ?*const fn (CommandBuffer, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawMeshTasksIndirectNV = ?*const fn (CommandBuffer, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawMeshTasksIndirectCountNV = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub extern fn cmdDrawMeshTasksNV(command_buffer: CommandBuffer, task_count: u32, first_task: u32) void;
pub extern fn cmdDrawMeshTasksIndirectNV(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, draw_count: u32, stride: u32) void;
pub extern fn cmdDrawMeshTasksIndirectCountNV(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_buffer_offset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub const PhysicalDeviceFragmentShaderBarycentricFeaturesNV = PhysicalDeviceFragmentShaderBarycentricFeaturesKHR;
pub const PhysicalDeviceShaderImageFootprintFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_image_footprint_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_footprint: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineViewportExclusiveScissorStateCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.pipeline_viewport_exclusive_scissor_state_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    exclusive_scissor_count: u32 = @import("std").mem.zeroes(u32),
    p_exclusive_scissors: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const PhysicalDeviceExclusiveScissorFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_exclusive_scissor_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    exclusive_scissor: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdSetExclusiveScissorEnableNV = ?*const fn (CommandBuffer, u32, u32, [*c]const Bool32) callconv(.c) void;
pub const PFN_cmdSetExclusiveScissorNV = ?*const fn (CommandBuffer, u32, u32, [*c]const Rect2D) callconv(.c) void;
pub extern fn cmdSetExclusiveScissorEnableNV(command_buffer: CommandBuffer, first_exclusive_scissor: u32, exclusive_scissor_count: u32, p_exclusive_scissor_enables: [*c]const Bool32) void;
pub extern fn cmdSetExclusiveScissorNV(command_buffer: CommandBuffer, first_exclusive_scissor: u32, exclusive_scissor_count: u32, p_exclusive_scissors: [*c]const Rect2D) void;
pub const QueueFamilyCheckpointPropertiesNV = extern struct {
    s_type: StructureType = StructureType.queue_family_checkpoint_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    checkpoint_execution_stage_mask: PipelineStageFlags = @import("std").mem.zeroes(PipelineStageFlags),
};
pub const CheckpointDataNV = extern struct {
    s_type: StructureType = StructureType.checkpoint_data_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    stage: PipelineStageFlags = @import("std").mem.zeroes(PipelineStageFlags),
    p_checkpoint_marker: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PFN_cmdSetCheckpointNV = ?*const fn (CommandBuffer, ?*const anyopaque) callconv(.c) void;
pub const PFN_getQueueCheckpointDataNV = ?*const fn (Queue, [*c]u32, [*c]CheckpointDataNV) callconv(.c) void;
pub extern fn cmdSetCheckpointNV(command_buffer: CommandBuffer, p_checkpoint_marker: ?*const anyopaque) void;
pub extern fn getQueueCheckpointDataNV(queue: Queue, p_checkpoint_data_count: [*c]u32, p_checkpoint_data: [*c]CheckpointDataNV) void;
pub const PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_integer_functions2features_intel,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_integer_functions2: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PerformanceConfigurationINTEL = enum(u64) { null = 0, _ };
pub const PerformanceConfigurationTypeINTEL = enum(u32) {
    command_queue_metrics_discovery_activated_intel = 0,
};
pub const QueryPoolSamplingModeINTEL = enum(u32) {
    manual_intel = 0,
};
pub const PerformanceOverrideTypeINTEL = enum(u32) {
    null_hardware_intel = 0,
    flush_gpu_caches_intel = 1,
};
pub const PerformanceParameterTypeINTEL = enum(u32) {
    hw_counters_supported_intel = 0,
    stream_marker_valid_bits_intel = 1,
};
pub const PerformanceValueTypeINTEL = enum(u32) {
    uint32_intel = 0,
    uint64_intel = 1,
    float_intel = 2,
    bool_intel = 3,
    string_intel = 4,
};
pub const PerformanceValueDataINTEL = extern union {
    value32: u32,
    value64: u64,
    value_float: f32,
    value_bool: Bool32,
    value_string: [*c]const u8,
};
pub const PerformanceValueINTEL = extern struct {
    type: PerformanceValueTypeINTEL = @import("std").mem.zeroes(PerformanceValueTypeINTEL),
    data: PerformanceValueDataINTEL = @import("std").mem.zeroes(PerformanceValueDataINTEL),
};
pub const InitializePerformanceApiInfoINTEL = extern struct {
    s_type: StructureType = StructureType.initialize_performance_api_info_intel,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const QueryPoolPerformanceQueryCreateInfoINTEL = extern struct {
    s_type: StructureType = StructureType.query_pool_performance_query_create_info_intel,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    performance_counters_sampling: QueryPoolSamplingModeINTEL = @import("std").mem.zeroes(QueryPoolSamplingModeINTEL),
};
pub const QueryPoolCreateInfoINTEL = QueryPoolPerformanceQueryCreateInfoINTEL;
pub const PerformanceMarkerInfoINTEL = extern struct {
    s_type: StructureType = StructureType.performance_marker_info_intel,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    marker: u64 = @import("std").mem.zeroes(u64),
};
pub const PerformanceStreamMarkerInfoINTEL = extern struct {
    s_type: StructureType = StructureType.performance_stream_marker_info_intel,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    marker: u32 = @import("std").mem.zeroes(u32),
};
pub const PerformanceOverrideInfoINTEL = extern struct {
    s_type: StructureType = StructureType.performance_override_info_intel,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: PerformanceOverrideTypeINTEL = @import("std").mem.zeroes(PerformanceOverrideTypeINTEL),
    enable: Bool32 = @import("std").mem.zeroes(Bool32),
    parameter: u64 = @import("std").mem.zeroes(u64),
};
pub const PerformanceConfigurationAcquireInfoINTEL = extern struct {
    s_type: StructureType = StructureType.performance_configuration_acquire_info_intel,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: PerformanceConfigurationTypeINTEL = @import("std").mem.zeroes(PerformanceConfigurationTypeINTEL),
};
pub const PFN_initializePerformanceApiINTEL = ?*const fn (Device, [*c]const InitializePerformanceApiInfoINTEL) callconv(.c) Result;
pub const PFN_uninitializePerformanceApiINTEL = ?*const fn (Device) callconv(.c) void;
pub const PFN_cmdSetPerformanceMarkerINTEL = ?*const fn (CommandBuffer, [*c]const PerformanceMarkerInfoINTEL) callconv(.c) Result;
pub const PFN_cmdSetPerformanceStreamMarkerINTEL = ?*const fn (CommandBuffer, [*c]const PerformanceStreamMarkerInfoINTEL) callconv(.c) Result;
pub const PFN_cmdSetPerformanceOverrideINTEL = ?*const fn (CommandBuffer, [*c]const PerformanceOverrideInfoINTEL) callconv(.c) Result;
pub const PFN_acquirePerformanceConfigurationINTEL = ?*const fn (Device, [*c]const PerformanceConfigurationAcquireInfoINTEL, [*c]PerformanceConfigurationINTEL) callconv(.c) Result;
pub const PFN_releasePerformanceConfigurationINTEL = ?*const fn (Device, PerformanceConfigurationINTEL) callconv(.c) Result;
pub const PFN_queueSetPerformanceConfigurationINTEL = ?*const fn (Queue, PerformanceConfigurationINTEL) callconv(.c) Result;
pub const PFN_getPerformanceParameterINTEL = ?*const fn (Device, PerformanceParameterTypeINTEL, [*c]PerformanceValueINTEL) callconv(.c) Result;
pub extern fn initializePerformanceApiINTEL(device: Device, p_initialize_info: [*c]const InitializePerformanceApiInfoINTEL) Result;
pub extern fn uninitializePerformanceApiINTEL(device: Device) void;
pub extern fn cmdSetPerformanceMarkerINTEL(command_buffer: CommandBuffer, p_marker_info: [*c]const PerformanceMarkerInfoINTEL) Result;
pub extern fn cmdSetPerformanceStreamMarkerINTEL(command_buffer: CommandBuffer, p_marker_info: [*c]const PerformanceStreamMarkerInfoINTEL) Result;
pub extern fn cmdSetPerformanceOverrideINTEL(command_buffer: CommandBuffer, p_override_info: [*c]const PerformanceOverrideInfoINTEL) Result;
pub extern fn acquirePerformanceConfigurationINTEL(device: Device, p_acquire_info: [*c]const PerformanceConfigurationAcquireInfoINTEL, p_configuration: [*c]PerformanceConfigurationINTEL) Result;
pub extern fn releasePerformanceConfigurationINTEL(device: Device, configuration: PerformanceConfigurationINTEL) Result;
pub extern fn queueSetPerformanceConfigurationINTEL(queue: Queue, configuration: PerformanceConfigurationINTEL) Result;
pub extern fn getPerformanceParameterINTEL(device: Device, parameter: PerformanceParameterTypeINTEL, p_value: [*c]PerformanceValueINTEL) Result;
pub const PhysicalDevicePCIBusInfoPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_pcibus_info_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pci_domain: u32 = @import("std").mem.zeroes(u32),
    pci_bus: u32 = @import("std").mem.zeroes(u32),
    pci_device: u32 = @import("std").mem.zeroes(u32),
    pci_function: u32 = @import("std").mem.zeroes(u32),
};
pub const DisplayNativeHdrSurfaceCapabilitiesAMD = extern struct {
    s_type: StructureType = StructureType.display_native_hdr_surface_capabilities_amd,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    local_dimming_support: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SwapchainDisplayNativeHdrCreateInfoAMD = extern struct {
    s_type: StructureType = StructureType.swapchain_display_native_hdr_create_info_amd,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    local_dimming_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_setLocalDimmingAMD = ?*const fn (Device, SwapchainKHR, Bool32) callconv(.c) void;
pub extern fn setLocalDimmingAMD(device: Device, swap_chain: SwapchainKHR, local_dimming_enable: Bool32) void;
pub const PhysicalDeviceFragmentDensityMapFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_density_map_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_density_map: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_density_map_dynamic: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_density_map_non_subsampled_images: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentDensityMapPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_density_map_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_fragment_density_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_fragment_density_texel_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    fragment_density_invocations: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RenderPassFragmentDensityMapCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.render_pass_fragment_density_map_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    fragment_density_map_attachment: AttachmentReference = @import("std").mem.zeroes(AttachmentReference),
};
pub const PhysicalDeviceScalarBlockLayoutFeaturesEXT = PhysicalDeviceScalarBlockLayoutFeatures;
pub const PhysicalDeviceSubgroupSizeControlFeaturesEXT = PhysicalDeviceSubgroupSizeControlFeatures;
pub const PhysicalDeviceSubgroupSizeControlPropertiesEXT = PhysicalDeviceSubgroupSizeControlProperties;
pub const PipelineShaderStageRequiredSubgroupSizeCreateInfoEXT = PipelineShaderStageRequiredSubgroupSizeCreateInfo;
pub const ShaderCorePropertiesFlagsAMD = enum(u32) {
    null = 0,
};
pub const PhysicalDeviceShaderCoreProperties2AMD = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_core_properties2amd,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_core_features: ShaderCorePropertiesFlagsAMD = @import("std").mem.zeroes(ShaderCorePropertiesFlagsAMD),
    active_compute_unit_count: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceCoherentMemoryFeaturesAMD = extern struct {
    s_type: StructureType = StructureType.physical_device_coherent_memory_features_amd,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_coherent_memory: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderImageAtomicInt64FeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_image_atomic_int64features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_image_int64atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_image_int64atomics: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMemoryBudgetPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_memory_budget_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    heap_budget: [16]DeviceSize = @import("std").mem.zeroes([16]DeviceSize),
    heap_usage: [16]DeviceSize = @import("std").mem.zeroes([16]DeviceSize),
};
pub const PhysicalDeviceMemoryPriorityFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_memory_priority_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_priority: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MemoryPriorityAllocateInfoEXT = extern struct {
    s_type: StructureType = StructureType.memory_priority_allocate_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    priority: f32 = @import("std").mem.zeroes(f32),
};
pub const PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_dedicated_allocation_image_aliasing_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    dedicated_allocation_image_aliasing: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceBufferDeviceAddressFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_buffer_device_address_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    buffer_device_address: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    buffer_device_address_multi_device: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceBufferAddressFeaturesEXT = PhysicalDeviceBufferDeviceAddressFeaturesEXT;
pub const BufferDeviceAddressInfoEXT = BufferDeviceAddressInfo;
pub const BufferDeviceAddressCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.buffer_device_address_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const PFN_getBufferDeviceAddressEXT = ?*const fn (Device, [*c]const BufferDeviceAddressInfo) callconv(.c) DeviceAddress;
pub extern fn getBufferDeviceAddressEXT(device: Device, p_info: [*c]const BufferDeviceAddressInfo) DeviceAddress;
pub const ToolPurposeFlagsEXT = ToolPurposeFlags;
pub const PhysicalDeviceToolPropertiesEXT = PhysicalDeviceToolProperties;
pub const PFN_getPhysicalDeviceToolPropertiesEXT = ?*const fn (PhysicalDevice, [*c]u32, [*c]PhysicalDeviceToolProperties) callconv(.c) Result;
pub extern fn getPhysicalDeviceToolPropertiesEXT(physical_device: PhysicalDevice, p_tool_count: [*c]u32, p_tool_properties: [*c]PhysicalDeviceToolProperties) Result;
pub const ImageStencilUsageCreateInfoEXT = ImageStencilUsageCreateInfo;
pub const ValidationFeatureEnableEXT = enum(u32) {
    gpu_assisted_ext = 0,
    gpu_assisted_reserve_binding_slot_ext = 1,
    best_practices_ext = 2,
    debug_printf_ext = 3,
    synchronization_validation_ext = 4,
};
pub const ValidationFeatureDisableEXT = enum(u32) {
    all_ext = 0,
    shaders_ext = 1,
    thread_safety_ext = 2,
    api_parameters_ext = 3,
    object_lifetimes_ext = 4,
    core_checks_ext = 5,
    unique_handles_ext = 6,
    shader_validation_cache_ext = 7,
};
pub const ValidationFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.validation_features_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    enabled_validation_feature_count: u32 = @import("std").mem.zeroes(u32),
    p_enabled_validation_features: [*c]const ValidationFeatureEnableEXT = @import("std").mem.zeroes([*c]const ValidationFeatureEnableEXT),
    disabled_validation_feature_count: u32 = @import("std").mem.zeroes(u32),
    p_disabled_validation_features: [*c]const ValidationFeatureDisableEXT = @import("std").mem.zeroes([*c]const ValidationFeatureDisableEXT),
};
pub const ComponentTypeNV = ComponentTypeKHR;
pub const ScopeNV = ScopeKHR;
pub const CooperativeMatrixPropertiesNV = extern struct {
    s_type: StructureType = StructureType.cooperative_matrix_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    Msize: u32 = @import("std").mem.zeroes(u32),
    Nsize: u32 = @import("std").mem.zeroes(u32),
    Ksize: u32 = @import("std").mem.zeroes(u32),
    Atype: ComponentTypeNV = @import("std").mem.zeroes(ComponentTypeNV),
    Btype: ComponentTypeNV = @import("std").mem.zeroes(ComponentTypeNV),
    Ctype: ComponentTypeNV = @import("std").mem.zeroes(ComponentTypeNV),
    Dtype: ComponentTypeNV = @import("std").mem.zeroes(ComponentTypeNV),
    scope: ScopeNV = @import("std").mem.zeroes(ScopeNV),
};
pub const PhysicalDeviceCooperativeMatrixFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_cooperative_matrix_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cooperative_matrix: Bool32 = @import("std").mem.zeroes(Bool32),
    cooperative_matrix_robust_buffer_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceCooperativeMatrixPropertiesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_cooperative_matrix_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cooperative_matrix_supported_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
};
pub const PFN_getPhysicalDeviceCooperativeMatrixPropertiesNV = ?*const fn (PhysicalDevice, [*c]u32, [*c]CooperativeMatrixPropertiesNV) callconv(.c) Result;
pub extern fn getPhysicalDeviceCooperativeMatrixPropertiesNV(physical_device: PhysicalDevice, p_property_count: [*c]u32, p_properties: [*c]CooperativeMatrixPropertiesNV) Result;
pub const CoverageReductionModeNV = enum(u32) {
    merge_nv = 0,
    truncate_nv = 1,
};
pub const PipelineCoverageReductionStateCreateFlagsNV = Flags;
pub const PhysicalDeviceCoverageReductionModeFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_coverage_reduction_mode_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    coverage_reduction_mode: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineCoverageReductionStateCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.pipeline_coverage_reduction_state_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCoverageReductionStateCreateFlagsNV = @import("std").mem.zeroes(PipelineCoverageReductionStateCreateFlagsNV),
    coverage_reduction_mode: CoverageReductionModeNV = @import("std").mem.zeroes(CoverageReductionModeNV),
};
pub const FramebufferMixedSamplesCombinationNV = extern struct {
    s_type: StructureType = StructureType.framebuffer_mixed_samples_combination_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    coverage_reduction_mode: CoverageReductionModeNV = @import("std").mem.zeroes(CoverageReductionModeNV),
    rasterization_samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    depth_stencil_samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
    color_samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
};
pub const PFN_getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV = ?*const fn (PhysicalDevice, [*c]u32, [*c]FramebufferMixedSamplesCombinationNV) callconv(.c) Result;
pub extern fn getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV(physical_device: PhysicalDevice, p_combination_count: [*c]u32, p_combinations: [*c]FramebufferMixedSamplesCombinationNV) Result;
pub const PhysicalDeviceFragmentShaderInterlockFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_shader_interlock_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_shader_sample_interlock: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shader_pixel_interlock: Bool32 = @import("std").mem.zeroes(Bool32),
    fragment_shader_shading_rate_interlock: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceYcbcrImageArraysFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_ycbcr_image_arrays_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ycbcr_image_arrays: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ProvokingVertexModeEXT = enum(u32) {
    first_vertex_ext = 0,
    last_vertex_ext = 1,
};
pub const PhysicalDeviceProvokingVertexFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_provoking_vertex_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    provoking_vertex_last: Bool32 = @import("std").mem.zeroes(Bool32),
    transform_feedback_preserves_provoking_vertex: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceProvokingVertexPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_provoking_vertex_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    provoking_vertex_mode_per_pipeline: Bool32 = @import("std").mem.zeroes(Bool32),
    transform_feedback_preserves_triangle_fan_provoking_vertex: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineRasterizationProvokingVertexStateCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.pipeline_rasterization_provoking_vertex_state_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    provoking_vertex_mode: ProvokingVertexModeEXT = @import("std").mem.zeroes(ProvokingVertexModeEXT),
};
pub const HeadlessSurfaceCreateFlagsEXT = Flags;
pub const HeadlessSurfaceCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.headless_surface_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: HeadlessSurfaceCreateFlagsEXT = @import("std").mem.zeroes(HeadlessSurfaceCreateFlagsEXT),
};
pub const PFN_createHeadlessSurfaceEXT = ?*const fn (Instance, [*c]const HeadlessSurfaceCreateInfoEXT, [*c]const AllocationCallbacks, [*c]SurfaceKHR) callconv(.c) Result;
pub extern fn createHeadlessSurfaceEXT(instance: Instance, p_create_info: [*c]const HeadlessSurfaceCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_surface: [*c]SurfaceKHR) Result;
pub const LineRasterizationModeEXT = LineRasterizationModeKHR;
pub const PhysicalDeviceLineRasterizationFeaturesEXT = PhysicalDeviceLineRasterizationFeaturesKHR;
pub const PhysicalDeviceLineRasterizationPropertiesEXT = PhysicalDeviceLineRasterizationPropertiesKHR;
pub const PipelineRasterizationLineStateCreateInfoEXT = PipelineRasterizationLineStateCreateInfoKHR;
pub const PFN_cmdSetLineStippleEXT = ?*const fn (CommandBuffer, u32, u16) callconv(.c) void;
pub extern fn cmdSetLineStippleEXT(command_buffer: CommandBuffer, line_stipple_factor: u32, line_stipple_pattern: u16) void;
pub const PhysicalDeviceShaderAtomicFloatFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_atomic_float_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_buffer_float32atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float32atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float64atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float64atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float32atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float32atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float64atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float64atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_image_float32atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_image_float32atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_image_float32atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_image_float32atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceHostQueryResetFeaturesEXT = PhysicalDeviceHostQueryResetFeatures;
pub const PFN_resetQueryPoolEXT = ?*const fn (Device, QueryPool, u32, u32) callconv(.c) void;
pub extern fn resetQueryPoolEXT(device: Device, query_pool: QueryPool, first_query: u32, query_count: u32) void;
pub const PhysicalDeviceIndexTypeUint8FeaturesEXT = PhysicalDeviceIndexTypeUint8FeaturesKHR;
pub const PhysicalDeviceExtendedDynamicStateFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_extended_dynamic_state_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    extended_dynamic_state: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdSetCullModeEXT = ?*const fn (CommandBuffer, CullModeFlags) callconv(.c) void;
pub const PFN_cmdSetFrontFaceEXT = ?*const fn (CommandBuffer, FrontFace) callconv(.c) void;
pub const PFN_cmdSetPrimitiveTopologyEXT = ?*const fn (CommandBuffer, PrimitiveTopology) callconv(.c) void;
pub const PFN_cmdSetViewportWithCountEXT = ?*const fn (CommandBuffer, u32, [*c]const Viewport) callconv(.c) void;
pub const PFN_cmdSetScissorWithCountEXT = ?*const fn (CommandBuffer, u32, [*c]const Rect2D) callconv(.c) void;
pub const PFN_cmdBindVertexBuffers2EXT = ?*const fn (CommandBuffer, u32, u32, [*c]const Buffer, [*c]const DeviceSize, [*c]const DeviceSize, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdSetDepthTestEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthWriteEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthCompareOpEXT = ?*const fn (CommandBuffer, CompareOp) callconv(.c) void;
pub const PFN_cmdSetDepthBoundsTestEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetStencilTestEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetStencilOpEXT = ?*const fn (CommandBuffer, StencilFaceFlags, StencilOp, StencilOp, StencilOp, CompareOp) callconv(.c) void;
pub extern fn cmdSetCullModeEXT(command_buffer: CommandBuffer, cull_mode: CullModeFlags) void;
pub extern fn cmdSetFrontFaceEXT(command_buffer: CommandBuffer, front_face: FrontFace) void;
pub extern fn cmdSetPrimitiveTopologyEXT(command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology) void;
pub extern fn cmdSetViewportWithCountEXT(command_buffer: CommandBuffer, viewport_count: u32, p_viewports: [*c]const Viewport) void;
pub extern fn cmdSetScissorWithCountEXT(command_buffer: CommandBuffer, scissor_count: u32, p_scissors: [*c]const Rect2D) void;
pub extern fn cmdBindVertexBuffers2EXT(command_buffer: CommandBuffer, first_binding: u32, binding_count: u32, p_buffers: [*c]const Buffer, p_offsets: [*c]const DeviceSize, p_sizes: [*c]const DeviceSize, p_strides: [*c]const DeviceSize) void;
pub extern fn cmdSetDepthTestEnableEXT(command_buffer: CommandBuffer, depth_test_enable: Bool32) void;
pub extern fn cmdSetDepthWriteEnableEXT(command_buffer: CommandBuffer, depth_write_enable: Bool32) void;
pub extern fn cmdSetDepthCompareOpEXT(command_buffer: CommandBuffer, depth_compare_op: CompareOp) void;
pub extern fn cmdSetDepthBoundsTestEnableEXT(command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32) void;
pub extern fn cmdSetStencilTestEnableEXT(command_buffer: CommandBuffer, stencil_test_enable: Bool32) void;
pub extern fn cmdSetStencilOpEXT(command_buffer: CommandBuffer, face_mask: StencilFaceFlags, fail_op: StencilOp, pass_op: StencilOp, depth_fail_op: StencilOp, compare_op: CompareOp) void;
pub const HostImageCopyFlagsEXT = enum(u32) {
    null = 0,
    memcpy_ext = 1,
};
pub const PhysicalDeviceHostImageCopyFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_host_image_copy_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    host_image_copy: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceHostImageCopyPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_host_image_copy_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    copy_src_layout_count: u32 = @import("std").mem.zeroes(u32),
    p_copy_src_layouts: [*c]ImageLayout = @import("std").mem.zeroes([*c]ImageLayout),
    copy_dst_layout_count: u32 = @import("std").mem.zeroes(u32),
    p_copy_dst_layouts: [*c]ImageLayout = @import("std").mem.zeroes([*c]ImageLayout),
    optimal_tiling_layout_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    identical_memory_type_requirements: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MemoryToImageCopyEXT = extern struct {
    s_type: StructureType = StructureType.memory_to_image_copy_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_host_pointer: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    memory_row_length: u32 = @import("std").mem.zeroes(u32),
    memory_image_height: u32 = @import("std").mem.zeroes(u32),
    image_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    image_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    image_extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const ImageToMemoryCopyEXT = extern struct {
    s_type: StructureType = StructureType.image_to_memory_copy_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_host_pointer: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_row_length: u32 = @import("std").mem.zeroes(u32),
    memory_image_height: u32 = @import("std").mem.zeroes(u32),
    image_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    image_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    image_extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const CopyMemoryToImageInfoEXT = extern struct {
    s_type: StructureType = StructureType.copy_memory_to_image_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: HostImageCopyFlagsEXT = @import("std").mem.zeroes(HostImageCopyFlagsEXT),
    dst_image: Image = @import("std").mem.zeroes(Image),
    dst_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const MemoryToImageCopyEXT = @import("std").mem.zeroes([*c]const MemoryToImageCopyEXT),
};
pub const CopyImageToMemoryInfoEXT = extern struct {
    s_type: StructureType = StructureType.copy_image_to_memory_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: HostImageCopyFlagsEXT = @import("std").mem.zeroes(HostImageCopyFlagsEXT),
    src_image: Image = @import("std").mem.zeroes(Image),
    src_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const ImageToMemoryCopyEXT = @import("std").mem.zeroes([*c]const ImageToMemoryCopyEXT),
};
pub const CopyImageToImageInfoEXT = extern struct {
    s_type: StructureType = StructureType.copy_image_to_image_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: HostImageCopyFlagsEXT = @import("std").mem.zeroes(HostImageCopyFlagsEXT),
    src_image: Image = @import("std").mem.zeroes(Image),
    src_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    dst_image: Image = @import("std").mem.zeroes(Image),
    dst_image_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const ImageCopy2 = @import("std").mem.zeroes([*c]const ImageCopy2),
};
pub const HostImageLayoutTransitionInfoEXT = extern struct {
    s_type: StructureType = StructureType.host_image_layout_transition_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
    old_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    new_layout: ImageLayout = @import("std").mem.zeroes(ImageLayout),
    subresource_range: ImageSubresourceRange = @import("std").mem.zeroes(ImageSubresourceRange),
};
pub const SubresourceHostMemcpySizeEXT = extern struct {
    s_type: StructureType = StructureType.subresource_host_memcpy_size_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const HostImageCopyDevicePerformanceQueryEXT = extern struct {
    s_type: StructureType = StructureType.host_image_copy_device_performance_query_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    optimal_device_access: Bool32 = @import("std").mem.zeroes(Bool32),
    identical_memory_layout: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SubresourceLayout2EXT = SubresourceLayout2KHR;
pub const ImageSubresource2EXT = ImageSubresource2KHR;
pub const PFN_copyMemoryToImageEXT = ?*const fn (Device, [*c]const CopyMemoryToImageInfoEXT) callconv(.c) Result;
pub const PFN_copyImageToMemoryEXT = ?*const fn (Device, [*c]const CopyImageToMemoryInfoEXT) callconv(.c) Result;
pub const PFN_copyImageToImageEXT = ?*const fn (Device, [*c]const CopyImageToImageInfoEXT) callconv(.c) Result;
pub const PFN_transitionImageLayoutEXT = ?*const fn (Device, u32, [*c]const HostImageLayoutTransitionInfoEXT) callconv(.c) Result;
pub const PFN_getImageSubresourceLayout2EXT = ?*const fn (Device, Image, [*c]const ImageSubresource2KHR, [*c]SubresourceLayout2KHR) callconv(.c) void;
pub extern fn copyMemoryToImageEXT(device: Device, p_copy_memory_to_image_info: [*c]const CopyMemoryToImageInfoEXT) Result;
pub extern fn copyImageToMemoryEXT(device: Device, p_copy_image_to_memory_info: [*c]const CopyImageToMemoryInfoEXT) Result;
pub extern fn copyImageToImageEXT(device: Device, p_copy_image_to_image_info: [*c]const CopyImageToImageInfoEXT) Result;
pub extern fn transitionImageLayoutEXT(device: Device, transition_count: u32, p_transitions: [*c]const HostImageLayoutTransitionInfoEXT) Result;
pub extern fn getImageSubresourceLayout2EXT(device: Device, image: Image, p_subresource: [*c]const ImageSubresource2KHR, p_layout: [*c]SubresourceLayout2KHR) void;
pub const PhysicalDeviceMapMemoryPlacedFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_map_memory_placed_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_map_placed: Bool32 = @import("std").mem.zeroes(Bool32),
    memory_map_range_placed: Bool32 = @import("std").mem.zeroes(Bool32),
    memory_unmap_reserve: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMapMemoryPlacedPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_map_memory_placed_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_placed_memory_map_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const MemoryMapPlacedInfoEXT = extern struct {
    s_type: StructureType = StructureType.memory_map_placed_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_placed_address: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PhysicalDeviceShaderAtomicFloat2FeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_atomic_float2features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_buffer_float16atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float16atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float16atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float32atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_buffer_float64atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float16atomics: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float16atomic_add: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float16atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float32atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_shared_float64atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_image_float32atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
    sparse_image_float32atomic_min_max: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PresentScalingFlagsEXT = enum(u32) {
    null = 0,
    one_to_one_bit_ext = 1,
    aspect_ratio_stretch_bit_ext = 2,
    stretch_bit_ext = 4,
};
pub const PresentGravityFlagsEXT = enum(u32) {
    null = 0,
    min_bit_ext = 1,
    max_bit_ext = 2,
    centered_bit_ext = 4,
};
pub const SurfacePresentModeEXT = extern struct {
    s_type: StructureType = StructureType.surface_present_mode_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_mode: PresentModeKHR = @import("std").mem.zeroes(PresentModeKHR),
};
pub const SurfacePresentScalingCapabilitiesEXT = extern struct {
    s_type: StructureType = StructureType.surface_present_scaling_capabilities_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supported_present_scaling: PresentScalingFlagsEXT = @import("std").mem.zeroes(PresentScalingFlagsEXT),
    supported_present_gravity_x: PresentGravityFlagsEXT = @import("std").mem.zeroes(PresentGravityFlagsEXT),
    supported_present_gravity_y: PresentGravityFlagsEXT = @import("std").mem.zeroes(PresentGravityFlagsEXT),
    min_scaled_image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_scaled_image_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const SurfacePresentModeCompatibilityEXT = extern struct {
    s_type: StructureType = StructureType.surface_present_mode_compatibility_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_mode_count: u32 = @import("std").mem.zeroes(u32),
    p_present_modes: [*c]PresentModeKHR = @import("std").mem.zeroes([*c]PresentModeKHR),
};
pub const PhysicalDeviceSwapchainMaintenance1FeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_swapchain_maintenance1features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    swapchain_maintenance1: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SwapchainPresentFenceInfoEXT = extern struct {
    s_type: StructureType = StructureType.swapchain_present_fence_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_fences: [*c]const Fence = @import("std").mem.zeroes([*c]const Fence),
};
pub const SwapchainPresentModesCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.swapchain_present_modes_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    present_mode_count: u32 = @import("std").mem.zeroes(u32),
    p_present_modes: [*c]const PresentModeKHR = @import("std").mem.zeroes([*c]const PresentModeKHR),
};
pub const SwapchainPresentModeInfoEXT = extern struct {
    s_type: StructureType = StructureType.swapchain_present_mode_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain_count: u32 = @import("std").mem.zeroes(u32),
    p_present_modes: [*c]const PresentModeKHR = @import("std").mem.zeroes([*c]const PresentModeKHR),
};
pub const SwapchainPresentScalingCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.swapchain_present_scaling_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    scaling_behavior: PresentScalingFlagsEXT = @import("std").mem.zeroes(PresentScalingFlagsEXT),
    present_gravity_x: PresentGravityFlagsEXT = @import("std").mem.zeroes(PresentGravityFlagsEXT),
    present_gravity_y: PresentGravityFlagsEXT = @import("std").mem.zeroes(PresentGravityFlagsEXT),
};
pub const ReleaseSwapchainImagesInfoEXT = extern struct {
    s_type: StructureType = StructureType.release_swapchain_images_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    swapchain: SwapchainKHR = @import("std").mem.zeroes(SwapchainKHR),
    image_index_count: u32 = @import("std").mem.zeroes(u32),
    p_image_indices: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const PFN_releaseSwapchainImagesEXT = ?*const fn (Device, [*c]const ReleaseSwapchainImagesInfoEXT) callconv(.c) Result;
pub extern fn releaseSwapchainImagesEXT(device: Device, p_release_info: [*c]const ReleaseSwapchainImagesInfoEXT) Result;
pub const PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT = PhysicalDeviceShaderDemoteToHelperInvocationFeatures;
pub const IndirectCommandsLayoutNV = enum(u64) { null = 0, _ };
pub const IndirectCommandsTokenTypeNV = enum(u32) {
    shader_group_nv = 0,
    state_flags_nv = 1,
    index_buffer_nv = 2,
    vertex_buffer_nv = 3,
    push_constant_nv = 4,
    draw_indexed_nv = 5,
    draw_nv = 6,
    draw_tasks_nv = 7,
    draw_mesh_tasks_nv = 1000328000,
    pipeline_nv = 1000428003,
    dispatch_nv = 1000428004,
};
pub const IndirectStateFlagsNV = enum(u32) {
    null = 0,
    frontface_bit_nv = 1,
};
pub const IndirectCommandsLayoutUsageFlagsNV = enum(u32) {
    null = 0,
    explicit_preprocess_bit_nv = 1,
    indexed_sequences_bit_nv = 2,
    unordered_sequences_bit_nv = 4,
};
pub const PhysicalDeviceDeviceGeneratedCommandsPropertiesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_device_generated_commands_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_graphics_shader_group_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_sequence_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_token_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_stream_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_token_offset: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_stream_stride: u32 = @import("std").mem.zeroes(u32),
    min_sequences_count_buffer_offset_alignment: u32 = @import("std").mem.zeroes(u32),
    min_sequences_index_buffer_offset_alignment: u32 = @import("std").mem.zeroes(u32),
    min_indirect_commands_buffer_offset_alignment: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceDeviceGeneratedCommandsFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_device_generated_commands_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_generated_commands: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const GraphicsShaderGroupCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.graphics_shader_group_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stage_count: u32 = @import("std").mem.zeroes(u32),
    p_stages: [*c]const PipelineShaderStageCreateInfo = @import("std").mem.zeroes([*c]const PipelineShaderStageCreateInfo),
    p_vertex_input_state: [*c]const PipelineVertexInputStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineVertexInputStateCreateInfo),
    p_tessellation_state: [*c]const PipelineTessellationStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineTessellationStateCreateInfo),
};
pub const GraphicsPipelineShaderGroupsCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.graphics_pipeline_shader_groups_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    group_count: u32 = @import("std").mem.zeroes(u32),
    p_groups: [*c]const GraphicsShaderGroupCreateInfoNV = @import("std").mem.zeroes([*c]const GraphicsShaderGroupCreateInfoNV),
    pipeline_count: u32 = @import("std").mem.zeroes(u32),
    p_pipelines: [*c]const Pipeline = @import("std").mem.zeroes([*c]const Pipeline),
};
pub const BindShaderGroupIndirectCommandNV = extern struct {
    group_index: u32 = @import("std").mem.zeroes(u32),
};
pub const BindIndexBufferIndirectCommandNV = extern struct {
    buffer_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: u32 = @import("std").mem.zeroes(u32),
    index_type: IndexType = @import("std").mem.zeroes(IndexType),
};
pub const BindVertexBufferIndirectCommandNV = extern struct {
    buffer_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: u32 = @import("std").mem.zeroes(u32),
    stride: u32 = @import("std").mem.zeroes(u32),
};
pub const SetStateFlagsIndirectCommandNV = extern struct {
    data: u32 = @import("std").mem.zeroes(u32),
};
pub const IndirectCommandsStreamNV = extern struct {
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const IndirectCommandsLayoutTokenNV = extern struct {
    s_type: StructureType = StructureType.indirect_commands_layout_token_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    token_type: IndirectCommandsTokenTypeNV = @import("std").mem.zeroes(IndirectCommandsTokenTypeNV),
    stream: u32 = @import("std").mem.zeroes(u32),
    offset: u32 = @import("std").mem.zeroes(u32),
    vertex_binding_unit: u32 = @import("std").mem.zeroes(u32),
    vertex_dynamic_stride: Bool32 = @import("std").mem.zeroes(Bool32),
    pushconstant_pipeline_layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    pushconstant_shader_stage_flags: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    pushconstant_offset: u32 = @import("std").mem.zeroes(u32),
    pushconstant_size: u32 = @import("std").mem.zeroes(u32),
    indirect_state_flags: IndirectStateFlagsNV = @import("std").mem.zeroes(IndirectStateFlagsNV),
    index_type_count: u32 = @import("std").mem.zeroes(u32),
    p_index_types: [*c]const IndexType = @import("std").mem.zeroes([*c]const IndexType),
    p_index_type_values: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const IndirectCommandsLayoutCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.indirect_commands_layout_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: IndirectCommandsLayoutUsageFlagsNV = @import("std").mem.zeroes(IndirectCommandsLayoutUsageFlagsNV),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    token_count: u32 = @import("std").mem.zeroes(u32),
    p_tokens: [*c]const IndirectCommandsLayoutTokenNV = @import("std").mem.zeroes([*c]const IndirectCommandsLayoutTokenNV),
    stream_count: u32 = @import("std").mem.zeroes(u32),
    p_stream_strides: [*c]const u32 = @import("std").mem.zeroes([*c]const u32),
};
pub const GeneratedCommandsInfoNV = extern struct {
    s_type: StructureType = StructureType.generated_commands_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
    indirect_commands_layout: IndirectCommandsLayoutNV = @import("std").mem.zeroes(IndirectCommandsLayoutNV),
    stream_count: u32 = @import("std").mem.zeroes(u32),
    p_streams: [*c]const IndirectCommandsStreamNV = @import("std").mem.zeroes([*c]const IndirectCommandsStreamNV),
    sequences_count: u32 = @import("std").mem.zeroes(u32),
    preprocess_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    preprocess_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    preprocess_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    sequences_count_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    sequences_count_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    sequences_index_buffer: Buffer = @import("std").mem.zeroes(Buffer),
    sequences_index_offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const GeneratedCommandsMemoryRequirementsInfoNV = extern struct {
    s_type: StructureType = StructureType.generated_commands_memory_requirements_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
    indirect_commands_layout: IndirectCommandsLayoutNV = @import("std").mem.zeroes(IndirectCommandsLayoutNV),
    max_sequences_count: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_getGeneratedCommandsMemoryRequirementsNV = ?*const fn (Device, [*c]const GeneratedCommandsMemoryRequirementsInfoNV, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_cmdPreprocessGeneratedCommandsNV = ?*const fn (CommandBuffer, [*c]const GeneratedCommandsInfoNV) callconv(.c) void;
pub const PFN_cmdExecuteGeneratedCommandsNV = ?*const fn (CommandBuffer, Bool32, [*c]const GeneratedCommandsInfoNV) callconv(.c) void;
pub const PFN_cmdBindPipelineShaderGroupNV = ?*const fn (CommandBuffer, PipelineBindPoint, Pipeline, u32) callconv(.c) void;
pub const PFN_createIndirectCommandsLayoutNV = ?*const fn (Device, [*c]const IndirectCommandsLayoutCreateInfoNV, [*c]const AllocationCallbacks, [*c]IndirectCommandsLayoutNV) callconv(.c) Result;
pub const PFN_destroyIndirectCommandsLayoutNV = ?*const fn (Device, IndirectCommandsLayoutNV, [*c]const AllocationCallbacks) callconv(.c) void;
pub extern fn getGeneratedCommandsMemoryRequirementsNV(device: Device, p_info: [*c]const GeneratedCommandsMemoryRequirementsInfoNV, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn cmdPreprocessGeneratedCommandsNV(command_buffer: CommandBuffer, p_generated_commands_info: [*c]const GeneratedCommandsInfoNV) void;
pub extern fn cmdExecuteGeneratedCommandsNV(command_buffer: CommandBuffer, is_preprocessed: Bool32, p_generated_commands_info: [*c]const GeneratedCommandsInfoNV) void;
pub extern fn cmdBindPipelineShaderGroupNV(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, pipeline: Pipeline, group_index: u32) void;
pub extern fn createIndirectCommandsLayoutNV(device: Device, p_create_info: [*c]const IndirectCommandsLayoutCreateInfoNV, p_allocator: [*c]const AllocationCallbacks, p_indirect_commands_layout: [*c]IndirectCommandsLayoutNV) Result;
pub extern fn destroyIndirectCommandsLayoutNV(device: Device, indirect_commands_layout: IndirectCommandsLayoutNV, p_allocator: [*c]const AllocationCallbacks) void;
pub const PhysicalDeviceInheritedViewportScissorFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_inherited_viewport_scissor_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    inherited_viewport_scissor2d: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const CommandBufferInheritanceViewportScissorInfoNV = extern struct {
    s_type: StructureType = StructureType.command_buffer_inheritance_viewport_scissor_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    viewport_scissor2d: Bool32 = @import("std").mem.zeroes(Bool32),
    viewport_depth_count: u32 = @import("std").mem.zeroes(u32),
    p_viewport_depths: [*c]const Viewport = @import("std").mem.zeroes([*c]const Viewport),
};
pub const PhysicalDeviceTexelBufferAlignmentFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_texel_buffer_alignment_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    texel_buffer_alignment: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceTexelBufferAlignmentPropertiesEXT = PhysicalDeviceTexelBufferAlignmentProperties;
pub const RenderPassTransformBeginInfoQCOM = extern struct {
    s_type: StructureType = StructureType.render_pass_transform_begin_info_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    transform: SurfaceTransformFlagsKHR = @import("std").mem.zeroes(SurfaceTransformFlagsKHR),
};
pub const CommandBufferInheritanceRenderPassTransformInfoQCOM = extern struct {
    s_type: StructureType = StructureType.command_buffer_inheritance_render_pass_transform_info_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    transform: SurfaceTransformFlagsKHR = @import("std").mem.zeroes(SurfaceTransformFlagsKHR),
    render_area: Rect2D = @import("std").mem.zeroes(Rect2D),
};
pub const DepthBiasRepresentationEXT = enum(u32) {
    least_representable_value_format_ext = 0,
    least_representable_value_force_unorm_ext = 1,
    float_ext = 2,
};
pub const PhysicalDeviceDepthBiasControlFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_depth_bias_control_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    depth_bias_control: Bool32 = @import("std").mem.zeroes(Bool32),
    least_representable_value_force_unorm_representation: Bool32 = @import("std").mem.zeroes(Bool32),
    float_representation: Bool32 = @import("std").mem.zeroes(Bool32),
    depth_bias_exact: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DepthBiasInfoEXT = extern struct {
    s_type: StructureType = StructureType.depth_bias_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    depth_bias_constant_factor: f32 = @import("std").mem.zeroes(f32),
    depth_bias_clamp: f32 = @import("std").mem.zeroes(f32),
    depth_bias_slope_factor: f32 = @import("std").mem.zeroes(f32),
};
pub const DepthBiasRepresentationInfoEXT = extern struct {
    s_type: StructureType = StructureType.depth_bias_representation_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    depth_bias_representation: DepthBiasRepresentationEXT = @import("std").mem.zeroes(DepthBiasRepresentationEXT),
    depth_bias_exact: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdSetDepthBias2EXT = ?*const fn (CommandBuffer, [*c]const DepthBiasInfoEXT) callconv(.c) void;
pub extern fn cmdSetDepthBias2EXT(command_buffer: CommandBuffer, p_depth_bias_info: [*c]const DepthBiasInfoEXT) void;
pub const DeviceMemoryReportEventTypeEXT = enum(u32) {
    allocate_ext = 0,
    free_ext = 1,
    import_ext = 2,
    unimport_ext = 3,
    allocation_failed_ext = 4,
};
pub const DeviceMemoryReportFlagsEXT = Flags;
pub const PhysicalDeviceDeviceMemoryReportFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_device_memory_report_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_memory_report: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceMemoryReportCallbackDataEXT = extern struct {
    s_type: StructureType = StructureType.device_memory_report_callback_data_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: DeviceMemoryReportFlagsEXT = @import("std").mem.zeroes(DeviceMemoryReportFlagsEXT),
    type: DeviceMemoryReportEventTypeEXT = @import("std").mem.zeroes(DeviceMemoryReportEventTypeEXT),
    memory_object_id: u64 = @import("std").mem.zeroes(u64),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    object_type: ObjectType = @import("std").mem.zeroes(ObjectType),
    object_handle: u64 = @import("std").mem.zeroes(u64),
    heap_index: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_deviceMemoryReportCallbackEXT = ?*const fn ([*c]const DeviceMemoryReportCallbackDataEXT, ?*anyopaque) callconv(.c) void;
pub const DeviceDeviceMemoryReportCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.device_device_memory_report_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DeviceMemoryReportFlagsEXT = @import("std").mem.zeroes(DeviceMemoryReportFlagsEXT),
    pfn_user_callback: PFN_deviceMemoryReportCallbackEXT = @import("std").mem.zeroes(PFN_deviceMemoryReportCallbackEXT),
    p_user_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const PFN_acquireDrmDisplayEXT = ?*const fn (PhysicalDevice, i32, DisplayKHR) callconv(.c) Result;
pub const PFN_getDrmDisplayEXT = ?*const fn (PhysicalDevice, i32, u32, [*c]DisplayKHR) callconv(.c) Result;
pub extern fn acquireDrmDisplayEXT(physical_device: PhysicalDevice, drm_fd: i32, display: DisplayKHR) Result;
pub extern fn getDrmDisplayEXT(physical_device: PhysicalDevice, drm_fd: i32, connector_id: u32, display: [*c]DisplayKHR) Result;
pub const PhysicalDeviceRobustness2FeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_robustness2features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    robust_buffer_access2: Bool32 = @import("std").mem.zeroes(Bool32),
    robust_image_access2: Bool32 = @import("std").mem.zeroes(Bool32),
    null_descriptor: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRobustness2PropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_robustness2properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    robust_storage_buffer_access_size_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    robust_uniform_buffer_access_size_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const SamplerCustomBorderColorCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.sampler_custom_border_color_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    custom_border_color: ClearColorValue = @import("std").mem.zeroes(ClearColorValue),
    format: Format = @import("std").mem.zeroes(Format),
};
pub const PhysicalDeviceCustomBorderColorPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_custom_border_color_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_custom_border_color_samplers: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceCustomBorderColorFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_custom_border_color_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    custom_border_colors: Bool32 = @import("std").mem.zeroes(Bool32),
    custom_border_color_without_format: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePresentBarrierFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_present_barrier_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_barrier: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SurfaceCapabilitiesPresentBarrierNV = extern struct {
    s_type: StructureType = StructureType.surface_capabilities_present_barrier_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_barrier_supported: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SwapchainPresentBarrierCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.swapchain_present_barrier_create_info_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    present_barrier_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PrivateDataSlotEXT = PrivateDataSlot;
pub const PrivateDataSlotCreateFlagsEXT = PrivateDataSlotCreateFlags;
pub const PhysicalDevicePrivateDataFeaturesEXT = PhysicalDevicePrivateDataFeatures;
pub const DevicePrivateDataCreateInfoEXT = DevicePrivateDataCreateInfo;
pub const PrivateDataSlotCreateInfoEXT = PrivateDataSlotCreateInfo;
pub const PFN_createPrivateDataSlotEXT = ?*const fn (Device, [*c]const PrivateDataSlotCreateInfo, [*c]const AllocationCallbacks, [*c]PrivateDataSlot) callconv(.c) Result;
pub const PFN_destroyPrivateDataSlotEXT = ?*const fn (Device, PrivateDataSlot, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_setPrivateDataEXT = ?*const fn (Device, ObjectType, u64, PrivateDataSlot, u64) callconv(.c) Result;
pub const PFN_getPrivateDataEXT = ?*const fn (Device, ObjectType, u64, PrivateDataSlot, [*c]u64) callconv(.c) void;
pub extern fn createPrivateDataSlotEXT(device: Device, p_create_info: [*c]const PrivateDataSlotCreateInfo, p_allocator: [*c]const AllocationCallbacks, p_private_data_slot: [*c]PrivateDataSlot) Result;
pub extern fn destroyPrivateDataSlotEXT(device: Device, private_data_slot: PrivateDataSlot, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn setPrivateDataEXT(device: Device, object_type: ObjectType, object_handle: u64, private_data_slot: PrivateDataSlot, data: u64) Result;
pub extern fn getPrivateDataEXT(device: Device, object_type: ObjectType, object_handle: u64, private_data_slot: PrivateDataSlot, p_data: [*c]u64) void;
pub const PhysicalDevicePipelineCreationCacheControlFeaturesEXT = PhysicalDevicePipelineCreationCacheControlFeatures;
pub const DeviceDiagnosticsConfigFlagsNV = enum(u32) {
    null = 0,
    enable_shader_debug_info_bit_nv = 1,
    enable_resource_tracking_bit_nv = 2,
    enable_automatic_checkpoints_bit_nv = 4,
    enable_shader_error_reporting_bit_nv = 8,
};
pub const PhysicalDeviceDiagnosticsConfigFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_diagnostics_config_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    diagnostics_config: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceDiagnosticsConfigCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.device_diagnostics_config_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: DeviceDiagnosticsConfigFlagsNV = @import("std").mem.zeroes(DeviceDiagnosticsConfigFlagsNV),
};
pub const CudaModuleNV = enum(u64) { null = 0, _ };
pub const CudaFunctionNV = enum(u64) { null = 0, _ };
pub const CudaModuleCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.cuda_module_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    data_size: usize = @import("std").mem.zeroes(usize),
    p_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const CudaFunctionCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.cuda_function_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    module: CudaModuleNV = @import("std").mem.zeroes(CudaModuleNV),
    p_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const CudaLaunchInfoNV = extern struct {
    s_type: StructureType = StructureType.cuda_launch_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    function: CudaFunctionNV = @import("std").mem.zeroes(CudaFunctionNV),
    grid_dim_x: u32 = @import("std").mem.zeroes(u32),
    grid_dim_y: u32 = @import("std").mem.zeroes(u32),
    grid_dim_z: u32 = @import("std").mem.zeroes(u32),
    block_dim_x: u32 = @import("std").mem.zeroes(u32),
    block_dim_y: u32 = @import("std").mem.zeroes(u32),
    block_dim_z: u32 = @import("std").mem.zeroes(u32),
    shared_mem_bytes: u32 = @import("std").mem.zeroes(u32),
    param_count: usize = @import("std").mem.zeroes(usize),
    p_params: [*c]const ?*const anyopaque = @import("std").mem.zeroes([*c]const ?*const anyopaque),
    extra_count: usize = @import("std").mem.zeroes(usize),
    p_extras: [*c]const ?*const anyopaque = @import("std").mem.zeroes([*c]const ?*const anyopaque),
};
pub const PhysicalDeviceCudaKernelLaunchFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_cuda_kernel_launch_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cuda_kernel_launch_features: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceCudaKernelLaunchPropertiesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_cuda_kernel_launch_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    compute_capability_minor: u32 = @import("std").mem.zeroes(u32),
    compute_capability_major: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_createCudaModuleNV = ?*const fn (Device, [*c]const CudaModuleCreateInfoNV, [*c]const AllocationCallbacks, [*c]CudaModuleNV) callconv(.c) Result;
pub const PFN_getCudaModuleCacheNV = ?*const fn (Device, CudaModuleNV, [*c]usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_createCudaFunctionNV = ?*const fn (Device, [*c]const CudaFunctionCreateInfoNV, [*c]const AllocationCallbacks, [*c]CudaFunctionNV) callconv(.c) Result;
pub const PFN_destroyCudaModuleNV = ?*const fn (Device, CudaModuleNV, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_destroyCudaFunctionNV = ?*const fn (Device, CudaFunctionNV, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_cmdCudaLaunchKernelNV = ?*const fn (CommandBuffer, [*c]const CudaLaunchInfoNV) callconv(.c) void;
pub extern fn createCudaModuleNV(device: Device, p_create_info: [*c]const CudaModuleCreateInfoNV, p_allocator: [*c]const AllocationCallbacks, p_module: [*c]CudaModuleNV) Result;
pub extern fn getCudaModuleCacheNV(device: Device, module: CudaModuleNV, p_cache_size: [*c]usize, p_cache_data: ?*anyopaque) Result;
pub extern fn createCudaFunctionNV(device: Device, p_create_info: [*c]const CudaFunctionCreateInfoNV, p_allocator: [*c]const AllocationCallbacks, p_function: [*c]CudaFunctionNV) Result;
pub extern fn destroyCudaModuleNV(device: Device, module: CudaModuleNV, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn destroyCudaFunctionNV(device: Device, function: CudaFunctionNV, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn cmdCudaLaunchKernelNV(command_buffer: CommandBuffer, p_launch_info: [*c]const CudaLaunchInfoNV) void;
pub const QueryLowLatencySupportNV = extern struct {
    s_type: StructureType = StructureType.query_low_latency_support_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_queried_low_latency_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const AccelerationStructureKHR = enum(u64) { null = 0, _ };
pub const PhysicalDeviceDescriptorBufferPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_descriptor_buffer_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    combined_image_sampler_descriptor_single_array: Bool32 = @import("std").mem.zeroes(Bool32),
    bufferless_push_descriptors: Bool32 = @import("std").mem.zeroes(Bool32),
    allow_sampler_image_view_post_submit_creation: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_buffer_offset_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    max_descriptor_buffer_bindings: u32 = @import("std").mem.zeroes(u32),
    max_resource_descriptor_buffer_bindings: u32 = @import("std").mem.zeroes(u32),
    max_sampler_descriptor_buffer_bindings: u32 = @import("std").mem.zeroes(u32),
    max_embedded_immutable_sampler_bindings: u32 = @import("std").mem.zeroes(u32),
    max_embedded_immutable_samplers: u32 = @import("std").mem.zeroes(u32),
    buffer_capture_replay_descriptor_data_size: usize = @import("std").mem.zeroes(usize),
    image_capture_replay_descriptor_data_size: usize = @import("std").mem.zeroes(usize),
    image_view_capture_replay_descriptor_data_size: usize = @import("std").mem.zeroes(usize),
    sampler_capture_replay_descriptor_data_size: usize = @import("std").mem.zeroes(usize),
    acceleration_structure_capture_replay_descriptor_data_size: usize = @import("std").mem.zeroes(usize),
    sampler_descriptor_size: usize = @import("std").mem.zeroes(usize),
    combined_image_sampler_descriptor_size: usize = @import("std").mem.zeroes(usize),
    sampled_image_descriptor_size: usize = @import("std").mem.zeroes(usize),
    storage_image_descriptor_size: usize = @import("std").mem.zeroes(usize),
    uniform_texel_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    robust_uniform_texel_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    storage_texel_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    robust_storage_texel_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    uniform_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    robust_uniform_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    storage_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    robust_storage_buffer_descriptor_size: usize = @import("std").mem.zeroes(usize),
    input_attachment_descriptor_size: usize = @import("std").mem.zeroes(usize),
    acceleration_structure_descriptor_size: usize = @import("std").mem.zeroes(usize),
    max_sampler_descriptor_buffer_range: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    max_resource_descriptor_buffer_range: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    sampler_descriptor_buffer_address_space_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    resource_descriptor_buffer_address_space_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    descriptor_buffer_address_space_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PhysicalDeviceDescriptorBufferDensityMapPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_descriptor_buffer_density_map_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    combined_image_sampler_density_map_descriptor_size: usize = @import("std").mem.zeroes(usize),
};
pub const PhysicalDeviceDescriptorBufferFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_descriptor_buffer_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    descriptor_buffer: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_buffer_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_buffer_image_layout_ignored: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_buffer_push_descriptors: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DescriptorAddressInfoEXT = extern struct {
    s_type: StructureType = StructureType.descriptor_address_info_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    range: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    format: Format = @import("std").mem.zeroes(Format),
};
pub const DescriptorBufferBindingInfoEXT = extern struct {
    s_type: StructureType = StructureType.descriptor_buffer_binding_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    usage: BufferUsageFlags = @import("std").mem.zeroes(BufferUsageFlags),
};
pub const DescriptorBufferBindingPushDescriptorBufferHandleEXT = extern struct {
    s_type: StructureType = StructureType.descriptor_buffer_binding_push_descriptor_buffer_handle_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
};
pub const DescriptorDataEXT = extern union {
    p_sampler: [*c]const Sampler,
    p_combined_image_sampler: [*c]const DescriptorImageInfo,
    p_input_attachment_image: [*c]const DescriptorImageInfo,
    p_sampled_image: [*c]const DescriptorImageInfo,
    p_storage_image: [*c]const DescriptorImageInfo,
    p_uniform_texel_buffer: [*c]const DescriptorAddressInfoEXT,
    p_storage_texel_buffer: [*c]const DescriptorAddressInfoEXT,
    p_uniform_buffer: [*c]const DescriptorAddressInfoEXT,
    p_storage_buffer: [*c]const DescriptorAddressInfoEXT,
    acceleration_structure: DeviceAddress,
};
pub const DescriptorGetInfoEXT = extern struct {
    s_type: StructureType = StructureType.descriptor_get_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: DescriptorType = @import("std").mem.zeroes(DescriptorType),
    data: DescriptorDataEXT = @import("std").mem.zeroes(DescriptorDataEXT),
};
pub const BufferCaptureDescriptorDataInfoEXT = extern struct {
    s_type: StructureType = StructureType.buffer_capture_descriptor_data_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
};
pub const ImageCaptureDescriptorDataInfoEXT = extern struct {
    s_type: StructureType = StructureType.image_capture_descriptor_data_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image: Image = @import("std").mem.zeroes(Image),
};
pub const ImageViewCaptureDescriptorDataInfoEXT = extern struct {
    s_type: StructureType = StructureType.image_view_capture_descriptor_data_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    image_view: ImageView = @import("std").mem.zeroes(ImageView),
};
pub const SamplerCaptureDescriptorDataInfoEXT = extern struct {
    s_type: StructureType = StructureType.sampler_capture_descriptor_data_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    sampler: Sampler = @import("std").mem.zeroes(Sampler),
};
pub const OpaqueCaptureDescriptorDataCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.opaque_capture_descriptor_data_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    opaque_capture_descriptor_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const AccelerationStructureCaptureDescriptorDataInfoEXT = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_capture_descriptor_data_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acceleration_structure: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    acceleration_structure_nv: AccelerationStructureNV = @import("std").mem.zeroes(AccelerationStructureNV),
};
pub const PFN_getDescriptorSetLayoutSizeEXT = ?*const fn (Device, DescriptorSetLayout, [*c]DeviceSize) callconv(.c) void;
pub const PFN_getDescriptorSetLayoutBindingOffsetEXT = ?*const fn (Device, DescriptorSetLayout, u32, [*c]DeviceSize) callconv(.c) void;
pub const PFN_getDescriptorEXT = ?*const fn (Device, [*c]const DescriptorGetInfoEXT, usize, ?*anyopaque) callconv(.c) void;
pub const PFN_cmdBindDescriptorBuffersEXT = ?*const fn (CommandBuffer, u32, [*c]const DescriptorBufferBindingInfoEXT) callconv(.c) void;
pub const PFN_cmdSetDescriptorBufferOffsetsEXT = ?*const fn (CommandBuffer, PipelineBindPoint, PipelineLayout, u32, u32, [*c]const u32, [*c]const DeviceSize) callconv(.c) void;
pub const PFN_cmdBindDescriptorBufferEmbeddedSamplersEXT = ?*const fn (CommandBuffer, PipelineBindPoint, PipelineLayout, u32) callconv(.c) void;
pub const PFN_getBufferOpaqueCaptureDescriptorDataEXT = ?*const fn (Device, [*c]const BufferCaptureDescriptorDataInfoEXT, ?*anyopaque) callconv(.c) Result;
pub const PFN_getImageOpaqueCaptureDescriptorDataEXT = ?*const fn (Device, [*c]const ImageCaptureDescriptorDataInfoEXT, ?*anyopaque) callconv(.c) Result;
pub const PFN_getImageViewOpaqueCaptureDescriptorDataEXT = ?*const fn (Device, [*c]const ImageViewCaptureDescriptorDataInfoEXT, ?*anyopaque) callconv(.c) Result;
pub const PFN_getSamplerOpaqueCaptureDescriptorDataEXT = ?*const fn (Device, [*c]const SamplerCaptureDescriptorDataInfoEXT, ?*anyopaque) callconv(.c) Result;
pub const PFN_getAccelerationStructureOpaqueCaptureDescriptorDataEXT = ?*const fn (Device, [*c]const AccelerationStructureCaptureDescriptorDataInfoEXT, ?*anyopaque) callconv(.c) Result;
pub extern fn getDescriptorSetLayoutSizeEXT(device: Device, layout: DescriptorSetLayout, p_layout_size_in_bytes: [*c]DeviceSize) void;
pub extern fn getDescriptorSetLayoutBindingOffsetEXT(device: Device, layout: DescriptorSetLayout, binding: u32, p_offset: [*c]DeviceSize) void;
pub extern fn getDescriptorEXT(device: Device, p_descriptor_info: [*c]const DescriptorGetInfoEXT, data_size: usize, p_descriptor: ?*anyopaque) void;
pub extern fn cmdBindDescriptorBuffersEXT(command_buffer: CommandBuffer, buffer_count: u32, p_binding_infos: [*c]const DescriptorBufferBindingInfoEXT) void;
pub extern fn cmdSetDescriptorBufferOffsetsEXT(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, layout: PipelineLayout, first_set: u32, set_count: u32, p_buffer_indices: [*c]const u32, p_offsets: [*c]const DeviceSize) void;
pub extern fn cmdBindDescriptorBufferEmbeddedSamplersEXT(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, layout: PipelineLayout, set: u32) void;
pub extern fn getBufferOpaqueCaptureDescriptorDataEXT(device: Device, p_info: [*c]const BufferCaptureDescriptorDataInfoEXT, p_data: ?*anyopaque) Result;
pub extern fn getImageOpaqueCaptureDescriptorDataEXT(device: Device, p_info: [*c]const ImageCaptureDescriptorDataInfoEXT, p_data: ?*anyopaque) Result;
pub extern fn getImageViewOpaqueCaptureDescriptorDataEXT(device: Device, p_info: [*c]const ImageViewCaptureDescriptorDataInfoEXT, p_data: ?*anyopaque) Result;
pub extern fn getSamplerOpaqueCaptureDescriptorDataEXT(device: Device, p_info: [*c]const SamplerCaptureDescriptorDataInfoEXT, p_data: ?*anyopaque) Result;
pub extern fn getAccelerationStructureOpaqueCaptureDescriptorDataEXT(device: Device, p_info: [*c]const AccelerationStructureCaptureDescriptorDataInfoEXT, p_data: ?*anyopaque) Result;
pub const GraphicsPipelineLibraryFlagsEXT = enum(u32) {
    null = 0,
    vertex_input_interface_bit_ext = 1,
    pre_rasterization_shaders_bit_ext = 2,
    fragment_shader_bit_ext = 4,
    fragment_output_interface_bit_ext = 8,
};
pub const PhysicalDeviceGraphicsPipelineLibraryFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_graphics_pipeline_library_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    graphics_pipeline_library: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceGraphicsPipelineLibraryPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_graphics_pipeline_library_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    graphics_pipeline_library_fast_linking: Bool32 = @import("std").mem.zeroes(Bool32),
    graphics_pipeline_library_independent_interpolation_decoration: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const GraphicsPipelineLibraryCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.graphics_pipeline_library_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: GraphicsPipelineLibraryFlagsEXT = @import("std").mem.zeroes(GraphicsPipelineLibraryFlagsEXT),
};
pub const PhysicalDeviceShaderEarlyAndLateFragmentTestsFeaturesAMD = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_early_and_late_fragment_tests_features_amd,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_early_and_late_fragment_tests: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const FragmentShadingRateTypeNV = enum(u32) {
    fragment_size_nv = 0,
    enums_nv = 1,
};
pub const FragmentShadingRateNV = enum(u32) {
    @"1_invocation_per_pixel_nv" = 0,
    @"1_invocation_per_1x2_pixels_nv" = 1,
    @"1_invocation_per_2x1_pixels_nv" = 4,
    @"1_invocation_per_2x2_pixels_nv" = 5,
    @"1_invocation_per_2x4_pixels_nv" = 6,
    @"1_invocation_per_4x2_pixels_nv" = 9,
    @"1_invocation_per_4x4_pixels_nv" = 10,
    @"2_invocations_per_pixel_nv" = 11,
    @"4_invocations_per_pixel_nv" = 12,
    @"8_invocations_per_pixel_nv" = 13,
    @"16_invocations_per_pixel_nv" = 14,
    no_invocations_nv = 15,
};
pub const PhysicalDeviceFragmentShadingRateEnumsFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_shading_rate_enums_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_shading_rate_enums: Bool32 = @import("std").mem.zeroes(Bool32),
    supersample_fragment_shading_rates: Bool32 = @import("std").mem.zeroes(Bool32),
    no_invocation_fragment_shading_rates: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentShadingRateEnumsPropertiesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_shading_rate_enums_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_fragment_shading_rate_invocation_count: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
};
pub const PipelineFragmentShadingRateEnumStateCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.pipeline_fragment_shading_rate_enum_state_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    shading_rate_type: FragmentShadingRateTypeNV = @import("std").mem.zeroes(FragmentShadingRateTypeNV),
    shading_rate: FragmentShadingRateNV = @import("std").mem.zeroes(FragmentShadingRateNV),
    combiner_ops: [2]FragmentShadingRateCombinerOpKHR = @import("std").mem.zeroes([2]FragmentShadingRateCombinerOpKHR),
};
pub const PFN_cmdSetFragmentShadingRateEnumNV = ?*const fn (CommandBuffer, FragmentShadingRateNV, [*c]const FragmentShadingRateCombinerOpKHR) callconv(.c) void;
pub extern fn cmdSetFragmentShadingRateEnumNV(command_buffer: CommandBuffer, shading_rate: FragmentShadingRateNV, combiner_ops: [*c]const FragmentShadingRateCombinerOpKHR) void;
pub const AccelerationStructureMotionInstanceTypeNV = enum(u32) {
    static_nv = 0,
    matrix_motion_nv = 1,
    srt_motion_nv = 2,
};
pub const AccelerationStructureMotionInfoFlagsNV = Flags;
pub const AccelerationStructureMotionInstanceFlagsNV = Flags;
pub const DeviceOrHostAddressConstKHR = extern union {
    device_address: DeviceAddress,
    host_address: ?*const anyopaque,
};
pub const AccelerationStructureGeometryMotionTrianglesDataNV = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_geometry_motion_triangles_data_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    vertex_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
};
pub const AccelerationStructureMotionInfoNV = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_motion_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    max_instances: u32 = @import("std").mem.zeroes(u32),
    flags: AccelerationStructureMotionInfoFlagsNV = @import("std").mem.zeroes(AccelerationStructureMotionInfoFlagsNV),
};
pub const AccelerationStructureMatrixMotionInstanceNV = enum(u64) { null = 0, _ };
pub const SRTDataNV = extern struct {
    sx: f32 = @import("std").mem.zeroes(f32),
    a: f32 = @import("std").mem.zeroes(f32),
    b: f32 = @import("std").mem.zeroes(f32),
    pvx: f32 = @import("std").mem.zeroes(f32),
    sy: f32 = @import("std").mem.zeroes(f32),
    c: f32 = @import("std").mem.zeroes(f32),
    pvy: f32 = @import("std").mem.zeroes(f32),
    sz: f32 = @import("std").mem.zeroes(f32),
    pvz: f32 = @import("std").mem.zeroes(f32),
    qx: f32 = @import("std").mem.zeroes(f32),
    qy: f32 = @import("std").mem.zeroes(f32),
    qz: f32 = @import("std").mem.zeroes(f32),
    qw: f32 = @import("std").mem.zeroes(f32),
    tx: f32 = @import("std").mem.zeroes(f32),
    ty: f32 = @import("std").mem.zeroes(f32),
    tz: f32 = @import("std").mem.zeroes(f32),
};
pub const AccelerationStructureSRTMotionInstanceNV = enum(u64) { null = 0, _ };
pub const AccelerationStructureMotionInstanceDataNV = extern union {
    static_instance: AccelerationStructureInstanceKHR,
    matrix_motion_instance: AccelerationStructureMatrixMotionInstanceNV,
    srt_motion_instance: AccelerationStructureSRTMotionInstanceNV,
};
pub const AccelerationStructureMotionInstanceNV = extern struct {
    type: AccelerationStructureMotionInstanceTypeNV = @import("std").mem.zeroes(AccelerationStructureMotionInstanceTypeNV),
    flags: AccelerationStructureMotionInstanceFlagsNV = @import("std").mem.zeroes(AccelerationStructureMotionInstanceFlagsNV),
    data: AccelerationStructureMotionInstanceDataNV = @import("std").mem.zeroes(AccelerationStructureMotionInstanceDataNV),
};
pub const PhysicalDeviceRayTracingMotionBlurFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_ray_tracing_motion_blur_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_motion_blur: Bool32 = @import("std").mem.zeroes(Bool32),
    ray_tracing_motion_blur_pipeline_trace_rays_indirect: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceYcbcr2Plane444FormatsFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_ycbcr2plane444formats_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ycbcr2plane444formats: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentDensityMap2FeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_density_map2features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_density_map_deferred: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentDensityMap2PropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_density_map2properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    subsampled_loads: Bool32 = @import("std").mem.zeroes(Bool32),
    subsampled_coarse_reconstruction_early_access: Bool32 = @import("std").mem.zeroes(Bool32),
    max_subsampled_array_layers: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_subsampled_samplers: u32 = @import("std").mem.zeroes(u32),
};
pub const CopyCommandTransformInfoQCOM = extern struct {
    s_type: StructureType = StructureType.copy_command_transform_info_qcom,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    transform: SurfaceTransformFlagsKHR = @import("std").mem.zeroes(SurfaceTransformFlagsKHR),
};
pub const PhysicalDeviceImageRobustnessFeaturesEXT = PhysicalDeviceImageRobustnessFeatures;
pub const ImageCompressionFlagsEXT = enum(u32) {
    default_ext = 0,
    fixed_rate_default_ext = 1,
    fixed_rate_explicit_ext = 2,
    disabled_ext = 4,
};
pub const ImageCompressionFixedRateFlagsEXT = enum(u32) {
    none_ext = 0,
    @"1bpc_bit_ext" = 1,
    @"2bpc_bit_ext" = 2,
    @"3bpc_bit_ext" = 4,
    @"4bpc_bit_ext" = 8,
    @"5bpc_bit_ext" = 16,
    @"6bpc_bit_ext" = 32,
    @"7bpc_bit_ext" = 64,
    @"8bpc_bit_ext" = 128,
    @"9bpc_bit_ext" = 256,
    @"10bpc_bit_ext" = 512,
    @"11bpc_bit_ext" = 1024,
    @"12bpc_bit_ext" = 2048,
    @"13bpc_bit_ext" = 4096,
    @"14bpc_bit_ext" = 8192,
    @"15bpc_bit_ext" = 16384,
    @"16bpc_bit_ext" = 32768,
    @"17bpc_bit_ext" = 65536,
    @"18bpc_bit_ext" = 131072,
    @"19bpc_bit_ext" = 262144,
    @"20bpc_bit_ext" = 524288,
    @"21bpc_bit_ext" = 1048576,
    @"22bpc_bit_ext" = 2097152,
    @"23bpc_bit_ext" = 4194304,
    @"24bpc_bit_ext" = 8388608,
};
pub const PhysicalDeviceImageCompressionControlFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_image_compression_control_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_compression_control: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ImageCompressionControlEXT = extern struct {
    s_type: StructureType = StructureType.image_compression_control_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ImageCompressionFlagsEXT = @import("std").mem.zeroes(ImageCompressionFlagsEXT),
    compression_control_plane_count: u32 = @import("std").mem.zeroes(u32),
    p_fixed_rate_flags: [*c]ImageCompressionFixedRateFlagsEXT = @import("std").mem.zeroes([*c]ImageCompressionFixedRateFlagsEXT),
};
pub const ImageCompressionPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.image_compression_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_compression_flags: ImageCompressionFlagsEXT = @import("std").mem.zeroes(ImageCompressionFlagsEXT),
    image_compression_fixed_rate_flags: ImageCompressionFixedRateFlagsEXT = @import("std").mem.zeroes(ImageCompressionFixedRateFlagsEXT),
};
pub const PhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_attachment_feedback_loop_layout_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    attachment_feedback_loop_layout: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevice4444FormatsFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device4444formats_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    format_a4r4g4b4: Bool32 = @import("std").mem.zeroes(Bool32),
    format_a4b4g4r4: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceFaultAddressTypeEXT = enum(u32) {
    none_ext = 0,
    read_invalid_ext = 1,
    write_invalid_ext = 2,
    execute_invalid_ext = 3,
    instruction_pointer_unknown_ext = 4,
    instruction_pointer_invalid_ext = 5,
    instruction_pointer_fault_ext = 6,
};
pub const DeviceFaultVendorBinaryHeaderVersionEXT = enum(u32) {
    null = 0,
    one_ext = 1,
};
pub const PhysicalDeviceFaultFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_fault_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_fault: Bool32 = @import("std").mem.zeroes(Bool32),
    device_fault_vendor_binary: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceFaultCountsEXT = extern struct {
    s_type: StructureType = StructureType.device_fault_counts_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    address_info_count: u32 = @import("std").mem.zeroes(u32),
    vendor_info_count: u32 = @import("std").mem.zeroes(u32),
    vendor_binary_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const DeviceFaultAddressInfoEXT = extern struct {
    address_type: DeviceFaultAddressTypeEXT = @import("std").mem.zeroes(DeviceFaultAddressTypeEXT),
    reported_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    address_precision: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const DeviceFaultVendorInfoEXT = extern struct {
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    vendor_fault_code: u64 = @import("std").mem.zeroes(u64),
    vendor_fault_data: u64 = @import("std").mem.zeroes(u64),
};
pub const DeviceFaultInfoEXT = extern struct {
    s_type: StructureType = StructureType.device_fault_info_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    p_address_infos: [*c]DeviceFaultAddressInfoEXT = @import("std").mem.zeroes([*c]DeviceFaultAddressInfoEXT),
    p_vendor_infos: [*c]DeviceFaultVendorInfoEXT = @import("std").mem.zeroes([*c]DeviceFaultVendorInfoEXT),
    p_vendor_binary_data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const DeviceFaultVendorBinaryHeaderVersionOneEXT = extern struct {
    header_size: u32 = @import("std").mem.zeroes(u32),
    header_version: DeviceFaultVendorBinaryHeaderVersionEXT = @import("std").mem.zeroes(DeviceFaultVendorBinaryHeaderVersionEXT),
    vendor_id: u32 = @import("std").mem.zeroes(u32),
    device_id: u32 = @import("std").mem.zeroes(u32),
    driver_version: u32 = @import("std").mem.zeroes(u32),
    pipeline_cache_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    application_name_offset: u32 = @import("std").mem.zeroes(u32),
    application_version: u32 = @import("std").mem.zeroes(u32),
    engine_name_offset: u32 = @import("std").mem.zeroes(u32),
    engine_version: u32 = @import("std").mem.zeroes(u32),
    api_version: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_getDeviceFaultInfoEXT = ?*const fn (Device, [*c]DeviceFaultCountsEXT, [*c]DeviceFaultInfoEXT) callconv(.c) Result;
pub extern fn getDeviceFaultInfoEXT(device: Device, p_fault_counts: [*c]DeviceFaultCountsEXT, p_fault_info: [*c]DeviceFaultInfoEXT) Result;
pub const PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_rasterization_order_attachment_access_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    rasterization_order_color_attachment_access: Bool32 = @import("std").mem.zeroes(Bool32),
    rasterization_order_depth_attachment_access: Bool32 = @import("std").mem.zeroes(Bool32),
    rasterization_order_stencil_attachment_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM = PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT;
pub const PhysicalDeviceRGBA10X6FormatsFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_rgba10x6formats_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    format_rgba10x6without_ycb_cr_sampler: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMutableDescriptorTypeFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_mutable_descriptor_type_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    mutable_descriptor_type: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMutableDescriptorTypeFeaturesVALVE = PhysicalDeviceMutableDescriptorTypeFeaturesEXT;
pub const MutableDescriptorTypeListEXT = extern struct {
    descriptor_type_count: u32 = @import("std").mem.zeroes(u32),
    p_descriptor_types: [*c]const DescriptorType = @import("std").mem.zeroes([*c]const DescriptorType),
};
pub const MutableDescriptorTypeListVALVE = MutableDescriptorTypeListEXT;
pub const MutableDescriptorTypeCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.mutable_descriptor_type_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    mutable_descriptor_type_list_count: u32 = @import("std").mem.zeroes(u32),
    p_mutable_descriptor_type_lists: [*c]const MutableDescriptorTypeListEXT = @import("std").mem.zeroes([*c]const MutableDescriptorTypeListEXT),
};
pub const MutableDescriptorTypeCreateInfoVALVE = MutableDescriptorTypeCreateInfoEXT;
pub const PhysicalDeviceVertexInputDynamicStateFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_vertex_input_dynamic_state_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    vertex_input_dynamic_state: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const VertexInputBindingDescription2EXT = extern struct {
    s_type: StructureType = StructureType.vertex_input_binding_description2ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    binding: u32 = @import("std").mem.zeroes(u32),
    stride: u32 = @import("std").mem.zeroes(u32),
    input_rate: VertexInputRate = @import("std").mem.zeroes(VertexInputRate),
    divisor: u32 = @import("std").mem.zeroes(u32),
};
pub const VertexInputAttributeDescription2EXT = extern struct {
    s_type: StructureType = StructureType.vertex_input_attribute_description2ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    location: u32 = @import("std").mem.zeroes(u32),
    binding: u32 = @import("std").mem.zeroes(u32),
    format: Format = @import("std").mem.zeroes(Format),
    offset: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdSetVertexInputEXT = ?*const fn (CommandBuffer, u32, [*c]const VertexInputBindingDescription2EXT, u32, [*c]const VertexInputAttributeDescription2EXT) callconv(.c) void;
pub extern fn cmdSetVertexInputEXT(command_buffer: CommandBuffer, vertex_binding_description_count: u32, p_vertex_binding_descriptions: [*c]const VertexInputBindingDescription2EXT, vertex_attribute_description_count: u32, p_vertex_attribute_descriptions: [*c]const VertexInputAttributeDescription2EXT) void;
pub const PhysicalDeviceDrmPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_drm_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    has_primary: Bool32 = @import("std").mem.zeroes(Bool32),
    has_render: Bool32 = @import("std").mem.zeroes(Bool32),
    primary_major: i64 = @import("std").mem.zeroes(i64),
    primary_minor: i64 = @import("std").mem.zeroes(i64),
    render_major: i64 = @import("std").mem.zeroes(i64),
    render_minor: i64 = @import("std").mem.zeroes(i64),
};
pub const DeviceAddressBindingTypeEXT = enum(u32) {
    bind_ext = 0,
    unbind_ext = 1,
};
pub const DeviceAddressBindingFlagsEXT = enum(u32) {
    null = 0,
    internal_object_bit_ext = 1,
};
pub const PhysicalDeviceAddressBindingReportFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_address_binding_report_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    report_address_binding: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DeviceAddressBindingCallbackDataEXT = extern struct {
    s_type: StructureType = StructureType.device_address_binding_callback_data_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: DeviceAddressBindingFlagsEXT = @import("std").mem.zeroes(DeviceAddressBindingFlagsEXT),
    base_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    binding_type: DeviceAddressBindingTypeEXT = @import("std").mem.zeroes(DeviceAddressBindingTypeEXT),
};
pub const PhysicalDeviceDepthClipControlFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_depth_clip_control_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    depth_clip_control: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineViewportDepthClipControlCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.pipeline_viewport_depth_clip_control_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    negative_one_to_one: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePrimitiveTopologyListRestartFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_primitive_topology_list_restart_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    primitive_topology_list_restart: Bool32 = @import("std").mem.zeroes(Bool32),
    primitive_topology_patch_list_restart: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SubpassShadingPipelineCreateInfoHUAWEI = extern struct {
    s_type: StructureType = StructureType.subpass_shading_pipeline_create_info_huawei,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    render_pass: RenderPass = @import("std").mem.zeroes(RenderPass),
    subpass: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceSubpassShadingFeaturesHUAWEI = extern struct {
    s_type: StructureType = StructureType.physical_device_subpass_shading_features_huawei,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    subpass_shading: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceSubpassShadingPropertiesHUAWEI = extern struct {
    s_type: StructureType = StructureType.physical_device_subpass_shading_properties_huawei,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_subpass_shading_workgroup_size_aspect_ratio: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_getDeviceSubpassShadingMaxWorkgroupSizeHUAWEI = ?*const fn (Device, RenderPass, [*c]Extent2D) callconv(.c) Result;
pub const PFN_cmdSubpassShadingHUAWEI = ?*const fn (CommandBuffer) callconv(.c) void;
pub extern fn getDeviceSubpassShadingMaxWorkgroupSizeHUAWEI(device: Device, renderpass: RenderPass, p_max_workgroup_size: [*c]Extent2D) Result;
pub extern fn cmdSubpassShadingHUAWEI(command_buffer: CommandBuffer) void;
pub const PhysicalDeviceInvocationMaskFeaturesHUAWEI = extern struct {
    s_type: StructureType = StructureType.physical_device_invocation_mask_features_huawei,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    invocation_mask: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdBindInvocationMaskHUAWEI = ?*const fn (CommandBuffer, ImageView, ImageLayout) callconv(.c) void;
pub extern fn cmdBindInvocationMaskHUAWEI(command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout) void;
pub const RemoteAddressNV = ?*anyopaque;
pub const MemoryGetRemoteAddressInfoNV = extern struct {
    s_type: StructureType = StructureType.memory_get_remote_address_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    memory: DeviceMemory = @import("std").mem.zeroes(DeviceMemory),
    handle_type: ExternalMemoryHandleTypeFlags = @import("std").mem.zeroes(ExternalMemoryHandleTypeFlags),
};
pub const PhysicalDeviceExternalMemoryRDMAFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_external_memory_rdmafeatures_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    external_memory_rdma: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_getMemoryRemoteAddressNV = ?*const fn (Device, [*c]const MemoryGetRemoteAddressInfoNV, [*c]RemoteAddressNV) callconv(.c) Result;
pub extern fn getMemoryRemoteAddressNV(device: Device, p_memory_get_remote_address_info: [*c]const MemoryGetRemoteAddressInfoNV, p_address: [*c]RemoteAddressNV) Result;
pub const PipelineInfoEXT = PipelineInfoKHR;
pub const PipelinePropertiesIdentifierEXT = extern struct {
    s_type: StructureType = StructureType.pipeline_properties_identifier_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_identifier: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const PhysicalDevicePipelinePropertiesFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_pipeline_properties_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_properties_identifier: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_getPipelinePropertiesEXT = ?*const fn (Device, [*c]const PipelineInfoEXT, [*c]BaseOutStructure) callconv(.c) Result;
pub extern fn getPipelinePropertiesEXT(device: Device, p_pipeline_info: [*c]const PipelineInfoEXT, p_pipeline_properties: [*c]BaseOutStructure) Result;
pub const FrameBoundaryFlagsEXT = enum(u32) {
    null = 0,
    frame_end_bit_ext = 1,
};
pub const PhysicalDeviceFrameBoundaryFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_frame_boundary_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    frame_boundary: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const FrameBoundaryEXT = extern struct {
    s_type: StructureType = StructureType.frame_boundary_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: FrameBoundaryFlagsEXT = @import("std").mem.zeroes(FrameBoundaryFlagsEXT),
    frame_id: u64 = @import("std").mem.zeroes(u64),
    image_count: u32 = @import("std").mem.zeroes(u32),
    p_images: [*c]const Image = @import("std").mem.zeroes([*c]const Image),
    buffer_count: u32 = @import("std").mem.zeroes(u32),
    p_buffers: [*c]const Buffer = @import("std").mem.zeroes([*c]const Buffer),
    tag_name: u64 = @import("std").mem.zeroes(u64),
    tag_size: usize = @import("std").mem.zeroes(usize),
    p_tag: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const PhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_multisampled_render_to_single_sampled_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    multisampled_render_to_single_sampled: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SubpassResolvePerformanceQueryEXT = extern struct {
    s_type: StructureType = StructureType.subpass_resolve_performance_query_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    optimal: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MultisampledRenderToSingleSampledInfoEXT = extern struct {
    s_type: StructureType = StructureType.multisampled_render_to_single_sampled_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    multisampled_render_to_single_sampled_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    rasterization_samples: SampleCountFlags = @import("std").mem.zeroes(SampleCountFlags),
};
pub const PhysicalDeviceExtendedDynamicState2FeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_extended_dynamic_state2features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    extended_dynamic_state2: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state2logic_op: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state2patch_control_points: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdSetPatchControlPointsEXT = ?*const fn (CommandBuffer, u32) callconv(.c) void;
pub const PFN_cmdSetRasterizerDiscardEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthBiasEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetLogicOpEXT = ?*const fn (CommandBuffer, LogicOp) callconv(.c) void;
pub const PFN_cmdSetPrimitiveRestartEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub extern fn cmdSetPatchControlPointsEXT(command_buffer: CommandBuffer, patch_control_points: u32) void;
pub extern fn cmdSetRasterizerDiscardEnableEXT(command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32) void;
pub extern fn cmdSetDepthBiasEnableEXT(command_buffer: CommandBuffer, depth_bias_enable: Bool32) void;
pub extern fn cmdSetLogicOpEXT(command_buffer: CommandBuffer, logic_op: LogicOp) void;
pub extern fn cmdSetPrimitiveRestartEnableEXT(command_buffer: CommandBuffer, primitive_restart_enable: Bool32) void;
pub const PhysicalDeviceColorWriteEnableFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_color_write_enable_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    color_write_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineColorWriteCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.pipeline_color_write_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    attachment_count: u32 = @import("std").mem.zeroes(u32),
    p_color_write_enables: [*c]const Bool32 = @import("std").mem.zeroes([*c]const Bool32),
};
pub const PFN_cmdSetColorWriteEnableEXT = ?*const fn (CommandBuffer, u32, [*c]const Bool32) callconv(.c) void;
pub extern fn cmdSetColorWriteEnableEXT(command_buffer: CommandBuffer, attachment_count: u32, p_color_write_enables: [*c]const Bool32) void;
pub const PhysicalDevicePrimitivesGeneratedQueryFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_primitives_generated_query_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    primitives_generated_query: Bool32 = @import("std").mem.zeroes(Bool32),
    primitives_generated_query_with_rasterizer_discard: Bool32 = @import("std").mem.zeroes(Bool32),
    primitives_generated_query_with_non_zero_streams: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceGlobalPriorityQueryFeaturesEXT = PhysicalDeviceGlobalPriorityQueryFeaturesKHR;
pub const QueueFamilyGlobalPriorityPropertiesEXT = QueueFamilyGlobalPriorityPropertiesKHR;
pub const PhysicalDeviceImageViewMinLodFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_image_view_min_lod_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    min_lod: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ImageViewMinLodCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.image_view_min_lod_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    min_lod: f32 = @import("std").mem.zeroes(f32),
};
pub const PhysicalDeviceMultiDrawFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_multi_draw_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    multi_draw: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMultiDrawPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_multi_draw_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_multi_draw_count: u32 = @import("std").mem.zeroes(u32),
};
pub const MultiDrawInfoEXT = extern struct {
    first_vertex: u32 = @import("std").mem.zeroes(u32),
    vertex_count: u32 = @import("std").mem.zeroes(u32),
};
pub const MultiDrawIndexedInfoEXT = extern struct {
    first_index: u32 = @import("std").mem.zeroes(u32),
    index_count: u32 = @import("std").mem.zeroes(u32),
    vertex_offset: i32 = @import("std").mem.zeroes(i32),
};
pub const PFN_cmdDrawMultiEXT = ?*const fn (CommandBuffer, u32, [*c]const MultiDrawInfoEXT, u32, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawMultiIndexedEXT = ?*const fn (CommandBuffer, u32, [*c]const MultiDrawIndexedInfoEXT, u32, u32, u32, [*c]const i32) callconv(.c) void;
pub extern fn cmdDrawMultiEXT(command_buffer: CommandBuffer, draw_count: u32, p_vertex_info: [*c]const MultiDrawInfoEXT, instance_count: u32, first_instance: u32, stride: u32) void;
pub extern fn cmdDrawMultiIndexedEXT(command_buffer: CommandBuffer, draw_count: u32, p_index_info: [*c]const MultiDrawIndexedInfoEXT, instance_count: u32, first_instance: u32, stride: u32, p_vertex_offset: [*c]const i32) void;
pub const PhysicalDeviceImage2DViewOf3DFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_image2dview_of3dfeatures_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image2dview_of3d: Bool32 = @import("std").mem.zeroes(Bool32),
    sampler2dview_of3d: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderTileImageFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_tile_image_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_tile_image_color_read_access: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_tile_image_depth_read_access: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_tile_image_stencil_read_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderTileImagePropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_tile_image_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_tile_image_coherent_read_accelerated: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_tile_image_read_sample_from_pixel_rate_invocation: Bool32 = @import("std").mem.zeroes(Bool32),
    shader_tile_image_read_from_helper_invocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MicromapEXT = enum(u64) { null = 0, _ };
pub const MicromapTypeEXT = enum(u32) {
    opacity_micromap_ext = 0,
};
pub const BuildMicromapModeEXT = enum(u32) {
    build_ext = 0,
};
pub const CopyMicromapModeEXT = enum(u32) {
    clone_ext = 0,
    serialize_ext = 1,
    deserialize_ext = 2,
    compact_ext = 3,
};
pub const OpacityMicromapFormatEXT = enum(u32) {
    null = 0,
    @"2_state_ext" = 1,
    @"4_state_ext" = 2,
};
pub const OpacityMicromapSpecialIndexEXT = enum(i32) {
    fully_unknown_opaque_ext = -4,
    fully_unknown_transparent_ext = -3,
    fully_opaque_ext = -2,
    fully_transparent_ext = -1,
};
pub const AccelerationStructureCompatibilityKHR = enum(u32) {
    compatible_khr = 0,
    incompatible_khr = 1,
};
pub const AccelerationStructureBuildTypeKHR = enum(u32) {
    host_khr = 0,
    device_khr = 1,
    host_or_device_khr = 2,
};
pub const BuildMicromapFlagsEXT = enum(u32) {
    null = 0,
    prefer_fast_trace_bit_ext = 1,
    prefer_fast_build_bit_ext = 2,
    allow_compaction_bit_ext = 4,
};
pub const MicromapCreateFlagsEXT = enum(u32) {
    null = 0,
    device_address_capture_replay_bit_ext = 1,
};
pub const MicromapUsageEXT = extern struct {
    count: u32 = @import("std").mem.zeroes(u32),
    subdivision_level: u32 = @import("std").mem.zeroes(u32),
    format: u32 = @import("std").mem.zeroes(u32),
};
pub const DeviceOrHostAddressKHR = extern union {
    device_address: DeviceAddress,
    host_address: ?*anyopaque,
};
pub const MicromapBuildInfoEXT = extern struct {
    s_type: StructureType = StructureType.micromap_build_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: MicromapTypeEXT = @import("std").mem.zeroes(MicromapTypeEXT),
    flags: BuildMicromapFlagsEXT = @import("std").mem.zeroes(BuildMicromapFlagsEXT),
    mode: BuildMicromapModeEXT = @import("std").mem.zeroes(BuildMicromapModeEXT),
    dst_micromap: MicromapEXT = @import("std").mem.zeroes(MicromapEXT),
    usage_counts_count: u32 = @import("std").mem.zeroes(u32),
    p_usage_counts: [*c]const MicromapUsageEXT = @import("std").mem.zeroes([*c]const MicromapUsageEXT),
    pp_usage_counts: [*c]const [*c]const MicromapUsageEXT = @import("std").mem.zeroes([*c]const [*c]const MicromapUsageEXT),
    data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    scratch_data: DeviceOrHostAddressKHR = @import("std").mem.zeroes(DeviceOrHostAddressKHR),
    triangle_array: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    triangle_array_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const MicromapCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.micromap_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    create_flags: MicromapCreateFlagsEXT = @import("std").mem.zeroes(MicromapCreateFlagsEXT),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    type: MicromapTypeEXT = @import("std").mem.zeroes(MicromapTypeEXT),
    device_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const PhysicalDeviceOpacityMicromapFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_opacity_micromap_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    micromap: Bool32 = @import("std").mem.zeroes(Bool32),
    micromap_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    micromap_host_commands: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceOpacityMicromapPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_opacity_micromap_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_opacity2state_subdivision_level: u32 = @import("std").mem.zeroes(u32),
    max_opacity4state_subdivision_level: u32 = @import("std").mem.zeroes(u32),
};
pub const MicromapVersionInfoEXT = extern struct {
    s_type: StructureType = StructureType.micromap_version_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_version_data: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const CopyMicromapToMemoryInfoEXT = extern struct {
    s_type: StructureType = StructureType.copy_micromap_to_memory_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src: MicromapEXT = @import("std").mem.zeroes(MicromapEXT),
    dst: DeviceOrHostAddressKHR = @import("std").mem.zeroes(DeviceOrHostAddressKHR),
    mode: CopyMicromapModeEXT = @import("std").mem.zeroes(CopyMicromapModeEXT),
};
pub const CopyMemoryToMicromapInfoEXT = extern struct {
    s_type: StructureType = StructureType.copy_memory_to_micromap_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    dst: MicromapEXT = @import("std").mem.zeroes(MicromapEXT),
    mode: CopyMicromapModeEXT = @import("std").mem.zeroes(CopyMicromapModeEXT),
};
pub const CopyMicromapInfoEXT = extern struct {
    s_type: StructureType = StructureType.copy_micromap_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src: MicromapEXT = @import("std").mem.zeroes(MicromapEXT),
    dst: MicromapEXT = @import("std").mem.zeroes(MicromapEXT),
    mode: CopyMicromapModeEXT = @import("std").mem.zeroes(CopyMicromapModeEXT),
};
pub const MicromapBuildSizesInfoEXT = extern struct {
    s_type: StructureType = StructureType.micromap_build_sizes_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    micromap_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    build_scratch_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    discardable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const AccelerationStructureTrianglesOpacityMicromapEXT = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_triangles_opacity_micromap_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    index_type: IndexType = @import("std").mem.zeroes(IndexType),
    index_buffer: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    index_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    base_triangle: u32 = @import("std").mem.zeroes(u32),
    usage_counts_count: u32 = @import("std").mem.zeroes(u32),
    p_usage_counts: [*c]const MicromapUsageEXT = @import("std").mem.zeroes([*c]const MicromapUsageEXT),
    pp_usage_counts: [*c]const [*c]const MicromapUsageEXT = @import("std").mem.zeroes([*c]const [*c]const MicromapUsageEXT),
    micromap: MicromapEXT = @import("std").mem.zeroes(MicromapEXT),
};
pub const MicromapTriangleEXT = extern struct {
    data_offset: u32 = @import("std").mem.zeroes(u32),
    subdivision_level: u16 = @import("std").mem.zeroes(u16),
    format: u16 = @import("std").mem.zeroes(u16),
};
pub const PFN_createMicromapEXT = ?*const fn (Device, [*c]const MicromapCreateInfoEXT, [*c]const AllocationCallbacks, [*c]MicromapEXT) callconv(.c) Result;
pub const PFN_destroyMicromapEXT = ?*const fn (Device, MicromapEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_cmdBuildMicromapsEXT = ?*const fn (CommandBuffer, u32, [*c]const MicromapBuildInfoEXT) callconv(.c) void;
pub const PFN_buildMicromapsEXT = ?*const fn (Device, DeferredOperationKHR, u32, [*c]const MicromapBuildInfoEXT) callconv(.c) Result;
pub const PFN_copyMicromapEXT = ?*const fn (Device, DeferredOperationKHR, [*c]const CopyMicromapInfoEXT) callconv(.c) Result;
pub const PFN_copyMicromapToMemoryEXT = ?*const fn (Device, DeferredOperationKHR, [*c]const CopyMicromapToMemoryInfoEXT) callconv(.c) Result;
pub const PFN_copyMemoryToMicromapEXT = ?*const fn (Device, DeferredOperationKHR, [*c]const CopyMemoryToMicromapInfoEXT) callconv(.c) Result;
pub const PFN_writeMicromapsPropertiesEXT = ?*const fn (Device, u32, [*c]const MicromapEXT, QueryType, usize, ?*anyopaque, usize) callconv(.c) Result;
pub const PFN_cmdCopyMicromapEXT = ?*const fn (CommandBuffer, [*c]const CopyMicromapInfoEXT) callconv(.c) void;
pub const PFN_cmdCopyMicromapToMemoryEXT = ?*const fn (CommandBuffer, [*c]const CopyMicromapToMemoryInfoEXT) callconv(.c) void;
pub const PFN_cmdCopyMemoryToMicromapEXT = ?*const fn (CommandBuffer, [*c]const CopyMemoryToMicromapInfoEXT) callconv(.c) void;
pub const PFN_cmdWriteMicromapsPropertiesEXT = ?*const fn (CommandBuffer, u32, [*c]const MicromapEXT, QueryType, QueryPool, u32) callconv(.c) void;
pub const PFN_getDeviceMicromapCompatibilityEXT = ?*const fn (Device, [*c]const MicromapVersionInfoEXT, [*c]AccelerationStructureCompatibilityKHR) callconv(.c) void;
pub const PFN_getMicromapBuildSizesEXT = ?*const fn (Device, AccelerationStructureBuildTypeKHR, [*c]const MicromapBuildInfoEXT, [*c]MicromapBuildSizesInfoEXT) callconv(.c) void;
pub extern fn createMicromapEXT(device: Device, p_create_info: [*c]const MicromapCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_micromap: [*c]MicromapEXT) Result;
pub extern fn destroyMicromapEXT(device: Device, micromap: MicromapEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn cmdBuildMicromapsEXT(command_buffer: CommandBuffer, info_count: u32, p_infos: [*c]const MicromapBuildInfoEXT) void;
pub extern fn buildMicromapsEXT(device: Device, deferred_operation: DeferredOperationKHR, info_count: u32, p_infos: [*c]const MicromapBuildInfoEXT) Result;
pub extern fn copyMicromapEXT(device: Device, deferred_operation: DeferredOperationKHR, p_info: [*c]const CopyMicromapInfoEXT) Result;
pub extern fn copyMicromapToMemoryEXT(device: Device, deferred_operation: DeferredOperationKHR, p_info: [*c]const CopyMicromapToMemoryInfoEXT) Result;
pub extern fn copyMemoryToMicromapEXT(device: Device, deferred_operation: DeferredOperationKHR, p_info: [*c]const CopyMemoryToMicromapInfoEXT) Result;
pub extern fn writeMicromapsPropertiesEXT(device: Device, micromap_count: u32, p_micromaps: [*c]const MicromapEXT, query_type: QueryType, data_size: usize, p_data: ?*anyopaque, stride: usize) Result;
pub extern fn cmdCopyMicromapEXT(command_buffer: CommandBuffer, p_info: [*c]const CopyMicromapInfoEXT) void;
pub extern fn cmdCopyMicromapToMemoryEXT(command_buffer: CommandBuffer, p_info: [*c]const CopyMicromapToMemoryInfoEXT) void;
pub extern fn cmdCopyMemoryToMicromapEXT(command_buffer: CommandBuffer, p_info: [*c]const CopyMemoryToMicromapInfoEXT) void;
pub extern fn cmdWriteMicromapsPropertiesEXT(command_buffer: CommandBuffer, micromap_count: u32, p_micromaps: [*c]const MicromapEXT, query_type: QueryType, query_pool: QueryPool, first_query: u32) void;
pub extern fn getDeviceMicromapCompatibilityEXT(device: Device, p_version_info: [*c]const MicromapVersionInfoEXT, p_compatibility: [*c]AccelerationStructureCompatibilityKHR) void;
pub extern fn getMicromapBuildSizesEXT(device: Device, build_type: AccelerationStructureBuildTypeKHR, p_build_info: [*c]const MicromapBuildInfoEXT, p_size_info: [*c]MicromapBuildSizesInfoEXT) void;
pub const PhysicalDeviceClusterCullingShaderFeaturesHUAWEI = extern struct {
    s_type: StructureType = StructureType.physical_device_cluster_culling_shader_features_huawei,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    clusterculling_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview_cluster_culling_shader: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceClusterCullingShaderPropertiesHUAWEI = extern struct {
    s_type: StructureType = StructureType.physical_device_cluster_culling_shader_properties_huawei,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_work_group_count: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_output_cluster_count: u32 = @import("std").mem.zeroes(u32),
    indirect_buffer_offset_alignment: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PhysicalDeviceClusterCullingShaderVrsFeaturesHUAWEI = extern struct {
    s_type: StructureType = StructureType.physical_device_cluster_culling_shader_vrs_features_huawei,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cluster_shading_rate: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdDrawClusterHUAWEI = ?*const fn (CommandBuffer, u32, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawClusterIndirectHUAWEI = ?*const fn (CommandBuffer, Buffer, DeviceSize) callconv(.c) void;
pub extern fn cmdDrawClusterHUAWEI(command_buffer: CommandBuffer, group_count_x: u32, group_count_y: u32, group_count_z: u32) void;
pub extern fn cmdDrawClusterIndirectHUAWEI(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize) void;
pub const PhysicalDeviceBorderColorSwizzleFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_border_color_swizzle_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    border_color_swizzle: Bool32 = @import("std").mem.zeroes(Bool32),
    border_color_swizzle_from_image: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SamplerBorderColorComponentMappingCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.sampler_border_color_component_mapping_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    components: ComponentMapping = @import("std").mem.zeroes(ComponentMapping),
    srgb: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePageableDeviceLocalMemoryFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_pageable_device_local_memory_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pageable_device_local_memory: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_setDeviceMemoryPriorityEXT = ?*const fn (Device, DeviceMemory, f32) callconv(.c) void;
pub extern fn setDeviceMemoryPriorityEXT(device: Device, memory: DeviceMemory, priority: f32) void;
pub const PhysicalDeviceShaderCorePropertiesARM = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_core_properties_arm,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pixel_rate: u32 = @import("std").mem.zeroes(u32),
    texel_rate: u32 = @import("std").mem.zeroes(u32),
    fma_rate: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceSchedulingControlsFlagsARM = Flags64;
pub const DeviceQueueShaderCoreControlCreateInfoARM = extern struct {
    s_type: StructureType = StructureType.device_queue_shader_core_control_create_info_arm,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_core_count: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceSchedulingControlsFeaturesARM = extern struct {
    s_type: StructureType = StructureType.physical_device_scheduling_controls_features_arm,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    scheduling_controls: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceSchedulingControlsPropertiesARM = extern struct {
    s_type: StructureType = StructureType.physical_device_scheduling_controls_properties_arm,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    scheduling_controls_flags: PhysicalDeviceSchedulingControlsFlagsARM = @import("std").mem.zeroes(PhysicalDeviceSchedulingControlsFlagsARM),
};
pub const PhysicalDeviceImageSlicedViewOf3DFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_image_sliced_view_of3dfeatures_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_sliced_view_of3d: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ImageViewSlicedCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.image_view_sliced_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    slice_offset: u32 = @import("std").mem.zeroes(u32),
    slice_count: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceDescriptorSetHostMappingFeaturesVALVE = extern struct {
    s_type: StructureType = StructureType.physical_device_descriptor_set_host_mapping_features_valve,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    descriptor_set_host_mapping: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DescriptorSetBindingReferenceVALVE = extern struct {
    s_type: StructureType = StructureType.descriptor_set_binding_reference_valve,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    descriptor_set_layout: DescriptorSetLayout = @import("std").mem.zeroes(DescriptorSetLayout),
    binding: u32 = @import("std").mem.zeroes(u32),
};
pub const DescriptorSetLayoutHostMappingInfoVALVE = extern struct {
    s_type: StructureType = StructureType.descriptor_set_layout_host_mapping_info_valve,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    descriptor_offset: usize = @import("std").mem.zeroes(usize),
    descriptor_size: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_getDescriptorSetLayoutHostMappingInfoVALVE = ?*const fn (Device, [*c]const DescriptorSetBindingReferenceVALVE, [*c]DescriptorSetLayoutHostMappingInfoVALVE) callconv(.c) void;
pub const PFN_getDescriptorSetHostMappingVALVE = ?*const fn (Device, DescriptorSet, [*c]?*anyopaque) callconv(.c) void;
pub extern fn getDescriptorSetLayoutHostMappingInfoVALVE(device: Device, p_binding_reference: [*c]const DescriptorSetBindingReferenceVALVE, p_host_mapping: [*c]DescriptorSetLayoutHostMappingInfoVALVE) void;
pub extern fn getDescriptorSetHostMappingVALVE(device: Device, descriptor_set: DescriptorSet, pp_data: [*c]?*anyopaque) void;
pub const PhysicalDeviceDepthClampZeroOneFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_depth_clamp_zero_one_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    depth_clamp_zero_one: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceNonSeamlessCubeMapFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_non_seamless_cube_map_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    non_seamless_cube_map: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRenderPassStripedFeaturesARM = extern struct {
    s_type: StructureType = StructureType.physical_device_render_pass_striped_features_arm,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    render_pass_striped: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRenderPassStripedPropertiesARM = extern struct {
    s_type: StructureType = StructureType.physical_device_render_pass_striped_properties_arm,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    render_pass_stripe_granularity: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_render_pass_stripes: u32 = @import("std").mem.zeroes(u32),
};
pub const RenderPassStripeInfoARM = extern struct {
    s_type: StructureType = StructureType.render_pass_stripe_info_arm,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stripe_area: Rect2D = @import("std").mem.zeroes(Rect2D),
};
pub const RenderPassStripeBeginInfoARM = extern struct {
    s_type: StructureType = StructureType.render_pass_stripe_begin_info_arm,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stripe_info_count: u32 = @import("std").mem.zeroes(u32),
    p_stripe_infos: [*c]const RenderPassStripeInfoARM = @import("std").mem.zeroes([*c]const RenderPassStripeInfoARM),
};
pub const RenderPassStripeSubmitInfoARM = extern struct {
    s_type: StructureType = StructureType.render_pass_stripe_submit_info_arm,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    stripe_semaphore_info_count: u32 = @import("std").mem.zeroes(u32),
    p_stripe_semaphore_infos: [*c]const SemaphoreSubmitInfo = @import("std").mem.zeroes([*c]const SemaphoreSubmitInfo),
};
pub const PhysicalDeviceFragmentDensityMapOffsetFeaturesQCOM = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_density_map_offset_features_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_density_map_offset: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceFragmentDensityMapOffsetPropertiesQCOM = extern struct {
    s_type: StructureType = StructureType.physical_device_fragment_density_map_offset_properties_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fragment_density_offset_granularity: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const SubpassFragmentDensityMapOffsetEndInfoQCOM = extern struct {
    s_type: StructureType = StructureType.subpass_fragment_density_map_offset_end_info_qcom,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    fragment_density_offset_count: u32 = @import("std").mem.zeroes(u32),
    p_fragment_density_offsets: [*c]const Offset2D = @import("std").mem.zeroes([*c]const Offset2D),
};
pub const CopyMemoryIndirectCommandNV = extern struct {
    src_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    dst_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const CopyMemoryToImageIndirectCommandNV = extern struct {
    src_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    buffer_row_length: u32 = @import("std").mem.zeroes(u32),
    buffer_image_height: u32 = @import("std").mem.zeroes(u32),
    image_subresource: ImageSubresourceLayers = @import("std").mem.zeroes(ImageSubresourceLayers),
    image_offset: Offset3D = @import("std").mem.zeroes(Offset3D),
    image_extent: Extent3D = @import("std").mem.zeroes(Extent3D),
};
pub const PhysicalDeviceCopyMemoryIndirectFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_copy_memory_indirect_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    indirect_copy: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceCopyMemoryIndirectPropertiesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_copy_memory_indirect_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supported_queues: QueueFlags = @import("std").mem.zeroes(QueueFlags),
};
pub const PFN_cmdCopyMemoryIndirectNV = ?*const fn (CommandBuffer, DeviceAddress, u32, u32) callconv(.c) void;
pub const PFN_cmdCopyMemoryToImageIndirectNV = ?*const fn (CommandBuffer, DeviceAddress, u32, u32, Image, ImageLayout, [*c]const ImageSubresourceLayers) callconv(.c) void;
pub extern fn cmdCopyMemoryIndirectNV(command_buffer: CommandBuffer, copy_buffer_address: DeviceAddress, copy_count: u32, stride: u32) void;
pub extern fn cmdCopyMemoryToImageIndirectNV(command_buffer: CommandBuffer, copy_buffer_address: DeviceAddress, copy_count: u32, stride: u32, dst_image: Image, dst_image_layout: ImageLayout, p_image_subresources: [*c]const ImageSubresourceLayers) void;
pub const MemoryDecompressionMethodFlagsNV = Flags64;
pub const DecompressMemoryRegionNV = extern struct {
    src_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    dst_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    compressed_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    decompressed_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    decompression_method: MemoryDecompressionMethodFlagsNV = @import("std").mem.zeroes(MemoryDecompressionMethodFlagsNV),
};
pub const PhysicalDeviceMemoryDecompressionFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_memory_decompression_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    memory_decompression: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMemoryDecompressionPropertiesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_memory_decompression_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    decompression_methods: MemoryDecompressionMethodFlagsNV = @import("std").mem.zeroes(MemoryDecompressionMethodFlagsNV),
    max_decompression_indirect_count: u64 = @import("std").mem.zeroes(u64),
};
pub const PFN_cmdDecompressMemoryNV = ?*const fn (CommandBuffer, u32, [*c]const DecompressMemoryRegionNV) callconv(.c) void;
pub const PFN_cmdDecompressMemoryIndirectCountNV = ?*const fn (CommandBuffer, DeviceAddress, DeviceAddress, u32) callconv(.c) void;
pub extern fn cmdDecompressMemoryNV(command_buffer: CommandBuffer, decompress_region_count: u32, p_decompress_memory_regions: [*c]const DecompressMemoryRegionNV) void;
pub extern fn cmdDecompressMemoryIndirectCountNV(command_buffer: CommandBuffer, indirect_commands_address: DeviceAddress, indirect_commands_count_address: DeviceAddress, stride: u32) void;
pub const PhysicalDeviceDeviceGeneratedCommandsComputeFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_device_generated_commands_compute_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_generated_compute: Bool32 = @import("std").mem.zeroes(Bool32),
    device_generated_compute_pipelines: Bool32 = @import("std").mem.zeroes(Bool32),
    device_generated_compute_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ComputePipelineIndirectBufferInfoNV = extern struct {
    s_type: StructureType = StructureType.compute_pipeline_indirect_buffer_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    device_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    pipeline_device_address_capture_replay: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const PipelineIndirectDeviceAddressInfoNV = extern struct {
    s_type: StructureType = StructureType.pipeline_indirect_device_address_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    pipeline_bind_point: PipelineBindPoint = @import("std").mem.zeroes(PipelineBindPoint),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
};
pub const BindPipelineIndirectCommandNV = extern struct {
    pipeline_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const PFN_getPipelineIndirectMemoryRequirementsNV = ?*const fn (Device, [*c]const ComputePipelineCreateInfo, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_cmdUpdatePipelineIndirectBufferNV = ?*const fn (CommandBuffer, PipelineBindPoint, Pipeline) callconv(.c) void;
pub const PFN_getPipelineIndirectDeviceAddressNV = ?*const fn (Device, [*c]const PipelineIndirectDeviceAddressInfoNV) callconv(.c) DeviceAddress;
pub extern fn getPipelineIndirectMemoryRequirementsNV(device: Device, p_create_info: [*c]const ComputePipelineCreateInfo, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn cmdUpdatePipelineIndirectBufferNV(command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, pipeline: Pipeline) void;
pub extern fn getPipelineIndirectDeviceAddressNV(device: Device, p_info: [*c]const PipelineIndirectDeviceAddressInfoNV) DeviceAddress;
pub const PhysicalDeviceLinearColorAttachmentFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_linear_color_attachment_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    linear_color_attachment: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImageCompressionControlSwapchainFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_image_compression_control_swapchain_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_compression_control_swapchain: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ImageViewSampleWeightCreateInfoQCOM = extern struct {
    s_type: StructureType = StructureType.image_view_sample_weight_create_info_qcom,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    filter_center: Offset2D = @import("std").mem.zeroes(Offset2D),
    filter_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    num_phases: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceImageProcessingFeaturesQCOM = extern struct {
    s_type: StructureType = StructureType.physical_device_image_processing_features_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    texture_sample_weighted: Bool32 = @import("std").mem.zeroes(Bool32),
    texture_box_filter: Bool32 = @import("std").mem.zeroes(Bool32),
    texture_block_match: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImageProcessingPropertiesQCOM = extern struct {
    s_type: StructureType = StructureType.physical_device_image_processing_properties_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_weight_filter_phases: u32 = @import("std").mem.zeroes(u32),
    max_weight_filter_dimension: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_block_match_region: Extent2D = @import("std").mem.zeroes(Extent2D),
    max_box_filter_block_size: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const PhysicalDeviceNestedCommandBufferFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_nested_command_buffer_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    nested_command_buffer: Bool32 = @import("std").mem.zeroes(Bool32),
    nested_command_buffer_rendering: Bool32 = @import("std").mem.zeroes(Bool32),
    nested_command_buffer_simultaneous_use: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceNestedCommandBufferPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_nested_command_buffer_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_command_buffer_nesting_level: u32 = @import("std").mem.zeroes(u32),
};
pub const ExternalMemoryAcquireUnmodifiedEXT = extern struct {
    s_type: StructureType = StructureType.external_memory_acquire_unmodified_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acquire_unmodified_memory: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceExtendedDynamicState3FeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_extended_dynamic_state3features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    extended_dynamic_state3tessellation_domain_origin: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3depth_clamp_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3polygon_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3rasterization_samples: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3sample_mask: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3alpha_to_coverage_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3alpha_to_one_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3logic_op_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3color_blend_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3color_blend_equation: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3color_write_mask: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3rasterization_stream: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3conservative_rasterization_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3extra_primitive_overestimation_size: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3depth_clip_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3sample_locations_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3color_blend_advanced: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3provoking_vertex_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3line_rasterization_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3line_stipple_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3depth_clip_negative_one_to_one: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3viewport_wscaling_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3viewport_swizzle: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3coverage_to_color_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3coverage_to_color_location: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3coverage_modulation_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3coverage_modulation_table_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3coverage_modulation_table: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3coverage_reduction_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3representative_fragment_test_enable: Bool32 = @import("std").mem.zeroes(Bool32),
    extended_dynamic_state3shading_rate_image_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceExtendedDynamicState3PropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_extended_dynamic_state3properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    dynamic_primitive_topology_unrestricted: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const ColorBlendEquationEXT = extern struct {
    src_color_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    dst_color_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    color_blend_op: BlendOp = @import("std").mem.zeroes(BlendOp),
    src_alpha_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    dst_alpha_blend_factor: BlendFactor = @import("std").mem.zeroes(BlendFactor),
    alpha_blend_op: BlendOp = @import("std").mem.zeroes(BlendOp),
};
pub const ColorBlendAdvancedEXT = extern struct {
    advanced_blend_op: BlendOp = @import("std").mem.zeroes(BlendOp),
    src_premultiplied: Bool32 = @import("std").mem.zeroes(Bool32),
    dst_premultiplied: Bool32 = @import("std").mem.zeroes(Bool32),
    blend_overlap: BlendOverlapEXT = @import("std").mem.zeroes(BlendOverlapEXT),
    clamp_results: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdSetDepthClampEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetPolygonModeEXT = ?*const fn (CommandBuffer, PolygonMode) callconv(.c) void;
pub const PFN_cmdSetRasterizationSamplesEXT = ?*const fn (CommandBuffer, SampleCountFlags) callconv(.c) void;
pub const PFN_cmdSetSampleMaskEXT = ?*const fn (CommandBuffer, SampleCountFlags, [*c]const SampleMask) callconv(.c) void;
pub const PFN_cmdSetAlphaToCoverageEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetAlphaToOneEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetLogicOpEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetColorBlendEnableEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const Bool32) callconv(.c) void;
pub const PFN_cmdSetColorBlendEquationEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const ColorBlendEquationEXT) callconv(.c) void;
pub const PFN_cmdSetColorWriteMaskEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const ColorComponentFlags) callconv(.c) void;
pub const PFN_cmdSetTessellationDomainOriginEXT = ?*const fn (CommandBuffer, TessellationDomainOrigin) callconv(.c) void;
pub const PFN_cmdSetRasterizationStreamEXT = ?*const fn (CommandBuffer, u32) callconv(.c) void;
pub const PFN_cmdSetConservativeRasterizationModeEXT = ?*const fn (CommandBuffer, ConservativeRasterizationModeEXT) callconv(.c) void;
pub const PFN_cmdSetExtraPrimitiveOverestimationSizeEXT = ?*const fn (CommandBuffer, f32) callconv(.c) void;
pub const PFN_cmdSetDepthClipEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetSampleLocationsEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetColorBlendAdvancedEXT = ?*const fn (CommandBuffer, u32, u32, [*c]const ColorBlendAdvancedEXT) callconv(.c) void;
pub const PFN_cmdSetProvokingVertexModeEXT = ?*const fn (CommandBuffer, ProvokingVertexModeEXT) callconv(.c) void;
pub const PFN_cmdSetLineRasterizationModeEXT = ?*const fn (CommandBuffer, LineRasterizationModeEXT) callconv(.c) void;
pub const PFN_cmdSetLineStippleEnableEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetDepthClipNegativeOneToOneEXT = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetViewportWScalingEnableNV = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetViewportSwizzleNV = ?*const fn (CommandBuffer, u32, u32, [*c]const ViewportSwizzleNV) callconv(.c) void;
pub const PFN_cmdSetCoverageToColorEnableNV = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetCoverageToColorLocationNV = ?*const fn (CommandBuffer, u32) callconv(.c) void;
pub const PFN_cmdSetCoverageModulationModeNV = ?*const fn (CommandBuffer, CoverageModulationModeNV) callconv(.c) void;
pub const PFN_cmdSetCoverageModulationTableEnableNV = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetCoverageModulationTableNV = ?*const fn (CommandBuffer, u32, [*c]const f32) callconv(.c) void;
pub const PFN_cmdSetShadingRateImageEnableNV = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetRepresentativeFragmentTestEnableNV = ?*const fn (CommandBuffer, Bool32) callconv(.c) void;
pub const PFN_cmdSetCoverageReductionModeNV = ?*const fn (CommandBuffer, CoverageReductionModeNV) callconv(.c) void;
pub extern fn cmdSetDepthClampEnableEXT(command_buffer: CommandBuffer, depth_clamp_enable: Bool32) void;
pub extern fn cmdSetPolygonModeEXT(command_buffer: CommandBuffer, polygon_mode: PolygonMode) void;
pub extern fn cmdSetRasterizationSamplesEXT(command_buffer: CommandBuffer, rasterization_samples: SampleCountFlags) void;
pub extern fn cmdSetSampleMaskEXT(command_buffer: CommandBuffer, samples: SampleCountFlags, p_sample_mask: [*c]const SampleMask) void;
pub extern fn cmdSetAlphaToCoverageEnableEXT(command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32) void;
pub extern fn cmdSetAlphaToOneEnableEXT(command_buffer: CommandBuffer, alpha_to_one_enable: Bool32) void;
pub extern fn cmdSetLogicOpEnableEXT(command_buffer: CommandBuffer, logic_op_enable: Bool32) void;
pub extern fn cmdSetColorBlendEnableEXT(command_buffer: CommandBuffer, first_attachment: u32, attachment_count: u32, p_color_blend_enables: [*c]const Bool32) void;
pub extern fn cmdSetColorBlendEquationEXT(command_buffer: CommandBuffer, first_attachment: u32, attachment_count: u32, p_color_blend_equations: [*c]const ColorBlendEquationEXT) void;
pub extern fn cmdSetColorWriteMaskEXT(command_buffer: CommandBuffer, first_attachment: u32, attachment_count: u32, p_color_write_masks: [*c]const ColorComponentFlags) void;
pub extern fn cmdSetTessellationDomainOriginEXT(command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin) void;
pub extern fn cmdSetRasterizationStreamEXT(command_buffer: CommandBuffer, rasterization_stream: u32) void;
pub extern fn cmdSetConservativeRasterizationModeEXT(command_buffer: CommandBuffer, conservative_rasterization_mode: ConservativeRasterizationModeEXT) void;
pub extern fn cmdSetExtraPrimitiveOverestimationSizeEXT(command_buffer: CommandBuffer, extra_primitive_overestimation_size: f32) void;
pub extern fn cmdSetDepthClipEnableEXT(command_buffer: CommandBuffer, depth_clip_enable: Bool32) void;
pub extern fn cmdSetSampleLocationsEnableEXT(command_buffer: CommandBuffer, sample_locations_enable: Bool32) void;
pub extern fn cmdSetColorBlendAdvancedEXT(command_buffer: CommandBuffer, first_attachment: u32, attachment_count: u32, p_color_blend_advanced: [*c]const ColorBlendAdvancedEXT) void;
pub extern fn cmdSetProvokingVertexModeEXT(command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT) void;
pub extern fn cmdSetLineRasterizationModeEXT(command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT) void;
pub extern fn cmdSetLineStippleEnableEXT(command_buffer: CommandBuffer, stippled_line_enable: Bool32) void;
pub extern fn cmdSetDepthClipNegativeOneToOneEXT(command_buffer: CommandBuffer, negative_one_to_one: Bool32) void;
pub extern fn cmdSetViewportWScalingEnableNV(command_buffer: CommandBuffer, viewport_wscaling_enable: Bool32) void;
pub extern fn cmdSetViewportSwizzleNV(command_buffer: CommandBuffer, first_viewport: u32, viewport_count: u32, p_viewport_swizzles: [*c]const ViewportSwizzleNV) void;
pub extern fn cmdSetCoverageToColorEnableNV(command_buffer: CommandBuffer, coverage_to_color_enable: Bool32) void;
pub extern fn cmdSetCoverageToColorLocationNV(command_buffer: CommandBuffer, coverage_to_color_location: u32) void;
pub extern fn cmdSetCoverageModulationModeNV(command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV) void;
pub extern fn cmdSetCoverageModulationTableEnableNV(command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32) void;
pub extern fn cmdSetCoverageModulationTableNV(command_buffer: CommandBuffer, coverage_modulation_table_count: u32, p_coverage_modulation_table: [*c]const f32) void;
pub extern fn cmdSetShadingRateImageEnableNV(command_buffer: CommandBuffer, shading_rate_image_enable: Bool32) void;
pub extern fn cmdSetRepresentativeFragmentTestEnableNV(command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32) void;
pub extern fn cmdSetCoverageReductionModeNV(command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV) void;
pub const SubpassMergeStatusEXT = enum(u32) {
    merged_ext = 0,
    disallowed_ext = 1,
    not_merged_side_effects_ext = 2,
    not_merged_samples_mismatch_ext = 3,
    not_merged_views_mismatch_ext = 4,
    not_merged_aliasing_ext = 5,
    not_merged_dependencies_ext = 6,
    not_merged_incompatible_input_attachment_ext = 7,
    not_merged_too_many_attachments_ext = 8,
    not_merged_insufficient_storage_ext = 9,
    not_merged_depth_stencil_count_ext = 10,
    not_merged_resolve_attachment_reuse_ext = 11,
    not_merged_single_subpass_ext = 12,
    not_merged_unspecified_ext = 13,
};
pub const PhysicalDeviceSubpassMergeFeedbackFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_subpass_merge_feedback_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    subpass_merge_feedback: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RenderPassCreationControlEXT = extern struct {
    s_type: StructureType = StructureType.render_pass_creation_control_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    disallow_merging: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RenderPassCreationFeedbackInfoEXT = extern struct {
    post_merge_subpass_count: u32 = @import("std").mem.zeroes(u32),
};
pub const RenderPassCreationFeedbackCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.render_pass_creation_feedback_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_render_pass_feedback: [*c]RenderPassCreationFeedbackInfoEXT = @import("std").mem.zeroes([*c]RenderPassCreationFeedbackInfoEXT),
};
pub const RenderPassSubpassFeedbackInfoEXT = extern struct {
    subpass_merge_status: SubpassMergeStatusEXT = @import("std").mem.zeroes(SubpassMergeStatusEXT),
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
    post_merge_index: u32 = @import("std").mem.zeroes(u32),
};
pub const RenderPassSubpassFeedbackCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.render_pass_subpass_feedback_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_subpass_feedback: [*c]RenderPassSubpassFeedbackInfoEXT = @import("std").mem.zeroes([*c]RenderPassSubpassFeedbackInfoEXT),
};
pub const DirectDriverLoadingModeLUNARG = enum(u32) {
    exclusive_lunarg = 0,
    inclusive_lunarg = 1,
};
pub const DirectDriverLoadingFlagsLUNARG = Flags;
pub const PFN_getInstanceProcAddrLUNARG = ?*const fn (Instance, [*c]const u8) callconv(.c) PFN_voidFunction;
pub const DirectDriverLoadingInfoLUNARG = extern struct {
    s_type: StructureType = StructureType.direct_driver_loading_info_lunarg,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: DirectDriverLoadingFlagsLUNARG = @import("std").mem.zeroes(DirectDriverLoadingFlagsLUNARG),
    pfn_get_instance_proc_addr: PFN_getInstanceProcAddrLUNARG = @import("std").mem.zeroes(PFN_getInstanceProcAddrLUNARG),
};
pub const DirectDriverLoadingListLUNARG = extern struct {
    s_type: StructureType = StructureType.direct_driver_loading_list_lunarg,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    mode: DirectDriverLoadingModeLUNARG = @import("std").mem.zeroes(DirectDriverLoadingModeLUNARG),
    driver_count: u32 = @import("std").mem.zeroes(u32),
    p_drivers: [*c]const DirectDriverLoadingInfoLUNARG = @import("std").mem.zeroes([*c]const DirectDriverLoadingInfoLUNARG),
};
pub const PhysicalDeviceShaderModuleIdentifierFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_module_identifier_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_module_identifier: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderModuleIdentifierPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_module_identifier_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_module_identifier_algorithm_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
};
pub const PipelineShaderStageModuleIdentifierCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.pipeline_shader_stage_module_identifier_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    identifier_size: u32 = @import("std").mem.zeroes(u32),
    p_identifier: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const ShaderModuleIdentifierEXT = extern struct {
    s_type: StructureType = StructureType.shader_module_identifier_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    identifier_size: u32 = @import("std").mem.zeroes(u32),
    identifier: [32]u8 = @import("std").mem.zeroes([32]u8),
};
pub const PFN_getShaderModuleIdentifierEXT = ?*const fn (Device, ShaderModule, [*c]ShaderModuleIdentifierEXT) callconv(.c) void;
pub const PFN_getShaderModuleCreateInfoIdentifierEXT = ?*const fn (Device, [*c]const ShaderModuleCreateInfo, [*c]ShaderModuleIdentifierEXT) callconv(.c) void;
pub extern fn getShaderModuleIdentifierEXT(device: Device, shader_module: ShaderModule, p_identifier: [*c]ShaderModuleIdentifierEXT) void;
pub extern fn getShaderModuleCreateInfoIdentifierEXT(device: Device, p_create_info: [*c]const ShaderModuleCreateInfo, p_identifier: [*c]ShaderModuleIdentifierEXT) void;
pub const OpticalFlowSessionNV = enum(u64) { null = 0, _ };
pub const OpticalFlowPerformanceLevelNV = enum(u32) {
    unknown_nv = 0,
    slow_nv = 1,
    medium_nv = 2,
    fast_nv = 3,
};
pub const OpticalFlowSessionBindingPointNV = enum(u32) {
    unknown_nv = 0,
    input_nv = 1,
    reference_nv = 2,
    hint_nv = 3,
    flow_vector_nv = 4,
    backward_flow_vector_nv = 5,
    cost_nv = 6,
    backward_cost_nv = 7,
    global_flow_nv = 8,
};
pub const OpticalFlowGridSizeFlagsNV = enum(u32) {
    unknown_nv = 0,
    @"1x1_bit_nv" = 1,
    @"2x2_bit_nv" = 2,
    @"4x4_bit_nv" = 4,
    @"8x8_bit_nv" = 8,
};
pub const OpticalFlowUsageFlagsNV = enum(u32) {
    unknown_nv = 0,
    input_bit_nv = 1,
    output_bit_nv = 2,
    hint_bit_nv = 4,
    cost_bit_nv = 8,
    global_flow_bit_nv = 16,
};
pub const OpticalFlowSessionCreateFlagsNV = enum(u32) {
    null = 0,
    enable_hint_bit_nv = 1,
    enable_cost_bit_nv = 2,
    enable_global_flow_bit_nv = 4,
    allow_regions_bit_nv = 8,
    both_directions_bit_nv = 16,
};
pub const OpticalFlowExecuteFlagsNV = enum(u32) {
    null = 0,
    disable_temporal_hints_bit_nv = 1,
};
pub const PhysicalDeviceOpticalFlowFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_optical_flow_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    optical_flow: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceOpticalFlowPropertiesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_optical_flow_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supported_output_grid_sizes: OpticalFlowGridSizeFlagsNV = @import("std").mem.zeroes(OpticalFlowGridSizeFlagsNV),
    supported_hint_grid_sizes: OpticalFlowGridSizeFlagsNV = @import("std").mem.zeroes(OpticalFlowGridSizeFlagsNV),
    hint_supported: Bool32 = @import("std").mem.zeroes(Bool32),
    cost_supported: Bool32 = @import("std").mem.zeroes(Bool32),
    bidirectional_flow_supported: Bool32 = @import("std").mem.zeroes(Bool32),
    global_flow_supported: Bool32 = @import("std").mem.zeroes(Bool32),
    min_width: u32 = @import("std").mem.zeroes(u32),
    min_height: u32 = @import("std").mem.zeroes(u32),
    max_width: u32 = @import("std").mem.zeroes(u32),
    max_height: u32 = @import("std").mem.zeroes(u32),
    max_num_regions_of_interest: u32 = @import("std").mem.zeroes(u32),
};
pub const OpticalFlowImageFormatInfoNV = extern struct {
    s_type: StructureType = StructureType.optical_flow_image_format_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    usage: OpticalFlowUsageFlagsNV = @import("std").mem.zeroes(OpticalFlowUsageFlagsNV),
};
pub const OpticalFlowImageFormatPropertiesNV = extern struct {
    s_type: StructureType = StructureType.optical_flow_image_format_properties_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    format: Format = @import("std").mem.zeroes(Format),
};
pub const OpticalFlowSessionCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.optical_flow_session_create_info_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
    image_format: Format = @import("std").mem.zeroes(Format),
    flow_vector_format: Format = @import("std").mem.zeroes(Format),
    cost_format: Format = @import("std").mem.zeroes(Format),
    output_grid_size: OpticalFlowGridSizeFlagsNV = @import("std").mem.zeroes(OpticalFlowGridSizeFlagsNV),
    hint_grid_size: OpticalFlowGridSizeFlagsNV = @import("std").mem.zeroes(OpticalFlowGridSizeFlagsNV),
    performance_level: OpticalFlowPerformanceLevelNV = @import("std").mem.zeroes(OpticalFlowPerformanceLevelNV),
    flags: OpticalFlowSessionCreateFlagsNV = @import("std").mem.zeroes(OpticalFlowSessionCreateFlagsNV),
};
pub const OpticalFlowSessionCreatePrivateDataInfoNV = extern struct {
    s_type: StructureType = StructureType.optical_flow_session_create_private_data_info_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    id: u32 = @import("std").mem.zeroes(u32),
    size: u32 = @import("std").mem.zeroes(u32),
    p_private_data: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const OpticalFlowExecuteInfoNV = extern struct {
    s_type: StructureType = StructureType.optical_flow_execute_info_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    flags: OpticalFlowExecuteFlagsNV = @import("std").mem.zeroes(OpticalFlowExecuteFlagsNV),
    region_count: u32 = @import("std").mem.zeroes(u32),
    p_regions: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const PFN_getPhysicalDeviceOpticalFlowImageFormatsNV = ?*const fn (PhysicalDevice, [*c]const OpticalFlowImageFormatInfoNV, [*c]u32, [*c]OpticalFlowImageFormatPropertiesNV) callconv(.c) Result;
pub const PFN_createOpticalFlowSessionNV = ?*const fn (Device, [*c]const OpticalFlowSessionCreateInfoNV, [*c]const AllocationCallbacks, [*c]OpticalFlowSessionNV) callconv(.c) Result;
pub const PFN_destroyOpticalFlowSessionNV = ?*const fn (Device, OpticalFlowSessionNV, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_bindOpticalFlowSessionImageNV = ?*const fn (Device, OpticalFlowSessionNV, OpticalFlowSessionBindingPointNV, ImageView, ImageLayout) callconv(.c) Result;
pub const PFN_cmdOpticalFlowExecuteNV = ?*const fn (CommandBuffer, OpticalFlowSessionNV, [*c]const OpticalFlowExecuteInfoNV) callconv(.c) void;
pub extern fn getPhysicalDeviceOpticalFlowImageFormatsNV(physical_device: PhysicalDevice, p_optical_flow_image_format_info: [*c]const OpticalFlowImageFormatInfoNV, p_format_count: [*c]u32, p_image_format_properties: [*c]OpticalFlowImageFormatPropertiesNV) Result;
pub extern fn createOpticalFlowSessionNV(device: Device, p_create_info: [*c]const OpticalFlowSessionCreateInfoNV, p_allocator: [*c]const AllocationCallbacks, p_session: [*c]OpticalFlowSessionNV) Result;
pub extern fn destroyOpticalFlowSessionNV(device: Device, session: OpticalFlowSessionNV, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn bindOpticalFlowSessionImageNV(device: Device, session: OpticalFlowSessionNV, binding_point: OpticalFlowSessionBindingPointNV, view: ImageView, layout: ImageLayout) Result;
pub extern fn cmdOpticalFlowExecuteNV(command_buffer: CommandBuffer, session: OpticalFlowSessionNV, p_execute_info: [*c]const OpticalFlowExecuteInfoNV) void;
pub const PhysicalDeviceLegacyDitheringFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_legacy_dithering_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    legacy_dithering: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDevicePipelineProtectedAccessFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_pipeline_protected_access_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_protected_access: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const AntiLagModeAMD = enum(u32) {
    driver_control_amd = 0,
    on_amd = 1,
    off_amd = 2,
};
pub const AntiLagStageAMD = enum(u32) {
    input_amd = 0,
    present_amd = 1,
};
pub const PhysicalDeviceAntiLagFeaturesAMD = extern struct {
    s_type: StructureType = StructureType.physical_device_anti_lag_features_amd,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    anti_lag: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const AntiLagPresentationInfoAMD = extern struct {
    s_type: StructureType = StructureType.anti_lag_presentation_info_amd,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    stage: AntiLagStageAMD = @import("std").mem.zeroes(AntiLagStageAMD),
    frame_index: u64 = @import("std").mem.zeroes(u64),
};
pub const AntiLagDataAMD = extern struct {
    s_type: StructureType = StructureType.anti_lag_data_amd,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    mode: AntiLagModeAMD = @import("std").mem.zeroes(AntiLagModeAMD),
    max_fps: u32 = @import("std").mem.zeroes(u32),
    p_presentation_info: [*c]const AntiLagPresentationInfoAMD = @import("std").mem.zeroes([*c]const AntiLagPresentationInfoAMD),
};
pub const PFN_antiLagUpdateAMD = ?*const fn (Device, [*c]const AntiLagDataAMD) callconv(.c) void;
pub extern fn antiLagUpdateAMD(device: Device, p_data: [*c]const AntiLagDataAMD) void;
pub const ShaderEXT = enum(u64) { null = 0, _ };
pub const ShaderCodeTypeEXT = enum(u32) {
    binary_ext = 0,
    spirv_ext = 1,
};
pub const DepthClampModeEXT = enum(u32) {
    viewport_range_ext = 0,
    user_defined_range_ext = 1,
};
pub const ShaderCreateFlagsEXT = enum(u32) {
    null = 0,
    link_stage_bit_ext = 1,
    allow_varying_subgroup_size_bit_ext = 2,
    require_full_subgroups_bit_ext = 4,
    no_task_shader_bit_ext = 8,
    dispatch_base_bit_ext = 16,
    fragment_shading_rate_attachment_bit_ext = 32,
    fragment_density_map_attachment_bit_ext = 64,
    indirect_bindable_bit_ext = 128,
};
pub const PhysicalDeviceShaderObjectFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_object_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_object: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderObjectPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_object_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_binary_uuid: [16]u8 = @import("std").mem.zeroes([16]u8),
    shader_binary_version: u32 = @import("std").mem.zeroes(u32),
};
pub const ShaderCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.shader_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: ShaderCreateFlagsEXT = @import("std").mem.zeroes(ShaderCreateFlagsEXT),
    stage: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    next_stage: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    code_type: ShaderCodeTypeEXT = @import("std").mem.zeroes(ShaderCodeTypeEXT),
    code_size: usize = @import("std").mem.zeroes(usize),
    p_code: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    set_layout_count: u32 = @import("std").mem.zeroes(u32),
    p_set_layouts: [*c]const DescriptorSetLayout = @import("std").mem.zeroes([*c]const DescriptorSetLayout),
    push_constant_range_count: u32 = @import("std").mem.zeroes(u32),
    p_push_constant_ranges: [*c]const PushConstantRange = @import("std").mem.zeroes([*c]const PushConstantRange),
    p_specialization_info: [*c]const SpecializationInfo = @import("std").mem.zeroes([*c]const SpecializationInfo),
};
pub const ShaderRequiredSubgroupSizeCreateInfoEXT = PipelineShaderStageRequiredSubgroupSizeCreateInfo;
pub const DepthClampRangeEXT = extern struct {
    min_depth_clamp: f32 = @import("std").mem.zeroes(f32),
    max_depth_clamp: f32 = @import("std").mem.zeroes(f32),
};
pub const PFN_createShadersEXT = ?*const fn (Device, u32, [*c]const ShaderCreateInfoEXT, [*c]const AllocationCallbacks, [*c]ShaderEXT) callconv(.c) Result;
pub const PFN_destroyShaderEXT = ?*const fn (Device, ShaderEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_getShaderBinaryDataEXT = ?*const fn (Device, ShaderEXT, [*c]usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_cmdBindShadersEXT = ?*const fn (CommandBuffer, u32, [*c]const ShaderStageFlags, [*c]const ShaderEXT) callconv(.c) void;
pub const PFN_cmdSetDepthClampRangeEXT = ?*const fn (CommandBuffer, DepthClampModeEXT, [*c]const DepthClampRangeEXT) callconv(.c) void;
pub extern fn createShadersEXT(device: Device, create_info_count: u32, p_create_infos: [*c]const ShaderCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_shaders: [*c]ShaderEXT) Result;
pub extern fn destroyShaderEXT(device: Device, shader: ShaderEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn getShaderBinaryDataEXT(device: Device, shader: ShaderEXT, p_data_size: [*c]usize, p_data: ?*anyopaque) Result;
pub extern fn cmdBindShadersEXT(command_buffer: CommandBuffer, stage_count: u32, p_stages: [*c]const ShaderStageFlags, p_shaders: [*c]const ShaderEXT) void;
pub extern fn cmdSetDepthClampRangeEXT(command_buffer: CommandBuffer, depth_clamp_mode: DepthClampModeEXT, p_depth_clamp_range: [*c]const DepthClampRangeEXT) void;
pub const PhysicalDeviceTilePropertiesFeaturesQCOM = extern struct {
    s_type: StructureType = StructureType.physical_device_tile_properties_features_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    tile_properties: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const TilePropertiesQCOM = extern struct {
    s_type: StructureType = StructureType.tile_properties_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    tile_size: Extent3D = @import("std").mem.zeroes(Extent3D),
    apron_size: Extent2D = @import("std").mem.zeroes(Extent2D),
    origin: Offset2D = @import("std").mem.zeroes(Offset2D),
};
pub const PFN_getFramebufferTilePropertiesQCOM = ?*const fn (Device, Framebuffer, [*c]u32, [*c]TilePropertiesQCOM) callconv(.c) Result;
pub const PFN_getDynamicRenderingTilePropertiesQCOM = ?*const fn (Device, [*c]const RenderingInfo, [*c]TilePropertiesQCOM) callconv(.c) Result;
pub extern fn getFramebufferTilePropertiesQCOM(device: Device, framebuffer: Framebuffer, p_properties_count: [*c]u32, p_properties: [*c]TilePropertiesQCOM) Result;
pub extern fn getDynamicRenderingTilePropertiesQCOM(device: Device, p_rendering_info: [*c]const RenderingInfo, p_properties: [*c]TilePropertiesQCOM) Result;
pub const PhysicalDeviceAmigoProfilingFeaturesSEC = extern struct {
    s_type: StructureType = StructureType.physical_device_amigo_profiling_features_sec,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    amigo_profiling: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const AmigoProfilingSubmitInfoSEC = extern struct {
    s_type: StructureType = StructureType.amigo_profiling_submit_info_sec,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    first_draw_timestamp: u64 = @import("std").mem.zeroes(u64),
    swap_buffer_timestamp: u64 = @import("std").mem.zeroes(u64),
};
pub const PhysicalDeviceMultiviewPerViewViewportsFeaturesQCOM = extern struct {
    s_type: StructureType = StructureType.physical_device_multiview_per_view_viewports_features_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    multiview_per_view_viewports: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const RayTracingInvocationReorderModeNV = enum(u32) {
    none_nv = 0,
    reorder_nv = 1,
};
pub const PhysicalDeviceRayTracingInvocationReorderPropertiesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_ray_tracing_invocation_reorder_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_invocation_reorder_reordering_hint: RayTracingInvocationReorderModeNV = @import("std").mem.zeroes(RayTracingInvocationReorderModeNV),
};
pub const PhysicalDeviceRayTracingInvocationReorderFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_ray_tracing_invocation_reorder_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_invocation_reorder: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceExtendedSparseAddressSpaceFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_extended_sparse_address_space_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    extended_sparse_address_space: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceExtendedSparseAddressSpacePropertiesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_extended_sparse_address_space_properties_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    extended_sparse_address_space_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    extended_sparse_image_usage_flags: ImageUsageFlags = @import("std").mem.zeroes(ImageUsageFlags),
    extended_sparse_buffer_usage_flags: BufferUsageFlags = @import("std").mem.zeroes(BufferUsageFlags),
};
pub const PhysicalDeviceLegacyVertexAttributesFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_legacy_vertex_attributes_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    legacy_vertex_attributes: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceLegacyVertexAttributesPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_legacy_vertex_attributes_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    native_unaligned_performance: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const LayerSettingTypeEXT = enum(u32) {
    bool32_ext = 0,
    int32_ext = 1,
    int64_ext = 2,
    uint32_ext = 3,
    uint64_ext = 4,
    float32_ext = 5,
    float64_ext = 6,
    string_ext = 7,
};
pub const LayerSettingEXT = extern struct {
    p_layer_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    p_setting_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    type: LayerSettingTypeEXT = @import("std").mem.zeroes(LayerSettingTypeEXT),
    value_count: u32 = @import("std").mem.zeroes(u32),
    p_values: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const LayerSettingsCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.layer_settings_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    setting_count: u32 = @import("std").mem.zeroes(u32),
    p_settings: [*c]const LayerSettingEXT = @import("std").mem.zeroes([*c]const LayerSettingEXT),
};
pub const PhysicalDeviceShaderCoreBuiltinsFeaturesARM = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_core_builtins_features_arm,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_core_builtins: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderCoreBuiltinsPropertiesARM = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_core_builtins_properties_arm,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_core_mask: u64 = @import("std").mem.zeroes(u64),
    shader_core_count: u32 = @import("std").mem.zeroes(u32),
    shader_warps_per_core: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_pipeline_library_group_handles_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline_library_group_handles: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_dynamic_rendering_unused_attachments_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    dynamic_rendering_unused_attachments: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const LatencyMarkerNV = enum(u32) {
    simulation_start_nv = 0,
    simulation_end_nv = 1,
    rendersubmit_start_nv = 2,
    rendersubmit_end_nv = 3,
    present_start_nv = 4,
    present_end_nv = 5,
    input_sample_nv = 6,
    trigger_flash_nv = 7,
    out_of_band_rendersubmit_start_nv = 8,
    out_of_band_rendersubmit_end_nv = 9,
    out_of_band_present_start_nv = 10,
    out_of_band_present_end_nv = 11,
};
pub const OutOfBandQueueTypeNV = enum(u32) {
    render_nv = 0,
    present_nv = 1,
};
pub const LatencySleepModeInfoNV = extern struct {
    s_type: StructureType = StructureType.latency_sleep_mode_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    low_latency_mode: Bool32 = @import("std").mem.zeroes(Bool32),
    low_latency_boost: Bool32 = @import("std").mem.zeroes(Bool32),
    minimum_interval_us: u32 = @import("std").mem.zeroes(u32),
};
pub const LatencySleepInfoNV = extern struct {
    s_type: StructureType = StructureType.latency_sleep_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    signal_semaphore: Semaphore = @import("std").mem.zeroes(Semaphore),
    value: u64 = @import("std").mem.zeroes(u64),
};
pub const SetLatencyMarkerInfoNV = extern struct {
    s_type: StructureType = StructureType.set_latency_marker_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    present_id: u64 = @import("std").mem.zeroes(u64),
    marker: LatencyMarkerNV = @import("std").mem.zeroes(LatencyMarkerNV),
};
pub const LatencyTimingsFrameReportNV = extern struct {
    s_type: StructureType = StructureType.latency_timings_frame_report_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    present_id: u64 = @import("std").mem.zeroes(u64),
    input_sample_time_us: u64 = @import("std").mem.zeroes(u64),
    sim_start_time_us: u64 = @import("std").mem.zeroes(u64),
    sim_end_time_us: u64 = @import("std").mem.zeroes(u64),
    render_submit_start_time_us: u64 = @import("std").mem.zeroes(u64),
    render_submit_end_time_us: u64 = @import("std").mem.zeroes(u64),
    present_start_time_us: u64 = @import("std").mem.zeroes(u64),
    present_end_time_us: u64 = @import("std").mem.zeroes(u64),
    driver_start_time_us: u64 = @import("std").mem.zeroes(u64),
    driver_end_time_us: u64 = @import("std").mem.zeroes(u64),
    os_render_queue_start_time_us: u64 = @import("std").mem.zeroes(u64),
    os_render_queue_end_time_us: u64 = @import("std").mem.zeroes(u64),
    gpu_render_start_time_us: u64 = @import("std").mem.zeroes(u64),
    gpu_render_end_time_us: u64 = @import("std").mem.zeroes(u64),
};
pub const GetLatencyMarkerInfoNV = extern struct {
    s_type: StructureType = StructureType.get_latency_marker_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    timing_count: u32 = @import("std").mem.zeroes(u32),
    p_timings: [*c]LatencyTimingsFrameReportNV = @import("std").mem.zeroes([*c]LatencyTimingsFrameReportNV),
};
pub const LatencySubmissionPresentIdNV = extern struct {
    s_type: StructureType = StructureType.latency_submission_present_id_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    present_id: u64 = @import("std").mem.zeroes(u64),
};
pub const SwapchainLatencyCreateInfoNV = extern struct {
    s_type: StructureType = StructureType.swapchain_latency_create_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    latency_mode_enable: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const OutOfBandQueueTypeInfoNV = extern struct {
    s_type: StructureType = StructureType.out_of_band_queue_type_info_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    queue_type: OutOfBandQueueTypeNV = @import("std").mem.zeroes(OutOfBandQueueTypeNV),
};
pub const LatencySurfaceCapabilitiesNV = extern struct {
    s_type: StructureType = StructureType.latency_surface_capabilities_nv,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    present_mode_count: u32 = @import("std").mem.zeroes(u32),
    p_present_modes: [*c]PresentModeKHR = @import("std").mem.zeroes([*c]PresentModeKHR),
};
pub const PFN_setLatencySleepModeNV = ?*const fn (Device, SwapchainKHR, [*c]const LatencySleepModeInfoNV) callconv(.c) Result;
pub const PFN_latencySleepNV = ?*const fn (Device, SwapchainKHR, [*c]const LatencySleepInfoNV) callconv(.c) Result;
pub const PFN_setLatencyMarkerNV = ?*const fn (Device, SwapchainKHR, [*c]const SetLatencyMarkerInfoNV) callconv(.c) void;
pub const PFN_getLatencyTimingsNV = ?*const fn (Device, SwapchainKHR, [*c]GetLatencyMarkerInfoNV) callconv(.c) void;
pub const PFN_queueNotifyOutOfBandNV = ?*const fn (Queue, [*c]const OutOfBandQueueTypeInfoNV) callconv(.c) void;
pub extern fn setLatencySleepModeNV(device: Device, swapchain: SwapchainKHR, p_sleep_mode_info: [*c]const LatencySleepModeInfoNV) Result;
pub extern fn latencySleepNV(device: Device, swapchain: SwapchainKHR, p_sleep_info: [*c]const LatencySleepInfoNV) Result;
pub extern fn setLatencyMarkerNV(device: Device, swapchain: SwapchainKHR, p_latency_marker_info: [*c]const SetLatencyMarkerInfoNV) void;
pub extern fn getLatencyTimingsNV(device: Device, swapchain: SwapchainKHR, p_latency_marker_info: [*c]GetLatencyMarkerInfoNV) void;
pub extern fn queueNotifyOutOfBandNV(queue: Queue, p_queue_type_info: [*c]const OutOfBandQueueTypeInfoNV) void;
pub const PhysicalDeviceMultiviewPerViewRenderAreasFeaturesQCOM = extern struct {
    s_type: StructureType = StructureType.physical_device_multiview_per_view_render_areas_features_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    multiview_per_view_render_areas: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const MultiviewPerViewRenderAreasRenderPassBeginInfoQCOM = extern struct {
    s_type: StructureType = StructureType.multiview_per_view_render_areas_render_pass_begin_info_qcom,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    per_view_render_area_count: u32 = @import("std").mem.zeroes(u32),
    p_per_view_render_areas: [*c]const Rect2D = @import("std").mem.zeroes([*c]const Rect2D),
};
pub const PhysicalDevicePerStageDescriptorSetFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_per_stage_descriptor_set_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    per_stage_descriptor_set: Bool32 = @import("std").mem.zeroes(Bool32),
    dynamic_pipeline_layout: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const BlockMatchWindowCompareModeQCOM = enum(u32) {
    min_qcom = 0,
    max_qcom = 1,
};
pub const PhysicalDeviceImageProcessing2FeaturesQCOM = extern struct {
    s_type: StructureType = StructureType.physical_device_image_processing2features_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    texture_block_match2: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImageProcessing2PropertiesQCOM = extern struct {
    s_type: StructureType = StructureType.physical_device_image_processing2properties_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_block_match_window: Extent2D = @import("std").mem.zeroes(Extent2D),
};
pub const SamplerBlockMatchWindowCreateInfoQCOM = extern struct {
    s_type: StructureType = StructureType.sampler_block_match_window_create_info_qcom,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    window_extent: Extent2D = @import("std").mem.zeroes(Extent2D),
    window_compare_mode: BlockMatchWindowCompareModeQCOM = @import("std").mem.zeroes(BlockMatchWindowCompareModeQCOM),
};
pub const CubicFilterWeightsQCOM = enum(u32) {
    catmull_rom_qcom = 0,
    zero_tangent_cardinal_qcom = 1,
    b_spline_qcom = 2,
    mitchell_netravali_qcom = 3,
};
pub const PhysicalDeviceCubicWeightsFeaturesQCOM = extern struct {
    s_type: StructureType = StructureType.physical_device_cubic_weights_features_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    selectable_cubic_weights: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SamplerCubicWeightsCreateInfoQCOM = extern struct {
    s_type: StructureType = StructureType.sampler_cubic_weights_create_info_qcom,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    cubic_weights: CubicFilterWeightsQCOM = @import("std").mem.zeroes(CubicFilterWeightsQCOM),
};
pub const BlitImageCubicWeightsInfoQCOM = extern struct {
    s_type: StructureType = StructureType.blit_image_cubic_weights_info_qcom,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    cubic_weights: CubicFilterWeightsQCOM = @import("std").mem.zeroes(CubicFilterWeightsQCOM),
};
pub const PhysicalDeviceYcbcrDegammaFeaturesQCOM = extern struct {
    s_type: StructureType = StructureType.physical_device_ycbcr_degamma_features_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ycbcr_degamma: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const SamplerYcbcrConversionYcbcrDegammaCreateInfoQCOM = extern struct {
    s_type: StructureType = StructureType.sampler_ycbcr_conversion_ycbcr_degamma_create_info_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    enable_ydegamma: Bool32 = @import("std").mem.zeroes(Bool32),
    enable_cb_cr_degamma: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceCubicClampFeaturesQCOM = extern struct {
    s_type: StructureType = StructureType.physical_device_cubic_clamp_features_qcom,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    cubic_range_clamp: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceAttachmentFeedbackLoopDynamicStateFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_attachment_feedback_loop_dynamic_state_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    attachment_feedback_loop_dynamic_state: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PFN_cmdSetAttachmentFeedbackLoopEnableEXT = ?*const fn (CommandBuffer, ImageAspectFlags) callconv(.c) void;
pub extern fn cmdSetAttachmentFeedbackLoopEnableEXT(command_buffer: CommandBuffer, aspect_mask: ImageAspectFlags) void;
pub const LayeredDriverUnderlyingApiMSFT = enum(u32) {
    none_msft = 0,
    d3d12_msft = 1,
};
pub const PhysicalDeviceLayeredDriverPropertiesMSFT = extern struct {
    s_type: StructureType = StructureType.physical_device_layered_driver_properties_msft,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    underlying_api: LayeredDriverUnderlyingApiMSFT = @import("std").mem.zeroes(LayeredDriverUnderlyingApiMSFT),
};
pub const PhysicalDeviceDescriptorPoolOverallocationFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_descriptor_pool_overallocation_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    descriptor_pool_overallocation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRawAccessChainsFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_raw_access_chains_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_raw_access_chains: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceCommandBufferInheritanceFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_command_buffer_inheritance_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    command_buffer_inheritance: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderAtomicFloat16VectorFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_atomic_float16vector_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_float16vector_atomics: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceShaderReplicatedCompositesFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_shader_replicated_composites_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_replicated_composites: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRayTracingValidationFeaturesNV = extern struct {
    s_type: StructureType = StructureType.physical_device_ray_tracing_validation_features_nv,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_validation: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const IndirectExecutionSetEXT = enum(u64) { null = 0, _ };
pub const IndirectCommandsLayoutEXT = enum(u64) { null = 0, _ };
pub const IndirectExecutionSetInfoTypeEXT = enum(u32) {
    pipelines_ext = 0,
    shader_objects_ext = 1,
};
pub const IndirectCommandsTokenTypeEXT = enum(u32) {
    execution_set_ext = 0,
    push_constant_ext = 1,
    sequence_index_ext = 2,
    index_buffer_ext = 3,
    vertex_buffer_ext = 4,
    draw_indexed_ext = 5,
    draw_ext = 6,
    draw_indexed_count_ext = 7,
    draw_count_ext = 8,
    dispatch_ext = 9,
    draw_mesh_tasks_nv_ext = 1000202002,
    draw_mesh_tasks_count_nv_ext = 1000202003,
    draw_mesh_tasks_ext = 1000328000,
    draw_mesh_tasks_count_ext = 1000328001,
    trace_rays2_ext = 1000386004,
};
pub const IndirectCommandsInputModeFlagsEXT = enum(u32) {
    null = 0,
    vulkan_index_buffer_ext = 1,
    dxgi_index_buffer_ext = 2,
};
pub const IndirectCommandsLayoutUsageFlagsEXT = enum(u32) {
    null = 0,
    explicit_preprocess_bit_ext = 1,
    unordered_sequences_bit_ext = 2,
};
pub const PhysicalDeviceDeviceGeneratedCommandsFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_device_generated_commands_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    device_generated_commands: Bool32 = @import("std").mem.zeroes(Bool32),
    dynamic_generated_pipeline_layout: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceDeviceGeneratedCommandsPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_device_generated_commands_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_indirect_pipeline_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_shader_object_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_sequence_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_token_count: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_token_offset: u32 = @import("std").mem.zeroes(u32),
    max_indirect_commands_indirect_stride: u32 = @import("std").mem.zeroes(u32),
    supported_indirect_commands_input_modes: IndirectCommandsInputModeFlagsEXT = @import("std").mem.zeroes(IndirectCommandsInputModeFlagsEXT),
    supported_indirect_commands_shader_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    supported_indirect_commands_shader_stages_pipeline_binding: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    supported_indirect_commands_shader_stages_shader_binding: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    device_generated_commands_transform_feedback: Bool32 = @import("std").mem.zeroes(Bool32),
    device_generated_commands_multi_draw_indirect_count: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const GeneratedCommandsMemoryRequirementsInfoEXT = extern struct {
    s_type: StructureType = StructureType.generated_commands_memory_requirements_info_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    indirect_execution_set: IndirectExecutionSetEXT = @import("std").mem.zeroes(IndirectExecutionSetEXT),
    indirect_commands_layout: IndirectCommandsLayoutEXT = @import("std").mem.zeroes(IndirectCommandsLayoutEXT),
    max_sequence_count: u32 = @import("std").mem.zeroes(u32),
    max_draw_count: u32 = @import("std").mem.zeroes(u32),
};
pub const IndirectExecutionSetPipelineInfoEXT = extern struct {
    s_type: StructureType = StructureType.indirect_execution_set_pipeline_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    initial_pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
    max_pipeline_count: u32 = @import("std").mem.zeroes(u32),
};
pub const IndirectExecutionSetShaderLayoutInfoEXT = extern struct {
    s_type: StructureType = StructureType.indirect_execution_set_shader_layout_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    set_layout_count: u32 = @import("std").mem.zeroes(u32),
    p_set_layouts: [*c]const DescriptorSetLayout = @import("std").mem.zeroes([*c]const DescriptorSetLayout),
};
pub const IndirectExecutionSetShaderInfoEXT = extern struct {
    s_type: StructureType = StructureType.indirect_execution_set_shader_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    shader_count: u32 = @import("std").mem.zeroes(u32),
    p_initial_shaders: [*c]const ShaderEXT = @import("std").mem.zeroes([*c]const ShaderEXT),
    p_set_layout_infos: [*c]const IndirectExecutionSetShaderLayoutInfoEXT = @import("std").mem.zeroes([*c]const IndirectExecutionSetShaderLayoutInfoEXT),
    max_shader_count: u32 = @import("std").mem.zeroes(u32),
    push_constant_range_count: u32 = @import("std").mem.zeroes(u32),
    p_push_constant_ranges: [*c]const PushConstantRange = @import("std").mem.zeroes([*c]const PushConstantRange),
};
pub const IndirectExecutionSetInfoEXT = extern union {
    p_pipeline_info: [*c]const IndirectExecutionSetPipelineInfoEXT,
    p_shader_info: [*c]const IndirectExecutionSetShaderInfoEXT,
};
pub const IndirectExecutionSetCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.indirect_execution_set_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: IndirectExecutionSetInfoTypeEXT = @import("std").mem.zeroes(IndirectExecutionSetInfoTypeEXT),
    info: IndirectExecutionSetInfoEXT = @import("std").mem.zeroes(IndirectExecutionSetInfoEXT),
};
pub const GeneratedCommandsInfoEXT = extern struct {
    s_type: StructureType = StructureType.generated_commands_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    shader_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    indirect_execution_set: IndirectExecutionSetEXT = @import("std").mem.zeroes(IndirectExecutionSetEXT),
    indirect_commands_layout: IndirectCommandsLayoutEXT = @import("std").mem.zeroes(IndirectCommandsLayoutEXT),
    indirect_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    indirect_address_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    preprocess_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    preprocess_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    max_sequence_count: u32 = @import("std").mem.zeroes(u32),
    sequence_count_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    max_draw_count: u32 = @import("std").mem.zeroes(u32),
};
pub const WriteIndirectExecutionSetPipelineEXT = extern struct {
    s_type: StructureType = StructureType.write_indirect_execution_set_pipeline_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    index: u32 = @import("std").mem.zeroes(u32),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
};
pub const IndirectCommandsPushConstantTokenEXT = extern struct {
    update_range: PushConstantRange = @import("std").mem.zeroes(PushConstantRange),
};
pub const IndirectCommandsVertexBufferTokenEXT = extern struct {
    vertex_binding_unit: u32 = @import("std").mem.zeroes(u32),
};
pub const IndirectCommandsIndexBufferTokenEXT = extern struct {
    mode: IndirectCommandsInputModeFlagsEXT = @import("std").mem.zeroes(IndirectCommandsInputModeFlagsEXT),
};
pub const IndirectCommandsExecutionSetTokenEXT = extern struct {
    type: IndirectExecutionSetInfoTypeEXT = @import("std").mem.zeroes(IndirectExecutionSetInfoTypeEXT),
    shader_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
};
pub const IndirectCommandsTokenDataEXT = extern union {
    p_push_constant: [*c]const IndirectCommandsPushConstantTokenEXT,
    p_vertex_buffer: [*c]const IndirectCommandsVertexBufferTokenEXT,
    p_index_buffer: [*c]const IndirectCommandsIndexBufferTokenEXT,
    p_execution_set: [*c]const IndirectCommandsExecutionSetTokenEXT,
};
pub const IndirectCommandsLayoutTokenEXT = extern struct {
    s_type: StructureType = StructureType.indirect_commands_layout_token_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: IndirectCommandsTokenTypeEXT = @import("std").mem.zeroes(IndirectCommandsTokenTypeEXT),
    data: IndirectCommandsTokenDataEXT = @import("std").mem.zeroes(IndirectCommandsTokenDataEXT),
    offset: u32 = @import("std").mem.zeroes(u32),
};
pub const IndirectCommandsLayoutCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.indirect_commands_layout_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: IndirectCommandsLayoutUsageFlagsEXT = @import("std").mem.zeroes(IndirectCommandsLayoutUsageFlagsEXT),
    shader_stages: ShaderStageFlags = @import("std").mem.zeroes(ShaderStageFlags),
    indirect_stride: u32 = @import("std").mem.zeroes(u32),
    pipeline_layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    token_count: u32 = @import("std").mem.zeroes(u32),
    p_tokens: [*c]const IndirectCommandsLayoutTokenEXT = @import("std").mem.zeroes([*c]const IndirectCommandsLayoutTokenEXT),
};
pub const DrawIndirectCountIndirectCommandEXT = extern struct {
    buffer_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    stride: u32 = @import("std").mem.zeroes(u32),
    command_count: u32 = @import("std").mem.zeroes(u32),
};
pub const BindVertexBufferIndirectCommandEXT = extern struct {
    buffer_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: u32 = @import("std").mem.zeroes(u32),
    stride: u32 = @import("std").mem.zeroes(u32),
};
pub const BindIndexBufferIndirectCommandEXT = extern struct {
    buffer_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    size: u32 = @import("std").mem.zeroes(u32),
    index_type: IndexType = @import("std").mem.zeroes(IndexType),
};
pub const GeneratedCommandsPipelineInfoEXT = extern struct {
    s_type: StructureType = StructureType.generated_commands_pipeline_info_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    pipeline: Pipeline = @import("std").mem.zeroes(Pipeline),
};
pub const GeneratedCommandsShaderInfoEXT = extern struct {
    s_type: StructureType = StructureType.generated_commands_shader_info_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_count: u32 = @import("std").mem.zeroes(u32),
    p_shaders: [*c]const ShaderEXT = @import("std").mem.zeroes([*c]const ShaderEXT),
};
pub const WriteIndirectExecutionSetShaderEXT = extern struct {
    s_type: StructureType = StructureType.write_indirect_execution_set_shader_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    index: u32 = @import("std").mem.zeroes(u32),
    shader: ShaderEXT = @import("std").mem.zeroes(ShaderEXT),
};
pub const PFN_getGeneratedCommandsMemoryRequirementsEXT = ?*const fn (Device, [*c]const GeneratedCommandsMemoryRequirementsInfoEXT, [*c]MemoryRequirements2) callconv(.c) void;
pub const PFN_cmdPreprocessGeneratedCommandsEXT = ?*const fn (CommandBuffer, [*c]const GeneratedCommandsInfoEXT, CommandBuffer) callconv(.c) void;
pub const PFN_cmdExecuteGeneratedCommandsEXT = ?*const fn (CommandBuffer, Bool32, [*c]const GeneratedCommandsInfoEXT) callconv(.c) void;
pub const PFN_createIndirectCommandsLayoutEXT = ?*const fn (Device, [*c]const IndirectCommandsLayoutCreateInfoEXT, [*c]const AllocationCallbacks, [*c]IndirectCommandsLayoutEXT) callconv(.c) Result;
pub const PFN_destroyIndirectCommandsLayoutEXT = ?*const fn (Device, IndirectCommandsLayoutEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_createIndirectExecutionSetEXT = ?*const fn (Device, [*c]const IndirectExecutionSetCreateInfoEXT, [*c]const AllocationCallbacks, [*c]IndirectExecutionSetEXT) callconv(.c) Result;
pub const PFN_destroyIndirectExecutionSetEXT = ?*const fn (Device, IndirectExecutionSetEXT, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_updateIndirectExecutionSetPipelineEXT = ?*const fn (Device, IndirectExecutionSetEXT, u32, [*c]const WriteIndirectExecutionSetPipelineEXT) callconv(.c) void;
pub const PFN_updateIndirectExecutionSetShaderEXT = ?*const fn (Device, IndirectExecutionSetEXT, u32, [*c]const WriteIndirectExecutionSetShaderEXT) callconv(.c) void;
pub extern fn getGeneratedCommandsMemoryRequirementsEXT(device: Device, p_info: [*c]const GeneratedCommandsMemoryRequirementsInfoEXT, p_memory_requirements: [*c]MemoryRequirements2) void;
pub extern fn cmdPreprocessGeneratedCommandsEXT(command_buffer: CommandBuffer, p_generated_commands_info: [*c]const GeneratedCommandsInfoEXT, state_command_buffer: CommandBuffer) void;
pub extern fn cmdExecuteGeneratedCommandsEXT(command_buffer: CommandBuffer, is_preprocessed: Bool32, p_generated_commands_info: [*c]const GeneratedCommandsInfoEXT) void;
pub extern fn createIndirectCommandsLayoutEXT(device: Device, p_create_info: [*c]const IndirectCommandsLayoutCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_indirect_commands_layout: [*c]IndirectCommandsLayoutEXT) Result;
pub extern fn destroyIndirectCommandsLayoutEXT(device: Device, indirect_commands_layout: IndirectCommandsLayoutEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn createIndirectExecutionSetEXT(device: Device, p_create_info: [*c]const IndirectExecutionSetCreateInfoEXT, p_allocator: [*c]const AllocationCallbacks, p_indirect_execution_set: [*c]IndirectExecutionSetEXT) Result;
pub extern fn destroyIndirectExecutionSetEXT(device: Device, indirect_execution_set: IndirectExecutionSetEXT, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn updateIndirectExecutionSetPipelineEXT(device: Device, indirect_execution_set: IndirectExecutionSetEXT, execution_set_write_count: u32, p_execution_set_writes: [*c]const WriteIndirectExecutionSetPipelineEXT) void;
pub extern fn updateIndirectExecutionSetShaderEXT(device: Device, indirect_execution_set: IndirectExecutionSetEXT, execution_set_write_count: u32, p_execution_set_writes: [*c]const WriteIndirectExecutionSetShaderEXT) void;
pub const PhysicalDeviceImageAlignmentControlFeaturesMESA = extern struct {
    s_type: StructureType = StructureType.physical_device_image_alignment_control_features_mesa,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    image_alignment_control: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceImageAlignmentControlPropertiesMESA = extern struct {
    s_type: StructureType = StructureType.physical_device_image_alignment_control_properties_mesa,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    supported_image_alignment_mask: u32 = @import("std").mem.zeroes(u32),
};
pub const ImageAlignmentControlCreateInfoMESA = extern struct {
    s_type: StructureType = StructureType.image_alignment_control_create_info_mesa,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    maximum_requested_alignment: u32 = @import("std").mem.zeroes(u32),
};
pub const PhysicalDeviceDepthClampControlFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_depth_clamp_control_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    depth_clamp_control: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PipelineViewportDepthClampControlCreateInfoEXT = extern struct {
    s_type: StructureType = StructureType.pipeline_viewport_depth_clamp_control_create_info_ext,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    depth_clamp_mode: DepthClampModeEXT = @import("std").mem.zeroes(DepthClampModeEXT),
    p_depth_clamp_range: [*c]const DepthClampRangeEXT = @import("std").mem.zeroes([*c]const DepthClampRangeEXT),
};
pub const BuildAccelerationStructureModeKHR = enum(u32) {
    build_khr = 0,
    update_khr = 1,
};
pub const AccelerationStructureCreateFlagsKHR = enum(u32) {
    null = 0,
    device_address_capture_replay_bit_khr = 1,
    motion_bit_nv = 4,
    descriptor_buffer_capture_replay_bit_ext = 8,
};
pub const AccelerationStructureBuildRangeInfoKHR = extern struct {
    primitive_count: u32 = @import("std").mem.zeroes(u32),
    primitive_offset: u32 = @import("std").mem.zeroes(u32),
    first_vertex: u32 = @import("std").mem.zeroes(u32),
    transform_offset: u32 = @import("std").mem.zeroes(u32),
};
pub const AccelerationStructureGeometryTrianglesDataKHR = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_geometry_triangles_data_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    vertex_format: Format = @import("std").mem.zeroes(Format),
    vertex_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    vertex_stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    max_vertex: u32 = @import("std").mem.zeroes(u32),
    index_type: IndexType = @import("std").mem.zeroes(IndexType),
    index_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    transform_data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
};
pub const AccelerationStructureGeometryAabbsDataKHR = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_geometry_aabbs_data_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const AccelerationStructureGeometryInstancesDataKHR = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_geometry_instances_data_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    array_of_pointers: Bool32 = @import("std").mem.zeroes(Bool32),
    data: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
};
pub const AccelerationStructureGeometryDataKHR = extern union {
    triangles: AccelerationStructureGeometryTrianglesDataKHR,
    aabbs: AccelerationStructureGeometryAabbsDataKHR,
    instances: AccelerationStructureGeometryInstancesDataKHR,
};
pub const AccelerationStructureGeometryKHR = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_geometry_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    geometry_type: GeometryTypeKHR = @import("std").mem.zeroes(GeometryTypeKHR),
    geometry: AccelerationStructureGeometryDataKHR = @import("std").mem.zeroes(AccelerationStructureGeometryDataKHR),
    flags: GeometryFlagsKHR = @import("std").mem.zeroes(GeometryFlagsKHR),
};
pub const AccelerationStructureBuildGeometryInfoKHR = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_build_geometry_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: AccelerationStructureTypeKHR = @import("std").mem.zeroes(AccelerationStructureTypeKHR),
    flags: BuildAccelerationStructureFlagsKHR = @import("std").mem.zeroes(BuildAccelerationStructureFlagsKHR),
    mode: BuildAccelerationStructureModeKHR = @import("std").mem.zeroes(BuildAccelerationStructureModeKHR),
    src_acceleration_structure: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    dst_acceleration_structure: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    geometry_count: u32 = @import("std").mem.zeroes(u32),
    p_geometries: [*c]const AccelerationStructureGeometryKHR = @import("std").mem.zeroes([*c]const AccelerationStructureGeometryKHR),
    pp_geometries: [*c]const [*c]const AccelerationStructureGeometryKHR = @import("std").mem.zeroes([*c]const [*c]const AccelerationStructureGeometryKHR),
    scratch_data: DeviceOrHostAddressKHR = @import("std").mem.zeroes(DeviceOrHostAddressKHR),
};
pub const AccelerationStructureCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    create_flags: AccelerationStructureCreateFlagsKHR = @import("std").mem.zeroes(AccelerationStructureCreateFlagsKHR),
    buffer: Buffer = @import("std").mem.zeroes(Buffer),
    offset: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    type: AccelerationStructureTypeKHR = @import("std").mem.zeroes(AccelerationStructureTypeKHR),
    device_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
};
pub const WriteDescriptorSetAccelerationStructureKHR = extern struct {
    s_type: StructureType = StructureType.write_descriptor_set_acceleration_structure_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acceleration_structure_count: u32 = @import("std").mem.zeroes(u32),
    p_acceleration_structures: [*c]const AccelerationStructureKHR = @import("std").mem.zeroes([*c]const AccelerationStructureKHR),
};
pub const PhysicalDeviceAccelerationStructureFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_acceleration_structure_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    acceleration_structure: Bool32 = @import("std").mem.zeroes(Bool32),
    acceleration_structure_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    acceleration_structure_indirect_build: Bool32 = @import("std").mem.zeroes(Bool32),
    acceleration_structure_host_commands: Bool32 = @import("std").mem.zeroes(Bool32),
    descriptor_binding_acceleration_structure_update_after_bind: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceAccelerationStructurePropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_acceleration_structure_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_geometry_count: u64 = @import("std").mem.zeroes(u64),
    max_instance_count: u64 = @import("std").mem.zeroes(u64),
    max_primitive_count: u64 = @import("std").mem.zeroes(u64),
    max_per_stage_descriptor_acceleration_structures: u32 = @import("std").mem.zeroes(u32),
    max_per_stage_descriptor_update_after_bind_acceleration_structures: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_acceleration_structures: u32 = @import("std").mem.zeroes(u32),
    max_descriptor_set_update_after_bind_acceleration_structures: u32 = @import("std").mem.zeroes(u32),
    min_acceleration_structure_scratch_offset_alignment: u32 = @import("std").mem.zeroes(u32),
};
pub const AccelerationStructureDeviceAddressInfoKHR = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_device_address_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acceleration_structure: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
};
pub const AccelerationStructureVersionInfoKHR = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_version_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    p_version_data: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const CopyAccelerationStructureToMemoryInfoKHR = extern struct {
    s_type: StructureType = StructureType.copy_acceleration_structure_to_memory_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    dst: DeviceOrHostAddressKHR = @import("std").mem.zeroes(DeviceOrHostAddressKHR),
    mode: CopyAccelerationStructureModeKHR = @import("std").mem.zeroes(CopyAccelerationStructureModeKHR),
};
pub const CopyMemoryToAccelerationStructureInfoKHR = extern struct {
    s_type: StructureType = StructureType.copy_memory_to_acceleration_structure_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src: DeviceOrHostAddressConstKHR = @import("std").mem.zeroes(DeviceOrHostAddressConstKHR),
    dst: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    mode: CopyAccelerationStructureModeKHR = @import("std").mem.zeroes(CopyAccelerationStructureModeKHR),
};
pub const CopyAccelerationStructureInfoKHR = extern struct {
    s_type: StructureType = StructureType.copy_acceleration_structure_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    src: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    dst: AccelerationStructureKHR = @import("std").mem.zeroes(AccelerationStructureKHR),
    mode: CopyAccelerationStructureModeKHR = @import("std").mem.zeroes(CopyAccelerationStructureModeKHR),
};
pub const AccelerationStructureBuildSizesInfoKHR = extern struct {
    s_type: StructureType = StructureType.acceleration_structure_build_sizes_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    acceleration_structure_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    update_scratch_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    build_scratch_size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const PFN_createAccelerationStructureKHR = ?*const fn (Device, [*c]const AccelerationStructureCreateInfoKHR, [*c]const AllocationCallbacks, [*c]AccelerationStructureKHR) callconv(.c) Result;
pub const PFN_destroyAccelerationStructureKHR = ?*const fn (Device, AccelerationStructureKHR, [*c]const AllocationCallbacks) callconv(.c) void;
pub const PFN_cmdBuildAccelerationStructuresKHR = ?*const fn (CommandBuffer, u32, [*c]const AccelerationStructureBuildGeometryInfoKHR, [*c]const [*c]const AccelerationStructureBuildRangeInfoKHR) callconv(.c) void;
pub const PFN_cmdBuildAccelerationStructuresIndirectKHR = ?*const fn (CommandBuffer, u32, [*c]const AccelerationStructureBuildGeometryInfoKHR, [*c]const DeviceAddress, [*c]const u32, [*c]const [*c]const u32) callconv(.c) void;
pub const PFN_buildAccelerationStructuresKHR = ?*const fn (Device, DeferredOperationKHR, u32, [*c]const AccelerationStructureBuildGeometryInfoKHR, [*c]const [*c]const AccelerationStructureBuildRangeInfoKHR) callconv(.c) Result;
pub const PFN_copyAccelerationStructureKHR = ?*const fn (Device, DeferredOperationKHR, [*c]const CopyAccelerationStructureInfoKHR) callconv(.c) Result;
pub const PFN_copyAccelerationStructureToMemoryKHR = ?*const fn (Device, DeferredOperationKHR, [*c]const CopyAccelerationStructureToMemoryInfoKHR) callconv(.c) Result;
pub const PFN_copyMemoryToAccelerationStructureKHR = ?*const fn (Device, DeferredOperationKHR, [*c]const CopyMemoryToAccelerationStructureInfoKHR) callconv(.c) Result;
pub const PFN_writeAccelerationStructuresPropertiesKHR = ?*const fn (Device, u32, [*c]const AccelerationStructureKHR, QueryType, usize, ?*anyopaque, usize) callconv(.c) Result;
pub const PFN_cmdCopyAccelerationStructureKHR = ?*const fn (CommandBuffer, [*c]const CopyAccelerationStructureInfoKHR) callconv(.c) void;
pub const PFN_cmdCopyAccelerationStructureToMemoryKHR = ?*const fn (CommandBuffer, [*c]const CopyAccelerationStructureToMemoryInfoKHR) callconv(.c) void;
pub const PFN_cmdCopyMemoryToAccelerationStructureKHR = ?*const fn (CommandBuffer, [*c]const CopyMemoryToAccelerationStructureInfoKHR) callconv(.c) void;
pub const PFN_getAccelerationStructureDeviceAddressKHR = ?*const fn (Device, [*c]const AccelerationStructureDeviceAddressInfoKHR) callconv(.c) DeviceAddress;
pub const PFN_cmdWriteAccelerationStructuresPropertiesKHR = ?*const fn (CommandBuffer, u32, [*c]const AccelerationStructureKHR, QueryType, QueryPool, u32) callconv(.c) void;
pub const PFN_getDeviceAccelerationStructureCompatibilityKHR = ?*const fn (Device, [*c]const AccelerationStructureVersionInfoKHR, [*c]AccelerationStructureCompatibilityKHR) callconv(.c) void;
pub const PFN_getAccelerationStructureBuildSizesKHR = ?*const fn (Device, AccelerationStructureBuildTypeKHR, [*c]const AccelerationStructureBuildGeometryInfoKHR, [*c]const u32, [*c]AccelerationStructureBuildSizesInfoKHR) callconv(.c) void;
pub extern fn createAccelerationStructureKHR(device: Device, p_create_info: [*c]const AccelerationStructureCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_acceleration_structure: [*c]AccelerationStructureKHR) Result;
pub extern fn destroyAccelerationStructureKHR(device: Device, acceleration_structure: AccelerationStructureKHR, p_allocator: [*c]const AllocationCallbacks) void;
pub extern fn cmdBuildAccelerationStructuresKHR(command_buffer: CommandBuffer, info_count: u32, p_infos: [*c]const AccelerationStructureBuildGeometryInfoKHR, pp_build_range_infos: [*c]const [*c]const AccelerationStructureBuildRangeInfoKHR) void;
pub extern fn cmdBuildAccelerationStructuresIndirectKHR(command_buffer: CommandBuffer, info_count: u32, p_infos: [*c]const AccelerationStructureBuildGeometryInfoKHR, p_indirect_device_addresses: [*c]const DeviceAddress, p_indirect_strides: [*c]const u32, pp_max_primitive_counts: [*c]const [*c]const u32) void;
pub extern fn buildAccelerationStructuresKHR(device: Device, deferred_operation: DeferredOperationKHR, info_count: u32, p_infos: [*c]const AccelerationStructureBuildGeometryInfoKHR, pp_build_range_infos: [*c]const [*c]const AccelerationStructureBuildRangeInfoKHR) Result;
pub extern fn copyAccelerationStructureKHR(device: Device, deferred_operation: DeferredOperationKHR, p_info: [*c]const CopyAccelerationStructureInfoKHR) Result;
pub extern fn copyAccelerationStructureToMemoryKHR(device: Device, deferred_operation: DeferredOperationKHR, p_info: [*c]const CopyAccelerationStructureToMemoryInfoKHR) Result;
pub extern fn copyMemoryToAccelerationStructureKHR(device: Device, deferred_operation: DeferredOperationKHR, p_info: [*c]const CopyMemoryToAccelerationStructureInfoKHR) Result;
pub extern fn writeAccelerationStructuresPropertiesKHR(device: Device, acceleration_structure_count: u32, p_acceleration_structures: [*c]const AccelerationStructureKHR, query_type: QueryType, data_size: usize, p_data: ?*anyopaque, stride: usize) Result;
pub extern fn cmdCopyAccelerationStructureKHR(command_buffer: CommandBuffer, p_info: [*c]const CopyAccelerationStructureInfoKHR) void;
pub extern fn cmdCopyAccelerationStructureToMemoryKHR(command_buffer: CommandBuffer, p_info: [*c]const CopyAccelerationStructureToMemoryInfoKHR) void;
pub extern fn cmdCopyMemoryToAccelerationStructureKHR(command_buffer: CommandBuffer, p_info: [*c]const CopyMemoryToAccelerationStructureInfoKHR) void;
pub extern fn getAccelerationStructureDeviceAddressKHR(device: Device, p_info: [*c]const AccelerationStructureDeviceAddressInfoKHR) DeviceAddress;
pub extern fn cmdWriteAccelerationStructuresPropertiesKHR(command_buffer: CommandBuffer, acceleration_structure_count: u32, p_acceleration_structures: [*c]const AccelerationStructureKHR, query_type: QueryType, query_pool: QueryPool, first_query: u32) void;
pub extern fn getDeviceAccelerationStructureCompatibilityKHR(device: Device, p_version_info: [*c]const AccelerationStructureVersionInfoKHR, p_compatibility: [*c]AccelerationStructureCompatibilityKHR) void;
pub extern fn getAccelerationStructureBuildSizesKHR(device: Device, build_type: AccelerationStructureBuildTypeKHR, p_build_info: [*c]const AccelerationStructureBuildGeometryInfoKHR, p_max_primitive_counts: [*c]const u32, p_size_info: [*c]AccelerationStructureBuildSizesInfoKHR) void;
pub const ShaderGroupShaderKHR = enum(u32) {
    general_khr = 0,
    closest_hit_khr = 1,
    any_hit_khr = 2,
    intersection_khr = 3,
};
pub const RayTracingShaderGroupCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.ray_tracing_shader_group_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    type: RayTracingShaderGroupTypeKHR = @import("std").mem.zeroes(RayTracingShaderGroupTypeKHR),
    general_shader: u32 = @import("std").mem.zeroes(u32),
    closest_hit_shader: u32 = @import("std").mem.zeroes(u32),
    any_hit_shader: u32 = @import("std").mem.zeroes(u32),
    intersection_shader: u32 = @import("std").mem.zeroes(u32),
    p_shader_group_capture_replay_handle: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
};
pub const RayTracingPipelineInterfaceCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.ray_tracing_pipeline_interface_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    max_pipeline_ray_payload_size: u32 = @import("std").mem.zeroes(u32),
    max_pipeline_ray_hit_attribute_size: u32 = @import("std").mem.zeroes(u32),
};
pub const RayTracingPipelineCreateInfoKHR = extern struct {
    s_type: StructureType = StructureType.ray_tracing_pipeline_create_info_khr,
    p_next: ?*const anyopaque = @import("std").mem.zeroes(?*const anyopaque),
    flags: PipelineCreateFlags = @import("std").mem.zeroes(PipelineCreateFlags),
    stage_count: u32 = @import("std").mem.zeroes(u32),
    p_stages: [*c]const PipelineShaderStageCreateInfo = @import("std").mem.zeroes([*c]const PipelineShaderStageCreateInfo),
    group_count: u32 = @import("std").mem.zeroes(u32),
    p_groups: [*c]const RayTracingShaderGroupCreateInfoKHR = @import("std").mem.zeroes([*c]const RayTracingShaderGroupCreateInfoKHR),
    max_pipeline_ray_recursion_depth: u32 = @import("std").mem.zeroes(u32),
    p_library_info: [*c]const PipelineLibraryCreateInfoKHR = @import("std").mem.zeroes([*c]const PipelineLibraryCreateInfoKHR),
    p_library_interface: [*c]const RayTracingPipelineInterfaceCreateInfoKHR = @import("std").mem.zeroes([*c]const RayTracingPipelineInterfaceCreateInfoKHR),
    p_dynamic_state: [*c]const PipelineDynamicStateCreateInfo = @import("std").mem.zeroes([*c]const PipelineDynamicStateCreateInfo),
    layout: PipelineLayout = @import("std").mem.zeroes(PipelineLayout),
    base_pipeline_handle: Pipeline = @import("std").mem.zeroes(Pipeline),
    base_pipeline_index: i32 = @import("std").mem.zeroes(i32),
};
pub const PhysicalDeviceRayTracingPipelineFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_ray_tracing_pipeline_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_tracing_pipeline: Bool32 = @import("std").mem.zeroes(Bool32),
    ray_tracing_pipeline_shader_group_handle_capture_replay: Bool32 = @import("std").mem.zeroes(Bool32),
    ray_tracing_pipeline_shader_group_handle_capture_replay_mixed: Bool32 = @import("std").mem.zeroes(Bool32),
    ray_tracing_pipeline_trace_rays_indirect: Bool32 = @import("std").mem.zeroes(Bool32),
    ray_traversal_primitive_culling: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceRayTracingPipelinePropertiesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_ray_tracing_pipeline_properties_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    shader_group_handle_size: u32 = @import("std").mem.zeroes(u32),
    max_ray_recursion_depth: u32 = @import("std").mem.zeroes(u32),
    max_shader_group_stride: u32 = @import("std").mem.zeroes(u32),
    shader_group_base_alignment: u32 = @import("std").mem.zeroes(u32),
    shader_group_handle_capture_replay_size: u32 = @import("std").mem.zeroes(u32),
    max_ray_dispatch_invocation_count: u32 = @import("std").mem.zeroes(u32),
    shader_group_handle_alignment: u32 = @import("std").mem.zeroes(u32),
    max_ray_hit_attribute_size: u32 = @import("std").mem.zeroes(u32),
};
pub const StridedDeviceAddressRegionKHR = extern struct {
    device_address: DeviceAddress = @import("std").mem.zeroes(DeviceAddress),
    stride: DeviceSize = @import("std").mem.zeroes(DeviceSize),
    size: DeviceSize = @import("std").mem.zeroes(DeviceSize),
};
pub const TraceRaysIndirectCommandKHR = extern struct {
    width: u32 = @import("std").mem.zeroes(u32),
    height: u32 = @import("std").mem.zeroes(u32),
    depth: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdTraceRaysKHR = ?*const fn (CommandBuffer, [*c]const StridedDeviceAddressRegionKHR, [*c]const StridedDeviceAddressRegionKHR, [*c]const StridedDeviceAddressRegionKHR, [*c]const StridedDeviceAddressRegionKHR, u32, u32, u32) callconv(.c) void;
pub const PFN_createRayTracingPipelinesKHR = ?*const fn (Device, DeferredOperationKHR, PipelineCache, u32, [*c]const RayTracingPipelineCreateInfoKHR, [*c]const AllocationCallbacks, [*c]Pipeline) callconv(.c) Result;
pub const PFN_getRayTracingCaptureReplayShaderGroupHandlesKHR = ?*const fn (Device, Pipeline, u32, u32, usize, ?*anyopaque) callconv(.c) Result;
pub const PFN_cmdTraceRaysIndirectKHR = ?*const fn (CommandBuffer, [*c]const StridedDeviceAddressRegionKHR, [*c]const StridedDeviceAddressRegionKHR, [*c]const StridedDeviceAddressRegionKHR, [*c]const StridedDeviceAddressRegionKHR, DeviceAddress) callconv(.c) void;
pub const PFN_getRayTracingShaderGroupStackSizeKHR = ?*const fn (Device, Pipeline, u32, ShaderGroupShaderKHR) callconv(.c) DeviceSize;
pub const PFN_cmdSetRayTracingPipelineStackSizeKHR = ?*const fn (CommandBuffer, u32) callconv(.c) void;
pub extern fn cmdTraceRaysKHR(command_buffer: CommandBuffer, p_raygen_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, p_miss_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, p_hit_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, p_callable_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, width: u32, height: u32, depth: u32) void;
pub extern fn createRayTracingPipelinesKHR(device: Device, deferred_operation: DeferredOperationKHR, pipeline_cache: PipelineCache, create_info_count: u32, p_create_infos: [*c]const RayTracingPipelineCreateInfoKHR, p_allocator: [*c]const AllocationCallbacks, p_pipelines: [*c]Pipeline) Result;
pub extern fn getRayTracingCaptureReplayShaderGroupHandlesKHR(device: Device, pipeline: Pipeline, first_group: u32, group_count: u32, data_size: usize, p_data: ?*anyopaque) Result;
pub extern fn cmdTraceRaysIndirectKHR(command_buffer: CommandBuffer, p_raygen_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, p_miss_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, p_hit_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, p_callable_shader_binding_table: [*c]const StridedDeviceAddressRegionKHR, indirect_device_address: DeviceAddress) void;
pub extern fn getRayTracingShaderGroupStackSizeKHR(device: Device, pipeline: Pipeline, group: u32, group_shader: ShaderGroupShaderKHR) DeviceSize;
pub extern fn cmdSetRayTracingPipelineStackSizeKHR(command_buffer: CommandBuffer, pipeline_stack_size: u32) void;
pub const PhysicalDeviceRayQueryFeaturesKHR = extern struct {
    s_type: StructureType = StructureType.physical_device_ray_query_features_khr,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ray_query: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMeshShaderFeaturesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_mesh_shader_features_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    task_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    mesh_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    multiview_mesh_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    primitive_fragment_shading_rate_mesh_shader: Bool32 = @import("std").mem.zeroes(Bool32),
    mesh_shader_queries: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const PhysicalDeviceMeshShaderPropertiesEXT = extern struct {
    s_type: StructureType = StructureType.physical_device_mesh_shader_properties_ext,
    p_next: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    max_task_work_group_total_count: u32 = @import("std").mem.zeroes(u32),
    max_task_work_group_count: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_task_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    max_task_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_task_payload_size: u32 = @import("std").mem.zeroes(u32),
    max_task_shared_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_task_payload_and_shared_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_mesh_work_group_total_count: u32 = @import("std").mem.zeroes(u32),
    max_mesh_work_group_count: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_mesh_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    max_mesh_work_group_size: [3]u32 = @import("std").mem.zeroes([3]u32),
    max_mesh_shared_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_mesh_payload_and_shared_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_mesh_payload_and_output_memory_size: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_components: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_vertices: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_primitives: u32 = @import("std").mem.zeroes(u32),
    max_mesh_output_layers: u32 = @import("std").mem.zeroes(u32),
    max_mesh_multiview_view_count: u32 = @import("std").mem.zeroes(u32),
    mesh_output_per_vertex_granularity: u32 = @import("std").mem.zeroes(u32),
    mesh_output_per_primitive_granularity: u32 = @import("std").mem.zeroes(u32),
    max_preferred_task_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    max_preferred_mesh_work_group_invocations: u32 = @import("std").mem.zeroes(u32),
    prefers_local_invocation_vertex_output: Bool32 = @import("std").mem.zeroes(Bool32),
    prefers_local_invocation_primitive_output: Bool32 = @import("std").mem.zeroes(Bool32),
    prefers_compact_vertex_output: Bool32 = @import("std").mem.zeroes(Bool32),
    prefers_compact_primitive_output: Bool32 = @import("std").mem.zeroes(Bool32),
};
pub const DrawMeshTasksIndirectCommandEXT = extern struct {
    group_count_x: u32 = @import("std").mem.zeroes(u32),
    group_count_y: u32 = @import("std").mem.zeroes(u32),
    group_count_z: u32 = @import("std").mem.zeroes(u32),
};
pub const PFN_cmdDrawMeshTasksEXT = ?*const fn (CommandBuffer, u32, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawMeshTasksIndirectEXT = ?*const fn (CommandBuffer, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub const PFN_cmdDrawMeshTasksIndirectCountEXT = ?*const fn (CommandBuffer, Buffer, DeviceSize, Buffer, DeviceSize, u32, u32) callconv(.c) void;
pub extern fn cmdDrawMeshTasksEXT(command_buffer: CommandBuffer, group_count_x: u32, group_count_y: u32, group_count_z: u32) void;
pub extern fn cmdDrawMeshTasksIndirectEXT(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, draw_count: u32, stride: u32) void;
pub extern fn cmdDrawMeshTasksIndirectCountEXT(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, count_buffer: Buffer, count_buffer_offset: DeviceSize, max_draw_count: u32, stride: u32) void;
pub inline fn makeApiVersion(variant: anytype, major: anytype, minor: anytype, patch: anytype) @TypeOf((((@import("std").zig.c_translation.cast(u32, variant) << @as(c_uint, 29)) | (@import("std").zig.c_translation.cast(u32, major) << @as(c_uint, 22))) | (@import("std").zig.c_translation.cast(u32, minor) << @as(c_uint, 12))) | @import("std").zig.c_translation.cast(u32, patch)) {
    _ = &variant;
    _ = &major;
    _ = &minor;
    _ = &patch;
    return (((@import("std").zig.c_translation.cast(u32, variant) << @as(c_uint, 29)) | (@import("std").zig.c_translation.cast(u32, major) << @as(c_uint, 22))) | (@import("std").zig.c_translation.cast(u32, minor) << @as(c_uint, 12))) | @import("std").zig.c_translation.cast(u32, patch);
}
pub const API_VERSION_1_0 = makeApiVersion(@as(c_int, 0), @as(c_int, 1), @as(c_int, 0), @as(c_int, 0));
pub inline fn makeVersion(major: anytype, minor: anytype, patch: anytype) @TypeOf(((@import("std").zig.c_translation.cast(u32, major) << @as(c_uint, 22)) | (@import("std").zig.c_translation.cast(u32, minor) << @as(c_uint, 12))) | @import("std").zig.c_translation.cast(u32, patch)) {
    _ = &major;
    _ = &minor;
    _ = &patch;
    return ((@import("std").zig.c_translation.cast(u32, major) << @as(c_uint, 22)) | (@import("std").zig.c_translation.cast(u32, minor) << @as(c_uint, 12))) | @import("std").zig.c_translation.cast(u32, patch);
}
pub inline fn versionMajor(version: anytype) @TypeOf(@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 22)) {
    _ = &version;
    return @import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 22);
}
pub inline fn versionMinor(version: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 12)) & @as(c_uint, 0x3FF)) {
    _ = &version;
    return (@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 12)) & @as(c_uint, 0x3FF);
}
pub inline fn versionPatch(version: anytype) @TypeOf(@import("std").zig.c_translation.cast(u32, version) & @as(c_uint, 0xFFF)) {
    _ = &version;
    return @import("std").zig.c_translation.cast(u32, version) & @as(c_uint, 0xFFF);
}
pub inline fn apiVersionVariant(version: anytype) @TypeOf(@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 29)) {
    _ = &version;
    return @import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 29);
}
pub inline fn apiVersionMajor(version: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 22)) & @as(c_uint, 0x7F)) {
    _ = &version;
    return (@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 22)) & @as(c_uint, 0x7F);
}
pub inline fn apiVersionMinor(version: anytype) @TypeOf((@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 12)) & @as(c_uint, 0x3FF)) {
    _ = &version;
    return (@import("std").zig.c_translation.cast(u32, version) >> @as(c_uint, 12)) & @as(c_uint, 0x3FF);
}
pub inline fn apiVersionPatch(version: anytype) @TypeOf(@import("std").zig.c_translation.cast(u32, version) & @as(c_uint, 0xFFF)) {
    _ = &version;
    return @import("std").zig.c_translation.cast(u32, version) & @as(c_uint, 0xFFF);
}
pub const API_VERSION_1_1 = makeApiVersion(@as(c_int, 0), @as(c_int, 1), @as(c_int, 1), @as(c_int, 0));
pub const API_VERSION_1_2 = makeApiVersion(@as(c_int, 0), @as(c_int, 1), @as(c_int, 2), @as(c_int, 0));
pub const API_VERSION_1_3 = makeApiVersion(@as(c_int, 0), @as(c_int, 1), @as(c_int, 3), @as(c_int, 0));
pub inline fn makeVideoStdVersion(major: anytype, minor: anytype, patch: anytype) @TypeOf(((@import("std").zig.c_translation.cast(u32, major) << @as(c_int, 22)) | (@import("std").zig.c_translation.cast(u32, minor) << @as(c_int, 12))) | @import("std").zig.c_translation.cast(u32, patch)) {
    _ = &major;
    _ = &minor;
    _ = &patch;
    return ((@import("std").zig.c_translation.cast(u32, major) << @as(c_int, 22)) | (@import("std").zig.c_translation.cast(u32, minor) << @as(c_int, 12))) | @import("std").zig.c_translation.cast(u32, patch);
}
pub const STD_VULKAN_VIDEO_CODEC_H264_ENCODE_API_VERSION_1_0_0 = makeVideoStdVersion(@as(c_int, 1), @as(c_int, 0), @as(c_int, 0));
pub const STD_VULKAN_VIDEO_CODEC_H265_ENCODE_API_VERSION_1_0_0 = makeVideoStdVersion(@as(c_int, 1), @as(c_int, 0), @as(c_int, 0));
pub const STD_VULKAN_VIDEO_CODEC_H264_DECODE_API_VERSION_1_0_0 = makeVideoStdVersion(@as(c_int, 1), @as(c_int, 0), @as(c_int, 0));
pub const STD_VULKAN_VIDEO_CODEC_H265_DECODE_API_VERSION_1_0_0 = makeVideoStdVersion(@as(c_int, 1), @as(c_int, 0), @as(c_int, 0));
pub const STD_VULKAN_VIDEO_CODEC_AV1_DECODE_API_VERSION_1_0_0 = makeVideoStdVersion(@as(c_int, 1), @as(c_int, 0), @as(c_int, 0));
pub const ExtensionNames = struct {
    pub const surface = "VK_KHR_surface";
    pub const swapchain = "VK_KHR_swapchain";
    pub const display = "VK_KHR_display";
    pub const display_swapchain = "VK_KHR_display_swapchain";
    pub const sampler_mirror_clamp_to_edge = "VK_KHR_sampler_mirror_clamp_to_edge";
    pub const video_queue = "VK_KHR_video_queue";
    pub const video_decode_queue = "VK_KHR_video_decode_queue";
    pub const std_vulkan_video_codec_h264_encode = "VK_STD_vulkan_video_codec_h264_encode";
    pub const video_encode_h264 = "VK_KHR_video_encode_h264";
    pub const std_vulkan_video_codec_h265_encode = "VK_STD_vulkan_video_codec_h265_encode";
    pub const video_encode_h265 = "VK_KHR_video_encode_h265";
    pub const std_vulkan_video_codec_h264_decode = "VK_STD_vulkan_video_codec_h264_decode";
    pub const video_decode_h264 = "VK_KHR_video_decode_h264";
    pub const dynamic_rendering = "VK_KHR_dynamic_rendering";
    pub const multiview = "VK_KHR_multiview";
    pub const get_physical_device_properties_2 = "VK_KHR_get_physical_device_properties2";
    pub const device_group = "VK_KHR_device_group";
    pub const shader_draw_parameters = "VK_KHR_shader_draw_parameters";
    pub const maintenance_1 = "VK_KHR_maintenance1";
    pub const device_group_creation = "VK_KHR_device_group_creation";
    pub const external_memory_capabilities = "VK_KHR_external_memory_capabilities";
    pub const external_memory = "VK_KHR_external_memory";
    pub const external_memory_fd = "VK_KHR_external_memory_fd";
    pub const external_semaphore_capabilities = "VK_KHR_external_semaphore_capabilities";
    pub const external_semaphore = "VK_KHR_external_semaphore";
    pub const external_semaphore_fd = "VK_KHR_external_semaphore_fd";
    pub const push_descriptor = "VK_KHR_push_descriptor";
    pub const shader_float16_int8 = "VK_KHR_shader_float16_int8";
    pub const _16bit_storage = "VK_KHR_16bit_storage";
    pub const incremental_present = "VK_KHR_incremental_present";
    pub const descriptor_update_template = "VK_KHR_descriptor_update_template";
    pub const imageless_framebuffer = "VK_KHR_imageless_framebuffer";
    pub const create_renderpass_2 = "VK_KHR_create_renderpass2";
    pub const shared_presentable_image = "VK_KHR_shared_presentable_image";
    pub const external_fence_capabilities = "VK_KHR_external_fence_capabilities";
    pub const external_fence = "VK_KHR_external_fence";
    pub const external_fence_fd = "VK_KHR_external_fence_fd";
    pub const performance_query = "VK_KHR_performance_query";
    pub const maintenance_2 = "VK_KHR_maintenance2";
    pub const get_surface_capabilities_2 = "VK_KHR_get_surface_capabilities2";
    pub const variable_pointers = "VK_KHR_variable_pointers";
    pub const get_display_properties_2 = "VK_KHR_get_display_properties2";
    pub const dedicated_allocation = "VK_KHR_dedicated_allocation";
    pub const storage_buffer_storage_class = "VK_KHR_storage_buffer_storage_class";
    pub const relaxed_block_layout = "VK_KHR_relaxed_block_layout";
    pub const get_memory_requirements_2 = "VK_KHR_get_memory_requirements2";
    pub const image_format_list = "VK_KHR_image_format_list";
    pub const sampler_ycbcr_conversion = "VK_KHR_sampler_ycbcr_conversion";
    pub const bind_memory_2 = "VK_KHR_bind_memory2";
    pub const maintenance_3 = "VK_KHR_maintenance3";
    pub const draw_indirect_count = "VK_KHR_draw_indirect_count";
    pub const shader_subgroup_extended_types = "VK_KHR_shader_subgroup_extended_types";
    pub const _8bit_storage = "VK_KHR_8bit_storage";
    pub const shader_atomic_int64 = "VK_KHR_shader_atomic_int64";
    pub const shader_clock = "VK_KHR_shader_clock";
    pub const std_vulkan_video_codec_h265_decode = "VK_STD_vulkan_video_codec_h265_decode";
    pub const video_decode_h265 = "VK_KHR_video_decode_h265";
    pub const global_priority = "VK_KHR_global_priority";
    pub const driver_properties = "VK_KHR_driver_properties";
    pub const shader_float_controls = "VK_KHR_shader_float_controls";
    pub const depth_stencil_resolve = "VK_KHR_depth_stencil_resolve";
    pub const swapchain_mutable_format = "VK_KHR_swapchain_mutable_format";
    pub const timeline_semaphore = "VK_KHR_timeline_semaphore";
    pub const vulkan_memory_model = "VK_KHR_vulkan_memory_model";
    pub const shader_terminate_invocation = "VK_KHR_shader_terminate_invocation";
    pub const fragment_shading_rate = "VK_KHR_fragment_shading_rate";
    pub const dynamic_rendering_local_read = "VK_KHR_dynamic_rendering_local_read";
    pub const shader_quad_control = "VK_KHR_shader_quad_control";
    pub const spirv_1_4 = "VK_KHR_spirv_1_4";
    pub const surface_protected_capabilities = "VK_KHR_surface_protected_capabilities";
    pub const separate_depth_stencil_layouts = "VK_KHR_separate_depth_stencil_layouts";
    pub const present_wait = "VK_KHR_present_wait";
    pub const uniform_buffer_standard_layout = "VK_KHR_uniform_buffer_standard_layout";
    pub const buffer_device_address = "VK_KHR_buffer_device_address";
    pub const deferred_host_operations = "VK_KHR_deferred_host_operations";
    pub const pipeline_executable_properties = "VK_KHR_pipeline_executable_properties";
    pub const map_memory_2 = "VK_KHR_map_memory2";
    pub const shader_integer_dot_product = "VK_KHR_shader_integer_dot_product";
    pub const pipeline_library = "VK_KHR_pipeline_library";
    pub const shader_non_semantic_info = "VK_KHR_shader_non_semantic_info";
    pub const present_id = "VK_KHR_present_id";
    pub const video_encode_queue = "VK_KHR_video_encode_queue";
    pub const synchronization_2 = "VK_KHR_synchronization2";
    pub const fragment_shader_barycentric = "VK_KHR_fragment_shader_barycentric";
    pub const shader_subgroup_uniform_control_flow = "VK_KHR_shader_subgroup_uniform_control_flow";
    pub const zero_initialize_workgroup_memory = "VK_KHR_zero_initialize_workgroup_memory";
    pub const workgroup_memory_explicit_layout = "VK_KHR_workgroup_memory_explicit_layout";
    pub const copy_commands_2 = "VK_KHR_copy_commands2";
    pub const format_feature_flags_2 = "VK_KHR_format_feature_flags2";
    pub const ray_tracing_maintenance_1 = "VK_KHR_ray_tracing_maintenance1";
    pub const portability_enumeration = "VK_KHR_portability_enumeration";
    pub const maintenance_4 = "VK_KHR_maintenance4";
    pub const shader_subgroup_rotate = "VK_KHR_shader_subgroup_rotate";
    pub const shader_maximal_reconvergence = "VK_KHR_shader_maximal_reconvergence";
    pub const maintenance_5 = "VK_KHR_maintenance5";
    pub const ray_tracing_position_fetch = "VK_KHR_ray_tracing_position_fetch";
    pub const pipeline_binary = "VK_KHR_pipeline_binary";
    pub const cooperative_matrix = "VK_KHR_cooperative_matrix";
    pub const compute_shader_derivatives = "VK_KHR_compute_shader_derivatives";
    pub const std_vulkan_video_codec_av1_decode = "VK_STD_vulkan_video_codec_av1_decode";
    pub const video_decode_av1 = "VK_KHR_video_decode_av1";
    pub const video_maintenance_1 = "VK_KHR_video_maintenance1";
    pub const vertex_attribute_divisor = "VK_KHR_vertex_attribute_divisor";
    pub const load_store_op_none = "VK_KHR_load_store_op_none";
    pub const shader_float_controls_2 = "VK_KHR_shader_float_controls2";
    pub const index_type_uint8 = "VK_KHR_index_type_uint8";
    pub const line_rasterization = "VK_KHR_line_rasterization";
    pub const calibrated_timestamps = "VK_KHR_calibrated_timestamps";
    pub const shader_expect_assume = "VK_KHR_shader_expect_assume";
    pub const maintenance_6 = "VK_KHR_maintenance6";
    pub const shader_relaxed_extended_instruction = "VK_KHR_shader_relaxed_extended_instruction";
    pub const maintenance_7 = "VK_KHR_maintenance7";
    pub const ext_debug_report = "VK_EXT_debug_report";
    pub const nv_glsl_shader = "VK_NV_glsl_shader";
    pub const ext_depth_range_unrestricted = "VK_EXT_depth_range_unrestricted";
    pub const img_filter_cubic = "VK_IMG_filter_cubic";
    pub const amd_rasterization_order = "VK_AMD_rasterization_order";
    pub const amd_shader_trinary_minmax = "VK_AMD_shader_trinary_minmax";
    pub const amd_shader_explicit_vertex_parameter = "VK_AMD_shader_explicit_vertex_parameter";
    pub const ext_debug_marker = "VK_EXT_debug_marker";
    pub const amd_gcn_shader = "VK_AMD_gcn_shader";
    pub const nv_dedicated_allocation = "VK_NV_dedicated_allocation";
    pub const ext_transform_feedback = "VK_EXT_transform_feedback";
    pub const nvx_binary_import = "VK_NVX_binary_import";
    pub const nvx_image_view_handle = "VK_NVX_image_view_handle";
    pub const amd_draw_indirect_count = "VK_AMD_draw_indirect_count";
    pub const amd_negative_viewport_height = "VK_AMD_negative_viewport_height";
    pub const amd_gpu_shader_half_float = "VK_AMD_gpu_shader_half_float";
    pub const amd_shader_ballot = "VK_AMD_shader_ballot";
    pub const amd_texture_gather_bias_lod = "VK_AMD_texture_gather_bias_lod";
    pub const amd_shader_info = "VK_AMD_shader_info";
    pub const amd_shader_image_load_store_lod = "VK_AMD_shader_image_load_store_lod";
    pub const nv_corner_sampled_image = "VK_NV_corner_sampled_image";
    pub const img_format_pvrtc = "VK_IMG_format_pvrtc";
    pub const nv_external_memory_capabilities = "VK_NV_external_memory_capabilities";
    pub const nv_external_memory = "VK_NV_external_memory";
    pub const ext_validation_flags = "VK_EXT_validation_flags";
    pub const ext_shader_subgroup_ballot = "VK_EXT_shader_subgroup_ballot";
    pub const ext_shader_subgroup_vote = "VK_EXT_shader_subgroup_vote";
    pub const ext_texture_compression_astc_hdr = "VK_EXT_texture_compression_astc_hdr";
    pub const ext_astc_decode_mode = "VK_EXT_astc_decode_mode";
    pub const ext_pipeline_robustness = "VK_EXT_pipeline_robustness";
    pub const ext_conditional_rendering = "VK_EXT_conditional_rendering";
    pub const nv_clip_space_w_scaling = "VK_NV_clip_space_w_scaling";
    pub const ext_direct_mode_display = "VK_EXT_direct_mode_display";
    pub const ext_display_surface_counter = "VK_EXT_display_surface_counter";
    pub const ext_display_control = "VK_EXT_display_control";
    pub const google_display_timing = "VK_GOOGLE_display_timing";
    pub const nv_sample_mask_override_coverage = "VK_NV_sample_mask_override_coverage";
    pub const nv_geometry_shader_passthrough = "VK_NV_geometry_shader_passthrough";
    pub const nv_viewport_array_2 = "VK_NV_viewport_array2";
    pub const nvx_multiview_per_view_attributes = "VK_NVX_multiview_per_view_attributes";
    pub const nv_viewport_swizzle = "VK_NV_viewport_swizzle";
    pub const ext_discard_rectangles = "VK_EXT_discard_rectangles";
    pub const ext_conservative_rasterization = "VK_EXT_conservative_rasterization";
    pub const ext_depth_clip_enable = "VK_EXT_depth_clip_enable";
    pub const ext_swapchain_color_space = "VK_EXT_swapchain_colorspace";
    pub const ext_hdr_metadata = "VK_EXT_hdr_metadata";
    pub const img_relaxed_line_rasterization = "VK_IMG_relaxed_line_rasterization";
    pub const ext_external_memory_dma_buf = "VK_EXT_external_memory_dma_buf";
    pub const ext_queue_family_foreign = "VK_EXT_queue_family_foreign";
    pub const ext_debug_utils = "VK_EXT_debug_utils";
    pub const ext_sampler_filter_minmax = "VK_EXT_sampler_filter_minmax";
    pub const amd_gpu_shader_int16 = "VK_AMD_gpu_shader_int16";
    pub const amd_mixed_attachment_samples = "VK_AMD_mixed_attachment_samples";
    pub const amd_shader_fragment_mask = "VK_AMD_shader_fragment_mask";
    pub const ext_inline_uniform_block = "VK_EXT_inline_uniform_block";
    pub const ext_shader_stencil_export = "VK_EXT_shader_stencil_export";
    pub const ext_sample_locations = "VK_EXT_sample_locations";
    pub const ext_blend_operation_advanced = "VK_EXT_blend_operation_advanced";
    pub const nv_fragment_coverage_to_color = "VK_NV_fragment_coverage_to_color";
    pub const nv_framebuffer_mixed_samples = "VK_NV_framebuffer_mixed_samples";
    pub const nv_fill_rectangle = "VK_NV_fill_rectangle";
    pub const nv_shader_sm_builtins = "VK_NV_shader_sm_builtins";
    pub const ext_post_depth_coverage = "VK_EXT_post_depth_coverage";
    pub const ext_image_drm_format_modifier = "VK_EXT_image_drm_format_modifier";
    pub const ext_validation_cache = "VK_EXT_validation_cache";
    pub const ext_descriptor_indexing = "VK_EXT_descriptor_indexing";
    pub const ext_shader_viewport_index_layer = "VK_EXT_shader_viewport_index_layer";
    pub const nv_shading_rate_image = "VK_NV_shading_rate_image";
    pub const nv_ray_tracing = "VK_NV_ray_tracing";
    pub const nv_representative_fragment_test = "VK_NV_representative_fragment_test";
    pub const ext_filter_cubic = "VK_EXT_filter_cubic";
    pub const qcom_render_pass_shader_resolve = "VK_QCOM_render_pass_shader_resolve";
    pub const ext_global_priority = "VK_EXT_global_priority";
    pub const ext_external_memory_host = "VK_EXT_external_memory_host";
    pub const amd_buffer_marker = "VK_AMD_buffer_marker";
    pub const amd_pipeline_compiler_control = "VK_AMD_pipeline_compiler_control";
    pub const ext_calibrated_timestamps = "VK_EXT_calibrated_timestamps";
    pub const amd_shader_core_properties = "VK_AMD_shader_core_properties";
    pub const amd_memory_overallocation_behavior = "VK_AMD_memory_overallocation_behavior";
    pub const ext_vertex_attribute_divisor = "VK_EXT_vertex_attribute_divisor";
    pub const ext_pipeline_creation_feedback = "VK_EXT_pipeline_creation_feedback";
    pub const nv_shader_subgroup_partitioned = "VK_NV_shader_subgroup_partitioned";
    pub const nv_compute_shader_derivatives = "VK_NV_compute_shader_derivatives";
    pub const nv_mesh_shader = "VK_NV_mesh_shader";
    pub const nv_fragment_shader_barycentric = "VK_NV_fragment_shader_barycentric";
    pub const nv_shader_image_footprint = "VK_NV_shader_image_footprint";
    pub const nv_scissor_exclusive = "VK_NV_scissor_exclusive";
    pub const nv_device_diagnostic_checkpoints = "VK_NV_device_diagnostic_checkpoints";
    pub const intel_shader_integer_functions_2 = "VK_INTEL_shader_integer_functions2";
    pub const intel_performance_query = "VK_INTEL_performance_query";
    pub const ext_pci_bus_info = "VK_EXT_pci_bus_info";
    pub const amd_display_native_hdr = "VK_AMD_display_native_hdr";
    pub const ext_fragment_density_map = "VK_EXT_fragment_density_map";
    pub const ext_scalar_block_layout = "VK_EXT_scalar_block_layout";
    pub const google_hlsl_functionality_1 = "VK_GOOGLE_hlsl_functionality1";
    pub const google_decorate_string = "VK_GOOGLE_decorate_string";
    pub const ext_subgroup_size_control = "VK_EXT_subgroup_size_control";
    pub const amd_shader_core_properties_2 = "VK_AMD_shader_core_properties2";
    pub const amd_device_coherent_memory = "VK_AMD_device_coherent_memory";
    pub const ext_shader_image_atomic_int64 = "VK_EXT_shader_image_atomic_int64";
    pub const ext_memory_budget = "VK_EXT_memory_budget";
    pub const ext_memory_priority = "VK_EXT_memory_priority";
    pub const nv_dedicated_allocation_image_aliasing = "VK_NV_dedicated_allocation_image_aliasing";
    pub const ext_buffer_device_address = "VK_EXT_buffer_device_address";
    pub const ext_tooling_info = "VK_EXT_tooling_info";
    pub const ext_separate_stencil_usage = "VK_EXT_separate_stencil_usage";
    pub const ext_validation_features = "VK_EXT_validation_features";
    pub const nv_cooperative_matrix = "VK_NV_cooperative_matrix";
    pub const nv_coverage_reduction_mode = "VK_NV_coverage_reduction_mode";
    pub const ext_fragment_shader_interlock = "VK_EXT_fragment_shader_interlock";
    pub const ext_ycbcr_image_arrays = "VK_EXT_ycbcr_image_arrays";
    pub const ext_provoking_vertex = "VK_EXT_provoking_vertex";
    pub const ext_headless_surface = "VK_EXT_headless_surface";
    pub const ext_line_rasterization = "VK_EXT_line_rasterization";
    pub const ext_shader_atomic_float = "VK_EXT_shader_atomic_float";
    pub const ext_host_query_reset = "VK_EXT_host_query_reset";
    pub const ext_index_type_uint8 = "VK_EXT_index_type_uint8";
    pub const ext_extended_dynamic_state = "VK_EXT_extended_dynamic_state";
    pub const ext_host_image_copy = "VK_EXT_host_image_copy";
    pub const ext_map_memory_placed = "VK_EXT_map_memory_placed";
    pub const ext_shader_atomic_float_2 = "VK_EXT_shader_atomic_float2";
    pub const ext_surface_maintenance_1 = "VK_EXT_surface_maintenance1";
    pub const ext_swapchain_maintenance_1 = "VK_EXT_swapchain_maintenance1";
    pub const ext_shader_demote_to_helper_invocation = "VK_EXT_shader_demote_to_helper_invocation";
    pub const nv_device_generated_commands = "VK_NV_device_generated_commands";
    pub const nv_inherited_viewport_scissor = "VK_NV_inherited_viewport_scissor";
    pub const ext_texel_buffer_alignment = "VK_EXT_texel_buffer_alignment";
    pub const qcom_render_pass_transform = "VK_QCOM_render_pass_transform";
    pub const ext_depth_bias_control = "VK_EXT_depth_bias_control";
    pub const ext_device_memory_report = "VK_EXT_device_memory_report";
    pub const ext_acquire_drm_display = "VK_EXT_acquire_drm_display";
    pub const ext_robustness_2 = "VK_EXT_robustness2";
    pub const ext_custom_border_color = "VK_EXT_custom_border_color";
    pub const google_user_type = "VK_GOOGLE_user_type";
    pub const nv_present_barrier = "VK_NV_present_barrier";
    pub const ext_private_data = "VK_EXT_private_data";
    pub const ext_pipeline_creation_cache_control = "VK_EXT_pipeline_creation_cache_control";
    pub const nv_device_diagnostics_config = "VK_NV_device_diagnostics_config";
    pub const qcom_render_pass_store_ops = "VK_QCOM_render_pass_store_ops";
    pub const nv_cuda_kernel_launch = "VK_NV_cuda_kernel_launch";
    pub const nv_low_latency = "VK_NV_low_latency";
    pub const ext_descriptor_buffer = "VK_EXT_descriptor_buffer";
    pub const ext_graphics_pipeline_library = "VK_EXT_graphics_pipeline_library";
    pub const amd_shader_early_and_late_fragment_tests = "VK_AMD_shader_early_and_late_fragment_tests";
    pub const nv_fragment_shading_rate_enums = "VK_NV_fragment_shading_rate_enums";
    pub const nv_ray_tracing_motion_blur = "VK_NV_ray_tracing_motion_blur";
    pub const ext_ycbcr_2plane_444_formats = "VK_EXT_ycbcr_2plane_444_formats";
    pub const ext_fragment_density_map_2 = "VK_EXT_fragment_density_map2";
    pub const qcom_rotated_copy_commands = "VK_QCOM_rotated_copy_commands";
    pub const ext_image_robustness = "VK_EXT_image_robustness";
    pub const ext_image_compression_control = "VK_EXT_image_compression_control";
    pub const ext_attachment_feedback_loop_layout = "VK_EXT_attachment_feedback_loop_layout";
    pub const ext_4444_formats = "VK_EXT_4444_formats";
    pub const ext_device_fault = "VK_EXT_device_fault";
    pub const arm_rasterization_order_attachment_access = "VK_ARM_rasterization_order_attachment_access";
    pub const ext_rgba10x6_formats = "VK_EXT_rgba10x6_formats";
    pub const valve_mutable_descriptor_type = "VK_VALVE_mutable_descriptor_type";
    pub const ext_vertex_input_dynamic_state = "VK_EXT_vertex_input_dynamic_state";
    pub const ext_physical_device_drm = "VK_EXT_physical_device_drm";
    pub const ext_device_address_binding_report = "VK_EXT_device_address_binding_report";
    pub const ext_depth_clip_control = "VK_EXT_depth_clip_control";
    pub const ext_primitive_topology_list_restart = "VK_EXT_primitive_topology_list_restart";
    pub const huawei_subpass_shading = "VK_HUAWEI_subpass_shading";
    pub const huawei_invocation_mask = "VK_HUAWEI_invocation_mask";
    pub const nv_external_memory_rdma = "VK_NV_external_memory_rdma";
    pub const ext_pipeline_properties = "VK_EXT_pipeline_properties";
    pub const ext_frame_boundary = "VK_EXT_frame_boundary";
    pub const ext_multisampled_render_to_single_sampled = "VK_EXT_multisampled_render_to_single_sampled";
    pub const ext_extended_dynamic_state_2 = "VK_EXT_extended_dynamic_state2";
    pub const ext_color_write_enable = "VK_EXT_color_write_enable";
    pub const ext_primitives_generated_query = "VK_EXT_primitives_generated_query";
    pub const ext_global_priority_query = "VK_EXT_global_priority_query";
    pub const ext_image_view_min_lod = "VK_EXT_image_view_min_lod";
    pub const ext_multi_draw = "VK_EXT_multi_draw";
    pub const ext_image_2d_view_of_3d = "VK_EXT_image_2d_view_of_3d";
    pub const ext_shader_tile_image = "VK_EXT_shader_tile_image";
    pub const ext_opacity_micromap = "VK_EXT_opacity_micromap";
    pub const ext_load_store_op_none = "VK_EXT_load_store_op_none";
    pub const huawei_cluster_culling_shader = "VK_HUAWEI_cluster_culling_shader";
    pub const ext_border_color_swizzle = "VK_EXT_border_color_swizzle";
    pub const ext_pageable_device_local_memory = "VK_EXT_pageable_device_local_memory";
    pub const arm_shader_core_properties = "VK_ARM_shader_core_properties";
    pub const arm_scheduling_controls = "VK_ARM_scheduling_controls";
    pub const ext_image_sliced_view_of_3d = "VK_EXT_image_sliced_view_of_3d";
    pub const valve_descriptor_set_host_mapping = "VK_VALVE_descriptor_set_host_mapping";
    pub const ext_depth_clamp_zero_one = "VK_EXT_depth_clamp_zero_one";
    pub const ext_non_seamless_cube_map = "VK_EXT_non_seamless_cube_map";
    pub const arm_render_pass_striped = "VK_ARM_render_pass_striped";
    pub const qcom_fragment_density_map_offset = "VK_QCOM_fragment_density_map_offset";
    pub const nv_copy_memory_indirect = "VK_NV_copy_memory_indirect";
    pub const nv_memory_decompression = "VK_NV_memory_decompression";
    pub const nv_device_generated_commands_compute = "VK_NV_device_generated_commands_compute";
    pub const nv_linear_color_attachment = "VK_NV_linear_color_attachment";
    pub const google_surfaceless_query = "VK_GOOGLE_surfaceless_query";
    pub const ext_image_compression_control_swapchain = "VK_EXT_image_compression_control_swapchain";
    pub const qcom_image_processing = "VK_QCOM_image_processing";
    pub const ext_nested_command_buffer = "VK_EXT_nested_command_buffer";
    pub const ext_external_memory_acquire_unmodified = "VK_EXT_external_memory_acquire_unmodified";
    pub const ext_extended_dynamic_state_3 = "VK_EXT_extended_dynamic_state3";
    pub const ext_subpass_merge_feedback = "VK_EXT_subpass_merge_feedback";
    pub const lunarg_direct_driver_loading = "VK_LUNARG_direct_driver_loading";
    pub const ext_shader_module_identifier = "VK_EXT_shader_module_identifier";
    pub const ext_rasterization_order_attachment_access = "VK_EXT_rasterization_order_attachment_access";
    pub const nv_optical_flow = "VK_NV_optical_flow";
    pub const ext_legacy_dithering = "VK_EXT_legacy_dithering";
    pub const ext_pipeline_protected_access = "VK_EXT_pipeline_protected_access";
    pub const amd_anti_lag = "VK_AMD_anti_lag";
    pub const ext_shader_object = "VK_EXT_shader_object";
    pub const qcom_tile_properties = "VK_QCOM_tile_properties";
    pub const sec_amigo_profiling = "VK_SEC_amigo_profiling";
    pub const qcom_multiview_per_view_viewports = "VK_QCOM_multiview_per_view_viewports";
    pub const nv_ray_tracing_invocation_reorder = "VK_NV_ray_tracing_invocation_reorder";
    pub const nv_extended_sparse_address_space = "VK_NV_extended_sparse_address_space";
    pub const ext_mutable_descriptor_type = "VK_EXT_mutable_descriptor_type";
    pub const ext_legacy_vertex_attributes = "VK_EXT_legacy_vertex_attributes";
    pub const ext_layer_settings = "VK_EXT_layer_settings";
    pub const arm_shader_core_builtins = "VK_ARM_shader_core_builtins";
    pub const ext_pipeline_library_group_handles = "VK_EXT_pipeline_library_group_handles";
    pub const ext_dynamic_rendering_unused_attachments = "VK_EXT_dynamic_rendering_unused_attachments";
    pub const nv_low_latency_2 = "VK_NV_low_latency2";
    pub const qcom_multiview_per_view_render_areas = "VK_QCOM_multiview_per_view_render_areas";
    pub const nv_per_stage_descriptor_set = "VK_NV_per_stage_descriptor_set";
    pub const qcom_image_processing_2 = "VK_QCOM_image_processing2";
    pub const qcom_filter_cubic_weights = "VK_QCOM_filter_cubic_weights";
    pub const qcom_ycbcr_degamma = "VK_QCOM_ycbcr_degamma";
    pub const qcom_filter_cubic_clamp = "VK_QCOM_filter_cubic_clamp";
    pub const ext_attachment_feedback_loop_dynamic_state = "VK_EXT_attachment_feedback_loop_dynamic_state";
    pub const msft_layered_driver = "VK_MSFT_layered_driver";
    pub const nv_descriptor_pool_overallocation = "VK_NV_descriptor_pool_overallocation";
    pub const nv_raw_access_chains = "VK_NV_raw_access_chains";
    pub const nv_command_buffer_inheritance = "VK_NV_command_buffer_inheritance";
    pub const nv_shader_atomic_float16_vector = "VK_NV_shader_atomic_float16_vector";
    pub const ext_shader_replicated_composites = "VK_EXT_shader_replicated_composites";
    pub const nv_ray_tracing_validation = "VK_NV_ray_tracing_validation";
    pub const ext_device_generated_commands = "VK_EXT_device_generated_commands";
    pub const mesa_image_alignment_control = "VK_MESA_image_alignment_control";
    pub const ext_depth_clamp_control = "VK_EXT_depth_clamp_control";
    pub const acceleration_structure = "VK_KHR_acceleration_structure";
    pub const ray_tracing_pipeline = "VK_KHR_ray_tracing_pipeline";
    pub const ray_query = "VK_KHR_ray_query";
    pub const ext_mesh_shader = "VK_EXT_mesh_shader";
};
