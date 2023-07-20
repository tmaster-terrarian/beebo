draw_set_font(global.fonts.basic);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for(var i = 0; i < m_options_length; i++)
{
    var txt = m_options[m_submenu, i];

    var _c = c_ltgray;
    var selectoffset = 0;

    if(m_pos == i)
    {
        _c = c_white;
        selectoffset = 2;
    }
    else
    {
        _c = c_ltgray;
        selectoffset = 0;
    }

    if(i != (m_options_length - 1))
    {
        draw_text_ext_transformed_color(m_x + m_padding + selectoffset, m_y + m_padding + (m_size * i) + global.fonts.offset, txt, 12, 10000, 1, 1, 0, _c, _c, _c, _c, 1);
    }
    else
    {
        draw_text_ext_transformed_color(m_x + m_padding + selectoffset, m_y + m_h - m_padding + global.fonts.offset, txt, 12, 10000, 1, 1, 0, _c, _c, _c, _c, 1);
    }

    switch(m_submenu)
    {
        case 0:
        {
            switch(i)
            {
                case 0:
                {
                    if(global.screenSize < 7)
                        var _txt = string(global.screenSize);
                    else
                        var _txt = "FULLSCREEN";
                    draw_text_ext_transformed_color(m_x + m_padding + selectoffset + 161, m_y + m_padding + (m_size * i) + global.fonts.offset, _txt, 12, 10000, 1, 1, 0, _c, _c, _c, _c, 1);
                    draw_sprite_ext(spr_ui_slider, 0, m_x + m_padding + selectoffset + 125, m_y + m_padding + (m_size * i) + 4, 16, 1, 0, _c, 1);
                    draw_sprite_ext(spr_ui_slider_handle, 0, m_x + m_padding + selectoffset + 95 + round(10 * (global.screenSize - 1)), m_y + m_padding + (m_size * i) + 4, 1, 1, 0, _c, 1);
                    break;
                }
                case 1:
                {
                    draw_text_ext_transformed_color(m_x + m_padding + selectoffset + 161, m_y + m_padding + (m_size * i) + global.fonts.offset, string(round(global.snd_volume * 100)) + "%", 12, 10000, 1, 1, 0, _c, _c, _c, _c, 1);
                    draw_sprite_ext(spr_ui_slider, 0, m_x + m_padding + selectoffset + 125, m_y + m_padding + (m_size * i) + 4, 16, 1, 0, _c, 1);
                    draw_sprite_ext(spr_ui_slider_handle, 0, m_x + m_padding + selectoffset + 95 + round(60 * global.snd_volume), m_y + m_padding + (m_size * i) + 4, 1, 1, 0, _c, 1);
                    break;
                }
                case 2:
                {
                    draw_text_ext_transformed_color(m_x + m_padding + selectoffset + 161, m_y + m_padding + (m_size * i) + global.fonts.offset, string(round(global.bgm_volume * 100)) + "%", 12, 10000, 1, 1, 0, _c, _c, _c, _c, 1);
                    draw_sprite_ext(spr_ui_slider, 0, m_x + m_padding + selectoffset + 125, m_y + m_padding + (m_size * i) + 4, 16, 1, 0, _c, 1);
                    draw_sprite_ext(spr_ui_slider_handle, 0, m_x + m_padding + selectoffset + 95 + round(60 * global.bgm_volume), m_y + m_padding + (m_size * i) + 4, 1, 1, 0, _c, 1);
                    break;
                }
                case 4:
                {
                    draw_sprite_ext(spr_ui_checkbox, global.speedrun_mode, m_x + m_padding + selectoffset + 98, m_y + m_padding + (m_size * i) + 4, 1, 1, 0, _c, 1);
                    break;
                }
                case 5:
                {
                    draw_sprite_ext(spr_ui_checkbox, global.rich_presence, m_x + m_padding + selectoffset + 98, m_y + m_padding + (m_size * i) + 4, 1, 1, 0, _c, 1);
                    break;
                }
                case 6:
                {
                    draw_text_ext_transformed_color(m_x + m_padding + selectoffset + 161, m_y + m_padding + (m_size * i) + global.fonts.offset, string(round(global.fx_bias * 100)) + "%", 12, 10000, 1, 1, 0, _c, _c, _c, _c, 1);
                    draw_sprite_ext(spr_ui_slider, 0, m_x + m_padding + selectoffset + 125, m_y + m_padding + (m_size * i) + 4, 16, 1, 0, _c, 1);
                    draw_sprite_ext(spr_ui_slider_handle, 0, m_x + m_padding + selectoffset + 95 + round(60 * global.fx_bias), m_y + m_padding + (m_size * i) + 4, 1, 1, 0, _c, 1);
                    break;
                }
            }
            break;
        }
        case 2:
        {
            switch(i)
            {
                case 0:
                {
                    var _txt = language_names[language_selection]
                    draw_text_ext_transformed_color(m_x + m_padding + selectoffset + 52, m_y + m_padding + (m_size * i) + global.fonts.offset, _txt, 12, 10000, 1, 1, 0, _c, _c, _c, _c, 1);
                    draw_text_ext_transformed_color(m_x + m_padding + selectoffset, m_y + m_padding + (m_size * (i + 1)) + global.fonts.offset, "Relaunch to apply change", 12, 10000, 1, 1, 0, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
                    break;
                }
            }
            break
        }
        case 3:
        {
            switch(i)
            {
                case 1:
                {
                    draw_text_ext_transformed_color(m_x + m_padding + selectoffset + 151, m_y + m_padding + (m_size * i) + global.fonts.offset, string(round(test_slider * 100)) + "%", 12, 10000, 1, 1, 0, _c, _c, _c, _c, 1);
                    draw_sprite_ext(spr_ui_slider, 0, m_x + m_padding + selectoffset + 115, m_y + m_padding + (m_size * i) + 4, 16, 1, 0, _c, 1);
                    draw_sprite_ext(spr_ui_slider_handle, 0, m_x + m_padding + selectoffset + 85 + round(60 * test_slider), m_y + m_padding + (m_size * i) + 4, 1, 1, 0, _c, 1);
                    break;
                }
                case 2:
                {
                    draw_sprite_ext(spr_ui_checkbox, test_checkbox, m_x + m_padding + selectoffset + 88, m_y + m_padding + (m_size * i) + 4, 1, 1, 0, _c, 1);
                    break;
                }
            }
            break;
        }
    }
}
