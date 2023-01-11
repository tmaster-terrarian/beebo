if(instance_exists(follow))
{
    xTo = follow.x + (sign(sign(follow.facing) + sign(follow.hsp)) * 12);
    yTo = follow.y;
}
if(instance_exists(obj_player_dead))
{
    follow = obj_player_dead;
    xTo = follow.x;
    yTo = follow.y;
}

cam_x = camera_get_view_x(cam);
cam_y = camera_get_view_y(cam);
view_w_half = camera_get_view_width(cam) * 0.5 * (1 / zoom);
view_h_half = camera_get_view_height(cam) * 0.5 * (1 / zoom);

x += (xTo - x) / smooth_factor;
y += (yTo - y) / smooth_factor;

x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

camera_set_view_pos(cam, floor(x - view_w_half), floor(y - view_h_half));
camera_set_view_size(cam, cam_w / zoom, cam_h / zoom);

if(layer_exists("bg1"))
{
    layer_x("bg1", floor((x / 2) + get_timer() * -0.00002));
    layer_y("bg1", camera_get_view_y(cam));
}
if(layer_exists("bg2"))
{
    layer_x("bg2", floor((x / 2.5) + get_timer() * -0.000024));
    layer_y("bg2", camera_get_view_y(cam));
}
if(layer_exists("bg3"))
{
    layer_x("bg3", floor(x / 6));
}
if(layer_exists("bg4"))
{
    layer_x("bg4", floor(x / 8));
}
