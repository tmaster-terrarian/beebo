function _pickupitem(target, def)
{
    _def = def
    if(array_any(target.items, function(_v, _i){return _v.name == _def.name}))
        target.items[array_find_index(target.items, function(_v,_i){return (_v.name == _def.name)})].stacks++
    else
        array_push(target.items, _def)
}
