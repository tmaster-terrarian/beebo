var _x = x;
var _y = y;
x = floor(x);
y = floor(y);
draw_self();
x = _x;
y = _y;

if(instance_exists(oGun))
{
    draw_sprite_ext(oGun.sprite_index, oGun.image_index, x + gun_offs_x - lengthdir_x(oGun.recoil, oGun.image_angle), y + gun_offs_y - lengthdir_y(oGun.recoil, oGun.image_angle), oGun.image_xscale, oGun.image_yscale, oGun.image_angle, oGun.image_blend, oGun.image_alpha);

    if(oGun.fire || mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_shoulderlb))
    {
        oGun.fire = 0;
        ch_frame = 0;
        ch_animate = 1;
    }

    if(ch_animate)
    {
        ch_frame += 0.35;
    }

    if(ch_frame >= ch_frame_max)
    {
        ch_frame = 0;
        ch_animate = 0;
    }

    if(abs(oGun.aim_x) >= 0.1) || (abs(oGun.aim_y) >= 0.1) || (oGun.lock)
    {
        ch_alpha = min(ch_alpha + 0.25, 1);
    }
    else ch_alpha = max(ch_alpha - 0.1, 0);

    // draw_line_color
    // (
    //     x + gun_offs_x,
    //     y + gun_offs_y,
    //     x + gun_offs_x + lengthdir_x(point_distance(0, 0, oGun.aim_w, oGun.aim_h) * oGun.gp_aim_dist, point_direction(0, 0, oGun.aim_w, oGun.aim_h)),
    //     y + gun_offs_y + lengthdir_y(point_distance(0, 0, oGun.aim_w, oGun.aim_h) * oGun.gp_aim_dist, point_direction(0, 0, oGun.aim_w, oGun.aim_h)),
    //     c_red,
    //     c_red
    // );

    if(oGun.lock) draw_sprite_ext
    (
        spr_crosshair,
        ch_frame,
        oGun.lock_target.x,
        oGun.lock_target.y,
        1,
        1,
        0,
        c_yellow,
        ch_alpha
    );
    else draw_sprite_ext
    (
        spr_crosshair,
        ch_frame,
        x + gun_offs_x + lengthdir_x(point_distance(0, 0, oGun.aim_w, oGun.aim_h) * oGun.gp_aim_dist, point_direction(0, 0, oGun.aim_w, oGun.aim_h)),
        y + gun_offs_y + lengthdir_y(point_distance(0, 0, oGun.aim_w, oGun.aim_h) * oGun.gp_aim_dist, point_direction(0, 0, oGun.aim_w, oGun.aim_h)),
        1,
        1,
        0,
        c_white,
        ch_alpha
    );
}

if(flash > 0)
{
    flash--;
    shader_set(shWhite);
    shader_set_uniform_f(upixelW, texelW);
    shader_set_uniform_f(upixelH, texelH);
    draw_self();
    shader_reset();
}
