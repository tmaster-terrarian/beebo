//screen transition
if(mode != TRANS_MODE.OFF)
{
    switch(transtype)
    {
        case TRANS_TYPE.NONE:
            trans_speed = 1;
        break;
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

//console draw
var offs = 2;
if(global.console == true)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_font(fnt_console);

    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(1, 1, 254, 142, false);

    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_text_ext(offs + 1, 144 - (offs + 15) + log_pos, log_str, 10, 251);

    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(1, 1 + 128, 254, 142, false);

    draw_set_color(c_white);
    draw_set_alpha(1);
    if(cursor_timer <= 30)
        draw_text_ext(offs + 1, 144 - offs + 4, "> " + input_str + "_", 0, 1024);
    else
        draw_text_ext(offs + 1, 144 - offs + 4, "> " + input_str, 0, 1024);
}

//speedrun timer
if(global.speedrun_mode) && (global.gamestarted)
{
    draw_set_color(c_white);
    draw_set_font(fnt_console);
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);

    var centiseconds = global.t;
    var cs = floor(centiseconds % 100);
    var seconds = floor((centiseconds / 100) % 60);
    var minutes = floor((centiseconds / (100 * 60)) % 60);

    if(minutes < 10) minutes = "0" + string(minutes);
    if(seconds < 10) seconds = "0" + string(seconds);
    if(cs < 10) cs = "0" + string(cs);

    draw_text(254, 2, string(minutes) + ":" + string(seconds) + "." + string(cs));
}

if(global.draw_debug)
{
    draw_set_color(c_white)
    draw_set_font(fnt_basic)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)

    if(instance_exists(obj_player))
    {
        if(!obj_player.on_ground)
            draw_set_color(c_yellow)
        draw_text(2, 25, "x: " + string(obj_player.x) + " (" + string(floor(obj_player.x / 16)) + ")")
        draw_text(2, 35, "y: " + string(obj_player.y) + " (" + string(floor(obj_player.y / 16)) + ")")
        draw_set_color(c_white)

        draw_text(76, 25, "hsp: " + string(obj_player.hsp))
        draw_text(76, 35, "vsp: " + string(obj_player.vsp))

        if(obj_player.state != "normal")
            draw_set_color(c_yellow)
        draw_text(2, 50, "state: " + obj_player.state)
        draw_set_color(c_white)

        draw_text(2, 65, "spr: " + sprite_get_name(obj_player.sprite_index))
        draw_text(2, 75, "img: " + string(floor(obj_player.image_index)))
    }

    if(instance_exists(obj_player_dead))
    {
        draw_text(2, 25, "dead")
    }
}
