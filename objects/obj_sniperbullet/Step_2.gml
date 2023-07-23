v_counter += spd
var v = round(v_counter)
v_counter -= v

var collide = 0
var vx = lengthdir_x(v, dir)
var vy = lengthdir_y(v, dir)
var c = noone
repeat(abs(v))
{
    if(place_meeting(x + vx, y + vy, par_unit))
    {
        c = instance_place(x + vx, y + vy, par_unit)
        if(c && c != parent && c.bulletproof && _team == team.player)
        {
            instance_destroy()
            return
        }
        else if(c && c != parent)
        {
            if(_team != c._team)
            {
                c.hsp += lengthdir_x(-2, direction)
                c.vsp += lengthdir_y(-2, direction)

                damage_event(parent, c, proctype.onhit, damage, proc)

                instance_destroy()
                return
            }
        }
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
