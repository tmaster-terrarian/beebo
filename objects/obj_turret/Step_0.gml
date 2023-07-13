hsp = 0
vsp = 0

_rope.p0.x = lengthdir_x(-10 * facing, image_angle)
_rope.p0.y = lengthdir_x(-10 * facing, image_angle)
_rope.p1.x = -3 * facing
_rope.p1.y = 12

_rope.curvepoint.x = lerp(_rope.p0.x, _rope.p1.x, 0.5)
_rope.curvepoint.y = lerp(_rope.p0.x, _rope.p1.x, 0.5) + 8

_rope.x = x
_rope.y = y - 3

agpos.x = target.x
agpos.y = target.y
agpos.cy = (target.bbox_bottom + target.bbox_top)/2

event_inherited()
image_xscale = 1
var toffsx = 0
var toffsy = 0

if(instance_exists(target) && _target == obj_player)
{
	if(target.duck) toffsy = -6
	else toffsy = -12
}

if recoil
	recoil--

barrelpos_x = lengthdir_x(point_distance(0, 0, 0, -7 * image_yscale), image_angle + point_direction(0, 0, 0, -7 * image_yscale))
barrelpos_y = lengthdir_y(point_distance(0, 0, 0, -7 * image_yscale), image_angle + point_direction(0, 0, 0, -7 * image_yscale))

switch(state)
{
	case "normal":
    {
		if(instance_exists(target))
		{
			if(!collision_line(x, y, agpos.x + toffsx, agpos.y + toffsy, obj_wall, 0, 0))
			{
				timer0++

				if(timer0 >= 20) && cooldn == 0
				{
					state = "targeting"
					timer0 = 0
				}
			}
			else
			{
				timer0 = 0
				image_angle += (((facing == -1) * 180) - image_angle) / 4
				aim_dir = ((facing == -1) * 180)
			}
		}
		if cooldn
			cooldn--
        break
    }
	case "targeting":
	{
		if(instance_exists(target))
		{
			if(timer0 == 0)
			{
				aim_dir = point_direction(x + barrelpos_x, y + barrelpos_y, agpos.x + toffsx, agpos.y + toffsy)
				audio_play_sound(sn_turret_activate, 0, 0, 1.85, 0, 1.5)
			}
			if(!collision_line(x + barrelpos_x, y + barrelpos_y, agpos.x + toffsx, agpos.y + toffsy, obj_wall, 0, 0))
			{
				if(abs(point_direction(x + barrelpos_x, y + barrelpos_y, agpos.x + toffsx, agpos.y + toffsy) - aim_dir) > 300)
					aim_dir = point_direction(x + barrelpos_x, y + barrelpos_y, agpos.x + toffsx, agpos.y + toffsy)
				else
					aim_dir += (point_direction(x + barrelpos_x, y + barrelpos_y, agpos.x + toffsx, agpos.y + toffsy) - aim_dir) / aim_sp
			}
		}
		else
		{
			aim_dir = ((facing == -1) * 180)
			state = "normal"
			timer0 = 0
		}

		image_angle = aim_dir

		if(timer0 > 160)
		{
			if(timer0 % 4 == 0)
			{
				audio_play_sound(sn_turret_beep, 0, 0, 1.75)
			}
		}

		if(timer0 >= 190)
		{
			state = "fire"
			timer0 = 0
		}

		timer0++
		break
	}
	case "fire":
	{
		if(timer0 % 4 == 0)
		{
			audio_play_sound(sn_turret_beep, 0, 0, 1.75)
		}

		if(timer0 == 10)
		{
			with(instance_create_depth(x + barrelpos_x, y + barrelpos_y, depth + 1, obj_sniperbullet))
			{
				_team = team.enemy
				speed = 40
				direction = other.aim_dir
				image_angle = direction
				image_speed = 1
				damage = other.damage
			}
			with(instance_create_depth(x + lengthdir_x(-10, image_angle), y + lengthdir_y(-10, image_angle) - 6, depth - 5, fx_casing))
			{
				image_alpha = 20
				image_yscale = other.image_yscale
				sprite_index = spr_fx_casing_sniper
				angle = other.image_angle
				dir = other.image_yscale
				hsp = -other.image_yscale * random_range(1.5, 2)
				vsp = -1 + random_range(-0.2, 0.1)
			}
			ScreenShake(8, 30)
			var randsn = choose(sn_sniper1, sn_sniper2)
			audio_play_sound(randsn, 1, false, 1, 0, random_range(0.9, 1))
			audio_play_sound(randsn, 1, false, 1, 0, 1.2)
			cooldn = 30
			recoil = 14
			aim_dir = ((facing == -1) * 180)
			state = "normal"
			timer0 = 0
		}
		timer0++
		break
	}
}

if (image_angle > 90 && image_angle < 270)
	image_yscale = -1
else
	image_yscale = 1

if(position_meeting(x + 3 * facing, y + 11, obj_wall))
{
	y--
}
