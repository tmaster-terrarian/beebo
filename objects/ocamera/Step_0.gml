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

var _x = round(x - view_w_half);
var _y = round(y - view_h_half);

camera_set_view_pos(cam, _x, _y);
camera_set_view_size(cam, cam_w / zoom, cam_h / zoom);

var bg_static = layer_get_id("bg0");
var bg_near0  = layer_get_id("bg4");
var bg_far0   = layer_get_id("bg3");
var bg_sky0   = layer_get_id("bg2");
var bg_sky1   = layer_get_id("bg1");

layer_x(bg_near0, floor(lerp(0, _x, 0.5)));
layer_x(bg_far0,  floor(lerp(0, _x, 0.7)));
layer_x(bg_sky0,  floor(lerp(0, _x, 0.85) + get_timer() * -0.000024)); // scrolls automatically
layer_x(bg_sky1,  floor(lerp(0, _x, 0.9) + get_timer() * -0.00002));

layer_y(bg_near0, floor(lerp(room_height - 180, _y, 0.5)));
layer_y(bg_far0,  floor(lerp(room_height - 180, _y, 0.7)));
layer_y(bg_sky0,  _y);
layer_y(bg_sky1,  _y);
