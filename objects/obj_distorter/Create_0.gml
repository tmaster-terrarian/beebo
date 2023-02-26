#macro COLOUR_FOR_NO_MOVE make_colour_rgb(127,127,255)

// name of what you want it to be called in the shader
distortion_stage = shader_get_sampler_index(sh_distort, "distortion_texture_page") 

application_surface_draw_enable(false)
