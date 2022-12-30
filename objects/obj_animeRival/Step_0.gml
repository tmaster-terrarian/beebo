//h

if(on_ground)
{
    accel = ground_accel;
    fric = ground_fric;
}
else
{
    accel = air_accel;
    fric = air_fric;
}
switch(state)
{
    case "normal": default:
    {
        can_attack = 1;
        can_jump = 1;
        if (input_dir == 1)
        {
            if (hsp < 0)
            {
                hsp = approach(hsp, 0, fric)
            }
            else if (on_ground && vsp >= 0)
            {
                if (!landTimer)
                    sprite_index = spr_anime_run
            }
            if run
                run = 7
            if (hsp < walksp)
                hsp = approach(hsp, walksp, accel)
            if on_ground
                facing = 1
            else
                facing = approach(facing, 1, 0.2)
        }
        else if (input_dir == -1)
        {
            if (hsp > 0)
            {
                hsp = approach(hsp, 0, fric)
            }
            else if (on_ground && vsp >= 0)
            {
                if (!landTimer)
                    sprite_index = spr_anime_run
            }
            if run
                run = 7
            if (hsp > -walksp)
                hsp = approach(hsp, -walksp, accel)
            if on_ground
                facing = -1
            else
                facing = approach(facing, -1, 0.2)
        }
        else
        {
            hsp = approach(hsp, 0, (fric * 2))
            if (abs(hsp) < 2)
            {
                if run
                    run--
            }
            if (abs(hsp) < 0.5 && on_ground && (!landTimer))
            {
                sprite_index = spr_anime
                image_index = 0
            }
        }
        if (!on_ground)
        {
            // if (vsp >= -0.5)
            // {
            //     if place_meeting((x + (2 * input_dir)), y, oWall)
            //         wallslideTimer++
            // }
            // else
            //     wallslideTimer = 0
            // if (wallslideTimer >= 5)
            //     state = "wallslide"
            sprite_index = spr_anime_jump2
            if (vsp >= 0.1)
                vsp = approach(vsp, vsp_max, grv)
            if (vsp < 0)
                vsp = approach(vsp, vsp_max, grv)
            else if (vsp < 2)
                vsp = approach(vsp, vsp_max, (grv * 0.25))
            if (vsp < 0)
                image_index = approach(image_index, 1, 0.2)
            else if (vsp >= 0.5)
                image_index = approach(image_index, 5, 0.5)
            else
                image_index = 3
        }
        // else
        //     wallslideTimer = 0
        if (sprite_index == spr_anime_run)
            image_index += (hsp / 6)
        landTimer = approach(landTimer, 0, 1)
        break;
    }
    case "backflip_start":
    {
        if(timer0 == 0)
        {
            image_index = 0;
            sprite_index = spr_anime_backflip_a;
            hsp = 0;
            vsp = 0;
            timer0 = 1;
        }
        if(timer0 == 1)
        {
            if(image_index < 1.75) image_index += 0.25;
            else
            {
                timer0 = 0;
                state = "backflip";
            }
        }
        break;
    }
    case "backflip":
    {
        can_jump = 0;
        if(timer0 == 0)
        {
            can_dodge = 0;
            image_index = 0;
            sprite_index = spr_anime_backflip_b;
            hsp = 0;
            vsp = 0;
            vsp = -2;
            hsp = (-2 * sign(facing));
            invuln = 20;
            timer0++;
            audio_play_sound(sn_flip, 0, false);
        }
        image_index += 0.25;
        vsp = approach(vsp, vsp_max, grv);
        break;
    }
    case "backflip_end":
    {
        if(image_index < 3) image_index += 0.375;
        else
        {
            timer0 = 0;
            image_index = 0;
            state = "hard_land";
        }
    }
    case "hard_land":
    {
        timer0++;
        hsp = approach(hsp, 0, 0.2);
        if (timer0 >= 8 || (!on_ground))
        {
            timer0 = 0;
            can_dodge = 1;
            state = "normal";
        }
        if(instance_exists(obj_player_dead))
        {
            MakeExplosion(x, y);
            scr_particle_explode();
        }
        break;
    }
    case "dinder":
    {
        can_attack = 0;
        can_jump = 0;
        can_dodge = 0;
        if(timer0 == 0)
        {
            image_index = 0;
            sprite_index = spr_anime_dinder;
            hsp = 0;
            vsp = approach(vsp, vsp_max, grv);
            timer0 = 1;
            audio_play_sound(snGroundHit, 0, false);
        }
        if(timer0 <= 40)
        {
            timer0++;
        }
        else
        {
            timer0 = 0;
            image_index = 0;
            sprite_index = spr_anime;
            can_attack = 1;
            can_jump = 1;
            can_dodge = 1;
            state = "normal";
            if(instance_exists(obj_player_dead))
            {
                timer0 = 0;
                image_index = 0;
                flip_counter = 0;
                state = "backflip_start";
            }
        }
        break;
    }
    case "backflip_x3":
    {
        alarm[1] = 1;
        break;
    }
}

