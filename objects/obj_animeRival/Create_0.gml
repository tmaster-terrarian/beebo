event_inherited();

depth = 320;

x = xstart + 8;
y = ystart + 8;

sprite_index = spr_anime;
state = "idle";
active = 0;

facing = 1;
input_dir = 0;

grv = 0.1;
walksp = 2;
attack = 0;

ground_accel = 0.1;
ground_fric = 0.1;
air_accel = 0.06;
air_fric = 0.04;
jump_speed = -2.6;

iframes = 0;
hitfrom = 0;
flash = 0;

upixelH = shader_get_uniform(shWhite, "pixelH");
upixelW = shader_get_uniform(shWhite, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));
