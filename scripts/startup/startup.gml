display_set_gui_size(256, 144)

// game is too fucking LOUD
audio_master_gain(0.75);

// read and apply screenSize and draw_debug flags
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

// create basic perlin noise to reference wherever
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
enum item_rarity
{
	none,
	common,
	rare,
	legendary,
	special
}

// classes
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
			var _item = global.itemdefs[$ attacker.items[i].item_id]
			var _stacks = attacker.items[i].stacks
	        if(variable_struct_exists(global.itemdefs, attacker.items[i].item_id) && _item.proc_type == proc_type)
			{
				_item.proc(attacker, target, damage, proc, _stacks)
			}
	    }
	}

	var dmg = damage
	for(var i = 0; i < array_length(target.items); i++)
	{
		dmg = global.itemdefs[$ target.items[i].item_id].on_owner_damaged(target, dmg, target.items[i].stacks)
	}
	target.hp -= dmg
}

// global variables
function itemdata()
{
	static item_tables =
	{
		any : [{v: 4, w: 1}, {v: 3, w: 1}, {v: 2, w: 1}, {v: 1, w: 1}, {v: 0, w: 1}],
		any_obtainable : [{v: 3, w: 1}, {v: 2, w: 1}, {v: 1, w: 1}],
		chest_small : [{v: 3, w: 0.01}, {v: 2, w: 1.98}, {v: 1, w: 7.92}],
		chest_large : [{v: 3, w: 2}, {v: 2, w: 8}]
	}
	static rarity_colors =
	[
		#8B9899,
		#E8F6F4,
		#38EB73,
		#F3235E,
		#D508E5
	]
}
itemdata()

// functions
function item_id_get_random(_by_rarity, _table = itemdata.item_tables.any_obtainable)
{
	if(_by_rarity)
	{
		var _array = struct_get_names(global.itemdefs_by_rarity[random_weighted(_table)])
		return _array[irandom(array_length(_array) - 1)]
	}
	else
	{
		var _array = struct_get_names(global.itemdefs)
		return _array[irandom(array_length(_array) - 1)]
	}
}

function random_weighted(_list) // example values: [{v:3,w:1}, {v:4,w:3}, {v:2,w:5}]; v:value, w:weight. must be sorted by lowest weight.
{
	var _tw = 0
	var _w = 0
	var _v = 0
	for(var i = 0; i < array_length(_list); i++)
	{
		_tw += _list[i].w
	}

	var _rand = random(_tw)
	for(var j = 0; j < array_length(_list); j++)
	{
		if(_rand <= _list[j].w + _w)
			return _list[j].v
		else
			_w += _list[j].w
	}
	return _list[0].v
}
