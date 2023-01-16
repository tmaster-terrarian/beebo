event_inherited();
if(place_meeting(x, y, obj_player))
{
    with(oCamera)
    {
        follow = noone;
        xTo = other.target_x + other.xstart;
        yTo = other.target_y + other.ystart;
    }
}
else
{
    with(oCamera)
    {
        follow = obj_player;
    }
}
