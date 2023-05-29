if(_team == team.player && !other.playerally) || _team == team.neutral
{
	var _event = new damage_event(parent, other, proctype.onhit, damage, proc)
	with(other)
	{
		x += lengthdir_x(2, point_direction(other.x, other.y, x, y))
		y += lengthdir_y(2, point_direction(other.x, other.y, x, y))
	}
	if(_team == team.player)
		audio_play_sound(sn_hit, 5, false)
	instance_destroy()
}
