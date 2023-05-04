if other.playerally
{
	with other
	{
		hp -= other.damage
		audio_play_sound(snHurt, 0, false);
	}
	scr_particle_explode();
}
