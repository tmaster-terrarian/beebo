if(global.console) return;

if(sprite_index == spr_player || sprite_index == spr_player_lookup)
    image_index += 0.2

running = (sprite_index == spr_player_run) || (sprite_index == spr_anime_run) || (sprite_index == spr_player_run_rev) || (sprite_index == spr_anime_run_rev);

if(running)
{
    switch(floor(image_index))
    {
        case 0: gun_offs_x = -3 * sign(facing); gun_offs_y = -6; break;
        case 1: gun_offs_x = -3 * sign(facing); gun_offs_y = -5; break;
        case 2: gun_offs_x = -3 * sign(facing); gun_offs_y = -5; break;
        case 3: gun_offs_x = -3 * sign(facing); gun_offs_y = -6; break;
        case 4: gun_offs_x = -3 * sign(facing); gun_offs_y = -6; break;
        case 5: gun_offs_x = -3 * sign(facing); gun_offs_y = -5; break;
        case 6: gun_offs_x = -3 * sign(facing); gun_offs_y = -5; break;
        case 7: gun_offs_x = -3 * sign(facing); gun_offs_y = -6; break;
    }
}
else if(sprite_index == spr_player_crawl)
{
    switch(floor(image_index))
    {
        case 0: gun_offs_x = -2 * sign(facing); gun_offs_y = -2; break;
        case 1: gun_offs_x = -2 * sign(facing); gun_offs_y = -1; break;
        case 2: gun_offs_x = -2 * sign(facing); gun_offs_y = -0; break;
        case 3: gun_offs_x = -2 * sign(facing); gun_offs_y = -0; break;
        case 4: gun_offs_x = -2 * sign(facing); gun_offs_y = -0; break;
        case 5: gun_offs_x = -2 * sign(facing); gun_offs_y = -1; break;
        case 6: gun_offs_x = -2 * sign(facing); gun_offs_y = -2; break;
        case 7: gun_offs_x = -2 * sign(facing); gun_offs_y = -2; break;
    }
}
else if(sprite_index == spr_player || sprite_index == spr_player_lookup)
{
    switch(floor(image_index))
    {
        case 0: gun_offs_x = -3 * sign(facing); gun_offs_y = -6; break;
        case 1: gun_offs_x = -3 * sign(facing); gun_offs_y = -6; break;
        case 2: gun_offs_x = -3 * sign(facing); gun_offs_y = -6; break;
        case 3: gun_offs_x = -3 * sign(facing); gun_offs_y = -7; break;
        case 4: gun_offs_x = -3 * sign(facing); gun_offs_y = -7; break;
        case 5: gun_offs_x = -3 * sign(facing); gun_offs_y = -7; break;
    }
}
else if(state == "wallslide")
{
    gun_offs_x = 3 * sign(facing);
    gun_offs_y = -7;
}
else if(duck)
{
    gun_offs_x = (-3 + (1/3 * duck)) * sign(facing);
    gun_offs_y = -5 + duck;
}
else
{
    gun_offs_x = -3 * sign(facing);
    gun_offs_y = -7;
}

//set animation state
if(global.animemode)
{
    anim_state = 2;

    if(instance_exists(oGun))
    {
        oGun.x = x;
        oGun.y = y - 5;
    }
}
else
{
    anim_state = 0;

    if(instance_exists(oGun))
    {
        oGun.x = x + gun_offs_x;
        oGun.y = y + gun_offs_y;
    }
}

if(place_meeting(x, y, oWall)) y--;

hsp = clamp(hsp, -20, 20);

var input_dir = 0;
input_dir = sign
(
    gamepad_axis_value(0, gp_axislh)
    + (gamepad_button_check(0, gp_padr) - gamepad_button_check(0, gp_padl))
    + (keyboard_check(ord("D")) - keyboard_check(ord("A")))
);

if(!on_ground)
    duck = 0
walksp = 2;
if(duck)
{
    walksp = 1
    if(abs(hsp) > 1)
        hsp = approach(hsp, 1 * input_dir, 0.25)
}

