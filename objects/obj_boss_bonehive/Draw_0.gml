var _x = x;
var _y = y;

if(shaking)
{
    x += irandom_range(-shake, shake)
    y += irandom_range(-shake, shake)

    if(bits)
    {
        par_wingr.x = x + par_wing_x
        par_wingr.y = y + par_wing_y
        par_wingl.x = x - par_wing_x
        par_wingl.y = y + par_wing_y
        par_jawboned.x = x + par_jawboned_x
        par_jawboned.y = y + par_jawboned_y
        par_head.x = x + par_head_x
        par_head.y = y + par_head_y
    }
}

if(flash > 0)
{
    flash--
    par_head.image_index = sign(flash)
    par_jawboned.image_index = sign(flash)
    shader_set(shWhite)
    shader_set_uniform_f(upixelW, texelW)
    shader_set_uniform_f(upixelH, texelH)
    draw_self()
    shader_reset()
}
else draw_self()

x = _x
y = _y
