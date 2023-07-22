var _elapsedBootTime = get_timer()
file_delete("latest.log")

// pixelate gui
display_set_gui_size(256, 144)

// game is too fucking LOUD
audio_master_gain(0.5);

// read and apply screenSize and draw_debug flags
debug_log("startup", "getting settings")

ini_open("save.ini");
global.screenSize = clamp(floor(ini_read_real("settings", "res", 4)), 1, 7);
if(global.screenSize < 7)
{
    window_set_fullscreen(false);
    window_set_size((256 * global.screenSize), (144 * global.screenSize));
}
else
{
    window_set_fullscreen(true);
}
window_center()

global.draw_debug = ini_read_real("debug", "draw_debug", 0)
global.locale = ini_read_string("settings", "lang", "en")
ini_close();

// create basic perlin noise to reference wherever
macaw_set_seed(0)
global.perlin = macaw_generate(512, 512, 6, 100)
debug_log("macaw", "generated perlin noise with seed 0")

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

enum damage_notif_type
{
	generic,
	crit,
	heal,
	revive,
	playerhurt
}

enum healtype
{
	generic,
	regen
}

// classes
function damage_event(attacker, target, proc_type, damage, proc, attacker_has_items = 1, force_crit = 0)
{
	var _damage_type = damage_notif_type.generic
	var crit = 0

	if(instance_exists(target) && !target.invincible)
	{
		var _dir = 1

		if(instance_exists(attacker))
		{
			_dir = sign(target.x - attacker.x)

			if(random(1) < attacker.crit_chance) || force_crit
			{
				crit = 1
				_damage_type = damage_notif_type.crit
			}

			if(attacker_has_items)
			{
				for(var i = 0; i < array_length(attacker.items); i++)
				{
					if(variable_struct_exists(global.itemdefs, attacker.items[i].item_id))
					{
						var _item = global.itemdefs[$ attacker.items[i].item_id]
						var _stacks = attacker.items[i].stacks
						if(_item.proc_type == proc_type)
						{
							_item.proc(attacker, target, damage, proc, _stacks)
						}
					}
				}

				var dmg_fac = 1
				dmg_fac += ((target.facing == 1 && target.x >= attacker.x) || (target.facing == -1 && target.x < attacker.x)) * (0.2 * item_get_stacks("bloody_dagger", attacker))

				damage *= dmg_fac
			}

			if(attacker._team == team.player)
			{
				if(!crit)
					audio_play_sound(sn_hit, 5, false)
				else
					audio_play_sound(sn_hit_crit, 5, false)
			}
		}
		else 
		{
			if(force_crit)
			{
				crit = 1
				_damage_type = damage_notif_type.crit
			}
		}

		damage *= 1 + crit

		var dmg = damage
		for(var i = 0; i < array_length(target.items); i++)
		{
			dmg = global.itemdefs[$ target.items[i].item_id].on_owner_damaged(target, dmg, target.items[i].stacks)
		}
		target.hp -= dmg

		if(target.object_index == obj_player)
		{
			audio_play_sound(sn_player_hit, 5, false)
			oCamera.alarm[0] = 10
			_damage_type = damage_notif_type.playerhurt
		}

		instance_create_depth((target.bbox_left + target.bbox_right) / 2, (target.bbox_top + target.bbox_bottom) / 2, 10, fx_damage_number, {notif_type: _damage_type, value: ceil(dmg), dir: _dir})

		// activate on kill items if target died
		if(target.hp <= 0) && (target.object_index != obj_player)
		{
			if(instance_exists(attacker)) && (attacker_has_items)
			{
				for(var i = 0; i < array_length(attacker.items); i++)
				{
					if(variable_struct_exists(global.itemdefs, attacker.items[i].item_id))
					{
						var _item = global.itemdefs[$ attacker.items[i].item_id]
						var _stacks = attacker.items[i].stacks
						if(_item.proc_type == proctype.onkill)
						{
							_item.proc(attacker, target, damage, proc, _stacks)
						}
					}
				}
			}
			for(var i = 0; i < array_length(target.items); i++)
			{
				if(variable_struct_exists(global.itemdefs, target.items[i].item_id))
				{
					var _item = global.itemdefs[$ target.items[i].item_id]
					if(_item.name == "emergency_field_kit")
					{
						target.hp = target.hp_max
						item_add_stacks("emergency_field_kit", target, -1, 0)
						item_add_stacks("emergency_field_kit_consumed", target, 1, 0)
					}
				}
			}
		}
		else
		{
			target.flash = 3
		}
	}
}

