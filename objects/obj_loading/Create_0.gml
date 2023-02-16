skip = 10

screen_margin = 4

alarm[0] = 1

tl_pos = 0
tl_go = 1

var _x = xstart + screen_margin
var _y = ystart + screen_margin

tip_x = _x + 272
tip_y = _y + 32

txt_x = tip_x + 4
txt_y = tip_y + 21
txt_spacing = 12
txt_string = ""

lod_x = _x + 150
lod_y = _y + 127

ico_x = _x + 241
ico_y = _y + 129

tip_xt = _x + 16

lod_f = 0
ico_f = 0

duration = 60 * 10

loading_rm = lvl1_1

ScreenShake(6, 60)
snd = audio_play_sound(sn_glass, 1, false)
