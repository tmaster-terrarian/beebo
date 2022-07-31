//get inputs
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

//move input logic
var move = key_right - key_left;

hsp = move * walksp;

vsp += grv;
if (vsp > 5) vsp = 5;

coyotetime -= 1;
if ((place_meeting(x, y + 1, oWall)) || ((coyotetime <= 5) && (coyotetime >= 0))) && (key_jump)
{
    vsp = -2.5;
}

//move and collisions
//horizontal
if (place_meeting(x + hsp, y, oWall))
{
    while (!place_meeting(x + sign(hsp), y, oWall))
    {
        x += sign(hsp);
    }
    if (!place_meeting(x + sign(hsp), y - 4, oWall)) //edge detection (for top of platform)
    {
        //for (i=0; i < 4; i++)
        //{
            y -= 2;
            x += sign(hsp);
            if(!place_meeting(x + sign(hsp), y, oWall))
            {
                x += sign(hsp);
                //break;
            }
        //}
    }
    hsp = 0;
}
x += hsp;

//vertical
if (place_meeting(x, y + vsp, oWall))
{
    while (!place_meeting(x, y + sign(vsp), oWall))
    {
        y += sign(vsp);
    }
    coyotetime = 5;
    vsp = 0;
}
y += vsp;

//animation
if(!place_meeting(x, y + 1, oWall))
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
