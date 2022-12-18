image_angle = point_direction(x, y, mouse_x, mouse_y);
image_angle = round(image_angle / 10) * 10;

if (image_angle > 90 && image_angle < 270)
{
    image_yscale = -1;
    oPlayer.facing = -1;
}
else
{
    image_yscale = 1;
    oPlayer.facing = 1;
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
        with (instance_create_depth(x, y, depth - 3, oBullet))
        {
            //play fire sound
            audio_play_sound(snShot, 1, false);

            speed = 12;
            direction = other.image_angle + random_range(-4, 4);
            image_angle = direction;
        }
    //}
}

if(mouse_check_button_pressed(mb_right)) && (firingdelaybomb > 0)
{
    with(obj_bomb)
    {
        audio_stop_sound(throwsound);
        with(MakeExplosion(x, y, size, size, (2 / 3), sn_explosion2))
        {
            dmg = other.damage;
            with(obj_enemy) if(place_meeting(x, y, other)) hp -= other.dmg;
            with(oCrate) if(place_meeting(x, y, other)) hp -= other.dmg;

            if(place_meeting(x, y, oPlayer))
            {
                oPlayer.hsp = lengthdir_x(3, point_direction(x, y, oPlayer.x, oPlayer.y));
                oPlayer.vsp = lengthdir_y(3, point_direction(x, y, oPlayer.x, oPlayer.y));
            }
        }
        ScreenShake(4, 40);
        done = true;
        scr_particle_explode();
    }
}

firingdelaybomb -= 1;
if (mouse_check_button_pressed(mb_right)) && (firingdelaybomb < 0)
{
    ScreenShake(2, 10);
    recoil = 4;
    firingdelaybomb = bomb_timer_max;
    audio_play_sound(sn_throw, 1, false);

    with (instance_create_depth(x + lengthdir_x(12, image_angle), y + lengthdir_y(12, image_angle) - 1, depth - 2, obj_bomb))
    {
        direction = other.image_angle;
        hsp = lengthdir_x(2, direction);
        vsp = lengthdir_y(2, direction) - 1;
    }
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
