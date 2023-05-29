// game is too fucking LOUD
audio_master_gain(0.75);

// screen size
ini_open("save.ini");
global.screenSize = clamp(floor(ini_read_real("settings", "res", 4)), 1, 7);
if(global.screenSize < 7)
{
    window_set_fullscreen(false);
    window_set_size((256 * global.screenSize), (144 * global.screenSize));
	window_center()
}
else
{
    window_set_fullscreen(true);
}

global.draw_debug = ini_read_real("debug", "draw_debug", 0);

ini_close();

// enums
enum team
{
    player,
	enemy,
	neutral
}
enum proctype
{
	onhit,
	onkill,
	none
}

// struct classes
function damage_event(_attacker, _target, _type, _damage, _proc) constructor
{
	attacker = _attacker
	target = _target
	proc_type = _type
	damage = _damage
	proc = _proc

	if(instance_exists(attacker))
	{
		for(var i = 0; i < array_length(attacker.items); i++)
	    {
	        if(attacker.items[i].proc_type == proc_type)
			{
				attacker.items[i].proc(attacker, target, damage, proc)
			}
	    }
	}

	var dmg = damage
	for(var i = 0; i < array_length(target.items); i++)
	{
		dmg = target.items[i].on_owner_damaged(target, dmg)
	}
	target.hp -= dmg
}

function utils() constructor
{
	static chance = function(_value)
	{
		return random(1) <= _value
	}
}
global.utils = new utils()
