depth = 299;

cam = view_camera[0];
cam_x = camera_get_view_x(cam);
cam_y = camera_get_view_y(cam);
cam_w = 256;
cam_h = 144;
camera_set_view_size(cam, cam_w, cam_h);
view_w_half = cam_w * 0.5;
view_h_half = cam_h * 0.5;

zoom = 1;

draw_ui = true;

invpos = 0
invpostarget = 0

follow = obj_player;
usefollow = true;
xTo = xstart;
yTo = ystart;

playerlasthpmax = 0
playerlasthp = 0

smooth_factor = 5;

shake_length = 0; //60 is cool
shake_magnitude = 0; //3 is cool, 6 is super cool
shake_remain = 0; //3 is cool, 6 is super cool
buff = 4;

hudfont = font_add_sprite_ext(spr_hudnumbers, "/1234567890-", false, 0)
hudfontstacks = font_add_sprite_ext(spr_hudstacksfnt, "1234567890", true, -1)
hp_change = 0

if(layer_exists("bg1"))
{
    layer_y("bg1", camera_get_view_y(cam));
}
if(layer_exists("bg2"))
{
    layer_y("bg2", camera_get_view_y(cam));
}
if(layer_exists("bg3"))
{
    layer_y("bg3", camera_get_view_y(cam));
}
if(layer_exists("bg4"))
{
    layer_y("bg4", camera_get_view_y(cam));
}

item_pickup_queue = []
