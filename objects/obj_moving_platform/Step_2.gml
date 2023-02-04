var n = nodes[_n]

if cld
    cld--

if(abs(x - n.x) < sp) && (abs(y - n.y) < sp) && (cld <= 0)
{
    cld = sp * 2
    _n++

    if(_n == array_length(nodes))
        _n = 0

    n = nodes[_n]

    
}

hsp = lengthdir_x(sp, point_direction(x, y, n.x, n.y))
vsp = lengthdir_y(sp, point_direction(x, y, n.x, n.y))

cx += hsp
cy += vsp
var vxNew = round(cx)
var vyNew = round(cy)
cx -= vxNew
cy -= vyNew

var bx = sign(vxNew) * sp
var by = sign(vyNew) * sp

with (obj_moveable)
{
    if place_meeting(x, y + 1, other.id)
        y += by
}
y += by

with (obj_moveable)
{
    if place_meeting(x, y + 1, other.id)
        x += bx
    if place_meeting(x + bx, y, other.id)
        x += bx
    if (platformTarget == other.id)
    {
        if (!platformTarget)
        {
            if place_meeting(x, (y + 1), other.id)
                platformTarget = other.id
        }
        if (!place_meeting(x + bx, y, oWall) && platformTarget == other.id)
            x += bx
    }
}
x += bx
