if(hp <= 0)
{
	MakeExplosion(x, y);
    audio_play_sound(sn_scream_1, 1, false);
    with(wing_left) instance_destroy();
    with(wing_right) instance_destroy();
    scr_particle_explode();
}
