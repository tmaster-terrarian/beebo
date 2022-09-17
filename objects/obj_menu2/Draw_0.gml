draw_set_font(fMenu);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

for(var i = 0; i < m_options_length; i++)
{
    var txt = m_options[m_submenu, i];

    var _c = c_ltgray;
    var selectoffset = 0;

    if(m_submenu == 0 && i == 0)
    {
        if(global.screenSize < 9)
            txt = string_insert(string(global.screenSize), txt, string_length(txt) + 1);
        else
            txt = string_insert("fullscreen", txt, string_length(txt) + 1);
    }
    if(m_submenu == 0 && i == 1)
    {
        // draw_sprite_ext(spr_ui_slider, 0, m_x + m_padding + selectoffset + (4 * 8), m_y + m_padding + (1.25 * m_size * i), 4, 1, 0, c_white, 1);
    }
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
}
