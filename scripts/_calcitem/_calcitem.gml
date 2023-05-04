function _calcitem(_name, target)
{
    global.__calcitemnamearg = _name
    global.__calcitemtargetarg = target
    return (array_any(global.__calcitemtargetarg.items, function(_v, _i){return _v.name == global.__calcitemnamearg})) ? global.__calcitemtargetarg.items[array_find_index(global.__calcitemtargetarg.items, function(_v, _i){return _v.name == global.__calcitemnamearg})].calc() : 0
}
