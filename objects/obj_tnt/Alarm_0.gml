with(MakeExplosion(x, y, image_xscale, image_yscale))
{
	image_angle = random_range(0, 360)
    dmg = 4;
    with(obj_enemy) if(place_meeting(x, y, other)) hp -= other.dmg;
    with(oCrate) if(place_meeting(x, y, other)) hp -= other.dmg;
    with(obj_bomb) if(place_meeting(x, y, other)) hp -= other.dmg;
}
ScreenShake(4, 40);
scr_particle_explode();
