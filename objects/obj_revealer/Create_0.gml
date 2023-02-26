image_speed = 0
depth = 100
revealed = 0

x += 8
y += 8
nr = instance_position(x + 16, y, obj_revealer)
nl = instance_position(x - 16, y, obj_revealer)
nd = instance_position(x, y + 16, obj_revealer)
nu = instance_position(x, y - 16, obj_revealer)
x -= 8
y -= 8

n = [nr, nl, nd, nu]

fade = 0.1
alpho = 1
