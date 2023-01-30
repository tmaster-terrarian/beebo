if(global.console) return;

running = (sprite_index == sPlayerR) || (sprite_index == spr_player_run1) || (sprite_index == spr_anime_run) || (sprite_index == spr_player_run_rev0) || (sprite_index == spr_player_run_rev1) || (sprite_index == spr_anime_run_rev);

//set animation state
if(global.animemode)
{
    anim_state = 2;

    if(instance_exists(oGun))
    {
        oGun.x = x;
        oGun.y = y + 3;
    }
}
else if(!instance_exists(oGun))
{
    anim_state = 1;
}
else
{
    anim_state = 0;

    oGun.x = x;
    oGun.y = y + 2;
}

if(running)
{
    switch(floor(image_index))
    {
        case 0: gun_offs_x = -2 * sign(facing); gun_offs_y = 2; break;
        case 1: gun_offs_x = -2 * sign(facing); gun_offs_y = 3; break;
        case 2: gun_offs_x = -2 * sign(facing); gun_offs_y = 3; break;
        case 3: gun_offs_x = -2 * sign(facing); gun_offs_y = 2; break;
        case 4: gun_offs_x = -2 * sign(facing); gun_offs_y = 2; break;
        case 5: gun_offs_x = -2 * sign(facing); gun_offs_y = 3; break;
        case 6: gun_offs_x = -2 * sign(facing); gun_offs_y = 3; break;
        case 7: gun_offs_x = -2 * sign(facing); gun_offs_y = 2; break;
    }
}
else if(sprite_index == sPlayer || sprite_index == spr_player1)
{
    switch(floor(image_index))
    {
        case 0: gun_offs_x = -3 * sign(facing); gun_offs_y = 2; break;
        case 1: gun_offs_x = -3 * sign(facing); gun_offs_y = 2; break;
        case 2: gun_offs_x = -3 * sign(facing); gun_offs_y = 2; break;
        case 3: gun_offs_x = -3 * sign(facing); gun_offs_y = 1; break;
        case 4: gun_offs_x = -3 * sign(facing); gun_offs_y = 1; break;
        case 5: gun_offs_x = -3 * sign(facing); gun_offs_y = 1; break;
    }
}
else if(state == "wallslide")
{
    gun_offs_x = -3 * sign(facing);
    gun_offs_y = 4;
}
else
{
    gun_offs_x = -3 * sign(facing);
    gun_offs_y = 2;
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
                    {
                        if(sign(hsp) != sign(facing)) use_anim_state(3, anim_state);
                        else use_anim_state(1, anim_state);
                    }
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
                    {
                        if(sign(hsp) != sign(facing)) use_anim_state(3, anim_state);
                        else use_anim_state(1, anim_state);
                    }
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
                // facing = pointing;
                hsp = approach(hsp, 0, fric * 2)
                if (abs(hsp) < 2)
                {
                    if run
                        run--
                }
                if (abs(hsp) < 0.5 && on_ground && !landTimer)
                {
                    use_anim_state(2, anim_state);
                    image_index += 0.2;
                }
            }
            if (!on_ground)
            {
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
                wallslideTimer = 0
            if (running)
                image_index += hsp / 6
            landTimer = approach(landTimer, 0, 1)
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

    if (keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1))
    {
        if(on_ground)
        {
            if(place_meeting(x, (y + 2), oPlatform)) && (keyboard_check(ord("S")) || (gamepad_axis_value(0, gp_axislv) > 0) || gamepad_button_check(0, gp_padd))
            {
                sprite_index = spr_player_jump
                y += 2
                image_index = 2
            }
            else
            {
                // c = collision_point(x, (y + 2), obj_moving_platform, 1, 1)
                // if c
                // {
                //     hsp += c.hsp
                //     if (c.vsp < 0)
                //         vsp = c.vsp
                // }
                vsp += jump_speed
                audio_play_sound(sn_jump, 0, false)
            }
        }
        else
        {
            if place_meeting((x + 2), y, oWall)
            {
                state = "normal"
                hsp = -2
                vsp = -2.5
                facing = -1
                audio_play_sound(sn_throw, 0, false)
            }
            if place_meeting((x - 2), y, oWall)
            {
                state = "normal"
                hsp = 2
                vsp = -2.5
                facing = 1
                audio_play_sound(sn_throw, 0, false)
            }
        }
    }
    if(keyboard_check(ord("W")) || gamepad_button_check(0, gp_padu))
    {
        use_anim_state(4, anim_state);
    }
}
invuln = max(0, invuln - 1);

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
    input_dir = 0;
    hsp = 0;
    use_anim_state(2, anim_state);
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
