audio_stop_sound(throwsound);
with(MakeExplosion(x, y, size * 1.3, size * 1.3, (1 / 2), sn_explosion2))
{
    dmg = other.damage * 1.2;
    with(obj_enemy) if(place_meeting(x, y, other)) hp -= other.dmg;
    with(oCrate) if(place_meeting(x, y, other)) hp -= other.dmg;

    with(obj_stone) if(place_meeting(x, y, other)) hp -= other.dmg;

    with(obj_boss) if(place_meeting(x, y, other)) {hp -= other.dmg; flash = 3}

    if(place_meeting(x, y, obj_player))
    {
        if(abs(obj_player.hsp) < 5)
            obj_player.hsp = lengthdir_x(5, point_direction(x, y, obj_player.x, obj_player.y-8))
        else
            obj_player.hsp += lengthdir_x(2, point_direction(x, y, obj_player.x, obj_player.y-8))

        if(abs(obj_player.vsp) < 5)
            obj_player.vsp = lengthdir_y(5, point_direction(x, y, obj_player.x, obj_player.y-8))
        else
            obj_player.vsp += lengthdir_y(2, point_direction(x, y, obj_player.x, obj_player.y-8))
    }
}
ScreenShake(6, 60);
done = true;
scr_particle_explode();