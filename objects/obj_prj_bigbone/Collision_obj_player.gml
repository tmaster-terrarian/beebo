with (other)
{
    if(invuln <= 0)
    {
        invuln = 60;

        hp -= 1;
        flash = 3;
        hitfrom = point_direction(other.x, other.y, x, y);

	    vsp = lengthdir_y(1, hitfrom) - 1;
		hsp = lengthdir_x(1, hitfrom);

        audio_play_sound(sn_player_hit, 0, false);
    }
}
audio_play_sound(snHurt, 0, false);
scr_particle_explode();
