v_counter += spd
var v = round(v_counter)
v_counter -= v

var collide = 0
repeat(abs(v))
{
    if(place_meeting(x + lengthdir_x(v, dir), y + lengthdir_y(v, dir), obj_wall))
    {
        collide = 1
        break
    }
    else
    {
        x += lengthdir_x(v, dir)
        y += lengthdir_y(v, dir)
    }
}
if(collide)
    instance_destroy()
