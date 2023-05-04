if(lasthp != hp) {oCamera.alarm[0] = 5}
if(lasthp > hp) {regen = 0; alarm[1] = 120}
if(regen) hp += regen_rate
if(hp > hp_max) hp = hp_max
event_inherited();
