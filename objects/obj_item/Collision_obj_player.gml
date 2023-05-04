if(def.name != "")
{
	_pickupitem(other, def)
	with instance_create_depth(x, y - 6, depth, fx_pickuptext)
	{
		name = other.def.displayname
		shortdesc = other.def.shortdesc
	}
}
instance_destroy()
