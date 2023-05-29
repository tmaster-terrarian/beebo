audio_play_sound(sn_robo_death, 0, 0)
with (instance_create_depth(x, y, depth, oRoboDead))
{
    direction = (other.facing == -1) ? 165 : 15;
    hsp = lengthdir_x(2, direction);
    vsp = lengthdir_y(2, direction) - 1;

    image_xscale = other.facing;
}
