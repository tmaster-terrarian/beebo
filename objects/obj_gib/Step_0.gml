if(place_meeting(x, y + 1, oWall))
{
    hsp = approach(hsp, 0, fric)
}
if(!checkBelow())
{
    vsp = approach(vsp, 20, grv)
}
if(rotate_with_speed)
    image_angle += abs(vsp) * sign(hsp)
if(destroy_on_timer && timer == 0)
    scr_disintrigrate()
if(timer)
    timer--