if(_team == team.player && !other.playerally) || _team == team.neutral
{
	with(other)
	{
		var proc = other.proc
		hp -= other.damage
		x += lengthdir_x(2, other.direction)
		with(obj_player)
		    if(irandom_range(1, 10) <= round(_calcitem("eviction_notice", self) * 10 * proc))
		        _inflict(other, new statmanager._bleed())
	}
	audio_play_sound(sn_hit, 5, false)
	instance_destroy()
}
