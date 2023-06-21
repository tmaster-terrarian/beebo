function _dropranditem(_x, _y, _table = itemdata.item_tables.any_obtainable)
{
	with(instance_create_depth(_x, _y, depth, obj_item, {table: _table}))
	{
		item_id = item_id_get_random(1, _table)
	}
}
