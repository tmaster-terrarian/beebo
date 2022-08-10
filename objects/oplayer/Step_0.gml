//animation
if(!instance_exists(oGun))
{
    anim_state = 1;
}
else anim_state = 0;

use_anim_state = function(anim_id, state)
{
    switch(anim_id)
    {
        case 0:
            switch(state)
            {
                case 0: default: sprite_index = sPlayerA; break;
                case 1: sprite_index = spr_player_air1; break;
            }
        break;
        case 1:
            switch(state)
            {
                case 0: default: sprite_index = sPlayerR; break;
                case 1: sprite_index = spr_player_run1; break;
            }
        break;
        case 2: default:
            switch(state)
            {
                case 0: default: sprite_index = sPlayer; break;
                case 1: sprite_index = spr_player1; break;
            }
        break;
    }
}

if(place_meeting(x, y, oWall)) y--;

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
    if(keyboard_check(ord("D")))
    {
        if (hsp < 0)
        {
            hsp = approach(hsp, 0, fric);
        }
        if(hsp < walksp) hsp = approach(hsp, walksp, 0.1);
        if(on_ground && !attack) use_anim_state(1, anim_state);
        facing = 1;
    }
    else if(keyboard_check(ord("A")))
    {
        if (hsp > 0)
        {
            hsp = approach(hsp, 0, fric);
        }
        if(hsp > -walksp) hsp = approach(hsp, -walksp, 0.1);
        if(on_ground) && (!attack) use_anim_state(1, anim_state);
        facing = -1;
    }
    else
    {
        hsp = approach(hsp, 0, fric);
        if(hsp == 0 && !attack) use_anim_state(2, anim_state);
    }
    if(on_ground)
    {
        if(keyboard_check_pressed(vk_space))
        {
            if (place_meeting(x, y + 1, oPlatform)) && (keyboard_check(ord("S")))
            {
                y += 1;
            }
            else
            {
                audio_play_sound(sn_jump, 1, false);
                vsp = -2.51;
            }
        }
    }
    else
    {
        if(keyboard_check_pressed(vk_space))
        {
            if(place_meeting(x + 3, y, oWall))
            {
                facing = -1;
                hsp = 1.5 * facing;
                vsp = -2.51;
                audio_play_sound(sn_jump, 1, false);
            }
            if(place_meeting(x - 3, y, oWall))
            {
                facing = 1;
                hsp = 1.5 * facing;
                vsp = -2.51;
                audio_play_sound(sn_jump, 1, false);
            }
        }
        //if(keyboard_check_released(vk_space))
        //    vsp /= 2;
        if(vsp > 0)
        {
            if(!attack) sprite_index = spr_player_fall;
        }
        if(vsp < 0)
        {
            if(!attack) sprite_index = spr_player_jump;
        }
    }
}
if (!on_ground)
    vsp = approach(vsp, 20, grv);
else vsp = clamp(vsp, -20, 0);

x = floor(x)
y = floor(y)

//iframes
iframes = max(0, iframes - 1);

//coyotetime -= 1;
//if ((place_meeting(x, y + 1, oWall) || place_meeting(x, y + 1, oPlatform)) || ((coyotetime <= 5) && (coyotetime >= 0))) && (key_jump) && (vsp > 0)
//{
//    audio_play_sound(sn_jump, 1, false);
//    vsp = -2.5;
//}

//move and collisions
//functions
collisionV = function(obj)
{
    if (place_meeting(x, y + vsp, obj))
    {
        while (!place_meeting(x, y + sign(vsp), obj))
        {
            y += sign(vsp);
        }
        coyotetime = 8;
        vsp = 0;
    }
}
collisionH = function(obj)
{
    if (place_meeting(x + hsp, y, obj))
    {
        while (!place_meeting(x + sign(hsp), y, obj))
        {
            x += sign(hsp);
        }
        if (!place_meeting(x + sign(hsp), y - 4, obj)) //nudge
        {
            y -= 2;
            x += sign(hsp);
            if(!place_meeting(x + sign(hsp), y, obj))
            {
                x += sign(hsp);
            }
        }
        hsp = 0;
    }
}

//horizontal
if(!keyboard_check(vk_lcontrol))
{
//    collisionH(oWall);
}
//x += hsp;

//vertical
if(!keyboard_check(vk_lcontrol))
{
//    collisionV(oWall);
//    if (sign(vsp) > 0) && (!keyboard_check(ord("S"))) { collisionV(oPlatform); }
//    if (place_meeting(x, y, oPlatform))
//    {
//        y -= 1;
//    }
}
//y += vsp;

if(y > room_height + 200)
{
    hp = 0;
}

var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
instance_activate_region(_vx - 16, _vy - 16, _vw + 16, _vh + 16, true);
