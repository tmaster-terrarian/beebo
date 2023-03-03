image_xscale = facing

if(y > room_height + 48)
    hp = 0

if(hp <= 0) && !ded
{
    ded = 1
    event_perform(ev_other, ev_user2)
}

if(!place_meeting(x, y + 1, oWall))
    vsp = approach(vsp, 99, grv)
