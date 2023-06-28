function draw_self_shake(shake)
{
	var xx = x
	var yy = y
	x += random_range(-shake, shake)
	y += random_range(-shake, shake)
	draw_self()
	x = xx
	y = yy
}
