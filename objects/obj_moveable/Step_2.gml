h_counter += hsp
v_counter += vsp
var h = round(h_counter)
var v = round(v_counter)
h_counter -= h
v_counter -= v
var collide = 0
var slope = 0
repeat abs(h)
{
    if collides
    {
        if place_meeting((x + sign(h)), y, obj_wall)
        {
            if (!(place_meeting((x + sign(h)), (y - 1), obj_wall)))
            {
                y -= 1
                x += sign(h)
                slope = 1
                if (abs(h) - 1)
                    continue
            }
            else
                collide = 1
            break
        }
        else
        {
            if on_ground
            {
                if ((!(place_meeting((x + sign(h)), (y + 1), obj_wall))) && place_meeting((x + sign(h)), (y + 2), obj_wall))
                    y += 1
            }
            x += sign(h)
        }
    }
    else x += sign(h)
}
if collide
    event_perform(ev_other, ev_user0)
if slope
    hsp = approach(hsp, 0, S_SLOPE_SLOW)
collide = 0
repeat abs(v)
{
    if collides
    {
        if (vsp <= 0)
        {
            if place_meeting(x, (y + sign(v)), obj_wall)
                collide = 1
            else
            {
                y += sign(v)
                if (abs(v) - 1)
                    continue
            }
            break
        }
        else if checkBelow()
            collide = 1
        else
            y += sign(v)
    }
    else y += sign(v)
}
if collide
    event_perform(ev_other, ev_user1)
