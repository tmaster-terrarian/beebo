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
else draw_self();