image_xscale = sign(facing);
if(hascontrol)
{
    if(on_ground)
    {
        accel = ground_accel;
        fric = ground_fric;
    }
    else
    {
        accel = air_accel;
        fric = air_fric;
        if(abs(hsp) > 3)
            fric = 0.005
    }

    switch(state)
    {
        case "stunned":
        {
            lookup = 0
            can_attack = 0
            can_jump = 0
            can_dodge = 0
            input_dir = 0
            hsp = approach(hsp, 0, fric)
            if(!on_ground)
                vsp = approach(vsp, vsp_max, grv)
            if(invuln <= 0) || on_ground
                state = "normal"
            break
        }
        case "normal":
        {
            lookup = 0
            can_attack = 1
            can_jump = 1
            if (duck > 1)
                mask_index = mask_player_duck
            else
                mask_index = mask_player
            if (input_dir == 1)
            {
                if (hsp < 0)
                {
                    hsp = approach(hsp, 0, fric)
                }
                else if (on_ground && vsp >= 0)
                {
                    if (duck == 0 && !landTimer)
                    {
                        if(sign(hsp) != sign(facing)) use_anim_state(3, anim_state);
                        else use_anim_state(1, anim_state);
                    }
                    else if(duck)
                    {
                        sprite_index = spr_player_crawl;
                    }
                }
                if(abs(hsp) > 3)
                    run = 7
                else
                    run = 0
                if (hsp < walksp)
                    hsp = approach(hsp, walksp, accel)
                if on_ground
                {
                    running = 1
                    facing = 1
                }
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
                    if (duck == 0 && !landTimer)
                    {
                        if(sign(hsp) != sign(facing)) use_anim_state(3, anim_state);
                        else use_anim_state(1, anim_state);
                    }
                    else if(duck)
                    {
                        sprite_index = spr_player_crawl;
                    }
                }
                if(abs(hsp) > 3)
                    run = 7
                else
                    run = 0
                if (hsp > -walksp)
                    hsp = approach(hsp, -walksp, accel)
                if on_ground
                {
                    running = 1
                    facing = -1
                }
                else
                    facing = approach(facing, -1, 0.2)
            }
            else
            {
                running = 0
                hsp = approach(hsp, lasthsp, fric * 2)
                if (abs(hsp) < 2)
                {
                    if run
                        run--
                }
                if (abs(hsp) < 0.5 && on_ground && !landTimer)
                {
                    up = (keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu))
                    use_anim_state(2, anim_state)
                    if duck
                    {
                        sprite_index = spr_player_duck
                        image_index = duck
                        lookup = -0.5;
                    }
                    else if up
                    {
                        sprite_index = spr_player_lookup
                        lookup = 1;
                    }
                    else
                    {
                        lookup = 0;
                    }
                }
            }
            if ((keyboard_check(ord("S")) || gamepad_axis_value(0, gp_axislv) > 0 || gamepad_button_check(0, gp_padd)) && on_ground)
                duck = approach(duck, 3, 1)
            else if (!(place_meeting(x, (y - 8), oWall)))
                duck = approach(duck, 0, 1)
            if (!on_ground)
            {
                lookup = 0;

                if (vsp >= -0.5)
                {
                    if place_meeting((x + (2 * input_dir)), y, oWall)
                        wallslideTimer++
                }
                else
                    wallslideTimer = 0
                if (wallslideTimer >= 5)
                    state = "wallslide"

                jump_buffer = max(jump_buffer - 1, 0);
                jump_buffer2 = max(jump_buffer2 - 1, 0);

                sprite_index = spr_player_jump
                if (vsp >= 0.1)
                    vsp = approach(vsp, vsp_max, grv)
                if (vsp < 0)
                    vsp = approach(vsp, vsp_max, grv)
                else if (vsp < 2)
                    vsp = approach(vsp, vsp_max, grv * 0.25)
                if (vsp < 0)
                    image_index = approach(image_index, 1, 0.2)
                else if (vsp >= 0.5)
                    image_index = approach(image_index, 5, 0.5)
                else
                    image_index = 3
            }
            else
            {
                wallslideTimer = 0
                lasthsp = 0
                lastvsp = 0
            }
            if (running)
                image_index += abs(hsp / 6)
            else if (duck)
                image_index += abs(hsp / 4)
            landTimer = approach(landTimer, 0, 1)

            if(abs(hsp) > 3)
            {
                fxtrail = 1;
            }
            else fxtrail = 0;
            break;
        }
        case "wallslide":
        {
            if (vsp < 0)
                vsp = approach(vsp, vsp_max, 0.5);
            else
                vsp = approach(vsp, vsp_max / 3, grv / 3);
            if (!(place_meeting(x + (input_dir * 2), y, oWall)))
            {
                state = "normal";
                wallslideTimer = 0;
            }
            sprite_index = spr_player_wallslide;
            var n = choose(0, 1, 0);
            if n
                with (instance_create_depth(x + 4 * sign(facing), random_range(bbox_bottom - 12, bbox_bottom), depth - 1, fx_dust))
                {
                    vz = 0;
                    sprite_index = spr_fx_dust2
                }
            if (input_dir == 0 || on_ground)
            {
                state = "normal";
                wallslideTimer = 0;
            }
            if (sign(input_dir) == -sign(facing))
            {
                state = "normal";
                wallslideTimer = 0;
                facing = sign(input_dir);
            }
            vsp = clamp(vsp, -99, 2);
            break;
        }
    }

    if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1)) && can_jump
    {
        if(on_ground)
        {
            if(!duck)
            {
                state = "normal"
                image_index = 0
                sprite_index = spr_player_jump
                var c = collision_point(x, (y + 2), obj_moving_platform, 1, 1)
                if c
                {
                    lasthsp = c.hsp
                    lastvsp = c.vsp
                    hsp += c.hsp
                    if(c.vsp < 0)
                        vsp = c.vsp
                }
                vsp += jump_speed
                audio_play_sound(sn_jump, 0, false)
            }
            else if(place_meeting(x, (y + 2), oPlatform)) && (keyboard_check(ord("S")) || (gamepad_axis_value(0, gp_axislv) > 0) || gamepad_button_check(0, gp_padd))
            {
                sprite_index = spr_player_jump
                y += 2
                image_index = 2
                platformTarget = noone
            }
            else
            {
                c = collision_point(x, (y + 2), obj_moving_platform, 1, 1)
                if c
                {
                    lasthsp = c.hsp
                    lastvsp = c.vsp
                    hsp += c.hsp
                    if(c.vsp < 0)
                        vsp = c.vsp
                }
                vsp += jump_speed / 2
                audio_play_sound(sn_jump, 0, false)
            }
        }
        else
        {
            if place_meeting((x + 2), y, oWall)
            {
                state = "normal"
                hsp = -2
                vsp = -3.2
                facing = -1
                audio_play_sound(sn_walljump, 0, false)
            }
            if place_meeting((x - 2), y, oWall)
            {
                state = "normal"
                hsp = 2
                vsp = -3.2
                facing = 1
                audio_play_sound(sn_walljump, 0, false)
            }
        }
    }
}

