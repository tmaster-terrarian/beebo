function _dropranditem(_x, _y)
{
	with(instance_create_depth(_x, _y, depth, obj_item))
	{
		var _array = struct_get_names(global.itemdefs)
		id = _array[irandom(array_length(_array) - 1)]
	}
}
