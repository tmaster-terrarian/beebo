if(image_index == 4) && !particled
{
    particled = 1
    for (var i = 0; i < 8; i++)
    {
        with (instance_create_depth(x + -random_range(-6, 6), y, depth - 1, fx_dust))
        {
            sprite_index = spr_fx_dust
            if(x == other.x) x += choose(-1, 1)
            if(x > other.x) vx = random_range(1, 2)
            if(x < other.x) vx = -random_range(1, 2)
            vy = random_range(-1, 0)
            fade = 0
        }
    }
}
