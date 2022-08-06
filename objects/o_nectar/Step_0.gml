if(instance_exists(oPlayer))
{
    target = oPlayer;
}

circlepos += 2;
if(circlepos >= 360) circlepos = 0;

target_x = target.x + lengthdir_x(distancefrom, circlepos);
target_y = target.y + lengthdir_y(distancefrom, circlepos);

x += (target_x - x) / walksp;
y += (target_y - y) / walksp;

x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

wing_left.image_xscale = -1;
wing_left.x = x - 4;
wing_left.y = y + 2;

wing_right.x = x + 4;
wing_right.y = y + 2;

if(wing_direction == 1)
{
    wing_left.image_angle += wing_speed;
    wing_right.image_angle -= wing_speed;
    if(wing_left.image_angle >= wing_left_rotation_end)
    {
        wing_direction = -1;
    }
}
else
{
    wing_left.image_angle -= wing_speed;
    wing_right.image_angle += wing_speed;
    if(wing_left.image_angle <= wing_left_rotation_start)
    {
        wing_direction = 1;
    }
}
