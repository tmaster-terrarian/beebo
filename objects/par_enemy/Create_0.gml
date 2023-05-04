event_inherited()
grv = 0.2
if(stats == noone)
{
    stats =
    {
        hp_max : 20,
        spd : 1,
        firerate : 4,
        damage : 10
    }
}
hp_max = stats.hp_max
hp = hp_max
lasthp = hp
hp_change = hp
spd = stats.spd
firerate = stats.firerate
damage = stats.damage
facing = 1
state = "normal"
timer0 = 0
ded = 0
image_speed = 0
drawhp = 0
playerally = 0

statsmult = {}
buffs = {}
initbuffs(id)
