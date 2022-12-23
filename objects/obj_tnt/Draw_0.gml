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
	with(MakeExplosion(x, y, image_xscale, image_yscale))
    {
        dmg = 4;
        with(obj_enemy) if(place_meeting(x, y, other)) hp -= other.dmg;
        with(oCrate) if(place_meeting(x, y, other)) hp -= other.dmg;
        with(obj_bomb) if(place_meeting(x, y, other)) hp -= other.dmg;
    }
    ScreenShake(4, 40);
    scr_particle_explode();
}