function heal_event(target, value, healtype = healtype.generic)
{
	var heal_fac = 1
	target.hp += value * heal_fac

	if(healtype != healtype.regen)
		instance_create_depth((target.bbox_left + target.bbox_right) / 2, (target.bbox_top + target.bbox_bottom) / 2, 10, fx_damage_number, {notif_type: damage_notif_type.heal, value: value, dir: -target.facing})
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
		#798686,
		#E8F6F4,
		#38EB73,
		#F3235E,
		#D508E5
	]
	static damage_type_colors =
	[
		#E8F6F4,
		#F3235E,
		#9CE562,
		#D508E5,
		#7b003b
	]
}
itemdata()

global.timescale = 1
global.dt = 1

global.retro = 1

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

// the following eight functions are credited to D'Andrëw Box on Github and are licensed under the MIT license.
function array_fill(_array, _val)
{
	for (var i = 0; i < array_length(_array); i++)
	{
		_array[i] = _val;
	}
}

function array_clear(_array)
{
	array_delete(_array, 0, array_length(_array));
}

function array_empty(_array)
{
	return (array_length(_array) == 0);
}

function array_find_index_by_value(_array, _val)
{
	for (var i = 0; i < array_length(_array); i++)
	{
		if (_array[i] == _val)
		{
			return i;
		}
	}
	return -1;
}

function file_text_read_whole(_file) {
	if (_file < 0) return "";

	var _file_str = ""
	while (!file_text_eof(_file)) {
	    _file_str += file_text_readln(_file);
	}

	return _file_str;
}

function file_json_read(_file) {
	var _str = file_text_read_whole(_file);
	return json_parse(_str);
}

function file_text_get_lines_array(_file) {
	if (_file < 0) return [];

	var _file_arr = [];
	var _str = "";
	while (!file_text_eof(_file)) {
		_str = file_text_readln(_file);
	    array_push(_file_arr, _str);
	}

	return _file_arr;
}

function json2file(_filename, _json = {}, _iteration = 0) {
	if (!is_struct(_json)) return "";

	var _str	= "{";
	var _keys	= struct_keys(_json);
	array_sort(_keys, true);
	for (var i = 0; i < get_size(_keys); i++) {
		var _value = _json[$ _keys[i]];
		if (is_struct(_value)) {
			_value = json2file("", _value, _iteration + 1);
		} else if (is_string(_value)) {
			_value = string("\"{0}\"", _value);
			_value = string_replace_all(_value, "\n", "\\n");
		}
		_str += "\n\t";
		for (var j = 0; j < _iteration; j++) {
			_str += "\t";
		}
		_str += string(
			"\"{0}\": {1}",
			_keys[i],
			_value
		);
		_str += ( i != get_size(_keys) - 1 ? "," : "" );
	}
	_str += "\n";
	for (var j = 0; j < _iteration; j++) {
		_str += "\t";
	}
	_str += "}";

	if (_filename != "") {
		var _file = file_text_open_write(_filename);
		file_text_write_string(_file, _str);
		file_text_close(_file);
	}

	return _str;
}
// end of 3rd party functions

function random_weighted(_list) // example values: [{v:3,w:1}, {v:4,w:3}, {v:2,w:5}]; v:value, w:weight. automatically sorted by lowest weight.
{
	var _tw = 0
	var _w = 0
	var _v = 0

	var _l = []; array_copy(_l, 0, _list, 0, array_length(_list))
	array_sort(_l, function(_e1, _e2) { return sign(_e1.w - _e2.w) })

	for(var i = 0; i < array_length(_l); i++)
	{
		_tw += _l[i].w
	}

	var _rand = random(_tw)
	for(var j = 0; j < array_length(_l); j++)
	{
		if(_rand <= _l[j].w + _w)
			return _l[j].v
		else
			_w += _l[j].w
	}
	return array_last(_l).v
}

