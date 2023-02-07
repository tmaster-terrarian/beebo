event_inherited();

if(place_meeting(x, y, obj_player))
{
    with(oCamera)
    {
        xTo = other.target_x + other.xstart;
        yTo = other.target_y + other.ystart;
    }
}
