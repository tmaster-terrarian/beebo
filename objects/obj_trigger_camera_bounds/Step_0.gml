event_inherited();

if(place_meeting(x, y, obj_player))
{
    with(oCamera)
    {
        xTo = clamp(xTo, 0, other.image_xscale * 16) + other.xstart;
        yTo = clamp(yTo, 0, other.image_yscale * 16) + other.ystart;
    }
}
