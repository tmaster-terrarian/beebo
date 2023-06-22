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
	repeat(10)
	{
		with(instance_create_depth(x + random_range(-6, 6), y - 4, depth - 1, fx_dust))
		{
			vy = random_range(-2, -1)
			vx = random_range(-1.5, 1.5)
			fric = 0.05
		}
	}
	instance_destroy()
}
