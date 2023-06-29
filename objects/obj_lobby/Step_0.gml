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

    var key_rth = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr)
    var key_lth = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl)

    if(hold_countdown)
        hold_countdown--

    m_pos += key_dn - key_up

    if(m_pos >= array_length(m_options)) m_pos = 0
    if(m_pos < 0) m_pos = array_length(m_options) - 1

    var m = m_options[m_pos]

    if(key_up || key_dn)
    {
        ScreenShakeCursed(1, 10)
        audio_play_sound(sn_explosion, 1, false)

        hold_countdown = 20
    }
    if((key_rt || key_lt) && (is_instanceof(m, slider) || is_instanceof(m, num_range)))
    {
        ScreenShakeCursed(1, 10)
        audio_play_sound(snShot, 1, false)

        hold_countdown = 20

        m.value += (key_rt - key_lt)
        m.value = clamp(m.value, m._min, m.range)

        m.on_input(m.value)

        m.arrow_move = 4
    }
    if((key_rth || key_lth) && (is_instanceof(m, num_range)) && (hold_countdown == 0) && (t % 5 == 1))
    {
        ScreenShakeCursed(1, 6)
        audio_play_sound(snShot, 1, false)

        m.value += (key_rth - key_lth)
        m.value = clamp(m.value, m._min, m.range)

        m.on_input(m.value)

        m.arrow_move = 4
    }
    if(key_en)
    {
        ScreenShakeCursed(1, 10)
        audio_play_sound(sn_menu_select, 2, false)

        m.on_press()
    }
}

var c = m_options[m_pos]
s_x += (c.x - s_x) / s_sp
s_y += (c.y - s_y) / s_sp
s_w += (c.w - s_w) / s_sp
s_h += (c.h - s_h) / s_sp

t++
