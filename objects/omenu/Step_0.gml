//menu ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

if(menu_control)
{
    if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
    {
        menu_cursor++;
        ScreenShake(2, 10);
        if(menu_cursor >= menu_items)
        {
            menu_cursor = 0;
        }
        audio_play_sound(sn_explosion_loud, 2, false);
    }
    if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
    {
        menu_cursor--;
        ScreenShake(2, 10);
        if(menu_cursor < 0)
        {
            menu_cursor = menu_items - 1;
        }
        audio_play_sound(sn_explosion_loud, 2, false);
    }
    if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))
    {
        menu_x_target = gui_width + 200;
        menu_committed = menu_cursor;
        ScreenShake(12, 60);
        menu_control = false;
        audio_play_sound(sn_menu_select, 2, false);
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
            SlideTransition(TRANS_MODE.GOTO, TRANS_TYPE.SLOW_HORIZONTAL, gamemanager.stages[stage][0]);
        break;
        case 1: default:
            SlideTransition(TRANS_MODE.NEXT, TRANS_TYPE.SLOW_HORIZONTAL);
        break;
        case 0:
            game_end();
        break;
    }
}
