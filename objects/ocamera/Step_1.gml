if(instance_exists(follow)) && (usefollow)
{
    xTo = follow.x
    yTo = follow.y

    if(follow == obj_player) && (!keyboard_check(vk_lcontrol))
    {
        xTo = follow.x + (sign(follow.facing) * 12)
        yTo = follow.y - 12 - follow.lookup * 24 + follow.vsp * global.dt
    }
}

if(array_length(item_pickup_queue) > 0 && !instance_exists(fx_pickuptext))
{
    var item_id = array_shift(item_pickup_queue)

    var _i = instance_create_depth(0, 0, 0, fx_pickuptext)
    _i.name = getdef(item_id).displayname
    _i.shortdesc = getdef(item_id).shortdesc
    _i.item_id = item_id
}
