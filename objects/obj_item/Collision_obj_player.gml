if(id != "")
{
	_pickupitem(other, id)
	with instance_create_depth(x, y - 6, depth, fx_pickuptext)
	{
		name = global.itemdefs[$ id].displayname
		shortdesc = global.itemdefs[$ id].shortdesc
	}
}
instance_destroy()
