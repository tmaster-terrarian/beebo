if global.console
    return;

if(caninput)
{
    if(keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0, gp_face2))
        gm_room_transition_direct(rMenu, TRANS_TYPE.BOX)

    var key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || gamepad_button_check_pressed(0, gp_padu)
    var key_dn = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || gamepad_button_check_pressed(0, gp_padd)
    var key_rt = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || gamepad_button_check_pressed(0, gp_padr)
    var key_lt = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || gamepad_button_check_pressed(0, gp_padl)
    var key_en = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1)

    m_pos += key_dn - key_up

    if(m_pos >= array_length(m_options)) m_pos = 0
    if(m_pos < 0) m_pos = array_length(m_options) - 1

    if(key_up || key_dn)
    {
        ScreenShakeCursed(1, 10)
        audio_play_sound(sn_explosion, 1, false)
    }
    if((key_rt || key_lt) && (is_instanceof(m_options[m_pos], slider)))
    {
        ScreenShakeCursed(1, 10)
        audio_play_sound(snShot, 1, false)

        var m = m_options[m_pos]
        m.value += (key_rt - key_lt)
        m.value = clamp(m.value, 0, m.range)
    }
    if(key_en)
    {
        audio_play_sound(sn_menu_select, 2, false)
        ScreenShakeCursed(1, 10)
        m_options[m_pos].on_press()
    }
}

var c = m_options[m_pos]
s_x += (c.x - s_x) / s_sp
s_y += (c.y - s_y) / s_sp
s_w += (c.w - s_w) / s_sp
s_h += (c.h - s_h) / s_sp
