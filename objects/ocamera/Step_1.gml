if(instance_exists(follow)) && (usefollow)
{
    xTo = follow.x;
    yTo = follow.y;

    if(follow == obj_player)
    {
        xTo = follow.x + (sign(sign(follow.facing) + sign(follow.hsp)) * 12);
        yTo = follow.y - 12 - follow.lookup * 24;
    }
}
