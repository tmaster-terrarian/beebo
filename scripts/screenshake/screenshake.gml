function ScreenShake(_magnitude, _frames, _stop_player = false)
{
	with(oCamera)
	{
		if (_magnitude > shake_remain)
		{
			shake_magnitude = _magnitude;
			shake_remain = _magnitude;
			shake_length = _frames;
			if(_stop_player)
			{
				oGameManager.controltimer = _frames;
			}
		}
	}
}
