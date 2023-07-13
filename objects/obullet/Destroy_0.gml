if position_meeting(x, y, obj_wall)
{
    while(position_meeting(x, y, obj_wall))
    {
        x -= lengthdir_x(1, direction)
        y -= lengthdir_y(1, direction)
    }
}

var xx = x + random_range(-u, u)
var yy = y + random_range(-v, v)

instance_create_depth(xx, yy, other.depth - 4, fx_spark)
