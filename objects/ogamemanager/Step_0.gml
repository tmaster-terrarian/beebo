// screen transition stuff
if(mode != TRANS_MODE.OFF)
{
    if(mode == TRANS_MODE.INTRO)
    {
        percent = max(0, percent - max((percent / 5), 0.005));
    }
    else
    {
        percent = min(1.2, percent + max(((1.2 - percent) / trans_speed), 0.005))
    }

    if(percent == 1.2) || (percent == 0)
    {
        switch (mode)
        {
            case TRANS_MODE.INTRO:
                mode = TRANS_MODE.OFF;
            break;
            case TRANS_MODE.NEXT:
                mode = TRANS_MODE.INTRO;
                current_rm++;
                room_goto(rm_list[current_rm]);
            break;
            case TRANS_MODE.GOTO:
                mode = TRANS_MODE.INTRO;
                rm_index = 0;
                for(var i = 0; i < array_length(stages); i++)
                {
                    for(var j = 0; j < array_length(stages[i]); j++)
                    {
                        if(rm_list[rm_index] == target)
                        {
                            current_rm = rm_index;
                            ini_open("save.ini");
                            ini_write_real("savedata", "stage", i);
                            ini_close();
                            room_goto(target);
                            break;
                        }
                        rm_index++;
                    }
                }
            break;
            case TRANS_MODE.RESPAWN:
                mode = TRANS_MODE.INTRO;
                room_goto(target);
            break;
            case TRANS_MODE.RESTART:
                game_restart();
            break;
        }
    }
}

//:lollmao:
if(keyboard_check(vk_lcontrol))
{
    with(oPlayer)
    {
        x = mouse_x;
        y = mouse_y;
    }
}

//hascontrol timer or something idk
controltimer = max(0, controltimer - 1);
with(oPlayer)
{
    if(other.controltimer > 0)
    {
        hascontrol = false;
    }
    else hascontrol = true;
}
