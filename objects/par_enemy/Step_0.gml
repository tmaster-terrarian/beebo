image_xscale = facing

if(hp < hp_max)
    drawhp = 1

if(y > room_height + 48)
    hp = 0

if(hp <= 0) && !ded
{
    ded = 1
    event_perform(ev_other, ev_user2)
}

if(!place_meeting(x, y + 2, obj_wall))
    vsp = approach(vsp, 99, grv)
