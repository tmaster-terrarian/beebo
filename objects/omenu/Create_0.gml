gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 16;

menu_x = gui_width + 200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 5; // lower is faster
menu_font = fMenu;
menu_itemheight = font_get_size(menu_font);
menu_committed = -1;
menu_control = true;

menu[2] = "continued";
menu[1] = "new";
menu[0] = "rage quit";

menu_items = array_length_1d(menu);
menu_cursor = 2;

ini_open("save.ini");
if(ini_key_exists("screeb", "res"))
{
    global.screenSize = round(ini_read_real("screeb", "res", 1));
    if(global.screenSize < 9)
    {
        window_set_fullscreen(false);
        window_set_size((320 * global.screenSize), (180 * global.screenSize));
    }
    else
    {
        window_set_fullscreen(true);
    }
}
else
{
    window_set_fullscreen(false);
    global.screenSize = 2;
    ini_write_real("screeb", "res", global.screenSize);
    window_set_size((320 * global.screenSize), (180 * global.screenSize));
}
ini_close();
