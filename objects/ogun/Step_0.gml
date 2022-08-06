image_angle = point_direction(x, y, mouse_x, mouse_y);
image_angle = round(image_angle / 10) * 10;

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
    ScreenShake(1, 5);
    recoil = 2;
    firingdelay = 4;

    //fire bullet
    //for (var i = 0; i < 6; i += 1) //uncomment for spread
    //{
        with (instance_create_layer(x, y, "Bullet_Instances", oBullet))
        {
            //play fire sound
            audio_play_sound(snShot, 1, false);

            speed = 12;
            direction = other.image_angle + random_range(-4, 4);
            image_angle = direction;
        }
    //}
}

//animation
if (mouse_check_button_released(mb_left))
{
    sprite_index = sGunR;
    audio_play_sound(snReload, 1, false);
}
if (sprite_index == sGunR)
{
    if (image_index >= image_number - 1)
    {
        sprite_index = sGun;
    }
}
