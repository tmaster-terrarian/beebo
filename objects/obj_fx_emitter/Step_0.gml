if(follow_mouse)
{
    x = mouse_x
    y = mouse_y
}

if(mouse_check_button_pressed(mb_left) && mouse_x < bbox_right && mouse_x > bbox_left && mouse_y < bbox_bottom && mouse_y > bbox_top)
{
    follow_mouse = !follow_mouse
}
