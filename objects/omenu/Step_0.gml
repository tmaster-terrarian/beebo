if(global.console) return;

//menu ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

if(menu_control)
{
    if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) || (gamepad_button_check_pressed(0, gp_padu))
    {
        menu_cursor++;
        if(menu_cursor >= menu_items)
        {
            menu_cursor = 0;
        }
        ScreenShake(2, 10);
        audio_play_sound(sn_explosion, 2, false);
    }
    if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) || (gamepad_button_check_pressed(0, gp_padd))
    {
        menu_cursor--;
        if(menu_cursor < 0)
        {
            menu_cursor = menu_items - 1;
        }
        ScreenShake(2, 10);
        audio_play_sound(sn_explosion, 2, false);
    }
    if(keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) || (gamepad_button_check_pressed(0, gp_face1)) || (gamepad_button_check_pressed(0, gp_start))
    {
        menu_x_target = gui_width + 200;
        menu_committed = menu_cursor;
        menu_control = false;
        ScreenShake(12, 60);
        audio_play_sound(sn_menu_select, 2, false);
    }

    if(keyboard_check_pressed(ord("Z"))) || (gamepad_button_check_pressed(0, gp_select))
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
        case 1: default:
            // global.t = 0;
            // global.hasgun = true;
            // global.gamestarted = true;
            // global.introcutscene = false;
            // gm_room_transition_direct(lvl1_1, TRANS_TYPE.SLOW_HORIZONTAL);
            gm_room_transition_direct(rm_lobby, TRANS_TYPE.BOX);
        break;
        case 0:
            game_end();
        break;
    }
}
