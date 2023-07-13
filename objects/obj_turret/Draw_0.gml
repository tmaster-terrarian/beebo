if(flash)
{
	flash--
	shader_set(sh_flash)
}

if(state == "targeting") && instance_exists(target)
{
    var c = merge_color(merge_color(c_red, c_black, 0.3), c_red, clamp(timer0/160, 0, 1))
    if(timer0 > 160)
    {
        if(timer0 % 4 == 0)
        {
            c = c_white
        }
    }
    if(timer0 == 1 || timer0 == 5) c = c_white
    draw_set_alpha(clamp((timer0 + 60)/100, 0, 1))
    draw_line_color(x + barrelpos_x, y + barrelpos_y, x + barrelpos_x + lengthdir_x(10000, aim_dir), y + barrelpos_y + lengthdir_y(10000, aim_dir), c, c)
    draw_set_alpha(1)
}
if(state == "fire") && instance_exists(target)
{
    var c = c_red
    if(timer0 % 4 == 0)
    {
        c = c_white
    }
    draw_line_color(x + barrelpos_x, y + barrelpos_y, x + barrelpos_x + lengthdir_x(10000, aim_dir), y + barrelpos_y + lengthdir_y(10000, aim_dir), c, c)
}

draw_sprite_ext(spr_turret_head, image_index, x + lengthdir_x(-recoil, image_angle), y + lengthdir_y(-recoil, image_angle), image_xscale, image_yscale, image_angle, image_blend, image_alpha)

draw_sprite_ext(spr_turret_legs, 0, x, y, facing, 1, 0, image_blend, image_alpha)

shader_reset()
