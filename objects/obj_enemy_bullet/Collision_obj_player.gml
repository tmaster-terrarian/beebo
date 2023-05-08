if(_team == team.neutral || _team == team.enemy)
{
	with (other)
	{
		hp -= other.damage
	}
	oCamera.alarm[0] = 10
	scr_disintigrate()
}
