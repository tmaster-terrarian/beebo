function SlideTransition(_mode, _type = TRANS_TYPE.BOX, _target = room)
{
	with (oGameManager)
	{
		mode = _mode;
		transtype = _type;
		target = _target;
	}
}

function gm_room_transition_goto(st, rm, transition_type = TRANS_TYPE.BOX)
{
	with (oGameManager)
	{
		mode = TRANS_MODE.GOTO;
		transtype = transition_type;
		target = stages[st][rm];
		target_st = st;
		target_rm = rm;
		global.playeritems = (instance_exists(obj_player)) ? obj_player.items : []
	}
}

function gm_room_transition_direct(target_room, transition_type = TRANS_TYPE.BOX)
{
	with (oGameManager)
	{
		mode = TRANS_MODE.DIRECT;
		transtype = transition_type;
		target = target_room;
		global.playeritems = (instance_exists(obj_player)) ? obj_player.items : []
	}
}

function gm_room_transition_restart(transition_type = TRANS_TYPE.BOX)
{
	with (oGameManager)
	{
		mode = TRANS_MODE.RESTART;
		transtype = transition_type;
		global.playeritems = (instance_exists(obj_player)) ? obj_player.items : []
	}
}
