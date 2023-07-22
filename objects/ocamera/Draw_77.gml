var e = application_surface_is_enabled()
if(global.hitstop)
{
    application_surface_draw_enable(false)

    draw_set_color(c_white)
    draw_rectangle(0, 0, window_get_width(), window_get_height(), false)

    draw_surface_ext(application_surface, 0, 0, global.screenSize * zoom, global.screenSize * zoom, 0, c_white, 0.7)
}
// else if(global.retro)
// {
//     application_surface_draw_enable(false)

//     shader_set(sh_retro)
//     draw_surface_ext(application_surface, 0, 0, global.screenSize * zoom, global.screenSize * zoom, 0, c_white, 1)
//     shader_reset()
// }
else application_surface_draw_enable(e)
