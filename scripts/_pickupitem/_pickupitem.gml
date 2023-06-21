function _pickupitem(_target, item_id)
{
    global.__itemidarg = item_id
    if(array_any(_target.items, function(_v, _i){return (_v.item_id == global.__itemidarg)}))
        _target.items[array_find_index(_target.items, function(_v,_i){return (_v.item_id == global.__itemidarg)})].stacks++
    else
        array_push(_target.items, new inventory_item(item_id))
}
