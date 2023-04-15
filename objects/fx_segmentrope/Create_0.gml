image_speed = 0
alarm[0] = 1

hsp = 0
vsp = 0
grv = 0.2

ropetype = "default"

seg_length = 1
seg_count = 8
seg_colors = [c_white, c_ltgray, c_white, c_ltgray, c_white, c_ltgray, c_white, c_ltgray]
seg_weight = 0.2

segments[seg_count - 1] = noone

outln = 1
outln_c = c_black

function segment(l = 1, e = 0, c = c_white) constructor
{
	color = c
    length = l
    en = e
    angle = 180
    _x = 0
    _y = 0
}
