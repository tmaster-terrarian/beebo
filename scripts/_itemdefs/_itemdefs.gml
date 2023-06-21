function _itemdef(_name) constructor
{
    name = _name
    displayname = name
    stacks = 1
	proc_type = proctype.none
    rarity = item_rarity.none

    shortdesc = "undefined"

    calc = function(_s) { return 0 }
    draw = function(_s = 1) {}
    step = function(target, _s) {}

    proc = function(_a, _t, _d, _p, _s) {}
	on_owner_damaged = function(_o, _d, _s) { return _d }
}

function _itemdef_beeswax() : _itemdef("beeswax") constructor
{
    displayname = "Beeswax"
    shortdesc = "+10% bullet accuracy"
    rarity = item_rarity.common
    calc = function(_s)
    {
        return 0.1 * _s
    }
}

function _itemdef_eviction_notice() : _itemdef("eviction_notice") constructor
{
    displayname = "Eviction Notice"
    shortdesc = "Throw razor-sharp legal papers on hit when above 90% health"
    proc_type = proctype.onhit
    rarity = item_rarity.rare
	proc = function(_a, _t, _d, _p, _s) //attacker, target, damage, proc coefficient, item stacks
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
}

function _itemdef_serrated_stinger() : _itemdef("serrated_stinger") constructor
{
    displayname = "Serrated Stinger"
    shortdesc = "+10% chance to bleed on hit"
	proc_type = proctype.onhit
    rarity = item_rarity.common
	proc = function(_a, _t, _d, _p, _s)
	{
		if(random(1) <= (0.1 * _s * _p))
			_inflict(_t, new statmanager._bleed(_p, _d))
	}
}

function _itemdef_amorphous_plush() : _itemdef("amorphous_plush") constructor
{
    displayname = "Amorphous Plush"
    shortdesc = "A protective feline follows you"
    rarity = item_rarity.rare
    t = 0
    step = function(target, _s)
    {
        if(instance_exists(target) && t == 30) && target.object_index != obj_catfriend
        {
            var o = instance_create_depth(target.x + random_range(-8, 8), target.y, 0, obj_catfriend, { _team : target._team, parent : target})
            o.hp_max = o.stats.hp_max + (0.1 * o.stats.hp_max * _s)
            o.spd = o.stats.spd + (0.1 * o.stats.spd * _s)
            o.damage = o.stats.damage + (0.2 * o.stats.damage * _s)
        }
        t++
		if(t > 600) t = 0
    }
}

function _itemdef_placeholder() : _itemdef("placeholder") constructor
{
    displayname = "unknown"
    shortdesc = "unknown"
    rarity = item_rarity.legendary
}

global.itemdefs =
{
    beeswax: new _itemdef_beeswax(),
    eviction_notice: new _itemdef_eviction_notice(),
    serrated_stinger: new _itemdef_serrated_stinger(),
    amorphous_plush: new _itemdef_amorphous_plush(),
    placeholder: new _itemdef_placeholder()
}

global.itemdefs_by_rarity = [{}, {}, {}, {}, {}]
struct_foreach(global.itemdefs as (_name, _item)
{
    global.itemdefs_by_rarity[_item.rarity][$ _name] = _item
})
global.itemdefs_by_rarity[0].placeholder = global.itemdefs.placeholder
global.itemdefs_by_rarity[4].placeholder = global.itemdefs.placeholder

function inventory_item(__id, _stacks = 1) constructor
{
    item_id = __id
    stacks = _stacks
}

function get_item_stacks(item_id, target)
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
