event_inherited()

switch(state)
{
	case "normal":
    {
        if(!instance_exists(target))
        {
            var inst, xx;
            xx = x;
            x -= 10000;
            inst = instance_nearest(xx, y, par_enemy);
            if inst
            {
                if inst.object_index != obj_catfriend
                    target = inst
            }
            x += 10000;
            if(instance_exists(obj_enemy))
                target = instance_nearest(x, y, obj_enemy)
            else if(instance_exists(obj_boss))
                target = instance_nearest(x, y, obj_boss)
        }
        else
        {
            state = "attack"
        }

        if(instance_exists(obj_player))
        {
            if(point_distance(x, y, obj_player.x, obj_player.y) > 24)
            {
                hsp = approach(hsp, spd * sign(obj_player.x - x), 0.1)
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
                audio_play_sound(sn_hit, 5, false)
                target.hp -= 10
                scr_particle_explode()
            }
        }
        else state = "normal"

        break
    }
}
t++

image_speed = hsp/6
if(hsp == 0)
    image_speed = 0.2

if(hsp != 0)
    facing = sign(hsp)

if(place_meeting(x + 2 * hsp + 2 * facing, y, obj_wall)) && on_ground
    vsp = -3.8 - (state == "attack")
if(!place_meeting(x + facing * 16, y + 14, obj_wall)) && on_ground
    vsp = -3.4 - (state == "attack")
if(place_meeting(x, y, obj_wall))
    y--
