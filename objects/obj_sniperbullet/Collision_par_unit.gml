if(other.bulletproof && _team == team.player)
{
	instance_destroy()
}
else
{
	other.hsp += lengthdir_x(2, direction)
	other.vsp += lengthdir_y(2, direction)
	event_inherited()
}
