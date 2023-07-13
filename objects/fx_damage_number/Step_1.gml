image_alpha -= 0.1 * global.dt
hsp = approach(hsp, 0, 0.01 * global.dt)
vsp = approach(vsp, 10, grv * global.dt)

if(image_alpha <= 0)
	instance_destroy()
