if state == "grind"
{
    // draw_sprite(spr_railboard, !on_ground, x, y)
    // if(!on_ground)
    //     draw_sprite(spr_railboard, 2, x, ystart)
    draw_sprite(spr_railboard, 0, x, ystart)
}

// ponytail
var px = x - 5 * facing
if(facing < 0)
var px = x - 1 - 5 * facing
var py = y - 13
if(running)
{
    var f = floor(image_index)
    if(f == 1 || f == 2 || f == 4 || f == 5)
    {
        py += 1
    }
}
if(sprite_index == spr_player_jump)
{
    px = x - 1 - 3 * facing
    py = y - 13
}
if(sprite_index == spr_player || sprite_index == spr_player_lookup)
{
    var f = floor(image_index)
    if(f == 0 || f == 1 || f == 2)
    {
        py += 1
    }
}
py += duck
ponytail_points[0] = [px, py]
for (r = 0; r < 30; r++) //thumbtack magic that i dont understand
{
    magnitude = 1
    choice = random_range(0, ponytail_points_count - 1)
    if (choice > 0)
    {
        pointA = ponytail_points[choice]
        pointB = ponytail_points[choice + 1]
        vector = [(pointB[0] - pointA[0]), (pointB[1] - pointA[1])]
        if (!collision_point(pointB[0], pointB[1], obj_wall, 1, 0))
            vector[1] += grv - (0.18 * clamp(abs(hsp), 0, 1))
        vector[1] += random_range(-0.01, 0)
        magnitude = point_distance(0, 0, vector[0], vector[1])
        normal_vec = [vector[0] / magnitude, vector[1] / magnitude]
        normal_vec = [vector[0] / magnitude, vector[1] / magnitude]
        corrected_vec = [normal_vec[0] * ponytail_segment_len[choice], normal_vec[1] * ponytail_segment_len[choice]]
        ponytail_points[choice + 1] = [pointA[0] + corrected_vec[0], pointA[1] + corrected_vec[1]]
    }
}
ponytail_points[0] = [px, py]
if(ponytail_visible)
{
    for (var i = 0; i < ponytail_points_count - 1; i++)
    {
        draw_line_width_colour(ponytail_points[i][0], ponytail_points[i][1], ponytail_points[i + 1][0], ponytail_points[i + 1][1], 3, c_black, c_black)
        if i == ponytail_points_count - 2
            draw_line_width_colour(ponytail_points[i][0], ponytail_points[i][1], ponytail_points[i + 1][0] + lengthdir_x(1, point_direction(ponytail_points[i][0], ponytail_points[i][1], ponytail_points[i + 1][0], ponytail_points[i + 1][1])), ponytail_points[i + 1][1] + lengthdir_y(1, point_direction(ponytail_points[i][0], ponytail_points[i][1], ponytail_points[i + 1][0], ponytail_points[i + 1][1])), 1, c_black, c_black)
    }
    for (var i = 0; i < ponytail_points_count - 1; i++)
    {
        draw_line_width_colour(ponytail_points[i][0], ponytail_points[i][1], ponytail_points[i + 1][0], ponytail_points[i + 1][1], 1, ponytail_colors[i], ponytail_colors[i])
    }
}

// lol
draw_self();

// gun
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
