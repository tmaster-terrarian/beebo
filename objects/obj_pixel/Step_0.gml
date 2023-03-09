if (!ticker)
{
    gravity = 0
    hspeed = 0
    vspeed = 0
}
if (check && ticker)
{
    if collision_point((x + hspeed), y, obj_wall, 1, 1)
    {
        hspeed *= (-random(0.8))
        gravity = 0.2
        ticker -= 1
    }
    if collision_point(x, (y + vspeed), obj_wall, 1, 1)
    {
        vspeed *= (-random(0.8))
        gravity = 0.2
        ticker -= 1
    }
}
check *= -1
image_alpha -= 0.05
if (image_alpha <= 0)
    instance_destroy()
