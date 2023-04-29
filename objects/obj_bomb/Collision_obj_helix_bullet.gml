if other.bla
{
	other.bla = 0
	if(instance_exists(obj_player))
	{
	    if(obj_player.hp == 1)
	    {
	        alarm[0] = 3
	        global.hitstop = 10
	    }
	    else
	    {
	        alarm[0] = 1
	    }
	}
	else
	{
	    alarm[0] = 1
	}
}
