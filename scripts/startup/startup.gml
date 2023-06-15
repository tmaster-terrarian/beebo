display_set_gui_size(256, 144)

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

macaw_set_seed(0)
global.perlin = macaw_generate(512, 512, 6, 100)

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
			var _item = global.itemdefs[$ attacker.items[i]._id]
			var _stacks = attacker.items[i].stacks
	        if(variable_struct_exists(global.itemdefs, attacker.items[i]._id) && _item.proc_type == proc_type)
			{
				_item.proc(attacker, target, damage, proc, _stacks)
			}
	    }
	}

	var dmg = damage
	for(var i = 0; i < array_length(target.items); i++)
	{
		dmg = global.itemdefs[$ target.items[i]._id].on_owner_damaged(target, dmg, target.items[i].stacks)
	}
	target.hp -= dmg
}

global.utils =
{
	chance : function(_value)
	{
		return random(1) <= _value
	}
}
