if(global.draw_debug)
{
	with(obj_wall)
	{
		draw_rectangle_color(bbox_left + 1, bbox_top + 1, bbox_right - 1, bbox_bottom - 1, c_red, c_red, c_red, c_red, true)
	}
	with(par_enemy)
	{
		draw_rectangle_color(bbox_left + 1, bbox_top + 1, bbox_right - 1, bbox_bottom - 1, c_red, c_red, c_red, c_red, true)
		draw_rectangle_color(x - 1, y - 1, x, y, c_lime, c_lime, c_lime, c_lime, true)
	}
	with(obj_robo)
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
	}
	with(fx_base)
	{
		draw_rectangle_color(x - 1, y - 1, x + 1, y + 1, c_blue, c_blue, c_blue, c_blue, true)
	}
	with(obj_player)
	{
		// draw_rectangle_color(bbox_left + 1, bbox_top + 1, bbox_right - 1, bbox_bottom - 1, c_red, c_red, c_red, c_red, true)
		draw_rectangle_color(x - 1, y - 1, x, y, c_lime, c_lime, c_lime, c_lime, true)
	}
}
