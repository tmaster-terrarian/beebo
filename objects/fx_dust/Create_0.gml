event_inherited()
image_speed = 0
image_index = choose(0, 1, 2)
image_xscale = random_range(0.66, 1.33)
image_yscale = random_range(0.66, 1.33)
image_xscale *= choose(-1, 1)
image_yscale *= choose(-1, 1)
vx = random_range(-1, 1)
vy = random_range(-1, 1)
vz = random_range(-10, 10)
vz += 10 * sign(vz)
fric = 0.1
life = 3
fade = 1
