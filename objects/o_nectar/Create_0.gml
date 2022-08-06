winglayer = layer_create(layer_get_depth("Enemy") + 1, "wing_layer");
wing_left = instance_create_layer(x, y, winglayer, o_nectar_wing);
wing_left_rotation_start = 0;
wing_left_rotation_end = 45;
wing_right = instance_create_layer(x, y, winglayer, o_nectar_wing);
wing_right_rotation_start = 360;
wing_right_rotation_end = 315;
wing_direction = 1;

target = noone;
target_x = 0;
target_y = 0;
distancefrom = 64;
circlepos = 0;

shake_length = 999999999;
shake_magnitude = 2;
shake_remain = 2;

upixelH = shader_get_uniform(shWhite, "pixelH");
upixelW = shader_get_uniform(shWhite, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

audio_play_sound(sn_tp, 1, false);
