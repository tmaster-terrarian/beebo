if(has_triggered == false)
{
	has_triggered = true;
	with (oPlayer)
	{
		ScreenShake(other.magnitude, other.duration, other.stop_player);
	}
}