if fxtrail && !global.cutscene
    trailTimer++
else
    trailTimer = 0
if ((trailTimer % 4) == 1)
{
    with (instance_create_depth(x, y, (depth + 2), fx_aura))
    {
        visible = true
        image_speed = 0
        image_index = other.image_index
        sprite_index = other.sprite_index
        image_xscale = other.image_xscale
        image_yscale = other.image_yscale
    }
}

if place_meeting(x, y + 2, oWall)
{
    var footsound = choose(sn_stepgrass1, sn_stepgrass2, sn_stepgrass3)
    if(running && (ceil(image_index) == 5 || ceil(image_index) == 1))
    {
        if (!audio_is_playing(footsound))
            audio_play_sound(footsound, 8, false)
    }
    if(running && run && abs(hsp) >= 2 && ceil(image_index) % 2 == 0)
    {
        with(instance_create_depth(x, bbox_bottom, (depth - 10), fx_dust))
        {
            sprite_index = spr_fx_dust2;
            vx = random_range(-0.1, 0.1);
            vy = random_range(-0.5, -0.1);
            vz = 0;
        }
    }
}

if(hp > hp_max) hp = hp_max;

if(!global.introsequence)
{
    if(invuln > 0 && !global.cutscene) image_alpha = 0.6;
    else image_alpha = 1;

    invuln = max(0, invuln - 1);

    if(!hascontrol) image_alpha = 1;
}

if(y > room_height + 200)
{
    hp = 0;
}

if(!hascontrol)
{
    input_dir = 0
    if(!on_ground)
        vsp = approach(vsp, vsp_max, grv)
}

enemy_enabler_counter = max(0, enemy_enabler_counter - 1);
if(enemy_enabler_counter == 0)
{
    enemy_enabler_counter = 2;
    var _vx = camera_get_view_x(view_camera[0]);
    var _vy = camera_get_view_y(view_camera[0]);
    var _vw = camera_get_view_width(view_camera[0]);
    var _vh = camera_get_view_height(view_camera[0]);
    instance_activate_region(_vx - 16, _vy - 16, _vw + 16, _vh + 16, true);
}
