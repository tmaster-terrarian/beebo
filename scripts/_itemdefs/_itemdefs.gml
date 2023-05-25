function _itemdef(_name) constructor
{
    name = _name
    displayname = name
    stacks = 1
	proc_type = proctype.none

    shortdesc = "undefined"

    static calc = function() { return 0 }
    static draw = function() {}
    static step = function(target) {}

    static proc = function(_a, _t, _d, _p) {}
	static on_owner_damaged = function(_o, _d) { return _d }
}

function _itemdef_beeswax() : _itemdef("beeswax") constructor
{
    displayname = "Beeswax"
    shortdesc = "+10% bullet accuracy"
    calc = function()
    {
        return 0.1 * stacks
    }
}

function _itemdef_eviction_notice() : _itemdef("eviction_notice") constructor
{
    displayname = "Eviction Notice"
    shortdesc = "Throw razor-sharp legal papers on hit when above 90% health"
    proc_type = proctype.onhit
	proc = function(_a, _t, _d, _p)
	{
		if(_a.hp/_a.hp_max >= 0.9)
		{
            var offx = 0
            var offy = 0
            if(_a == obj_player)
            {
                offy = -12
            }

			var p = instance_create_depth(_a.x + offx, _a.y + offy, _a.depth + 2, obj_paperwork)
			p.damage = _d * (stacks + 1)
            p._team = _a._team
            p.dir = point_direction(_a.x + offx, _a.y + offy, _t.x, _t.y)
            p.pmax = point_distance(_a.x + offx, _a.y + offy, _t.x, _t.y)
            p.target = _t
		}
	}
}

function _itemdef_serrated_stinger() : _itemdef("serrated_stinger") constructor
{
    displayname = "Serrated Stinger"
    shortdesc = "+10% chance to bleed on hit"
	proc_type = proctype.onhit
	proc = function(_a, _t, _d, _p)
	{
		if(global.utils.chance(0.1 * stacks * _p))
			_inflict(_t, new statmanager._bleed(_p, _d))
	}
}

function _itemdef_amorphous_plush() : _itemdef("amorphous_plush") constructor
{
    displayname = "Amorphous Plush"
    shortdesc = "A protective feline follows you"
    t = 0
    step = function(target)
    {
        if(instance_exists(target) && t == 30)
        {
            var o = instance_create_depth(target.x + random_range(-8, 8), target.y, 0, obj_catfriend, { _team : target._team, parent : target })
            o.hp_max = o.stats.hp_max + 0.1 * stacks
            o.spd = o.stats.spd + 0.1 * stacks
            o.damage = o.stats.damage + 0.2 * stacks
        }
        t++
		if(t > 600) t = 0
    }
}
