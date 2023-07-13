// pixelate gui
display_set_gui_size(256, 144)

// game is too fucking LOUD
audio_master_gain(0.5);

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

global.draw_debug = ini_read_real("debug", "draw_debug", 0)
global.locale = ini_read_string("settings", "lang", "en")

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

enum damage_notif_type
{
	generic,
	crit,
	heal,
	revive
}

enum healtype
{
	generic,
	regen
}

// classes
function damage_event(attacker, target, proc_type, damage, proc, attacker_has_items = 1)
{
	if(instance_exists(target))
	{
		var _damage_type = damage_notif_type.generic
		var _dir = 1

		if(instance_exists(attacker))
		{
			var crit = 0
			_dir = sign(target.x - attacker.x)

			if(attacker_has_items)
			{
				if(random(1) <= attacker.crit_chance)
				{
					crit = 1
					_damage_type = damage_notif_type.crit
				}

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

				damage += damage * ((target.facing == 1 && target.x >= attacker.x) || (target.facing == -1 && target.x < attacker.x)) * (0.2 * item_get_stacks("bloody_dagger", attacker))
				damage *= 1 + crit
			}

			if(attacker._team == team.player)
			{
				if(!crit)
					audio_play_sound(sn_hit, 5, false)
				else
					audio_play_sound(sn_hit_crit, 5, false)
			}
			else if(target.object_index == obj_player)
			{
				audio_play_sound(sn_player_hit, 5, false)
				oCamera.alarm[0] = 10
			}
		}

		var dmg = damage
		for(var i = 0; i < array_length(target.items); i++)
		{
			dmg = global.itemdefs[$ target.items[i].item_id].on_owner_damaged(target, dmg, target.items[i].stacks)
		}
		target.hp -= dmg

		if(target.object_index != obj_player)
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
	target.hp += value

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
		#D508E5
	]
}
itemdata()

global.timescale = 1
global.dt = 1

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

// localization
function string_loc(key) // example key: item.beeswax.name
{
	return (variable_struct_exists(global.lang, global.locale) && variable_struct_exists(global.lang[$ global.locale], string_replace_all(key, ".", "_"))) ? global.lang[$ global.locale][$ string_replace_all(key, ".", "_")] : (variable_struct_exists(global.lang.en, string_replace_all(key, ".", "_")) ? global.lang.en[$ string_replace_all(key, ".", "_")] : key)
}

global.lang = { en: {}, es: {}, ja: {} }
global.lang.en =
{
	item_unknown_name: "Undefined",
	item_unknown_shortdesc: "undefined",
	item_beeswax_name: "Beeswax",
	item_beeswax_shortdesc: "[kw_number]+10%[/c] [kw_projectile]bullet accuracy[/c].",
	item_eviction_notice_name: "Eviction Notice",
	item_eviction_notice_shortdesc: "Throw [kw_damage]razor-sharp[/c] [kw_projectile]legal papers[/c] [kw_proctype]on hit[/c] when above [kw_number]90%[/c] [kw_health]health[/c].",
	item_serrated_stinger_name: "Serrated Stinger",
	item_serrated_stinger_shortdesc: "[kw_number]+10%[/c] chance to inflict [kw_damage]bleeding[/c] [kw_proctype]on hit[/c].",
	item_amorphous_plush_name: "Amorphous Plush",
	item_amorphous_plush_shortdesc: "A protective feline follows you.",
	item_emergency_field_kit_name: "Emergency Field Kit",
	item_emergency_field_kit_shortdesc: "Gain an [kw_health]extra life[/c].",
	item_emergency_field_kit_consumed_name: "Emergency Field Kit (Consumed)",
	item_emergency_field_kit_consumed_shortdesc: "A used item with no power.",
	item_bloody_dagger_name: "Bloody Dagger",
	item_bloody_dagger_shortdesc: "Attacks from behind deal [kw_damage]bonus damage[/c] [kw_proctype]on hit[/c]."
}
global.lang.es =
{
	item_unknown_name: "Indefinido",
	item_unknown_shortdesc: "indefinido",
	item_beeswax_name: "Cera de Abejas",
	item_beeswax_shortdesc: "[kw_number]+10%[/c] [kw_projectile]precision de bala[/c].",
	item_eviction_notice_name: "Aviso de Desalojo",
	item_eviction_notice_shortdesc: "Tira [kw_projectile]documentos legales[/c] [kw_damage]afilados[/c] cuando te pegan con mas del [kw_number]90%[/c] de [kw_health]vida[/c].",
	item_serrated_stinger_name: "Aguijon Serrado",
	item_serrated_stinger_shortdesc: "[kw_number]+10%[/c] chance to inflict [kw_damage]bleeding[/c] [kw_proctype]on hit[/c].",
	item_amorphous_plush_name: "Peluche Amorfo",
	item_amorphous_plush_shortdesc: "Un felino protectivo te sigue."
}
global.lang.ja =
{
	item_unknown_name: "Mi teigi",
	item_unknown_shortdesc: "mi teigi",
	item_beeswax_name: "蜜蝋"
}

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
			if(random(1) <= (0.1 * _s * _p))
				_inflict(_t, new statmanager._bleed(_p, _a.base_damage))
		}
	}),
	amorphous_plush : itemdef(new _itemdef("amorphous_plush"), {
		displayname : string_loc("item.amorphous_plush.name"),
		shortdesc : string_loc("item.amorphous_plush.shortdesc"),
		rarity : item_rarity.rare,
		step : function(target, _s)
		{
			if(instance_exists(target) && (target.t % 600) == 30) && target.object_index != obj_catfriend
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
	if(notify)
	{
		var _i = instance_create_depth(target.x, target.y - 6, depth, fx_pickuptext)
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

function item_set_stacks(item_id, target, stacks)
{
    for(var i = 0; i < array_length(target.items); i++)
    {
        if(target.items[i].item_id == item_id)
        {
            target.items[i].stacks = stacks
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

// modifiers
function _modifierdef(_name) constructor
{
	name = _name
	displayname = string_loc("modifier.unknown.name")
	desc = string_loc("modifier.unknown.desc")
}
