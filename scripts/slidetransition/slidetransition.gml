function SlideTransition(_mode, _type = TRANS_TYPE.BOX, _target = room)
{
	with (oGameManager)
	{
		mode = _mode;
		transtype = _type;
		target = _target;
	}
}

function gm_room_transition_goto(st, rm, _x = -1, _y = -1, transition_type = TRANS_TYPE.BOX)
{
	with (oGameManager)
	{
		mode = TRANS_MODE.GOTO;
		transtype = transition_type;
		target = stages[st, rm];
		target_st = st;
		target_rm = rm;
	}
	with(obj_player)
	{
		x = (_x != -1) ? _x : x
		y = (_y != -1) ? _y : y
	}
}

function gm_room_transition_direct(target_room, _x = -1, _y = -1, transition_type = TRANS_TYPE.BOX)
{
	with (oGameManager)
	{
		mode = TRANS_MODE.DIRECT;
		transtype = transition_type;
		target = target_room;
	}
	with(obj_player)
	{
		x = (_x != -1) ? _x : x
		y = (_y != -1) ? _y : y
	}
}

function gm_room_transition_restart(transition_type = TRANS_TYPE.BOX)
{
	with (oGameManager)
	{
		mode = TRANS_MODE.RESTART;
		transtype = transition_type;
	}
}

function gm_room_transition_softrestart(transition_type = TRANS_TYPE.BOX)
{
	with (oGameManager)
	{
		mode = TRANS_MODE.SOFTRESTART;
		transtype = transition_type;
	}
}
