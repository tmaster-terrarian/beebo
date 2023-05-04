if(drawhp)
{
    var c = c_black
    var w = clamp(hp_max * 0.5, 32, 48)
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
}
