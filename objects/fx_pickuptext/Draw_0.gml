var txt = scribble("[fnt_basic][d#" + string(itemdata.rarity_colors[global.itemdefs[$ item_id].rarity]) + "]" + name + "[/color]\n[fnt_itemdesc][c_ltgray]" + shortdesc + "[/color]")
.starting_format("fnt_itemdesc", c_ltgray)
.blend(c_white, image_alpha)
.wrap(128)

txt.flash(c_black, 1).draw(x - 61, y + 21)
txt.flash(c_black, 0).draw(x - 62, y + 20)

var _spr = asset_get_index("spr_item_" + item_id)
draw_sprite_outlined_ext((_spr != -1) ? _spr : spr_buff_missing, 0, x - 74, y + 32, 1, 1, 0, c_white, (_spr != -1) ? itemdata.rarity_colors[global.itemdefs[$ item_id].rarity] : itemdata.rarity_colors.none, image_alpha, image_alpha, 0)
