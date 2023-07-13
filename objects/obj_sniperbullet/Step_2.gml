v_counter += spd
var v = round(v_counter)
v_counter -= v

var collide = 0
var vx = lengthdir_x(v, dir)
var vy = lengthdir_y(v, dir)
repeat(abs(v))
{
    if(place_meeting(x + vx, y + vy, par_unit))
    {
        with(instance_place(x, y, par_unit))
            event_perform(ev_collision, par_unit)
        return
    }
    else if(place_meeting(x + vx, y + vy, obj_wall))
    {
        instance_destroy()
    }
    else
    {
        x += vx
        y += vy
    }
}
