draw_set_font(fnt_basic)
draw_set_color(c_white)
draw_set_alpha(1)

draw_sprite(spr_loading_text, lod_f, lod_x, lod_y)

if(!global.hasgun)
    draw_sprite(spr_loading_icon_a, ico_f, ico_x, ico_y)
else
    draw_sprite(spr_loading_icon_b, ico_f, ico_x, ico_y)

draw_sprite(spr_loading_tip, 0, tip_x, tip_y)

draw_text_ext(txt_x, txt_y, txt_string, txt_spacing, 222)
