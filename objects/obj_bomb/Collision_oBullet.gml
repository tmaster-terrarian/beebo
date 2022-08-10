audio_stop_sound(throwsound);
with(MakeExplosion(x, y, size * 1.3, size * 1.3, (1 / 2), sn_explosion2))
{
    dmg = other.damage * 1.2;
    with(obj_enemy) if(place_meeting(x, y, other)) hp -= other.dmg;
    with(oCrate) if(place_meeting(x, y, other)) hp -= other.dmg;
}
ScreenShake(6, 60);
done = true;
scr_particle_explode();
