if(_team == team.player && !other.playerally) || _team == team.neutral
{
	with (other)
	{
		hp -= other.damage
	}
	audio_play_sound(sn_hit, 5, false)
	instance_destroy()
}
