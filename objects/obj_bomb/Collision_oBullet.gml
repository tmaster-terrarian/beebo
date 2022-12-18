audio_stop_sound(throwsound);
with(MakeExplosion(x, y, size * 1.3, size * 1.3, (1 / 2), sn_explosion2))
{
    dmg = other.damage * 1.2;
    with(obj_enemy) if(place_meeting(x, y, other)) hp -= other.dmg;
    with(oCrate) if(place_meeting(x, y, other)) hp -= other.dmg;
    
    if(place_meeting(x, y, oPlayer))
    {
        oPlayer.hsp = lengthdir_x(5, point_direction(x, y, oPlayer.x, oPlayer.y));
        oPlayer.vsp = lengthdir_y(5, point_direction(x, y, oPlayer.x, oPlayer.y));
    }
}
ScreenShake(6, 60);
done = true;
scr_particle_explode();
