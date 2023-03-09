timer--;
if (timer <= 0)
{
    instance_destroy();
}
if (place_meeting(x, y, obj_wall))
{
    instance_destroy();
}
