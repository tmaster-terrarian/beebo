if(has_triggered == false)
{
	has_triggered = true;
	var cam = camera_get_active();
	with(oPlayer)
	{
		if(other.side > 0)
		{
			instance_create_layer(camera_get_view_x(cam) + 328, camera_get_view_y(cam) + other.vertical_pos, "Enemy", other.enemy);
		}
		else
		{
			instance_create_layer(camera_get_view_x(cam) - 8, camera_get_view_y(cam) + other.vertical_pos, "Enemy", other.enemy);
		}
	}
}
