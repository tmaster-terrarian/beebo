event_inherited()
flash = 0
grv = 0
collides = 0
image_alpha = 0;

hasheart = 0;

wing_left = instance_create_depth(x, y, depth + 2, obj_nectar_wing);
wing_left.image_alpha = 0;
wing_rotation_start = 0;
wing_rotation_end = 45;
wing_right = instance_create_depth(x, y, depth + 2, obj_nectar_wing);
wing_right.image_alpha = 0;
wing_direction = 1;

target = noone;
target_x = 0;
target_y = 0;
distancefrom = 48;
circlepos = random_range(0, 359);

attack = false;
attack_timer = 0;
attack_timer_cooldn = 0;
attack_counter = 0;

shake_length = 999999999;
shake_magnitude = 2;
shake_remain = 2;

upixelH = shader_get_uniform(shWhite, "pixelH");
upixelW = shader_get_uniform(shWhite, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

circlespd = 4

appeared = false;

seethruwalls = 1

instance_deactivate_object(id)
