draw_set_halign(fa_middle)
draw_set_valign(fa_center)
draw_set_font(fnt_itemdesc)

var c = c_black
draw_text_color(x + 1, y - 5, shortdesc, c,c,c,c, image_alpha)
c = c_ltgray
draw_text_color(x, y - 6, shortdesc, c,c,c,c, image_alpha)

c = c_black
draw_text_color(x + 1, y - 11, name, c,c,c,c, image_alpha)
c = c_white
draw_text_color(x, y - 12, name, c,c,c,c, image_alpha)
