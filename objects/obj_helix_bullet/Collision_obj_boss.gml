if(_team == team.neutral || _team == team.player)
{
	with (other)
	{
		hp -= other.damage;
		flash = 3;
	}
	audio_play_sound(sn_hit, 5, false)
	instance_destroy()
}
