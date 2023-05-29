event_inherited()

if(place_meeting(x, y, obj_wall)) y--

if (!place_meeting(x + facing, y + 5, obj_wall) && !place_meeting(x + facing, y + 5, obj_platform))
{
    hsp = -hsp;
	facing = sign(hsp)
}

if t
	t--

var _t = instance_place(x, y, _target)
if(_t)
{
	if(!t)
	{
		t = 30
		var _event = new damage_event(id, _t, proctype.onhit, damage, 1)

		if(_t.object_index == obj_player)
		{
			audio_play_sound(sn_player_hit, 0, 0);
			_t.state = "stunned"
		    _t.timer0 = 0
		    _t.flash = 5
			oCamera.alarm[0] = 10
		}
	}
}

//animation
if (!on_ground)
{
    sprite_index = sRoboA;
    image_speed = 0;
    if (vsp > 0) image_index = 1; else image_index = 0;
}
else
{
    
    if (hsp == 0)
    {
        sprite_index = sRobo;
		image_speed = 0.2;
    }
    else
    {
        sprite_index = sRoboR;
		image_speed = abs(hsp/8);
    }
}

image_xscale = facing
