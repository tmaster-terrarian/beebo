if(target == proj_thrower)
    dir = point_direction(target.x, target.y, posx, posy);
else
    dir = point_direction(xstart, ystart, target.x, target.y - 8);

image_angle += (35 * abs(spd * (1/spd_max))) + 10;

posx += lengthdir_x(spd, dir);
posy += lengthdir_y(spd, dir);
spd = approach(spd, -spd_max, spd_mod);

x = floor(posx);
y = floor(posy);

if(sign(spd) <= 0)
{
    target = proj_thrower;
}

if(place_meeting(x, y, proj_thrower) && sign(spd) == -1)
{
    with(proj_thrower)
    {
        hp -= 24;
        flash = 3;
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
