// screen transition stuff

if(mode != TRANS_MODE.OFF)
{
    switch(transtype)
    {
        case TRANS_TYPE.BOX: default:
            trans_speed = 5;
            draw_set_color(c_black);
            draw_rectangle(0, 0, w, percent * h_half, false);
            draw_rectangle(0, h, w, h - (percent * h_half), false);
            draw_rectangle(0, 0, percent * w_half, h, false);
            draw_rectangle(w, 0, w - (percent * w_half), h, false);
        break;
        case TRANS_TYPE.SLOW_HORIZONTAL:
            trans_speed = 30;
            draw_set_color(c_black);
            draw_rectangle(0, 0, w, percent * h_half, false);
            draw_rectangle(0, h, w, h - (percent * h_half), false);
        break;
    }
}

if(global.speedrun_mode) && (global.gamestarted)
{
    draw_set_color(c_white);
    draw_set_font(fnt_console);
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);

    var centiseconds = global.t - 100/60;
    var cs = floor(centiseconds % 100);
    var seconds = floor((centiseconds / 100) % 60);
    var minutes = floor((centiseconds / (100 * 60)) % 60);

    if(minutes < 10) minutes = "0" + string(minutes);
    if(seconds < 10) seconds = "0" + string(seconds);
    if(cs < 10) cs = "0" + string(cs);

    draw_text(254, 2, string(minutes) + ":" + string(seconds) + "." + string(cs));
    if(global.gunlesspercent)
    {
        draw_text(254, 12, "gunless%");
    }
}
