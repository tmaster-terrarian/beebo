event_inherited();

if(global.playerhealth == 0) global.playerhealth = hp_max;
hp = global.playerhealth;
global.playermaxhealth = hp_max;

depth = 300;

grv = 0.1;
walksp = 2;
facing = 1;
attack = 0;

ground_accel = 0.1;
ground_fric = 0.1;
air_accel = 0.05;
air_fric = 0.05;

coyotetime = 0;

hascontrol = true;

iframes = 0;
hitfrom = 0;
flash = 0;

upixelH = shader_get_uniform(shWhite, "pixelH");
upixelW = shader_get_uniform(shWhite, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

anim_state = 0; //0: default, 1: no_gun
