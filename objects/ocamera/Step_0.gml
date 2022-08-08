if(instance_exists(follow))
{
    xTo = follow.x;
    yTo = follow.y;
}
if(instance_exists(obj_player_dead))
{
    follow = obj_player_dead;
}

x += (xTo - x) / smooth_factor; // LERP MY BELOVED
y += (yTo - y) / smooth_factor;

x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

if(layer_exists("bg1"))
{
    layer_x("bg1", x / 2);
    layer_y("bg1", camera_get_view_y(cam));
}
if(layer_exists("bg2"))
{
    layer_x("bg2", x / 4);
    layer_y("bg2", camera_get_view_y(cam));
}
if(layer_exists("bg3"))
{
    layer_x("bg3", x / 6);
}
if(layer_exists("bg4"))
{
    layer_x("bg4", x / 8);
}
