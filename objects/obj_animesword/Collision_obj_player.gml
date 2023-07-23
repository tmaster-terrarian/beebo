if(_team == team.neutral || _team == team.enemy)
{
	damage_event(parent, other, proctype.onhit, damage, proc)
	_inflict(other, new statmanager._bleed(parent, proc, damage))

	oCamera.alarm[0] = 10
	instance_destroy()
}
