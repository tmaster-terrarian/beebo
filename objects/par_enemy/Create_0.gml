event_inherited()
depth = 400
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
_target = noone
switch(_team)
{
	case team.neutral:
	{
		playerally = 0
		_target = choose(obj_player, par_enemy)
		break;
	}
	case team.player:
	{
		playerally = 1
		_target = par_enemy
		break;
	}
	case team.enemy:
	{
		playerally = 0
		_target = obj_player
		break;
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
flash = 0
timer0 = 0
ded = 0
bulletproof = 0
image_speed = 0
drawhp = 0
playerally = 0

statsmult = {}
buffs = {}
initbuffs(id)

items =
[
	// new inventory_item("amorphous_plush", 1)
]
