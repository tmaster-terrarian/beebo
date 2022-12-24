//commands console
var cam = oCamera.cam;
var offs = 2;
var xpos = oCamera.x - oCamera.view_w_half;
var ypos = oCamera.y - oCamera.view_h_half;

if(global.console == true)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_font(fMenu);

    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(xpos + 1, ypos + 1, xpos + 254, ypos + 142, false);
    draw_rectangle(xpos + 1, ypos + 1 + 128, xpos + 254, ypos + 142, false);

    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_text_ext_transformed(xpos + offs + 1, ypos + 144 - (offs + 15) + log_pos, log_str, 22, 502, 0.5, 0.5, 0);
    
    if(cursor_timer <= 30) draw_text_ext_transformed(xpos + offs + 1, ypos + 144 - offs + 1, "> " + input_str + "_", 22, 2048, 0.5, 0.5, 0);
    else draw_text_ext_transformed(xpos + offs + 1, ypos + 144 - offs + 1, "> " + input_str, 22, 2048, 0.5, 0.5, 0);
}
