if(drawhp)
{
    var c = c_black
    var w = ceil(clamp(hp_max * 0.2, 32, 48))
    // var avgx = (bbox_left + bbox_right) / 2
    var avgx = x
    draw_rectangle_color(avgx - floor(w/2) - 2, bbox_top - 4, avgx + ceil(w/2) + 1, bbox_top - 13, c,c,c,c,false)

    c = c_white
    draw_rectangle_color(avgx - floor(w/2) - 1, bbox_top - 5, avgx + ceil(w/2), bbox_top - 12, c,c,c,c,false)

    draw_sprite_ext(spr_enemyhpbar, 0, avgx - floor(w/2), bbox_top - 10, w, 1, 0, c_white, 1)

    draw_sprite_ext(spr_enemyhpbar, 3, avgx - floor(w/2), bbox_top - 10, ceil((hp_change / hp_max) * w), 1, 0, c_white, 1)
    draw_sprite_ext(spr_enemyhpbar, 1, avgx - floor(w/2), bbox_top - 10, ceil((hp / hp_max) * w), 1, 0, c_white, 1)
    if(ceil(hp_change) < ceil(hp))
    {
        draw_sprite_ext(spr_enemyhpbar, 2, avgx - floor(w/2) + ceil((hp / hp_max) * w), bbox_top - 10, ceil(-(hp - hp_change)), 1, 0, c_white, 1)
    }

    buffoffsi = 0
    foreach(buffs as (buff, name, i)
    {
		var w = ceil(clamp(hp_max * 0.2, 32, 48))
        var buffsx = x - w/2
        var buffsy = bbox_top - 18
        if(buff.stacks > 0)
        {
            var spr = asset_get_index("spr_" + buff.name)
            draw_sprite((spr != -1) ? spr : spr_buff_missing, 0, buffsx + (10 * (i + buffoffsi)), buffsy)
            if(buff.stacks > 1)
            {
                draw_set_font(fnt_itemdesc); draw_set_halign(fa_right); draw_set_valign(fa_bottom)
                draw_text(buffsx + 1 + (10 * (i + buffoffsi)), buffsy + 1, string(buff.stacks))
            }
        }
        else buffoffsi--
    })
}
