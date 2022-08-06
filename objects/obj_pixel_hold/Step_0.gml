if (active == 1)
{
    x += hspd
    y += vspd
}
else if (active == 2)
{
    x = lerp(x, startX, 0.5)
    y = lerp(y, startY, 0.5)
    vspeed = 0
    hspeed = 0
    gravity = 0
    hspd = 0
    vspd = 0
}
