function _calcitem(_name, target)
{
    ___calcitemname = _name
    return (array_any(target.items, function(_v, _i){return ( _v.name == ___calcitemname)})) ? target.items[array_find_index(target.items, function(_v, _i){return (_v.name == ___calcitemname)})].calc() : 0
}

function _getitem(_name, target)
{
    ___calcitemname = _name
    return (array_any(target.items, function(_v, _i){return _v.name == ___calcitemname})) ? target.items[array_find_index(target.items, function(_v, _i){return _v.name == ___calcitemname})] : -1
}

function _item_exists(_name, target)
{
    ___calcitemname = _name
    return (array_any(target.items, function(_v, _i){return _v.name == ___calcitemname}))
}
