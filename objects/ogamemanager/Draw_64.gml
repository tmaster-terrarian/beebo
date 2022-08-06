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
