dir = point_direction(xstart, ystart, targetx, targety) + 10 * (spd * (1/spd_max));

posx += lengthdir_x(spd, dir);
posy += lengthdir_y(spd, dir);
spd = approach(spd, -spd_max, spd_mod);

x = floor(posx);
y = floor(posy);

if(place_meeting(x, y, proj_thrower) && sign(spd) == -1)
{
    with(proj_thrower)
    {
        hp -= 1;
    }
    if(proj_thrower == obj_boss_bonehive)
    {
        var _snd = choose(sn_skeleton_hurt1, sn_skeleton_hurt2, sn_skeleton_hurt3, sn_skeleton_hurt4);
        audio_play_sound(_snd, 0, false);
    }
    audio_play_sound(snHurt, 0, false);
    scr_particle_explode();
}
if(spd == -spd_max)
{
    if(!place_meeting(x, y, oCamera))
    {
        instance_destroy();
    }
}