function timer_to_timestamp(_t)
{
	var _c = floor((abs(_t) / 10000) % 100)
	var _s = floor((abs(_t) / 1000000) % 60)
	var _m = floor((_s / 60) % 60)
	var _h = floor((_m / 60) % 60)
	var h = string(_h) + ":"

	if(_c < 10) _c = "0" + string(_c)
	if(_s < 10) _s = "0" + string(_s)
	if(_m < 10) _m = "0" + string(_m)
	if(_h < 10) h = "0" + string(_h) + ":"

	var str = ((_t < 0) ? "-" : "") + ((_h) ? h : "") + $"{_m}:{_s}:{_c}"

	return str
}

function debug_log(src, str)
{
	show_debug_message($"[{timer_to_timestamp(get_timer())}] [{src}]: {str}")

	var file = file_text_open_append("latest.log")
	file_text_write_string(file, $"[{timer_to_timestamp(get_timer())}] [{src}]: {str}")
	file_text_writeln(file)
	file_text_close(file)
}

function string_to_real(str)
{
	return (string_starts_with(str, "-") ? -1 : 1) * real(string_digits(str))
}

function string_is_real(str)
{
	return !((string_digits(str) == "") || (string_replace(str, "-", "") != string_digits(str)))
}

// localization
function string_loc(key) // example key: item.beeswax.name
{
	return (variable_struct_exists(global.lang, global.locale) && variable_struct_exists(global.lang[$ global.locale], string_replace_all(key, ".", "_"))) ? global.lang[$ global.locale][$ string_replace_all(key, ".", "_")] : (variable_struct_exists(global.lang.en, string_replace_all(key, ".", "_")) ? global.lang.en[$ string_replace_all(key, ".", "_")] : key)
}

function locale()
{
	static init = function()
	{
		delete global.lang

		global.lang = { en: {}, es: {} }

		var file = file_text_open_read("data/lang.json")
		global.lang = file_json_read(file)
		file_text_close(file)
	}
	static reload = function()
	{
		var _starttime = get_timer()
		debug_log("system", "reloading language data")

		locale.init()
		debug_log("system", $"loaded languages: {struct_get_names(global.lang)}")

		struct_foreach(global.itemdefs as (_name, _item)
		{
			global.itemdefs[$ _name].displayname = string_loc($"item.{_name}.name")
			global.itemdefs[$ _name].shortdesc = string_loc($"item.{_name}.shortdesc")
			global.itemdefs[$ _name].lore = string_loc($"item.{_name}.lore")
		})
		debug_log("system", "reloaded item language data")

		struct_foreach(global.modifierdefs as (_name, _item)
		{
			global.modifierdefs[$ _name].displayname = string_loc($"modifier.{_name}.name")
			global.modifierdefs[$ _name].desc = string_loc($"modifier.{_name}.desc")
		})
		debug_log("system", "reloaded modifier language data")

		debug_log("system", $"language data reload completed, elapsed time: [{timer_to_timestamp(get_timer() - _starttime)}]")
	}
}
locale()

global.lang = { en: {}, es: {} }

locale.init()
debug_log("startup", $"loaded languages: {struct_get_names(global.lang)}")

// itemdefs.gml
function _itemdef(_name) constructor {
    name = _name
    displayname = string_loc("item.unknown.name")
    shortdesc = string_loc("item.unknown.shortdesc")
	proc_type = proctype.none
    rarity = item_rarity.none

    calc = function(_s) { return 0 }
    draw = function(_s = 1) {}
    step = function(target, _s) {}
    proc = function(_a, _t, _d, _p, _s) {}
	on_owner_damaged = function(_o, _d, _s) { return _d }
}

function itemdef(__struct, _struct)
{
	static total_items = 0
	total_items++

	// hhhhhh i hate scope issues so much
	var names = variable_struct_get_names(_struct)
    var size = variable_struct_names_count(_struct);

    for (var i = 0; i < size; i++) {
        var name = names[i];
        var element = variable_struct_get(_struct, name);
        variable_struct_set(__struct, name, element)
    }
	delete _struct
	return __struct
}

