sp = ceil(4 * (pmax/64))

if(dir > 90 && dir < 270)
{
    flip = -1
}
else
{
    flip = 1
}

if(p < pmax)
{
    p += sp

    var _h = -(h / (0.25 * sqr(pmax)) * flip) * p * (p - pmax)
    var _h2 = -(h / (0.25 * sqr(pmax)) * flip) * (p + sp) * ((p + sp) - pmax)

    x = xstart + lengthdir_x(p, dir) + lengthdir_x(_h, dir + 90)
    y = ystart + lengthdir_y(p, dir) + lengthdir_y(_h, dir + 90)

    image_angle = point_direction(x, y, xstart + lengthdir_x(p + sp, dir) + lengthdir_x(_h2, dir + 90), ystart + lengthdir_y(p + sp, dir) + lengthdir_y(_h2, dir + 90))
}
else
{
    if(instance_exists(target))
    {
        x += (target.x - x) / 4
        y += (target.y - y) / 4
    }
    else instance_destroy()
}
