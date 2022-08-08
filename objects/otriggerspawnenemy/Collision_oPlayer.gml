if(has_triggered == false)
{
	has_triggered = true;
	var cam = view_camera[0];
	with(oPlayer)
	{
		if(other.side > 0)
		{
			for(i = 0; i < other.count; i++)
			{
				instance_create_depth(camera_get_view_x(cam) + 328, camera_get_view_y(cam) + other.vertical_pos, depth + 20, other.enemy);
			}
		}
		else
		{
			for(i = 0; i < other.count; i++)
			{
				instance_create_depth(camera_get_view_x(cam) - 8, camera_get_view_y(cam) + other.vertical_pos, depth + 20, other.enemy);
			}
		}
	}
}
