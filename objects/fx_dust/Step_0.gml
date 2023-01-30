vx = approach(vx, 0, fric)
vy = approach(vy, 0, fric)
vz = approach(vz, 0, fric)
image_xscale -= 0.025
image_yscale -= 0.025
image_alpha -= 0.033
if (image_alpha <= 0)
    instance_destroy()
