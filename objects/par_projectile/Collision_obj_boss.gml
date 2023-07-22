if(_team == team.neutral || _team == team.player)
{
	crit = (random(1) < parent.crit_chance)
	with (other)
	{
	    hp -= other.damage * (2 * other.crit);
	    flash = 3;
	}
	if(_team == team.player)
	{
		if(!crit)
			audio_play_sound(sn_hit, 5, false)
		else
			audio_play_sound(sn_hit_crit, 5, false)
	}
	instance_destroy();
}
