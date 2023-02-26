if(instance_exists(obj_player))
{
    if(facing == 1)
    {
        if obj_player.x < x
            depth = 299
        else
            depth = 301
    }
    else
    {
        if obj_player.x > x
            depth = 299
        else
            depth = 301
    }
}
image_xscale = -facing

if(place_meeting(x, y - 1, obj_player))
{
    obj_player.x += facing * 2
}

if invuln
    invuln--
