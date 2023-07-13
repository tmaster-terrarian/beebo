event_inherited()

if(place_meeting(x, y, obj_wall)) y--

hsp = approach(hsp, sign(agpos.x - x) * spd, ground_accel)
if(abs(sign(agpos.x - x))) facing = sign(agpos.x - x)

if(place_meeting(x + sign(agpos.x - x), y, obj_wall))
{
	hsp = 0
	if(on_ground)
		vsp = -3
}

if(_t)
	_t--

var __t = instance_place(x, y, target)
if(__t)
{
	if(!_t)
	{
		_t = 30
		damage_event(id, __t, proctype.onhit, damage, 1)

		if(__t.object_index == obj_player)
		{
			__t.state = "stunned"
		    __t.timer0 = 0
			__t.hsp = -__t.facing * 1.2
		}
	}
}

//animation
if(!on_ground)
{
    sprite_index = sRoboA;
    image_speed = 0;
    image_index = (vsp > 0);
}
else
{
    if(hsp == 0)
    {
        sprite_index = sRobo;
		image_speed = 0.2;
    }
    else
    {
        sprite_index = sRoboR;
		image_speed = abs(hsp/6);
    }
}

image_xscale = facing
