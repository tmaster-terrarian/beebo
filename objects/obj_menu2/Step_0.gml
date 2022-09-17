if(keyboard_check_pressed(ord("Z")))
{
    SlideTransition(TRANS_MODE.RESPAWN, TRANS_TYPE.BOX, rMenu);
}

m_options_length = array_length(m_options[m_submenu]);

key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
key_dn = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
key_en = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)|| mouse_check_button_pressed(mb_left);

m_pos += key_dn - key_up;

if(m_pos >= m_options_length) m_pos = 0;
if(m_pos < 0) m_pos = m_options_length - 1;
// if(m_pos >= m_options_length) m_pos = m_pos - m_options_length;
// if(m_pos < 0) m_pos = m_options_length + m_pos;

if(key_up || key_dn)
{
    ScreenShake(2, 10);
    audio_play_sound(sn_explosion_loud, 2, false);
}

//selection
if(key_en)
{
    audio_play_sound(sn_menu_select, 2, false);

    switch(m_submenu)
    {
        case 0:
        {
            switch(m_pos)
            {
                case 0:
                {
                    global.screenSize++;

                    ini_open("save.ini");
                    ini_write_real("screeb", "res", global.screenSize);
                    ini_close();

                    if(global.screenSize > 9)
                    {
                        global.screenSize = 1;
                    }
                    if(global.screenSize < 9)
                    {
                        window_set_fullscreen(false);
                        window_set_size((256 * global.screenSize), (144 * global.screenSize));
                    }
                    else
                    {
                        window_set_fullscreen(true);
                    }
                    break;
                }
                case 3:
                {
                    m_submenu = 1;
                    m_options_length = array_length(m_options[m_submenu]);
                    m_pos = 0;
                    break;
                }
                case 4:
                {
                    SlideTransition(TRANS_MODE.RESPAWN, TRANS_TYPE.BOX, rMenu);
                    break;
                }
            }
            break;
        }
        case 1:
        {
            switch(m_pos)
            {
                case 0:
                {
                    break;
                }
                case 1:
                {
                    m_submenu = 0;
                    m_options_length = array_length(m_options[m_submenu]);
                    m_pos = 0;
                    break;
                }
            }
            break;
        }
    }
}
if(keyboard_check_pressed(vk_escape))
{
    switch(m_submenu)
    {
        case 0:
        {
            SlideTransition(TRANS_MODE.RESPAWN, TRANS_TYPE.BOX, rMenu);
            break;
        }
        case 1:
        {
            m_submenu = 0;
            m_options_length = array_length(m_options[m_submenu]);
            m_pos = 0;
            break;
        }
    }
}
