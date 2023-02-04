// x += hsp
// y += vsp

if(strt)
{
    strt = 0
    for(var i = 0; i < array_length(_nodes); i++)
    {
        nodes[i] = node_create(xstart + _nodes[i][0], ystart + _nodes[i][1], node_type.def, "pl" + string(id) + "-" + string(i))
    }

    var n = nodes[_n]

    hsp = lengthdir_x(sp, point_direction(x, y, n.x, n.y))
    vsp = lengthdir_y(sp, point_direction(x, y, n.x, n.y))

    cld = 2
}
