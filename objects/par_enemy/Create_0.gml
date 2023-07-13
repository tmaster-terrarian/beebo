event_inherited()
depth = 400
grv = 0.2
_target = noone
target = noone
switch(_team)
{
	case team.neutral:
	{
		playerally = 0
		_target = par_unit
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
base_damage = stats.damage
crit_chance = 0
facing = 1
state = "normal"
flash = 0
timer0 = 0
ded = 0
image_speed = 0
drawhp = 0
playerally = 0

statsmult = {}
buffs = {}
initbuffs(id)

items = statmanager.items

t = 0
autoaggro = 1
agpos = {x:x, y:y, cy:y-8}
seethruwalls = 0

aggrotimer = 0
