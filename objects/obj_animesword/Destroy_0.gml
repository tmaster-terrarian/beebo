if(place_meeting(x, y, par_unit))
{
	switch(_team)
	{
		case team.player:
		{
			target = instance_place(x, y, par_enemy)
			break
		}
		case team.enemy:
		{
			target = instance_place(x, y, obj_player)
			break
		}
		case team.neutral: default:
		{
			target = instance_place(x, y, par_unit)
			break
		}
	}
}
else if(place_meeting(x, y, obj_wall))
{
	target = instance_place(x, y, obj_wall)
}

with(instance_create_depth(x, y, depth, obj_sticker))
{
	target = other.target
	if(instance_exists(target))
	{
		xx = other.x - target.x
		yy = other.y - target.y
	}

	image_angle = other.image_angle
	image_alpha = 12
	sprite_index = other.sprite_index
}
