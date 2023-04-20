// hair
var px1 = x - 5 * facing
var py1 = y - 5
if(sprite_index == spr_anime_run)
{
    var f = floor(image_index)
    if(f == 1 || f == 2 || f == 4 || f == 5)
    {
        py1 += 1
    }
}
if(sprite_index == spr_anime_jump)
{
    px1 = x - 4 * facing
    py1 = y - 5
}
if(sprite_index == spr_anime || sprite_index == spr_anime_dinder)
{
    hair_visible = 0
    var f = floor(image_index)
    if(f == 0 || f == 1 || f == 2)
    {
        py1 += 1
    }
}
else hair_visible = 1
py1 += duck
hair1_points[0] = [px1, py1]
for (r = 0; r < 30; r++)
{
    magnitude = 1
    choice = random_range(0, hair1_points_count - 1)
    if (choice > 0)
    {
        pointA = hair1_points[choice]
        pointB = hair1_points[choice + 1]
        vector = [(pointB[0] - pointA[0]), (pointB[1] - pointA[1])]
        if (!collision_point(pointB[0], pointB[1], obj_wall, 1, 0))
            vector[1] += grv - (0.18 * clamp(abs(hsp), 0, 1))
        vector[1] += random_range(-0.01, 0)
        magnitude = point_distance(0, 0, vector[0], vector[1])
        normal_vec = [vector[0] / magnitude, vector[1] / magnitude]
        normal_vec = [vector[0] / magnitude, vector[1] / magnitude]
        corrected_vec = [normal_vec[0] * hair1_segment_len[choice], normal_vec[1] * hair1_segment_len[choice]]
        hair1_points[choice + 1] = [pointA[0] + corrected_vec[0], pointA[1] + corrected_vec[1]]
    }
}
hair1_points[0] = [px1, py1]
if(hair_visible)
{
    for (var i = 0; i < hair1_points_count - 1; i++)
    {
        draw_line_width_colour(hair1_points[i][0], hair1_points[i][1], hair1_points[i + 1][0], hair1_points[i + 1][1], 3, c_black, c_black)
        if i == hair1_points_count - 2
            draw_line_width_colour(hair1_points[i][0], hair1_points[i][1], hair1_points[i + 1][0] + lengthdir_x(1, point_direction(hair1_points[i][0], hair1_points[i][1], hair1_points[i + 1][0], hair1_points[i + 1][1])), hair1_points[i + 1][1] + lengthdir_y(1, point_direction(hair1_points[i][0], hair1_points[i][1], hair1_points[i + 1][0], hair1_points[i + 1][1])), 1, c_black, c_black)
    }
    for (var i = 0; i < hair1_points_count - 1; i++)
    {
        draw_line_width_colour(hair1_points[i][0], hair1_points[i][1], hair1_points[i + 1][0], hair1_points[i + 1][1], 1, hair1_colors[i], hair1_colors[i])
    }
}

var px2 = x + 3 * facing
var py2 = y - 5
if(sprite_index == spr_anime_run)
{
    var f = floor(image_index)
    if(f == 1 || f == 2 || f == 4 || f == 5)
    {
        py2 += 1
    }
}
if(sprite_index == spr_anime_jump)
{
    px2 = x + 2 * facing
    py2 = y - 5
}
if(sprite_index == spr_anime || sprite_index == spr_anime_dinder)
{
    hair_visible = 0
    var f = floor(image_index)
    if(f == 0 || f == 1 || f == 2)
    {
        py2 += 1
    }
}
else hair_visible = 1
py2 += duck
hair2_points[0] = [px2, py2]
for (r = 0; r < 30; r++)
{
    magnitude = 1
    choice = random_range(0, hair2_points_count - 1)
    if (choice > 0)
    {
        pointA = hair2_points[choice]
        pointB = hair2_points[choice + 1]
        vector = [(pointB[0] - pointA[0]), (pointB[1] - pointA[1])]
        if (!collision_point(pointB[0], pointB[1], obj_wall, 1, 0))
            vector[1] += grv - (0.18 * clamp(abs(hsp), 0, 1))
        vector[1] += random_range(-0.01, 0)
        magnitude = point_distance(0, 0, vector[0], vector[1])
        normal_vec = [vector[0] / magnitude, vector[1] / magnitude]
        normal_vec = [vector[0] / magnitude, vector[1] / magnitude]
        corrected_vec = [normal_vec[0] * hair2_segment_len[choice], normal_vec[1] * hair2_segment_len[choice]]
        hair2_points[choice + 1] = [pointA[0] + corrected_vec[0], pointA[1] + corrected_vec[1]]
    }
}
hair2_points[0] = [px2, py2]
if(hair_visible)
{
    for (var i = 0; i < hair2_points_count - 1; i++)
    {
        draw_line_width_colour(hair2_points[i][0], hair2_points[i][1], hair2_points[i + 1][0], hair2_points[i + 1][1], 3, c_black, c_black)
        if i == hair2_points_count - 2
            draw_line_width_colour(hair2_points[i][0], hair2_points[i][1], hair2_points[i + 1][0] + lengthdir_x(1, point_direction(hair2_points[i][0], hair2_points[i][1], hair2_points[i + 1][0], hair2_points[i + 1][1])), hair2_points[i + 1][1] + lengthdir_y(1, point_direction(hair2_points[i][0], hair2_points[i][1], hair2_points[i + 1][0], hair2_points[i + 1][1])), 1, c_black, c_black)
    }
    for (var i = 0; i < hair2_points_count - 1; i++)
    {
        draw_line_width_colour(hair2_points[i][0], hair2_points[i][1], hair2_points[i + 1][0], hair2_points[i + 1][1], 1, hair2_colors[i], hair2_colors[i])
    }
}

draw_self();

// draw_set_alpha(1);
// draw_set_color(c_white);
// draw_set_font(fnt_console);
// draw_set_halign(fa_left);
// draw_set_valign(fa_top);

// draw_text(x + 16, y + 16, string(timer0));