global.itemdefs =
{
	unknown : new _itemdef("unknown"),
	beeswax : itemdef(new _itemdef("beeswax"), {
		displayname : string_loc("item.beeswax.name"),
    	shortdesc : string_loc("item.beeswax.shortdesc"),
		rarity : item_rarity.common,
		calc : function(_s)
		{
			return 0.1 * _s
		}
	}),
	eviction_notice : itemdef(new _itemdef("eviction_notice"), {
		displayname : string_loc("item.eviction_notice.name"),
		shortdesc : string_loc("item.eviction_notice.shortdesc"),
		proc_type : proctype.onhit,
		rarity : item_rarity.rare,
		proc : function(_a, _t, _d, _p, _s) //attacker, target, damage, proc coefficient, item stacks
		{
			if(_a.hp/_a.hp_max >= 0.9) && sign(_p)
			{
				var offx = 0
				var offy = 0
				if(_a == obj_player)
				{
					offy = -12
				}

				var p = instance_create_depth(_a.x + offx, _a.y + offy, _a.depth + 2, obj_paperwork)
				p.damage = _d * (_s + 1)
				p._team = _a._team
				p.dir = point_direction(_a.x + offx, _a.y + offy, _t.x, _t.y)
				p.pmax = point_distance(_a.x + offx, _a.y + offy, _t.x, _t.y)
				p.target = _t
				p.parent = _a
			}
		}
	}),
	serrated_stinger : itemdef(new _itemdef("serrated_stinger"), {
		displayname : string_loc("item.serrated_stinger.name"),
		shortdesc : string_loc("item.serrated_stinger.shortdesc"),
		proc_type : proctype.onhit,
		rarity : item_rarity.common,
		proc : function(_a, _t, _d, _p = 1, _s = 1)
		{
			if(random(1) < (0.1 * _s * _p))
				_inflict(_t, new statmanager._bleed(_p, _a.base_damage))
		}
	}),
	amorphous_plush : itemdef(new _itemdef("amorphous_plush"), {
		displayname : string_loc("item.amorphous_plush.name"),
		shortdesc : string_loc("item.amorphous_plush.shortdesc"),
		rarity : item_rarity.rare,
		step : function(target, _s)
		{
			if(instance_exists(target) && (target.t % 600) == 30) && (target.object_index != obj_catfriend) && (instance_number(obj_catfriend) < 1)
			{
				var o = instance_create_depth(target.x + random_range(-8, 8), target.y, 0, obj_catfriend, { _team : target._team, parent : target})
				o.stats.hp_max += (0.1 * o.stats.hp_max * (_s - 1))
				o.stats.spd += (0.1 * o.stats.spd * (_s - 1))
				o.stats.damage += (0.2 * o.stats.damage * (_s - 1))
			}
		}
	}),
	emergency_field_kit : itemdef(new _itemdef("emergency_field_kit"), {
		displayname : string_loc("item.emergency_field_kit.name"),
		shortdesc : string_loc("item.emergency_field_kit.shortdesc"),
		rarity : item_rarity.legendary
	}),
	emergency_field_kit_consumed : itemdef(new _itemdef("emergency_field_kit_consumed"), {
		displayname : string_loc("item.emergency_field_kit_consumed.name"),
		shortdesc : string_loc("item.emergency_field_kit_consumed.shortdesc"),
		rarity : item_rarity.none
	}),
	bloody_dagger : itemdef(new _itemdef("bloody_dagger"), {
		displayname : string_loc("item.bloody_dagger.name"),
		shortdesc : string_loc("item.bloody_dagger.shortdesc"),
		rarity : item_rarity.common
	})
}

global.itemdefs_by_rarity = [{}, {}, {}, {}, {}]
struct_foreach(global.itemdefs as (_name, _item)
{
    global.itemdefs_by_rarity[_item.rarity][$ _name] = _item
})

debug_log("startup", $"successfully created {itemdef.total_items} items")

function inventory_item(__id, _stacks = 1) constructor
{
    item_id = __id
    stacks = _stacks
}

function item_get_stacks(item_id, target)
{
    for(var i = 0; i < array_length(target.items); i++)
    {
        if(target.items[i].item_id == item_id)
        {
            return target.items[i].stacks
        }
    }
    return 0
}

function item_add_stacks(item_id, target, stacks = 1, notify = 1)
{
	if(notify && stacks >= 1 && target.object_index == obj_player)
	{
		var _i = instance_create_depth(0, 0, 0, fx_pickuptext)
		_i.name = global.itemdefs[$ item_id].displayname
		_i.shortdesc = global.itemdefs[$ item_id].shortdesc
		_i.item_id = item_id
	}

    for(var i = 0; i < array_length(target.items); i++)
    {
        if(target.items[i].item_id == item_id)
        {
            target.items[i].stacks += stacks
			if(target.items[i].stacks <= 0)
				array_delete(target.items, i, 1)
			return
        }
    }
	if(stacks > 0)
	{
		array_push(target.items, new inventory_item(item_id, stacks))
	}
}

