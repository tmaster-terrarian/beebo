function seq_intro_event_create()
{
	screenshaketimer = 180;
}

function seq_intro_event_destroy()
{

}

function seq_intro_event_clean_up()
{
	
}

function seq_intro_event_step()
{
	screenshaketimer--;
	if(screenshaketimer == 0)
	{
		ScreenShake(3, 180, true);
	}
}

function seq_intro_event_step_begin()
{

}

function seq_intro_event_step_end()
{

}

function seq_intro_event_async_system()
{

}