surface_distort = surface_create(256, 144);
surface_set_target(surface_distort)

    draw_clear_alpha(COLOUR_FOR_NO_MOVE,0)

    // Anything we draw here will distort the screen
    draw_sprite_ext(spr_normal_distorter4, 0, 128, 72, 1, 1, 0, c_white, 0.5)

surface_reset_target()

var surface_texture_page = surface_get_texture(surface_distort)

shader_set(sh_distort)

    texture_set_stage(distortion_stage, surface_texture_page);
    draw_surface_ext(application_surface, 0, 0, global.screenSize * oCamera.zoom, global.screenSize * oCamera.zoom, 0, c_white, 1)

shader_reset()

surface_free(surface_distort) // always remember to remove the surface from memory
