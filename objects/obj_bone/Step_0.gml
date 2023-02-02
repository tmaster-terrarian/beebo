if(hit) && (instance_exists(proj_thrower))
{
	if(place_meeting(x, y, proj_thrower))
	{
		scr_particle_explode();
		proj_thrower.hp = 0;
		return;
	}

	grv = 0
	hsp = lengthdir_x(1, point_direction(x, y, proj_thrower.x, proj_thrower.y)) * 4;
	vsp = lengthdir_y(1, point_direction(x, y, proj_thrower.x, proj_thrower.y)) * 4;
}
vsp += grv;
x += hsp;
y += vsp;

image_xscale *= size;
image_yscale *= size;

if(y > room_height + 10) instance_destroy();
