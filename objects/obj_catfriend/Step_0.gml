event_inherited()

switch(state)
{
	case "normal":
    {
        if(!instance_exists(target))
        {
			if(_team == team.neutral)
				_target = par_unit
            var inst = get_nearest_notme(x, y, _target)
            if inst && inst.object_index != obj_catfriend
            {
                target = inst
            }
        }
        else
        {
            state = "attack"
        }

        if(instance_exists(parent))
        {
            if(point_distance(x, y, parent.x, parent.y) > 24)
            {
                hsp = approach(hsp, spd * sign(parent.x - x), 0.1)
            }
            else
            {
                hsp = approach(hsp, 0, 0.13)
            }
        }
        else hsp = approach(hsp, 0, 0.13)
        break
    }
    case "attack":
    {
        if (t % 4 == 1)
        {
            with (instance_create_depth(x, y, depth + 2, fx_aura))
            {
                visible = true
                image_speed = 0
                image_index = other.image_index
                sprite_index = other.sprite_index
                image_xscale = other.image_xscale
                image_yscale = other.image_yscale
                if(other.state == "grind")
                {
                    hspeed = -6
                }
            }
        }

        if(instance_exists(target))
        {
			hsp = approach(hsp, spd * 1.5 * sign(target.x - x), 0.1)
            if(collision_rectangle(x - 8, y, x + 8, y - 16, target, false, true))
            {
				damage_event(parent, target, proctype.onhit, damage)
                scr_particle_explode()
            }
            r++
            if(r >= 180)
            {
                r = 0
				if(_team == team.neutral)
					_target = par_unit
	            var inst = get_nearest_notme(x, y, _target)
	            if inst && inst.object_index != obj_catfriend
	            {
	                target = inst
	            }
            }
        }
        else state = "normal"

        break
    }
}

image_speed = hsp/6
if(hsp == 0)
    image_speed = 0.1

if(hsp != 0)
    facing = sign(hsp)

if(place_meeting(x + 2 * hsp + 2 * facing, y, obj_wall)) && on_ground
    vsp = -3.8 - (state == "attack")
if(!place_meeting(x + facing * 16, y + 14, obj_wall)) && on_ground
    vsp = -3.4 - (state == "attack")
if(place_meeting(x, y, obj_wall))
    y--
