function _calcitem(_name, target)
{
    return (array_any(target.items, function(_v, _i, _n = _name){return _v.name == _n})) ? target.items[array_find_index(target.items, function(_v, _i, _n = _name){return _v.name == _n})].calc() : 0
}

function _getitem(_name, target)
{
    return (array_any(target.items, function(_v, _i, _n = _name){return _v.name == _n})) ? target.items[array_find_index(target.items, function(_v, _i, _n = _name){return _v.name == _n})] : -1
}

function _item_exists(_name, target)
{
    return (array_any(target.items, function(_v, _i, _n = _name){return _v.name == _n}))
}
