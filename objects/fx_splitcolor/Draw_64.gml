draw_set_font(fnt_console)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_alpha(1)

var c = c_white

draw_text_color(0, 0, "xx: " + string(xx) + ", yy: " + string(yy), c,c,c,c,1)
draw_text_color(0, 11, "red x: " + string(redx), c,c,c,c,1)
draw_text_color(0, 22, "red y: " + string(redy), c,c,c,c,1)
