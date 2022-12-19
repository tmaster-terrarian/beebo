if(!hit)
{
	vsp += grv;

	//move and collisions
	//horizontal
	// if (place_meeting(x + hsp, y, oWall))
	// {
	//     scr_disintigrate();
	// }
	x += hsp;

	//vertical
	// if (place_meeting(x, y + vsp, oWall))
	// {
	//     scr_disintigrate();
	// }
	y += vsp;
}
else
{
	x += hsp;
	y += vsp;

	if(place_meeting(x, y, proj_thrower))
	{
		scr_particle_explode();
	}
}

if(hsp != 0) image_xscale = sign(hsp) * size;
image_yscale *= size;

if(y > room_height + 10) instance_destroy();
