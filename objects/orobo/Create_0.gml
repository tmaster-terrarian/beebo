vsp = 0;
grv = 0.1;
walksp = 1;
hsp = walksp;

hp = 4;
flash = 0;
hitfrom = 0;
hitfrom_as_digit = 0;

upixelH = shader_get_uniform(shWhite, "pixelH");
upixelW = shader_get_uniform(shWhite, "pixelW");
//uoutlineColor = shader_get_uniform(shWhite, "outlineColor");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));
