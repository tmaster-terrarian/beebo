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
