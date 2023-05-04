function _itemdef(_name) constructor
{
    name = _name
    displayname = name
    stacks = 1

    shortdesc = "undefined"

    static remove = function()
    {
        delete other.items[$ name]
    }

    static calc = function() { return 0 }
    static draw = function() {}
    static step = function() {}

    static on_hit = function(target) {}
    static on_kill = function(target) {}
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
    shortdesc = "+10% chance to bleed"
    calc = function()
    {
        return 0.1 * stacks
    }
}

function _itemdef_amorphous_plush() : _itemdef("amorphous_plush") constructor
{
    displayname = "Amorphous Plush"
    shortdesc = "A protective feline follows you"
    t = 0
    calc = function()
    {
        t++
        if(instance_exists(obj_player) && t % 600 == 1)
        {
            if(!instance_exists(obj_catfriend))
            {
                instance_create_depth(obj_player.x + random_range(-24, 24), obj_player.y, 0, obj_catfriend)
            }
            var o = obj_catfriend
            o.hp_max = o.stats.hp_max + 0.1 * stacks
            o.spd = o.stats.spd + 0.1 * stacks
            o.damage = o.stats.damage + 0.2 * stacks
        }
    }
}
