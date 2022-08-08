depth = 300;

hsp = 0;
vsp = 0;
grv = 0.1;
walksp = 2;

coyotetime = 0;

hascontrol = true;

stored_hsp = 0;

iframes = 0;
hitfrom = 0;
flash = 0;

upixelH = shader_get_uniform(shWhite, "pixelH");
upixelW = shader_get_uniform(shWhite, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

anim_state = 0; //0: default, 1: no_gun
