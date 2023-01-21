function node_create(_x, _y, _type = node_type.def, _name = "node")
{
	var _node = instance_create_depth(_x, _y, 1, obj_node);
	_node._type = _type;
	_node.name = _name
	return _node;
}
