if (done == false)
{
	hsp = move;
	vsp += grv;

    //move and collisions
    //horizontal
	if (oob == false)
    if (place_meeting(x + hsp, y, oWall))
    {
        while (!place_meeting(x + sign(hsp), y, oWall))
        {
            x += sign(hsp);
        }
        hsp = 0;
    }
    x += hsp;

    //vertical
	if (oob == false)
    if (place_meeting(x, y + vsp, oWall))
    {
        if (vsp > 0)
        {
            done = true;
			audio_play_sound(sn_antic_gyui, 1, false);
			room_speed = 30;
        }
        while (!place_meeting(x, y + sign(vsp), oWall))
        {
            y += sign(vsp);
        }
        vsp = 0;
    }
    y += vsp;
}
else
{
	if(oob == true)
	{
		vsp -= grv;

		xTo = oCamera.x;
		yTo = oCamera.y;

		x += (xTo - x) / 6;
		y += (yTo - y) / 6;
	}

	bg.x = camera_get_view_x(cam) - 8;
	bg.y = camera_get_view_y(cam) - 8;

	with(obj_gun_dead)
	{
		done = true;
		image_angle -= 10;
		xTo = other.x;
		yTo = other.y - 4;

		x += (xTo - x) / 6;
		y += (yTo - y) / 6;
	}
	explosiontimer--;
    if(explosiontimer < 0)
    {
		if(timer_finished == false)
		{
			timer_finished = true;
			with(oCrate) hp = 0;
			with(obj_enemy) hp = 0;
			with(obj_gun_dead) scr_particle_explode();
			audio_play_sound(snBigExplode, 10, false);
			x = round(x);
			y = round(y);
			room_speed = 60;
		}

		var posx = random_range(x - 16, x + 16);
		var posy = random_range(y - 16, y + 16);
		var chance = random_range(1, 4);

		if(chance > 3)
		{
			shake_length = 20;
			shake_magnitude = 2;
			shake_remain = 2;
			ScreenShake(4, 20);
			MakeExplosion(posx, posy, 4, 4, 2, sn_explosion, depth + 150);
		}
    }
	if(explosiontimer == -5)
	{
		with(obj_pixel)
		{
			active = 1;
			deact = 10;
			ticker = 10;
			image_alpha = 10;
			hspeed *= lengthdir_x(10, point_direction(x, y, other.x, other.y));
			vspeed *= lengthdir_y(-10, point_direction(x, y, other.x, other.y));
		}
	}
}
bg.image_alpha = (-1 * (explosiontimer / 40) + 1);

if(keyboard_check_pressed(vk_space)) || (keyboard_check_pressed(vk_enter))
{
	global.playerhealth = hp_max;
	with(oGameManager) { audio_sound_gain(current_bgm, global.bgm_volume, 500); audio_sound_set_track_position(current_bgm, 0); }
	room_speed = 60;
	scr_particle_explode2();
	SlideTransition(TRANS_MODE.RESPAWN, TRANS_TYPE.BOX, rm);
}
