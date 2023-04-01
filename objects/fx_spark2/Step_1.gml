life -= fric

if life < -10
    instance_destroy()

image_blend = merge_color(make_color_rgb(255, 244, 94), c_red, min(-(life/life_max) + 1, 1))
