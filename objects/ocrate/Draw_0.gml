if(flash > 0)
{
    flash--;
    shader_set(sh_flash);
    draw_self();
    shader_reset();
}
else draw_self();
if(hp <= 0)
{
    scr_particle_explode();
}
