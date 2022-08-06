alarm[9] = 2
if active
{
    if (!(collision_point(x, (y + vspd), oWall, 1, 1)))
        vspd += gravy
    else
    {
        hspd = lerp(hspd, 0, 0.01)
        vspd *= random_range(-0.8, -0.2)
    }
    if collision_point((x + hspd), y, oWall, 1, 1)
        hspd *= -0.5
    image_alpha -= 0.1
    hspd -= (__view_get((4 << 0), 0) / 100)
}
