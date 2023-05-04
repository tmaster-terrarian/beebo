function _pickupitem(target, def)
{
    if(array_any(target.items, function(_v, _i){return _v.name == def.name}))
        target.items[array_find_index(target.items, function(_v,_i){return (_v.name == def.name)})].stacks++
    else
        array_push(target.items, def)
}
