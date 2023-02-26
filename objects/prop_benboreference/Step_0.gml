if(hp == 0 && !hit)
{
	hit = 1
	scr_particle_explode2()
	timer = 120
	audio_play_sound(sn_aaugh2, 0, false)
	audio_play_sound(sn_aaugh2, 0, false)
	audio_play_sound(sn_aaugh2, 0, false)
	audio_play_sound(sn_aaugh2, 0, false)
	audio_play_sound(sn_aaugh2, 0, false)
	audio_play_sound(sn_aaugh2, 0, false)
}
if (timer + 1) && hit
	timer--

if timer
{
	audio_play_sound(sn_player_land, 0, false)
	audio_play_sound(sn_player_land, 0, false)
	audio_play_sound(sn_player_land, 0, false)
	audio_play_sound(sn_player_land, 0, false)
	audio_play_sound(sn_player_land, 0, false)
	audio_play_sound(sn_player_land, 0, false)
	audio_play_sound(sn_player_land, 0, false)
	audio_play_sound(sn_player_land, 0, false)
	audio_play_sound(sn_player_land, 0, false)
	with(instance_create_depth(x, y - 8, depth - 1, obj_gib))
	{
		vsp = -random(1.5) - 1.5
		hsp = random_range(-4, 1)
		sprite_index = spr_bone
		image_index = irandom_range(0, 3)
		timer = 60
		explode = 1
		fric = 0.12
	}
}

if timer == -1
	instance_destroy()
