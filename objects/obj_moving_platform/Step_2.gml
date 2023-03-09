visible = true
if move
{
    var xp = path_get_x(path, path_pos)
    var yp = path_get_y(path, path_pos)
    path_pos += (1 / (path_get_length(path) / (path_sp * path_dir)))
    if reverse
    {
        if (path_pos >= 1)
        {
            path_pos = 1
            path_dir = -1
        }
        else if (path_pos <= 0)
        {
            path_pos = 0
            path_dir = 1
        }
    }
    else if go_once
    {
        if (path_pos >= 1)
        {
            path_pos = 1
            move = 0
            xp = path_get_x(path, 1)
            yp = path_get_y(path, 1)
        }
    }
    else if (path_pos >= 1)
        path_pos = 0
    hsp = lengthdir_x(point_distance(xp, yp, path_get_x(path, path_pos), path_get_y(path, path_pos)), point_direction(xp, yp, path_get_x(path, path_pos), path_get_y(path, path_pos)))
    vsp = lengthdir_y(point_distance(xp, yp, path_get_x(path, path_pos), path_get_y(path, path_pos)), point_direction(xp, yp, path_get_x(path, path_pos), path_get_y(path, path_pos)))
    if(move == 0)
    {
        hsp = 0
        vsp = 0
    }
}
else
{
    hsp = 0
    vsp = 0
}

cx += hsp
cy += vsp
var vxNew = round(cx)
var vyNew = round(cy)
cx -= vxNew
cy -= vyNew
repeat abs(vyNew)
{
    if(abs(vsp) < 0.01)
        break
    with (obj_moveable)
    {
        if place_meeting(x, y + 1, other.id)
            y += sign(vyNew)
    }
    with (oCrate)
    {
        if place_meeting(x, y + 1, other.id)
        {
            //y += sign(vyNew)
        }
    }
    y += sign(vyNew)
}
repeat abs(vxNew)
{
    if(abs(hsp) < 0.01)
        break
    with (obj_moveable)
    {
        if place_meeting(x, y + 1, other.id) && !place_meeting(x + sign(vxNew), y, obj_wall)
            x += sign(vxNew)
        if place_meeting(x - sign(vxNew), y, other.id)
            x += sign(vxNew)

        if(platformTarget != other.id)
            platformTarget = instance_place(x, y + 1, other.id)
    }
    with (oCrate)
    {
        if place_meeting(x, y + 1, other.id)
        {
            //x += sign(vxNew)
        }
    }
    x += sign(vxNew)
}
