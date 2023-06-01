if(_team == team.neutral || _team == team.enemy)
{
	var _event = new damage_event(parent, other, proctype.onhit, damage, proc)

	other.hsp += lengthdir_x(2, direction)
	other.vsp += lengthdir_y(2, direction)

	oCamera.alarm[0] = 10
	instance_destroy()
}
