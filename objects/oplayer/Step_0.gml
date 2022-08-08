//get inputs

if(hascontrol)
{
    key_left = keyboard_check(ord("A"));
    key_right = keyboard_check(ord("D"));
    key_jump = keyboard_check_pressed(vk_space);
    key_kick = keyboard_check(ord("F"));
}
else
{
    key_left = 0;
    key_right = 0;
    key_jump = 0;
    key_kick = 0;
}

//move input logic

var move = key_right - key_left;

if(iframes > 40) && !((place_meeting(x, y + 1, oWall) || place_meeting(x, y + 1, oCrate) || place_meeting(x, y + 1, oPlatform))) hsp = lengthdir_x(2, hitfrom);
else hsp = move * walksp;

vsp += grv;
vsp = clamp(vsp, -10, 5);

//iframes
iframes = max(0, iframes - 1);

coyotetime -= 1;
if ((place_meeting(x, y + 1, oWall) || place_meeting(x, y + 1, oCrate) || place_meeting(x, y + 1, oPlatform)) || ((coyotetime <= 5) && (coyotetime >= 0))) && (key_jump) && (vsp > 0)
{
    audio_play_sound(sn_jump, 1, false);
    vsp = -2.5;
}

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
        var _hsp = 0;
        _hsp += hsp;
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
    collisionH(oWall);
    collisionH(oCrate);
}
x += hsp;

//vertical
if(!keyboard_check(vk_lcontrol))
{
    collisionV(oWall);
    collisionV(oCrate);
    if (sign(vsp) > 0) && (!keyboard_check(ord("S"))) { collisionV(oPlatform); }
    if (place_meeting(x, y, oPlatform))
    {
        y -= 1;
    }
}
y += vsp;

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

notTouching = function(obj)
{
    if(!place_meeting(x, y + 1, obj)) return true;
    else return false;
}

if(notTouching(oWall) && notTouching(oCrate) && notTouching(oPlatform))
{
    use_anim_state(0, anim_state);
    image_speed = 0;
    if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
    image_speed = 1;
    if (hsp == 0)
    {
        use_anim_state(2, anim_state);
    }
    else
    {
        use_anim_state(1, anim_state);
    }
}
if(hsp != 0) image_xscale = sign(hsp);

if(x > room_width + 32) || (x < -32) || (y > room_height + 32) || (y < -32)
{
    hp = 0;
}
