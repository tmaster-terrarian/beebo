if(_id != "")
{
	_pickupitem(other, _id)
	with instance_create_depth(x, y - 6, depth, fx_pickuptext)
	{
		name = global.itemdefs[$ other._id].displayname
		shortdesc = global.itemdefs[$ other._id].shortdesc
	}
}
instance_destroy()
