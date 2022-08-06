//get inputs

if(hascontrol)
{
    key_left = keyboard_check(ord("A"));
    key_right = keyboard_check(ord("D"));
    key_jump = keyboard_check_pressed(vk_space);
}
else
{
    key_left = 0;
    key_right = 0;
    key_jump = 0;
}

//move input logic

var move = key_right - key_left;

hsp = move * walksp;

vsp += grv;
vsp = clamp(vsp, -10, 5);

coyotetime -= 1;
if ((place_meeting(x, y + 1, oWall) || place_meeting(x, y + 1, oCrate) || place_meeting(x, y + 1, oPlatform)) || ((coyotetime <= 5) && (coyotetime >= 0))) && (key_jump)
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
        //if (!place_meeting(x + sign(hsp), y - 4, obj)) //nudge
        //{
        //    y -= 2;
        //    x += sign(hsp);
        //    if(!place_meeting(x + sign(hsp), y, obj))
        //    {
        //        x += sign(hsp);
        //    }
        //}
        hsp = 0;
    }
}

//horizontal
if(!keyboard_check(vk_lcontrol))
{
    collisionH(oWall);
    collisionH(oCrate);
}
//if (place_meeting(x + hsp, y, oWall))
//{
//    while (!place_meeting(x + sign(hsp), y, oWall))
//    {
//        x += sign(hsp);
//    }
//    if (!place_meeting(x + sign(hsp), y - 4, oWall)) //nudge
//    {
//        y -= 2;
//        x += sign(hsp);
//        if(!place_meeting(x + sign(hsp), y, oWall))
//        {
//            x += sign(hsp);
//        }
//    }
//    hsp = 0;
//}
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
notTouching = function(obj)
{
    if(!place_meeting(x, y + 1, obj)) return true;
    else return false;
}

if(notTouching(oWall) && notTouching(oCrate) && notTouching(oPlatform))
{
    sprite_index = sPlayerA;
    image_speed = 0;
    if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
    image_speed = 1;
    if (hsp == 0)
    {
        sprite_index = sPlayer;
    }
    else
    {
        sprite_index = sPlayerR;
    }
}
if(hsp != 0) image_xscale = sign(hsp);

if(x > room_width + 32) || (x < -32) || (y > room_height + 32) || (y < -32)
{
    x = xstart;
    y = ystart;
}
