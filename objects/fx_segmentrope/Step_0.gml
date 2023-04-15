// update segment transforms
for(var i = 0; i < seg_count; i++)
{
    if(i == 0)
    {
        segments[i].angle = approach(segments[i].angle, point_direction(0, 0, -hsp, -vsp + grv) / seg_count, seg_weight)
        segments[i]._x = lengthdir_x(segments[i].length, segments[i].angle) + x
        segments[i]._y = lengthdir_y(segments[i].length, segments[i].angle) + y
    }
    else
    {
        segments[i].angle = approach(segments[i].angle, segments[i - 1].angle + point_direction(0, 0, -hsp, -vsp + grv) / seg_count, seg_weight)
        segments[i]._x = lengthdir_x(segments[i].length, segments[i].angle) + segments[i - 1]._x
        segments[i]._y = lengthdir_y(segments[i].length, segments[i].angle) + segments[i - 1]._y
    }
}
