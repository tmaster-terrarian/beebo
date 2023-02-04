event_inherited();

cLeft = place_meeting((x - 1), y, oWall)
cRight = place_meeting((x + 1), y, oWall)
if cLeft
    wallTarget = instance_place((x - 1), y, oWall)
if cRight
    wallTarget = instance_place((x + 1), y, oWall)

global.playerhealth = hp;
if(hp <= 0)
{
	with(oGun)
	{
		hitfrom = other.hitfrom;
		with (instance_create_layer(x, y, layer, obj_gun_dead))
	    {
			if(x > room_width) || (x < 0) || (y > room_height) || (y < 0)
			{
				direction = point_direction(x, y, oCamera.x, oCamera.y);
				hsp = lengthdir_x(4, direction);
				vsp = lengthdir_y(4, direction);
			}
	        else
			{
				direction = other.hitfrom;
				hsp = lengthdir_x(2, direction);
				vsp = lengthdir_y(2, direction) - 2;
			}
	    }
	    instance_destroy();
	}

	instance_change(obj_player_dead, true);
	if(x > room_width) || (x < 0) || (y > room_height) || (y < 0)
	{
		oob = true;
		direction = point_direction(x, y, oCamera.x, oCamera.y);
		move = lengthdir_x(3.5, direction);
		vsp = lengthdir_y(3.5, direction);
	}
	else
	{
		direction = hitfrom;
		if(hitfrom == 0) direction = point_direction(x, y, x + sign(hsp), y);
		move = lengthdir_x(1, direction);
		vsp = lengthdir_y(1, direction);
	}
}
