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
            can_dodge = 0;
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
            if(encounter1)
            {
                with(oGameManager)
                {
                    audio_sound_gain(current_bgm, 1, 1000);
                }
                with(oCamera)
                {
                    usefollow = 1;
                    draw_ui = true;
                    zoom = 1;
                }
                global.cutscene = false;
                instance_destroy();
            }
            else state = "normal";
            if(single_wall)
            {
                single_wall = 0;
                input_dir = -input_dir;
                if place_meeting(x + 2, y, oWall)
                {
                    hsp = -2
                    vsp = -2.5
                    facing = -1
                    input_dir = -1;
                    audio_play_sound(sn_throw, 0, false)
                }
                if place_meeting(x - 2, y, oWall)
                {
                    hsp = 2
                    vsp = -2.5
                    facing = 1
                    input_dir = 1;
                    audio_play_sound(sn_throw, 0, false)
                }
            }
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
    case "encounter1":
    {
        if(timer0 == 0)
        {
            audio_play_sound(sn_impact, 0, false);
            with(oGameManager) audio_sound_gain(current_bgm, 0, 500);
            with(oCamera)
            {
                usefollow = 0;
                draw_ui = false;
                xTo = 128;
                yTo = 80;
            }
            with(obj_player) facing = 1;
        }
        if(timer0 < 60)
        {
            timer0++;
            global.cutscene = true;
        }
        if(timer0 == 30)
        {
            audio_play_sound(sn_alert, 0, false);
            facing = -facing;
            with(oCamera)
            {
                zoom = 2;
                xTo = 144;
                yTo = 80;
            }
            with(obj_player)
            {
                x = 136;
            }
        }
        if(timer0 == 60)
        {
            timer0 = 0;
            state = "backflip_start";
        }
        break;
    }
}

invuln = max(0, invuln - 1);

check = function(_x, _y)
{
    return (place_meeting(_x, _y, oWall) || place_meeting(_x, _y, oPlatform));
}

if(active) && (instance_exists(obj_player))
{
    var chance = floor(random_range(1, 120));

    if(on_ground)
    {
        //jump over ledges
        if((place_meeting(x + sign(hsp) * 4, y, oWall)) && (cast_check_a(x + sign(hsp), y, 0, 1, oWall, 34))) && (can_jump)
        {
            can_jump = 0;
            state = "normal";
            sprite_index = spr_anime_jump2;
            image_index = 0;
            vsp = jumpsp;
            audio_play_sound(sn_jump, 0, false);
        }

        //jump over gaps
        if(!check(x + (sign(hsp) * 16), y + 16)) && (y > (obj_player.y - 16)) && (can_jump)
        {
            can_jump = 0;
            state = "normal";
            sprite_index = spr_anime_jump2;
            image_index = 0;
            vsp = jumpsp;
            audio_play_sound(sn_jump, 0, false);
        }

        //jump onto platforms
        if(place_meeting(x, y - 24, oPlatform)) && (y > obj_player.y) && (can_jump)
        {
            can_jump = 0;
            state = "normal";
            sprite_index = spr_anime_jump2;
            image_index = 0;
            vsp = jumpsp;
            hsp *= 0.8;
            audio_play_sound(sn_jump, 0, false);
        }

        //drop through platforms
        if(place_meeting(x, y + 1, oPlatform)) && (!place_meeting(x, y + 1, oWall)) && (y < obj_player.y)
        {
            y += 1;
        }

        //initiate walljump chains if too low from player
        if(y - obj_player.y > 80) && (place_meeting(x + sign(facing) * 8, y, oWall)) && (can_jump)
        {
            can_jump = 0;
            state = "normal";
            sprite_index = spr_anime_jump2;
            image_index = 0;
            vsp += jumpsp;
            audio_play_sound(sn_jump, 0, false);
        }
    }

    //walljumps only if below player and there's adequate space above and below
    else if(!check(x, y + 32)) && (!place_meeting(x, y - 16, oWall)) && ((y >= obj_player.y) || (y > room_height))
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
            can_dodge = 1;
        }
        if place_meeting(x - 2, y, oWall)
        {
            state = "normal"
            hsp = 2
            vsp = -2.5
            facing = 1
            input_dir = 1;
            audio_play_sound(sn_throw, 0, false)
            can_dodge = 1;
        }

        // single wall walljump via dodging into wall
        if(!place_meeting(x + 2 * sign(facing), y, oWall)) && (cast_check(x, y, -2 * sign(facing), 0, oWall, 24)) && (state == "normal") && (can_dodge) && (vsp >= 0.1)
        {
            single_wall = 1;
            can_dodge = 0;
            timer0 = 0;
            state = "backflip_start";
            chance = -1;
        }
    }

    //charge towards player without random stopping if offscreen
    if(abs(x - obj_player.x) > 128)
    {
        if(chance) input_dir = sign(obj_player.x - x);
        chance = -1;
    }

    //adjust speed to aim at player during freefall while above
    if(obj_player.y - y > 64) && (abs(x - obj_player.x) < 16) && (!on_ground)
    {
        hsp = approach(hsp, 0, 0.5);
    }

    if(!on_ground)
    {
        //cool backflip ledge save
        if(!place_meeting(x, y + 32, oWall)) && (!place_meeting(x - (sign(hsp) * 40), y - 8, oWall)) && (place_meeting(x - (sign(hsp) * 40), y + 8, oWall)) && (state == "normal") && (can_dodge) && (abs(x - obj_player.x) < 80) && ((y - obj_player.y) >= -8)
        {
            timer0 = 0;
            image_index = 0;
            state = "backflip_start";
        }
    }

    //randomly choose between moving and not moving toward the player
    if(chance <= 6) && (chance >= 1)
    {
        with(obj_player) other.input_dir = sign(x - other.x) + round(random_range(-1, 1));
    }

    // if(chance == 1) && (obj_player.facing == -sign(facing)) && (state == "normal") && (can_dodge)
    // {
    //     timer0 = 0
    //     image_index = 0
    //     state = "backflip_start"
    // }

    // if(chance == 2) && (obj_player.facing == -sign(facing)) && (state == "normal") && (can_dodge)
    // {
    //     flip_counter = 0
    //     timer0 = 0
    //     image_index = 0
    //     state = "backflip_x3"
    // }
}

//dinder into a backflip and then explode when player dies (lol, lmao)
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
