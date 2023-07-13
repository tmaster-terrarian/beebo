global_level = 0
difficulty_rate = 0
difficulty_mult = 1
items = []

run_initialize = function()
{
    global_level = 1
    difficulty_rate = 1
    items =
    [
        // {item_id: "serrated_stinger", stacks: 10}
    ]
}

function _calcitem(_name, target)
{
    global.__calcitemnamearg = _name
    global.__calcitemtargetarg = target
    var _item = global.__calcitemtargetarg.items[array_find_index(global.__calcitemtargetarg.items, function(_v, _i){return _v.name == global.__calcitemnamearg})]
    return (array_any(global.__calcitemtargetarg.items, function(_v, _i){return _v.name == global.__calcitemnamearg})) ? global.itemdefs[$ _item.item_id].calc(_item.stacks) : 0
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

function _bleed(_p = 1, _d = 10) : _buff("debuff_bleed") constructor
{
    timed = 1
	proc = _p
	damage = _d
    duration = 180 * proc
    tick = function(target)
    {
        if(timeleft % 15 == 1)
        {
            target.hp -= damage * 0.5
            if(target.object_index != obj_player)
                audio_play_sound(sn_hit, 5, false)
            else
                oCamera.alarm[0] = 5
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
    stop = function(target)
    {
        if abs(target.hsp) > target.spd
            target.hsp = clamp(target.hsp, -target.spd, target.spd)
    }
}