invuln = max(0, invuln - 1);

if(active) && (instance_exists(oPlayer))
{
    var chance = floor(random_range(1, 120));

    if(on_ground)
    {
        if(place_meeting(x + sign(hsp), y, oWall)) && (!place_meeting(x + sign(hsp), y - 34, oWall)) && (can_jump)
        {
            can_jump = 0;
            state = "normal";
            sprite_index = spr_anime_jump2;
            image_index = 0;
            vsp += jumpsp;
            audio_play_sound(sn_jump, 0, false);
        }
        if(!place_meeting(x + (sign(hsp) * 16), y + 16, oWall)) && (can_jump)
        {
            can_jump = 0;
            state = "normal";
            sprite_index = spr_anime_jump2;
            image_index = 0;
            vsp += jumpsp;
            audio_play_sound(sn_jump, 0, false);
        }
        if(place_meeting(x, y - 20, oPlatform)) && (y > oPlayer.y) && (can_jump)
        {
            can_jump = 0;
            state = "normal";
            sprite_index = spr_anime_jump2;
            image_index = 0;
            vsp += jumpsp;
            hsp *= 0.8;
            audio_play_sound(sn_jump, 0, false);
        }

        if(y - oPlayer.y > 80) && (place_meeting(x + sign(facing) * 8, y, oWall)) && (can_jump)
        {
            can_jump = 0;
            state = "normal";
            sprite_index = spr_anime_jump2;
            image_index = 0;
            vsp += jumpsp;
            audio_play_sound(sn_jump, 0, false);
        }
    }
    else if(!place_meeting(x, y + 32, oWall)) && (y > oPlayer.y)
    {
        chance = -1;

        if place_meeting(x + 2, y, oWall)
        {
            state = "normal"
            hsp = -2
            vsp = -2.5
            facing = -1
            input_dir = -1;
            audio_play_sound(sn_throw, 0, false)
        }
        if place_meeting(x - 2, y, oWall)
        {
            state = "normal"
            hsp = 2
            vsp = -2.5
            facing = 1
            input_dir = 1;
            audio_play_sound(sn_throw, 0, false)
        }
    }

    if(oPlayer.y - y > 64) && (!on_ground)
    {
        hsp *= 0.75;
    }

    if(!on_ground)
    {
        if(!place_meeting(x, y + 32, oWall)) && (!place_meeting(x + -sign(hsp) * 40, y, oWall)) && (place_meeting(x + -sign(hsp) * 40, y + 8, oWall)) && (state == "normal") && (can_dodge) && (abs(x - oPlayer.x) < 64) && ((y - oPlayer.y) > 0)
        {
            timer0 = 0
            image_index = 0
            state = "backflip_start"
        }
    }

    if(abs(x - oPlayer.x) > 128)
    {
        chance = -1;
        input_dir = sign(oPlayer.x - x);
    }

    if(chance <= 6) && (chance > 0)
    {
        with(oPlayer) other.input_dir = sign(x - other.x) + round(random_range(-1, 1));
    }

    // if(chance == 1) && (oPlayer.facing == -sign(facing)) && (state == "normal") && (can_dodge)
    // {
    //     timer0 = 0
    //     image_index = 0
    //     state = "backflip_start"
    // }

    // if(chance == 2) && (oPlayer.facing == -sign(facing))
    // {
    //     flip_counter = 0
    //     timer0 = 0
    //     image_index = 0
    //     state = "backflip_x3"
    // }
}

if(instance_exists(obj_player_dead)) && (active)
{
    state = "dinder";
    active = 0;
    input_dir = 0;
    image_index = 0;
    facing = sign(obj_player_dead.x - x);
}

input_dir = clamp(input_dir, -1, 1);

image_xscale = sign(facing);
