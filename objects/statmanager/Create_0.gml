global_level = 1
difficulty_rate = 0
difficulty_mult = 1
items = []
run_modifiers = []

run_initialize = function()
{
    global.t = 0
    global_level = 1
    difficulty_rate = 1
    items = []
    run_modifiers = []
}

function _calcitem(_name, target)
{
    global.__calcitemnamearg = _name
    global.__calcitemtargetarg = target
    var _item = global.__calcitemtargetarg.items[array_find_index(global.__calcitemtargetarg.items, function(_v, _i){return _v.name == global.__calcitemnamearg})]
    return (array_any(global.__calcitemtargetarg.items, function(_v, _i){return _v.name == global.__calcitemnamearg})) ? global.itemdefs[$ _item.item_id].calc(_item.stacks) : 0
}

function modifiers_tostring()
{
    var str = ""
    for(var i = 0; i < array_length(run_modifiers); i++)
    {
        var _str = ""

        if(i != 0) _str = ", "

        _str += string(run_modifiers[i].modifier_id)
        if(run_modifiers[i].stacks > 1) _str += $" ({run_modifiers[i].stacks})"

        str += _str
    }
    return str
}

function _buff(_name) constructor
{
    name = _name
    timed = 0
    duration = 60
    timeleft = 0
    stacks = 1
    static set_stacks = function(_stacks)
    {
        stacks = _stacks
        if(timed)
            timeleft = duration
    }
    static add_stacks = function(_stacks = 1)
    {
        stacks += _stacks
        if(timed)
            timeleft = duration
    }
    static calc = function() { return 1 }
    static draw = function() {}
    static tick = function() {}
    static stop = function(target) {}
    step = function(target)
    {
        if(timeleft && timed)
            timeleft--
        if(!timeleft && timed)
        {
            if(stacks)
                stop(target)
            stacks = 0
        }
    }
}

function _slow() : _buff("debuff_slow") constructor
{
    duration = 300
    timed = 1
    calc = function()
    {
        return stacks ? 0.5 : 0
    }
    draw = function()
    {
        if(timeleft)
            draw_sprite(spr_debuff_slow, 0, other.bbox_right + 2, other.bbox_top - 2)
    }
}

function _bleed(_a = noone, _p = 1, _d = 10) : _buff("debuff_bleed") constructor
{
    timed = 1
	proc = _p
	damage = _d
    duration = 180 * proc
    attacker = _a
    tick = function(target)
    {
        if(timeleft % 15 == 1)
        {
            damage_event(attacker, target, proctype.none, damage * 0.5, 0, 0, 0, 0)
        }
    }
}

function _fast() : _buff("buff_fast") constructor
{
    duration = 300
    timed = 1
    calc = function()
    {
        return stacks ? 0.3 : 0
    }
}
