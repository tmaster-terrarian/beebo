event_inherited();
image_speed = 0

hp = 2
flash = -1

upixelH = shader_get_uniform(shWhite, "pixelH")
upixelW = shader_get_uniform(shWhite, "pixelW")
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0))
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0))

move_parent = 0

var p = instance_place(x, y + 2, obj_moving_platform)
if p
{
    depth = p.depth - 1
}
