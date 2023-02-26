event_inherited();

if(place_meeting(x, y, obj_player))
{
    with(oCamera)
    {
        xTo = clamp(xTo, other.bbox_left + 128 / zoom, other.bbox_right - 128 / zoom)
        yTo = clamp(yTo, other.bbox_top + 72 / zoom, other.bbox_bottom - 72 / zoom)
    }
}
