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
    with(obj_stone) event_perform(ev_other, ev_user0);
    scr_particle_explode();
}
