var shakex = 0
var shakey = 0

if(flash)
{
    shakex = random_range(-shake, shake)
    shakey = random_range(-shake, shake)
}

draw_sprite_ext(sprite_index, image_index, x + shakex, y + shakey, image_xscale, image_yscale, image_angle, image_blend, image_alpha)

if !dead && flash
{
    alarm[0] = flash
    dead = 1
}
