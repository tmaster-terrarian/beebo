if(image_alpha)
	image_alpha -= 0.1
else instance_destroy()

if(instance_exists(target))
{
	x = target.x + xx
	y = target.y + yy
}
else
{
	if(!place_meeting(x, y + 1, obj_wall))
	{
		image_angle = -90
		vspeed = approach(vspeed, 20, 0.13)
	}
	else vspeed = 0
}
