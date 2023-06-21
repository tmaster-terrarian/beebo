if(item_id != "")
{
	_pickupitem(other, item_id)
	with instance_create_depth(x, y - 6, depth, fx_pickuptext)
	{
		name = global.itemdefs[$ other.item_id].displayname
		shortdesc = global.itemdefs[$ other.item_id].shortdesc
	}
}
instance_destroy()
