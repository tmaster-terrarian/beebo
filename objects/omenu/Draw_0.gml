draw_set_font(menu_font);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++)
{
    var offset = 2;
    var txt = menu[i];
    if(menu_cursor == i)
    {
        txt = string_insert("> ", txt, 0);
        //txt = string_insert(" <", txt, string_length(txt));
        var col = c_white;
        var selectoffset = 6;
    }
    else
    {
        var col = c_gray;
        var selectoffset = 0;
    }
    ini_open("save.ini");
    if(ini_section_exists("savedata")) && (i == 2)
    {
        //var stage = ini_read_real("savedata", "stage", 0);
        //txt = string_insert(" <" + gamemanager.stage_names[stage] + ">", txt, string_length(txt) + 1);
    }
    else if(i == 2) {menu_items = array_length(menu) - 1; menu_cursor = 1;}
    ini_close();
    var xx = round(menu_x);
    var yy = round(menu_y) - (menu_itemheight * i);
    draw_set_color(c_black);
    draw_text(xx + offset - selectoffset, yy, txt);          //right
    draw_text(xx - offset - selectoffset, yy, txt);          //left
    draw_text(xx - selectoffset, yy + offset, txt);          //bottom
    draw_text(xx - selectoffset, yy - offset, txt);          //top
    draw_text(xx + offset - selectoffset, yy + offset, txt); //bottom right
    draw_text(xx + offset - selectoffset, yy - offset, txt); //top right
    draw_text(xx - offset - selectoffset, yy + offset, txt); //bottom left
    draw_text(xx - offset - selectoffset, yy - offset, txt); //top left
    draw_set_color(col);
    draw_text(xx - selectoffset, yy, txt);
}
