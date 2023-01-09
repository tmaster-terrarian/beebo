if(instance_exists(oPlayer))
{
    if(!oPlayer.hascontrol) return;
}
if(global.console) return;

if(gamepad_is_connected(0))
{
    gamepad_set_axis_deadzone(0, 0.1);

    aim_x = (abs(gamepad_axis_value(0, gp_axisrh)) || abs(gamepad_axis_value(0, gp_axisrv))) ? gamepad_axis_value(0, gp_axisrh) : gamepad_axis_value(0, gp_axislh);
    aim_y = (abs(gamepad_axis_value(0, gp_axisrh)) || abs(gamepad_axis_value(0, gp_axisrv))) ? gamepad_axis_value(0, gp_axisrv) : gamepad_axis_value(0, gp_axislv);
    // aim_w = lengthdir_x(abs(aim_x), point_direction(0, 0, aim_x, aim_y));
    // aim_h = lengthdir_y(abs(aim_y), point_direction(0, 0, aim_x, aim_y));
    var _aim_n = normalize(aim_x, aim_y);
    aim_w = _aim_n[0];
    aim_h = _aim_n[1];

    gamepad_set_axis_deadzone(0, 0.2);

    if(aim_w != 0) && (aim_h != 0)
    {
        image_angle = point_direction(0, 0, aim_w, aim_h);
    }
    else
    {
        if(instance_exists(oPlayer))
        {
            if(oPlayer.facing == 1)
            {
                image_angle = 0;
            }
            if(oPlayer.facing == -1)
            {
                image_angle = 180;
            }
        }
    }

    if(gamepad_button_check_pressed(0, gp_stickr))
    {
        lock = !lock;
    }

    if(lock)
    {
        if(instance_exists(obj_enemy)) {lock_target = instance_nearest(x + aim_w, y + aim_h, obj_enemy); image_angle = point_direction(x, y, lock_target.x, lock_target.y);}
        else if(instance_exists(obj_animeRival)) {lock_target = obj_animeRival; image_angle = point_direction(x, y, lock_target.x, lock_target.y);}
        else lock = false;
    }
    else lock_target = noone;
}
else image_angle = point_direction(x, y, mouse_x, mouse_y);
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
if(mouse_check_button(mb_left) || gamepad_button_check(0, gp_shoulderrb)) && (firingdelay < 0)
{
    fire = 1;

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

if(mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_shoulderlb)) && (firingdelaybomb > 0)
{
    with(obj_bomb)
    {
        audio_stop_sound(throwsound);
        with(MakeExplosion(x, y, size, size, (2 / 3), sn_explosion2))
        {
            dmg = other.damage;
            with(obj_enemy) if(place_meeting(x, y, other)) hp -= other.dmg;
            with(oCrate) if(place_meeting(x, y, other)) hp -= other.dmg;

            with(obj_stone) if(place_meeting(x, y, other)) hp -= other.dmg;

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
if (mouse_check_button(mb_right) || gamepad_button_check(0, gp_shoulderlb)) && (firingdelaybomb < 0)
{
    fire = 1;

    ScreenShake(2, 10);
    recoil = 4;
    firingdelaybomb = bomb_timer_max;
    audio_play_sound(sn_throw, 1, false);

    with (instance_create_depth(x + lengthdir_x(12, image_angle), y + lengthdir_y(12, image_angle) - 1, depth - 2, obj_bomb))
    {
        direction = other.image_angle;
        hsp = lengthdir_x(2, direction) + (oPlayer.hsp * 0.1);
        vsp = lengthdir_y(2, direction) + (oPlayer.vsp * 0.1) - 1;

        if(mouse_check_button(mb_left) || gamepad_button_check(0, gp_shoulderrb)) event_perform(ev_other, ev_user0);
    }
}

//animation
if (mouse_check_button_released(mb_left) || gamepad_button_check_released(0, gp_shoulderrb))
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
