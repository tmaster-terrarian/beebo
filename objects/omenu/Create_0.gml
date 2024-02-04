gui_width = 256;
gui_height = 144;
gui_margin = 0;

menu_x = gui_width + 200;
menu_y = gui_height - gui_margin + 6;
menu_x_target = gui_width - gui_margin;
menu_speed = 5; // lower is faster
menu_font = fMenu;
menu_itemheight = font_get_size(menu_font);
menu_committed = -1;
menu_control = true;

menu[1] = "continued";
menu[0] = "new";

menu_items = array_length(menu);
menu_cursor = 0
ini_open("./save.ini");
if(ini_section_exists("savedata") && ini_key_exists("savedata", "stage"))
	menu_cursor = 1;
ini_close()

menu_top = menu_y - ((menu_itemheight * 1) * menu_items);

gamemanager = oGameManager;
