vsp += grv;

//move and collisions
//horizontal
if(place_meeting(x + sign(hsp), y, obj_wall))
{
    if(!place_meeting(x + sign(hsp), y - 4, obj_wall))
    {
        for(var i = 0; i < 4; i++)
        {
            y -= 1;
            if(!place_meeting(x + sign(hsp), y, obj_wall))
            {
                x += sign(hsp);
                break;
            }
        }
    }
}

if (place_meeting(x + hsp, y, obj_wall))
{
    while (!place_meeting(x + sign(hsp), y, obj_wall))
    {
        x += sign(hsp);
    }
    hsp = -hsp;
}
x += hsp;

//vertical
if (place_meeting(x, y + vsp, obj_wall))
{
    while (!place_meeting(x, y + sign(vsp), obj_wall))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

if (!place_meeting(x + sign(hsp), y + 5, obj_wall))
{
    hsp = -hsp;
}

//animation
if (!place_meeting(x, y + 1, obj_wall))
{
    sprite_index = sRoboA;
    image_speed = 0;
    if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
    image_speed = 1;
    if (hsp == 0)
    {
        sprite_index = sRobo;
    }
    else
    {
        sprite_index = sRoboR;
    }
}

if(hsp != 0)
{
	image_xscale = sign(hsp) * size;
	facing = sign(hsp);
}
image_yscale *= size;
