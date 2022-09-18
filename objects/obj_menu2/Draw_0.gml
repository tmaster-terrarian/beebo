draw_set_font(fMenu);
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
        draw_text_ext_transformed_color(m_x + m_padding + selectoffset, m_y + m_padding + (m_size * i), txt, 12, 10000, 0.5, 0.5, 0, _c, _c, _c, _c, 1);
    }
    else
    {
        draw_text_ext_transformed_color(m_x + m_padding + selectoffset, m_y + m_h - m_padding, txt, 12, 10000, 0.5, 0.5, 0, _c, _c, _c, _c, 1);
    }

    switch(m_submenu)
    {
        case 0:
        {
            switch(i)
            {
                case 0:
                {
                    if(global.screenSize == 4)
                        var _txt = string(global.screenSize) + " (Recommended)";
                    else if(global.screenSize < 7)
                        var _txt = string(global.screenSize);
                    else
                        var _txt = "FULLSCREEN";
                    draw_text_ext_transformed_color(m_x + m_padding + selectoffset + 144, m_y + m_padding + (m_size * i), _txt, 12, 10000, 0.5, 0.5, 0, _c, _c, _c, _c, 1);
                    draw_sprite_ext(spr_ui_slider, 0, m_x + m_padding + selectoffset + 108, m_y + m_padding + (m_size * i) + 4, 16, 1, 0, _c, 1);
                    draw_sprite_ext(spr_ui_slider_handle, 0, m_x + m_padding + selectoffset + 78 + round(10 * (global.screenSize - 1)), m_y + m_padding + (m_size * i) + 4, 1, 1, 0, _c, 1);
                    break;
                }
                case 1:
                {
                    draw_text_ext_transformed_color(m_x + m_padding + selectoffset + 144, m_y + m_padding + (m_size * i), string(round(global.snd_volume * 100)) + "%", 12, 10000, 0.5, 0.5, 0, _c, _c, _c, _c, 1);
                    draw_sprite_ext(spr_ui_slider, 0, m_x + m_padding + selectoffset + 108, m_y + m_padding + (m_size * i) + 4, 16, 1, 0, _c, 1);
                    draw_sprite_ext(spr_ui_slider_handle, 0, m_x + m_padding + selectoffset + 78 + round(60 * global.snd_volume), m_y + m_padding + (m_size * i) + 4, 1, 1, 0, _c, 1);
                    break;
                }
                case 2:
                {
                    draw_text_ext_transformed_color(m_x + m_padding + selectoffset + 144, m_y + m_padding + (m_size * i), string(round(global.bgm_volume * 100)) + "%", 12, 10000, 0.5, 0.5, 0, _c, _c, _c, _c, 1);
                    draw_sprite_ext(spr_ui_slider, 0, m_x + m_padding + selectoffset + 108, m_y + m_padding + (m_size * i) + 4, 16, 1, 0, _c, 1);
                    draw_sprite_ext(spr_ui_slider_handle, 0, m_x + m_padding + selectoffset + 78 + round(60 * global.bgm_volume), m_y + m_padding + (m_size * i) + 4, 1, 1, 0, _c, 1);
                    break;
                }
            }
            break;
        }
        case 2:
        {
            switch(i)
            {
                case 1:
                {
                    draw_text_ext_transformed_color(m_x + m_padding + selectoffset + 144, m_y + m_padding + (m_size * i), string(round(test_slider * 100)) + "%", 12, 10000, 0.5, 0.5, 0, _c, _c, _c, _c, 1);
                    draw_sprite_ext(spr_ui_slider, 0, m_x + m_padding + selectoffset + 108, m_y + m_padding + (m_size * i) + 4, 16, 1, 0, _c, 1);
                    draw_sprite_ext(spr_ui_slider_handle, 0, m_x + m_padding + selectoffset + 78 + round(60 * test_slider), m_y + m_padding + (m_size * i) + 4, 1, 1, 0, _c, 1);
                    break;
                }
                case 2:
                {
                    draw_sprite_ext(spr_ui_checkbox, test_checkbox, m_x + m_padding + selectoffset + 81, m_y + m_padding + (m_size * i) + 4, 1, 1, 0, _c, 1);
                    break;
                }
            }
            break;
        }
    }
}
