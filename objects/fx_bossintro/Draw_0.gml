var cam = view_camera[0]
var camx = camera_get_view_x(cam)
var camy = camera_get_view_y(cam)

var txt1 = scribble("[fnt_basic][#e5004c][fa_bottom]" + string_loc("ui.warning") + "[spr_warningsign]")
var txt2 = scribble("[fnt_basic][#e5004c][fa_top]" + string_loc("ui.warning") + "[spr_warningsign]")

var _ypos = round(ypos)

var c = #000031
draw_rectangle_color(camx - 1, camy - 1, camx + 257, camy - 1 + _ypos, c,c,c,c,0)
draw_rectangle_color(camx - 1, camy + 145, camx + 257, camy + 143 - _ypos, c,c,c,c,0)

for(var i = 0; i < ceil(256 / txt1.get_width()) + 1; i++)
{
    txt1.draw(camx + round((t*0.5) % txt1.get_width()) + ((i - 1) * txt1.get_width()), camy + _ypos)
    txt2.draw(camx - round((t*0.5) % txt2.get_width()) + (i * txt2.get_width()), camy + (143 - _ypos))
}
