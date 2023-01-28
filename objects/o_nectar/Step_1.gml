if(hp <= 0)
{
    if(hasheart)
    {
        instance_create_depth(x, y, 300, obj_hpup);
    }
	MakeExplosion(x, y);
    audio_play_sound(sn_scream_1, 1, false);
    with(wing_left) instance_destroy();
    with(wing_right) instance_destroy();
    scr_particle_explode();
}
