/// @desc SlideTransition(mode, target)
/// @arg mode set mode
/// @arg target room to transition to
function SlideTransition(_mode, _target = room)
{
	with (oGameManager)
	{
		mode = _mode;
		target = _target;
	}
}
