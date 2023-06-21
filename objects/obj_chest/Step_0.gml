if(hp <= 0) && !dead
{
	dead = 1
	_dropranditem(x, y - 12 * image_yscale, table)
	with(instance_create_depth(x, y, depth, obj_empty))
	{
		sprite_index = other.sprite_index
		image_yscale = other.image_yscale
		image_index = 1
	}
	instance_destroy()
}
