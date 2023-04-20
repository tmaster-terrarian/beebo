p += s
f++

var px = lengthdir_x(sin(a * p) * dis * u, dir - 90)
var py = lengthdir_y(sin(a * p) * dis * u, dir - 90)
var px2 = lengthdir_x(sin(a * (p + s)) * dis * u, dir - 90)
var py2 = lengthdir_y(sin(a * (p + s)) * dis * u, dir - 90)

image_angle = point_direction(px, py, lengthdir_x(s, dir) + px2, lengthdir_y(s, dir) + py2)

x = xstart + lengthdir_x(p, dir) + px
y = ystart + lengthdir_y(p, dir) + py

if p > 1/dd
{
    dis += 0.2 * s
    d += 0.1 * s
    a = 1/d * pi
    s += 0.05
}

if p > 128
    image_alpha = approach(image_alpha, 0, 1/30)
if image_alpha == 0
    instance_destroy()

if (f % 4 == 1)
{
    with (instance_create_depth(x, y, (depth + 101), fx_aura))
    {
        visible = true
        image_speed = 0
        sprite_index = other.sprite_index
        image_index = other.image_index
        image_angle = other.image_angle
        image_alpha = other.image_alpha
        with(obj_player)
        {
            if(state == "grind")
                hspeed = -6
        }
    }
}
