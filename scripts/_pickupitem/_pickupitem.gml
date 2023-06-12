function _pickupitem(_target, _id)
{
    global.__itemidarg = _id
    if(array_any(_target.items, function(_v, _i){return (_v.id == global.__itemidarg)}))
        _target.items[array_find_index(_target.items, function(_v,_i){return (_v.id == global.__itemidarg)})].stacks++
    else
        array_push(_target.items, new item(id))
}
