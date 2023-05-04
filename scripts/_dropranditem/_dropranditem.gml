// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function _dropranditem(_x, _y)
{
	with(instance_create_depth(_x, _y, depth, obj_item))
	{
		def = choose(new _itemdef_beeswax(), new _itemdef_eviction_notice(), new _itemdef_amorphous_plush())
	}
}
