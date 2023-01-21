event_inherited();

if(!touched)
{
    old_follow = oCamera.follow;
}
if(place_meeting(x, y, obj_player))
{
    touched = 1;
    with(oCamera)
    {
        follow = noone;
        xTo = other.target_x + other.xstart;
        yTo = other.target_y + other.ystart;
    }
}
else
{
    touched = 0;
    with(oCamera)
    {
        follow = other.old_follow;
    }
}
