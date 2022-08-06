function SlideTransition(_mode, _type = TRANS_TYPE.BOX, _target = room)
{
	with (oGameManager)
	{
		mode = _mode;
		transtype = _type;
		target = _target;
	}
}
