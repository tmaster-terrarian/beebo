if(global.draw_debug)
{
    var c = c_white
    draw_set_font(fnt_console)
    draw_set_halign(fa_center)
    draw_set_valign(fa_bottom)
    draw_text_color(xstart, ystart, path_get_name(path), c,c,c,c, 1)

    draw_path(path, xstart, ystart, 0)
}

if image_xscale == 1
    draw_sprite(spr_girder_platform_belt, 0, x, y)

draw_sprite(spr_cog_small, floor(smallcog_index), bbox_left - 2, y + 1)
draw_sprite_ext(spr_cog, 0, bbox_left - 1, y + 7, 1, 1, cog_rotl, c_white, 1)
draw_sprite_ext(spr_cog, 1, bbox_right + 1, y + 5, 1, 1, cog_rotr, c_white, 1)

draw_sprite_ext(sprite_index, image_index, x, y + player_step_yoffs, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
