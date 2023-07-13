function get_nearest_notme(_x, _y, inst)
{
	var __x = _x
	var __y = _y
	x -= 1000000
	y -= 1000000
	var _inst = instance_nearest(__x, __y, inst)
	x += 1000000
	y += 1000000
	return (_inst != id) ? _inst : noone
}
