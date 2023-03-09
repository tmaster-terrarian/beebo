function checkBelow()
{
    return (place_meeting(x, (y + 1), obj_wall) || (place_meeting(x, (y + 1), obj_platform) && (!(place_meeting(x, y, obj_platform)))));
}
