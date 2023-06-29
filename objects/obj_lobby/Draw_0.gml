draw_set_font(global.fonts.console); draw_set_halign(fa_middle); draw_set_valign(fa_center)

var key_en = keyboard_check(vk_enter) || keyboard_check(vk_space) || gamepad_button_check(0, gp_face1)

for(var i = 0; i < array_length(m_options); i++)
{
	var m = m_options[i]
	if(is_instanceof(m, button))
	{
		if(m.sprite != noone)
		{
			draw_sprite_ext(m.sprite, ((i == m_pos) ? 1 * key_en : 0), m.x, m.y + ((i == m_pos) ? 2 * key_en : 0), m.w/sprite_get_width(m.sprite), m.h/sprite_get_height(m.sprite), 0, c_white, 1)
		}
		draw_set_color(m.text_color)
		draw_text(m.x + m.w/2, m.y + m.h/2 + 2 + ((i == m_pos) ? 2 * key_en : 0) + global.fonts.offset, m.name)
	}
	if(is_instanceof(m, slider))
	{
		draw_sprite_ext(spr_ui_slider, 0, m.x + m.w/2, m.y + m.h/2, (m.w - 4)/4, 1, 0, merge_color(make_color_rgb(0, 167, 59), make_color_rgb(229, 0, 76), (m.value - m._min)/(m.range - m._min)), 1)
		draw_sprite_ext(spr_ui_slider_handle, 0, m.x + (((m.value - m._min)/(m.range - m._min)) * (m.w - 8)) + 4, m.y + m.h/2, 1, 1, 0, merge_color(make_color_rgb(0, 167, 59), make_color_rgb(229, 0, 76), (m.value - m._min)/(m.range - m._min)), 1)
	}
	if(is_instanceof(m, num_range))
	{
		var c = #020014
		draw_rectangle_color(m.x + 4, m.y, m.x + m.w - 5, m.y + m.h - 1, c,c,c,c, false)
		var c = #00122a
		//round corners
		draw_point_color(m.x + 4, m.y, c)					//top-left
		draw_point_color(m.x + m.w - 5, m.y, c)				//top-right
		draw_point_color(m.x + 4, m.y + m.h - 1, c)			//bottom-left
		draw_point_color(m.x + m.w - 5, m.y + m.h - 1, c)	//bottom-right

		draw_text(m.x + m.w/2, m.y + m.h/2 + 4 + global.fonts.offset, m.value)

		draw_set_halign(fa_right)
		draw_text(m.x + 5 - m.arrow_move, m.y + m.h/2 + 4 + global.fonts.offset, "<")
		draw_text(m.x + 4 - m.arrow_move, m.y + m.h/2 + 4 + global.fonts.offset, "<")
		draw_set_halign(fa_left)
		draw_text(m.x + m.w - 3 + m.arrow_move, m.y + m.h/2 + 4 + global.fonts.offset, ">")
		draw_text(m.x + m.w - 2 + m.arrow_move, m.y + m.h/2 + 4 + global.fonts.offset, ">")

		m.arrow_move = approach(m.arrow_move, 0, 1)
	}
}

var c = c_white
draw_rectangle_color(round(s_x) - 2, round(s_y) - 2, round(s_x + s_w - 1) + 2, round(s_y + s_h) + 1, c,c,c,c, true)

draw_sprite(spr_ui_inputhint, 0, 4, 148)
