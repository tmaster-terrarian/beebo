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
if(hp <= 0)
{
    scr_particle_explode();
}
