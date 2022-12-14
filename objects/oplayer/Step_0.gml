if(global.console) return;

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
    oGun.y = y + 3;
}

if(sprite_index == sPlayerR) || (sprite_index == spr_player_run1) || (sprite_index == spr_anime_run) || (sprite_index == spr_player_run_rev0) || (sprite_index == spr_player_run_rev1) || (sprite_index == spr_anime_run_rev)
{
    switch(floor(image_index))
    {
        case 0: gun_offs_x = 1 * sign(hsp); gun_offs_y = 3; break;
        case 1: gun_offs_x = 1 * sign(hsp); gun_offs_y = 4; break;
        case 2: gun_offs_x = 1 * sign(hsp); gun_offs_y = 4; break;
        case 3: gun_offs_x = 1 * sign(hsp); gun_offs_y = 3; break;
        case 4: gun_offs_x = 1 * sign(hsp); gun_offs_y = 3; break;
        case 5: gun_offs_x = 1 * sign(hsp); gun_offs_y = 4; break;
        case 6: gun_offs_x = 1 * sign(hsp); gun_offs_y = 4; break;
        case 7: gun_offs_x = 1 * sign(hsp); gun_offs_y = 3; break;
    }
}
else if(sprite_index == spr_player_jump) || (sprite_index == spr_anime_jump)
{
    gun_offs_y = 4;
}
else if(sprite_index == spr_player_fall) || (sprite_index == spr_anime_fall)
{
    gun_offs_y = 3;
}
else
{
    gun_offs_x = 0;
    gun_offs_y = 3;
}

if(place_meeting(x, y, oWall)) y--;

hsp = clamp(hsp, -20, 20);

image_xscale = facing;
if(hascontrol)
{
    if on_ground
    {
        var accel = ground_accel;
        var fric = ground_fric;
    }
    else
    {
        var accel = air_accel;
        var fric = air_fric;
    }
    if(keyboard_check(ord("D"))) || (gamepad_axis_value(0, gp_axislh) > 0) || (gamepad_button_check(0, gp_padr))
    {
        if (hsp < 0)
        {
            hsp = approach(hsp, 0, fric);
        }
        if(hsp < walksp) hsp = approach(hsp, walksp, accel);
        if(on_ground && !attack)
        {
            if(sign(hsp) == facing) use_anim_state(1, anim_state);
            else use_anim_state(3, anim_state);
        }
        facing = 1;
    }
    else if(keyboard_check(ord("A"))) || (gamepad_axis_value(0, gp_axislh) < 0) || (gamepad_button_check(0, gp_padl))
    {
        if (hsp > 0)
        {
            hsp = approach(hsp, 0, fric);
        }
        if(hsp > -walksp) hsp = approach(hsp, -walksp, accel);
        if(on_ground && !attack)
        {
            if(sign(hsp) == facing) use_anim_state(1, anim_state);
            else use_anim_state(3, anim_state);
        }
        facing = -1;
    }
    else
    {
        hsp = approach(hsp, 0, fric * 2);
        if(hsp == 0 && !attack) use_anim_state(2, anim_state);
    }
    jump_buffer = max(jump_buffer - 1, 0);
    jump_buffer2 = max(jump_buffer2 - 1, 0);
    if(on_ground)
    {
        jump_buffer2 = 5;

        if((keyboard_check_pressed(vk_space)) || (gamepad_button_check_pressed(0, gp_face1))) || (jump_buffer > 0)
        {
            jump_buffer = 0;
            if (place_meeting(x, y + 1, oPlatform)) && (!place_meeting(x, y + 1, oWall)) && ((keyboard_check(ord("S"))) || (gamepad_axis_value(0, gp_axislv) > 0))
            {
                y += 1;
            }
            else
            {
                audio_play_sound(sn_jump, 1, false);
                vsp = jump_speed;
            }
        }
    }
    else
    {
        if(keyboard_check_pressed(vk_space)) || (gamepad_button_check_pressed(0, gp_face1))
        {
            jump_buffer = 5;

            if(jump_buffer2 > 0) && (vsp > 0)
            {
                jump_buffer2 = 0;
                audio_play_sound(sn_jump, 1, false);
                vsp = jump_speed;
            }

            if(place_meeting(x + 3, y, oWall))
            {
                facing = -1;
                hsp = 1.5 * facing;
                vsp = jump_speed;
                audio_play_sound(sn_throw, 1, false);
            }
            if(place_meeting(x - 3, y, oWall))
            {
                facing = 1;
                hsp = 1.5 * facing;
                vsp = jump_speed;
                audio_play_sound(sn_throw, 1, false);
            }
        }
        if(vsp < 0)
        {
            if(!attack) {sprite_index = spr_player_jump; if(global.animemode) {sprite_index = spr_anime_jump;}}
        }
        if(vsp > 0)
        {
            if(!attack) {sprite_index = spr_player_fall; if(global.animemode) {sprite_index = spr_anime_fall;}}
        }
    }
}
if (!on_ground)
    vsp = approach(vsp, vsp_max, grv);

x = floor(x);
y = floor(y);

image_speed = 0.3;

if(hp > hp_max) hp = hp_max;

if(!global.introsequence)
{
    if(iframes > 0 && !global.cutscene) image_alpha = 0.6;
    else image_alpha = 1;

    iframes = max(0, iframes - 1);

    if(!hascontrol) image_alpha = 1;
}

if(y > room_height + 200)
{
    hp = 0;
}

if(!hascontrol)
{
    hsp = 0;
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
