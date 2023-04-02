var fix = global.screenSize * oCamera.zoom
var w = oCamera.cam_w
var h = oCamera.cam_h
xx = round(obj_player.x - round(camera_get_view_x(view_camera[0])))
yy = round(obj_player.y - round(camera_get_view_y(view_camera[0])))

gpu_set_colorwriteenable(0,1,1,1)
draw_surface_ext(application_surface, 0, 0, fix, fix, 0, c_white, 1)
gpu_set_colorwriteenable(1,1,1,1)

// red
gpu_set_colorwriteenable(1,0,0,1)
redx = round(-((w*distortx)-w) * (xx/w))
redy = round(-((h*distorty)-h) * (yy/h))
draw_surface_stretched(application_surface, redx * fix, redy * fix, w * distortx * fix, h * distorty * fix)
gpu_set_colorwriteenable(1,1,1,1)

// green
// gpu_set_colorwriteenable(0,1,0,1)
// greenx = -((w-(w*distortx)) * (w/2)) - 12.8
// draw_surface_stretched(application_surface, greenx * fix, greeny * fix, w * distortx * fix, h * distorty * fix)
// gpu_set_colorwriteenable(1,1,1,1)
