draw_set_alpha(1)

if(done == true) && (timer_finished == false)
{
	var xx = x;
	var yy = y;
	x += random_range(-shake_remain, shake_remain);
	y += random_range(-shake_remain, shake_remain);
	shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));
	draw_self();
	x = xx;
	y = yy;
}
else
{
	draw_self()
}

if done && timer_finished
{
	depth = -1000
	draw_set_font(fnt_basic)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)

	var xx = oCamera.x
	var yy = oCamera.y

	var txt_full = "YOUU FUCKING DIED LMAOO                      \n\n\n\n\n\n\n        PRESS  BUTTON TO RETRY"
	txt = string_copy(txt_full, 1, textchar)
	textchar++

	draw_text_color(((xx - 1) - 120), (yy - 64), txt, c_black, c_black, c_black, c_black, 1)
	draw_text_color(((xx + 1) - 120), (yy - 64), txt, c_black, c_black, c_black, c_black, 1)
	draw_text_color(((xx - 1) - 120), (yy - 65), txt, c_black, c_black, c_black, c_black, 1)
	draw_text_color(((xx + 1) - 120), (yy - 66), txt, c_black, c_black, c_black, c_black, 1)
	draw_text_color((xx - 120), (yy - 65), txt, c_white, c_white, c_white, c_white, 1)
}
