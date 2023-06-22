if(global.draw_debug)
{
	draw_set_color(c_white)
    draw_set_font(fnt_itemdesc)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)

	with(obj_wall)
	{
		draw_rectangle_color(bbox_left + 1, bbox_top + 1, bbox_right - 1, bbox_bottom - 1, c_red, c_red, c_red, c_red, true)
	}
	with(par_enemy)
	{
		draw_rectangle_color(bbox_left + 1, bbox_top + 1, bbox_right - 1, bbox_bottom - 1, c_red, c_red, c_red, c_red, true)
		draw_rectangle_color(x - 1, y - 1, x, y, c_lime, c_lime, c_lime, c_lime, true)
	}
	with(obj_boss)
	{
		draw_rectangle_color(bbox_left + 1, bbox_top + 1, bbox_right - 1, bbox_bottom - 1, c_red, c_red, c_red, c_red, true)
		draw_rectangle_color(x - 1, y - 1, x, y, c_lime, c_lime, c_lime, c_lime, true)
	}
	with(obj_enemy_extension)
	{
		draw_rectangle_color(bbox_left + 1, bbox_top + 1, bbox_right - 1, bbox_bottom - 1, c_red, c_red, c_red, c_red, true)
		draw_rectangle_color(x - 1, y - 1, x, y, c_lime, c_lime, c_lime, c_lime, true)
	}
	with(par_projectile)
	{
		draw_rectangle_color(bbox_left + 1, bbox_top + 1, bbox_right - 1, bbox_bottom - 1, c_red, c_red, c_red, c_red, true)
		if(instance_exists(parent))
		{
			draw_line_color(x, y, parent.x, parent.y, c_red, c_red)
			draw_text(x, bbox_bottom, string(object_get_name(parent)))
		}
	}
	with(fx_base)
	{
		draw_point_color(x, y, c_blue)
	}
	with(obj_bomb)
	{
		draw_line_color(x, y, x + lengthdir_x(point_distance(0, 0, hsp, vsp) * 2, point_direction(0, 0, hsp, vsp)), y + lengthdir_y(point_distance(0, 0, hsp, vsp) * 2, point_direction(0, 0, hsp, vsp)), c_aqua, c_aqua)
		draw_text(x, bbox_bottom + 8, string(bounce_counter) + "/" + string(max_bounces) + " bunces")
	}
	with(obj_player)
	{
		// draw_rectangle_color(bbox_left + 1, bbox_top + 1, bbox_right - 1, bbox_bottom - 1, c_red, c_red, c_red, c_red, true)
		draw_rectangle_color(x - 1, y - 1, x, y, c_lime, c_lime, c_lime, c_lime, true)
	}
	with(oCamera)
	{
		draw_line_color(x, y, xTo, yTo, c_yellow, c_yellow)
		if(instance_exists(follow))
			draw_line_color(follow.x, follow.y, xTo, yTo, c_orange, c_orange)
	}
	with(all)
	{
		draw_line_color(x, y, x + lengthdir_x(speed * 2, direction), y + lengthdir_y(speed * 2, direction), c_aqua, c_aqua)
	}
	with(obj_moveable)
	{
		draw_line_color(x, y, x + lengthdir_x(point_distance(0, 0, hsp, vsp) * 2, point_direction(0, 0, hsp, vsp)), y + lengthdir_y(point_distance(0, 0, hsp, vsp) * 2, point_direction(0, 0, hsp, vsp)), c_aqua, c_aqua)
	}
}
