event_inherited()

if(place_meeting(x, y, obj_wall))
{
    y--
}

switch state
{
    case "normal":
    {
        sprite_index = spr_robotank_idle
        if(instance_exists(obj_player))
        {
            hsp = spd * sign(obj_player.x - x)
            facing = (hsp != 0) ? sign(obj_player.x - x) : 1
            if(timer0 == 120)
            {
                timer0 = 0
                if(abs(obj_player.x - x) < 96)
                {
                    state = "fire"
                    hsp = 0
                }
            }
            else
                timer0++
        }
        else
        {
            timer0 = 0
        }
        break
    }
    case "fire":
    {
        sprite_index = spr_robotank_duck
        duck = approach(duck, 4, 0.1)
        image_index = duck

        if(timer0 == 40)
        {
            for (var i = 0; i < 4; i++)
            {
                with (instance_create_depth(random_range(bbox_left, bbox_right + 4), y + random_range(-9, -12), (depth - 1), fx_dust))
                {
                    vx = random_range(-1.8, 1.8)
                    vy = random_range(-1, 0)
                }
            }
        }
        if(timer0 > 60)
        {
            if timer0 % (2 * firerate) == 0
            {
                with(instance_create_depth(x - 0, y - 14 + random_range(-1, 1), depth - 2, obj_enemy_bullet))
                {
                    damage = other.damage
                    image_xscale = 2
                    image_yscale = 0.8
                    image_speed = 1
                    speed = 12
                    direction = point_direction(0, 0, other.facing, 0)
                    image_angle = 0
                }
            }
            if timer0 % (2 * firerate) == 4
            {
                with(instance_create_depth(x + 20, y - 14 + random_range(-1, 1), depth - 1, obj_enemy_bullet))
                {
                    damage = other.damage
                    image_xscale = 2
                    image_yscale = 0.8
                    image_speed = 1
                    speed = 12
                    direction = point_direction(0, 0, other.facing, 0)
                    image_angle = 0
                }
            }
            if(timer0 % (2 * firerate) == 0 || timer0 % (2 * firerate) == 4)
            {
                hsp += -facing * spd
                ScreenShake(1, 5)
                audio_play_sound(snShot, 1, false)
            }

            with(instance_create_depth(x + random_range(-16, 16), bbox_bottom, depth - 3, fx_spark2))
            {
                hsp = other.hsp
                vsp = random_range(-1, -2.5)
                life_max = 5
            }
        }
        if(timer0 == 180)
        {
            state = "normal"
            timer0 = 0
        }
        timer0++
        break
    }
}
