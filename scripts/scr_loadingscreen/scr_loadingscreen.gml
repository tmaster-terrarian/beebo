function scr_loadingscreen(rm, txt)
{
	if(txt == "") return;
    else
    {
        global.loading_rm = rm
        global.loading_txt = txt
        room_goto(loading)
    }
}
