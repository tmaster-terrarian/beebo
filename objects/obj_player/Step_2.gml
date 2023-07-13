if(lasthp != hp) {oCamera.alarm[0] = 5}
if(lasthp > hp) {regen = 0; alarm[1] = 120}
if(regen) heal_event(id, regen_rate/60, healtype.regen)
if(hp > hp_max) hp = hp_max
event_inherited();

if(position_meeting(bbox_left, bbox_bottom+1, obj_wall) && position_meeting(bbox_right, bbox_bottom+1, obj_wall))
{
    lastSafeX = x;
    lastSafeY = y;
}
