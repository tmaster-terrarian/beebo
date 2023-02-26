if(place_meeting(x, y, target))
{
    if(wrapx)
    {
        target.x = wrap(target.x, bbox_left + 2, bbox_right - 2)

        if(target.x + target.hsp > bbox_right)
            target.x = bbox_left
        if(target.x + target.hsp < bbox_left)
            target.x = bbox_right
    }
    if(wrapy)
    {
        target.y = wrap(target.y, bbox_top + 2, bbox_bottom - 2)

        if(target.y + target.vsp > bbox_bottom)
            target.y = bbox_top
        if(target.y + target.vsp < bbox_top)
            target.y = bbox_bottom
    }
}
