event_inherited()

if(place_meeting(x, y, obj_player))
{
    with(oCamera)
    {
        if(other.axis == "x")
        {
            xTo = other.target_x + other.xstart
            yTo = clamp(yTo, other.y_min + other.ystart, other.y_max + other.ystart)
        }
        if(other.axis == "y")
        {
            yTo = other.target_y + other.ystart
            xTo = clamp(xTo, other.x_min + other.xstart, other.x_max + other.xstart)
        }
    }
}
