if(hp <= 0)
{
    with (instance_create_depth(x, y, depth, oRoboDead))
    {
        direction = other.hitfrom;
        hsp = lengthdir_x(2, direction);
        vsp = lengthdir_y(2, direction) - 1;

        if (sign(hsp) != 0) image_xscale = sign(hsp);
    }
    instance_destroy();
}
