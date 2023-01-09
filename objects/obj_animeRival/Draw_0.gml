draw_self();

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(fnt_console);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(x + 16, y + 16, string(timer0));
