var _x = x;
var _y = y;

if(shaking)
{
    x += random_range(-shake, shake);
    y += random_range(-shake, shake);
}

if(flash > 0)
{
    flash--;
    shader_set(shWhite);
    shader_set_uniform_f(upixelW, texelW);
    shader_set_uniform_f(upixelH, texelH);
    draw_self();
    shader_reset();
}
else draw_self();

x = _x;
y = _y;
