if(global.show_debug)
{
    var _c = c_white;
    switch(_type)
    {
        case node_type.def: default:
            _c = c_white;
        break;
        case node_type.boss:
            _c = c_orange;
        break;
        case node_type.ai:
            _c = c_aqua;
        break;
    }
    draw_set_color(_c);

    draw_sprite_ext(spr_node, 0, x, y, 1, 1, 0, _c, 1);

    draw_set_font(fnt_console);
    draw_set_halign(fa_middle);
    draw_set_valign(fa_bottom);

    draw_text(x, y + 4, name);
}
