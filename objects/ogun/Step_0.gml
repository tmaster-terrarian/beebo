image_angle = point_direction(x, y, mouse_x, mouse_y);
if (image_angle > 90 && image_angle < 270)
{
    image_yscale = -1;
    oPlayer.image_xscale = -1;
}
else
{
    image_yscale = 1;
    oPlayer.image_xscale = 1;
}

firingdelay -= 1;
recoil = max(0, recoil - 1);
if (mouse_check_button(mb_left)) && (firingdelay < 0)
{
    recoil = 2;
    firingdelay = 8;
    //for (var i = 0; i < 6; i += 1)
    //{
        with (instance_create_layer(x, y, "Bullet_Instances", oBullet))
        {
            speed = 12;
            direction = other.image_angle + random_range(-4, 4);
            image_angle = direction;
        }
    //}
}
if (mouse_check_button_released(mb_left))
{
    sprite_index = sGunR;
}
if (sprite_index == sGunR)
{
    if (image_index >= image_number - 1)
    {
        sprite_index = sGun;
    }
}
