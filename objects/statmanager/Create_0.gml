function _calcitem(_name, target)
{
    global.__calcitemnamearg = _name
    global.__calcitemtargetarg = target
    return (array_any(global.__calcitemtargetarg.items, function(_v, _i){return _v.name == global.__calcitemnamearg})) ? global.__calcitemtargetarg.items[array_find_index(global.__calcitemtargetarg.items, function(_v, _i){return _v.name == global.__calcitemnamearg})].calc() : 0
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
    step = function()
    {
        if(timeleft && timed)
            timeleft--
        if(!timeleft && timed)
            stacks = 0
        // if(stacks == 0)
        //     delete self
    }
}

function _slow() : _buff("debuff_slow") constructor
{
    duration = 300
    timed = 1
    calc = function()
    {
        if(stacks > 1)
        {
            stacks = 1
            timeleft = duration
        }
        return stacks ? 0.5 : 0
    }
    draw = function()
    {
        if(timeleft)
            draw_sprite(spr_debuff_slow, 0, other.bbox_right + 2, other.bbox_top - 2)
    }
}

function _bleed() : _buff("debuff_bleed") constructor
{
    duration = 180
    timed = 1
    tick = function(target)
    {
        if(timeleft % 15 == 1)
        {
            target.hp -= 2
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
        if(stacks > 1)
        {
            stacks = 1
            timeleft = duration
        }
        return stacks ? 0.3 : 0
    }
}
