// screen transition stuff
if(mode != TRANS_MODE.OFF)
{
    if(mode == TRANS_MODE.ACTIVE) || (mode == TRANS_MODE.ACTIVE2)
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
            case TRANS_MODE.ACTIVE:
                mode = TRANS_MODE.OFF;
            break;
            case TRANS_MODE.ACTIVE2:
                mode = TRANS_MODE.OFF;
            break;
            case TRANS_MODE.NEXT:
                mode = TRANS_MODE.ACTIVE;
                current_rm += 1;
                console_log("loading room (mode: next): " + string(room_get_name(rm_list[current_rm]) + " (" + string(current_st) + ", " + string(current_rm) + ")"));
                room_goto(rm_list[current_rm]);
            break;
            case TRANS_MODE.GOTO: //can only be used in level progression
                mode = TRANS_MODE.ACTIVE;
                current_st = target_st;
                var _ind = array_find_index(rm_list, function(_v, _i){return(_v == stages[target_st][target_rm])})
                if(_ind != -1)
                {
                    current_rm = _ind;
                    console_log("loading room (mode: goto): " + string(room_get_name(rm_list[current_rm]) + " (" + string(target_st) + ", " + string(target_rm) + ")"));
                    room_goto(rm_list[current_rm]);
                    break;
                }
                else console_log("gm_room_transition_goto(" + string(target_st) + ", " + string(target_rm) + ") failed! room and/or stage index is out of bounds or room does not exist.");
            break;
            case TRANS_MODE.DIRECT: //best used outside of level progression unless target is the current room
                mode = TRANS_MODE.ACTIVE2; // avoid saving with direct
                console_log("loading room (mode: direct): '" + string(room_get_name(target)) + "' [warning: stage will not be saved!]");
                room_goto(target);
            break;
            case TRANS_MODE.RESTART:
                game_restart();
            break;
        }

        if(mode == TRANS_MODE.ACTIVE)
        {
            for(var i = 0; i < array_length(stages); i++)
            {
                if(array_any(stages[i], function(_v, _i){return(_v == rm_list[current_rm])}))
                {
                    current_st = i;
                    ini_open("save.ini");
                    if(current_st != ini_read_real("savedata", "stage", 0)) ini_write_real("savedata", "time_in_centiseconds", global.t);
                    ini_write_real("savedata", "stage", current_st);
                    ini_close();
                    console_log("saved (" + string(current_st) + "), " + string(global.t));
                    break;
                }
            }
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
if(!global.console) controltimer = max(0, controltimer - 1);
with(oPlayer)
{
    if(other.controltimer > 0)
    {
        hascontrol = false;
    }
    else hascontrol = true;
}

//console
if(keyboard_check_pressed(vk_f1))
{
    global.console = true;
    input_str = "";
    controltimer = 99999999;
}
if(global.console)
{
    cursor_timer = max(0, cursor_timer - 1);
    if(cursor_timer == 0) cursor_timer = 60;

    if(keyboard_check(vk_lshift))
    {
        log_pos += mouse_wheel_up() * 32;
        log_pos -= mouse_wheel_down() * 32;
    }
    else
    {
        log_pos += mouse_wheel_up() * 8;
        log_pos -= mouse_wheel_down() * 8;
    }

    log_pos = max(log_pos, 0);

    if(keyboard_check_pressed(vk_escape))
    {
        global.console = false;
        input_str = "";
        keyboard_string = "";
        controltimer = 0;
    }

    if(keyboard_check_pressed(vk_up))
    {
        input_str = last_input_str;
        keyboard_string = last_input_str;
    }

    if(keyboard_check_pressed(vk_enter))
    {
        //basic one-word commands
        switch(input_str)
        {
            default:
            {
                if(keyboard_string != "") console_log("| " + keyboard_string);
                break;
            }
            case "clear":
            {
                log_str = "";
                break;
            }
            case "restart":
            {
                gm_room_transition_restart();
                break;
            }
            case "goto_next":
            {
                gm_room_transition_next();
                break;
            }

            case "benbo":
            {
                console_log("fuck you");
                break;
            }

            case "animemode":
            {
                global.animemode = !global.animemode;
                if(global.animemode == 1) console_log("wtf??!??!?!?");
                break;
            }

            case "impulse 101":
            {
                with(obj_gun_pickup) instance_destroy();
                if(!instance_exists(oGun))
                {
                    with(oPlayer)
                    {
                        instance_create_depth(x, y, 300, oGun);
                    }
                    global.hasgun = true;
                    global.gunlesspercent = false;
                    ini_open("save.ini");
                    ini_write_real("savedata", "g", global.hasgun);
                    ini_close();
                }
                break;
            }
        }

        //more complicated argument-based commands
        if(cmd("goto"))
        {
            var _args = string_split(input_str, " ");
            if(array_length(_args) == 3)
            {
                gm_room_transition_goto(_args[1], real(_args[2]));
            }
            else if(array_length(_args) == 2)
            {
                gm_room_transition_goto(_args[1], 0);
            }
            else if(array_length(_args) == 1)
            {
                gm_room_transition_direct(room);
            }
            else console_log("invalid arguments! correct syntax: goto [stage_index] [room_index]");
        }

        if(cmd("config_write"))
        {
            var _args = string_split(input_str, " ");
            if(array_length(_args) == 3)
            {
                ini_open("save.ini");
                ini_write_real("settings", _args[1], real(_args[2]))
                ini_close();

                // screenSize refresh
                if(global.screenSize < 1)
                {
                    global.screenSize = 1;
                }
                if(global.screenSize > 7)
                {
                    global.screenSize = 7;
                }
                if(global.screenSize < 7)
                {
                    window_set_fullscreen(false);
                    window_set_size((256 * global.screenSize), (144 * global.screenSize));
                }
                else
                {
                    window_set_fullscreen(true);
                }

                // snd_volume / bgm_volume refresh
                global.snd_volume = clamp(global.snd_volume, 0, 1);
                audio_group_set_gain(audiogroup_default, global.snd_volume, 0);
                global.bgm_volume = clamp(global.bgm_volume, 0, 1);
                audio_group_set_gain(audiogroup_default, global.bgm_volume, 0);

                console_log("set value '" + string(_args[1]) + "' to " + string(_args[2]));
            }
            else console_log("invalid arguments! correct syntax: config_write <key> <value>");
        }

        if(cmd("config_read"))
        {
            var _args = string_split(input_str, " ");
            if(array_length(_args) == 2)
            {
                ini_open("save.ini");
                var _val = ini_read_real("settings", _args[1], -1)
                ini_close();
                if(_val != -1) console_log("'" + string(_args[1]) + "' = " + string(_val));
                else console_log("'" + string(_args[1]) + "' is either unset or does not exist.");
            }
            else console_log("invalid arguments! correct syntax: config_read <key>");
        }

        last_input_str = input_str;
        keyboard_string = "";
    }
    input_str = keyboard_string;
}
else keyboard_string = "";

cmd = function(command)
{
    return string_starts_with(input_str, string(command));
}

if(global.speedrun_mode) && (global.gamestarted) && (!global.pausetimer) && (!global.introsequence)
{
    global.t += 100/60;
}
