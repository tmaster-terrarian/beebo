vx = approach(vx, 0, fric)
vy = approach(vy, 0, fric)
vz = approach(vz, 0, fric)
image_xscale = approach(image_xscale, 0, 0.025)
image_yscale = approach(image_yscale, 0, 0.025)
life -= 0.099
if (life <= 0) || (image_xscale == 0 && image_yscale == 0)
    instance_destroy()
