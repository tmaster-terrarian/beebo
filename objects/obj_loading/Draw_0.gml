draw_set_font(global.fonts.basic)
draw_set_color(c_white)
draw_set_alpha(1)

draw_sprite(spr_loading_text, lod_f, lod_x, lod_y)

if(!global.hasgun)
    draw_sprite(spr_loading_icon_a, ico_f, ico_x, ico_y)
else
    draw_sprite(spr_loading_icon_b, ico_f, ico_x, ico_y)

draw_sprite(spr_loading_tip, 0, tip_x, tip_y)

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_ext(txt_x - 16, txt_y + global.fonts.offset, txt_string, txt_spacing, 222)
