if(hp <= 0) && (hit = 0)
{
    //play a funny sound here idk
	grv = 0;
	hit = 1;

	if(proj_thrower != noone)
	{
		audio_play_sound(sn_menu_select, 1, false);
		proj_thrower.hp = 0;
		scr_particle_explode();
		// hsp = lengthdir_x(4, point_direction(x, y, proj_thrower.x, proj_thrower.y));
		// vsp = lengthdir_y(4, point_direction(x, y, proj_thrower.x, proj_thrower.y));
	}
	else
	{
		MakeExplosion(x, y);
		audio_play_sound(sn_menu_select, 1, false);
		scr_particle_explode();
	}
}
