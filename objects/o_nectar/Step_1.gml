if(hp <= 0)
{
	MakeExplosion(x, y);
    audio_play_sound(sn_scream_1, 1, false);
    with(wing_left) scr_particle_explode();
    with(wing_right) scr_particle_explode();
    scr_particle_explode();
}