function item_set_stacks(item_id, target, stacks, notify = 1)
{
	if(notify && stacks >= 1 && target.object_index == obj_player)
	{
		var _i = instance_create_depth(0, 0, 0, fx_pickuptext)
		_i.name = global.itemdefs[$ item_id].displayname
		_i.shortdesc = global.itemdefs[$ item_id].shortdesc
		_i.item_id = item_id
	}

    for(var i = 0; i < array_length(target.items); i++)
    {
        if(target.items[i].item_id == item_id)
        {
            target.items[i].stacks = stacks
			if(target.items[i].stacks <= 0)
				array_delete(target.items, i, 1)
			return;
        }
    }
	if(stacks > 0)
	{
		array_push(target.items, new inventory_item(item_id, stacks))
	}
}

// modifiers
function _modifierdef(_name) constructor
{
	name = _name
	displayname = string_loc("modifier.unknown.name")
	desc = string_loc("modifier.unknown.desc")

	on_pickup = function() {}
}

function modifierdef(__blankdef, _struct)
{
	static total_modifiers = 0
	total_modifiers++

	var names = variable_struct_get_names(_struct)
    var size = variable_struct_names_count(_struct);

    for (var i = 0; i < size; i++) {
        var name = names[i];
        var element = variable_struct_get(_struct, name);
        variable_struct_set(__blankdef, name, element)
    }
	delete _struct
	return __blankdef
}

global.modifierdefs =
{
	unknown : new _modifierdef("unknown"),
	reckless : modifierdef(new _modifierdef("reckless"), {
		displayname : string_loc("modifier.reckless.name"),
    	desc : string_loc("modifier.reckless.shortdesc")
	}),
	evolution : modifierdef(new _modifierdef("evolution"), {
		displayname : string_loc("modifier.evolution.name"),
    	desc : string_loc("modifier.evolution.shortdesc"),
		on_pickup : function()
		{
			var _item = item_id_get_random(1, itemdata.item_tables.chest_small)
			if(instance_exists(obj_player))
				item_add_stacks(_item, obj_player, 3)
			item_add_stacks(_item, statmanager, 3, 0)
		}
	})
}

debug_log("startup", $"successfully created {modifierdef.total_modifiers} modifiers")

function modifier(_modifier_id, _stacks = 1) constructor
{
	modifier_id = _modifier_id
	stacks = _stacks
}

function modifier_get_stacks(modifier_id)
{
    for(var i = 0; i < array_length(statmanager.run_modifiers); i++)
    {
        if(statmanager.run_modifiers[i].modifier_id == modifier_id)
        {
            return statmanager.run_modifiers[i].stacks
        }
    }
    return 0
}

function modifier_add_stacks(modifier_id, stacks = 1)
{
    for(var i = 0; i < array_length(statmanager.run_modifiers); i++)
    {
        if(statmanager.run_modifiers[i].modifier_id == modifier_id)
        {
            statmanager.run_modifiers[i].stacks += stacks
			if(statmanager.run_modifiers[i].stacks <= 0)
				array_delete(statmanager.run_modifiers, i, 1)
			return;
        }
    }
	if(stacks > 0)
	{
		array_push(statmanager.run_modifiers, new modifier(modifier_id, stacks))
	}
}

function modifier_set_stacks(modifier_id, stacks)
{
    for(var i = 0; i < array_length(statmanager.run_modifiers); i++)
    {
        if(statmanager.run_modifiers[i].modifier_id == modifier_id)
        {
            statmanager.run_modifiers[i].stacks = stacks
			if(statmanager.run_modifiers[i].stacks <= 0)
				array_delete(statmanager.run_modifiers, i, 1)
			return;
        }
    }
	if(stacks > 0)
	{
		array_push(statmanager.run_modifiers, new modifier(modifier_id, stacks))
	}
}

debug_log("startup", $"initialization completed, elapsed time: [{timer_to_timestamp(get_timer() - _elapsedBootTime)}]")
