if(flash > 0)
{
    flash--;
    shader_set(shWhite);
    shader_set_uniform_f(upixelW, texelW);
    shader_set_uniform_f(upixelH, texelH);
    //shader_set_uniform_f(uoutlineColor, make_color_rgb(255, 0, 0));
    draw_self();
    shader_reset();
}
else draw_self();