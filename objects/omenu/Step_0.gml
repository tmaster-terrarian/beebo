if(global.console) return;

//menu ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

if(menu_control)
{
    if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
    {
        menu_cursor++;
        if(menu_cursor >= menu_items)
        {
            menu_cursor = 0;
        }
        ScreenShake(2, 10);
        audio_play_sound(sn_explosion, 2, false);
    }
    if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
    {
        menu_cursor--;
        if(menu_cursor < 0)
        {
            menu_cursor = menu_items - 1;
        }
        ScreenShake(2, 10);
        audio_play_sound(sn_explosion, 2, false);
    }
    if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
    {
        menu_x_target = gui_width + 200;
        menu_committed = menu_cursor;
        menu_control = false;
        ScreenShake(12, 60);
        audio_play_sound(sn_menu_select, 2, false);
    }

    // if(mouse_y < menu_y) && (mouse_y > menu_top) && (mouse_x > menu_x - 128)
    // {
    //     menu_cursor = floor(menu_y - mouse_y) div (menu_itemheight * 1);
    //     if(menu_cursor != last_cursor_pos)
    //     {
    //         ScreenShake(1, 5);
    //         audio_play_sound(sn_explosion, 2, false);
    //     }
    //     if(mouse_check_button_pressed(mb_left))
    //     {
    //         menu_x_target = gui_width + 200;
    //         menu_committed = menu_cursor;
    //         menu_control = false;
    //         ScreenShake(12, 60);
    //         audio_play_sound(sn_menu_select, 2, false);
    //     }
    // }

    if(keyboard_check_pressed(ord("Z")))
    {
        // "TRANS_MODE.RESPAWN" is just a basic version of "TRANS_MODE.GOTO"
            // why did I do this
                // btw these comments are now outdated lmao

        gm_room_transition_direct(rm_settings, TRANS_TYPE.BOX);
    }
}

if (menu_x > gui_width + 100) && (menu_committed != -1)
{
    switch (menu_committed)
    {
        case 2:
            ini_open("save.ini");
            var stage = ini_read_real("savedata", "stage", 0);
            ini_close();
            gm_room_transition_goto(stage, 0, TRANS_TYPE.SLOW_HORIZONTAL);
        break;
        case 1: default:
            gm_room_transition_goto(0, 0, TRANS_TYPE.SLOW_HORIZONTAL);
        break;
        case 0:
            game_end();
        break;
    }
}
