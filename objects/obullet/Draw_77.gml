timer--;
if (timer <= 0)
{
    instance_destroy();
}
if (place_meeting(x, y, oWall))
{
    instance_destroy();
}
