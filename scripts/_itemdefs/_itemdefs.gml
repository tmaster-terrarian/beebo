function _itemdef(_name) constructor
{
    name = _name
    displayname = name
    stacks = 1
	proc_type = proctype.none

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
	proc = function(_a, _t, _d, _p, _s)
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
	proc = function(_a, _t, _d, _p, _s)
	{
		if(global.utils.chance(0.1 * _s * _p))
			_inflict(_t, new statmanager._bleed(_p, _d))
	}
}

function _itemdef_amorphous_plush() : _itemdef("amorphous_plush") constructor
{
    displayname = "Amorphous Plush"
    shortdesc = "A protective feline follows you"
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

function get_new_itemdef(_name)
{
    switch _name
    {
        default:
        {
            return -1
            break
        }
        case "beeswax":
        {
            return new _itemdef_beeswax()
            break
        }
        case "eviction_notice":
        {
            return new _itemdef_eviction_notice()
            break
        }
        case "serrated_stinger":
        {
            return new _itemdef_serrated_stinger()
            break
        }
        case "amorphous_plush":
        {
            return new _itemdef_amorphous_plush()
            break
        }
    }
}

function itemdef_exists(_name)
{
    switch _name
    {
        default:
        {
            return 0
            break
        }
        case "beeswax": case "eviction_notice": case "serrated_stinger": case "amorphous_plush":
        {
            return 1
            break
        }
    }
}

global.itemdefs =
{
    beeswax: new _itemdef_beeswax(),
    serrated_stinger: new _itemdef_serrated_stinger()
}

function item(_id, _stacks = 1) constructor
{
    id = _id
    stacks = _stacks
}
