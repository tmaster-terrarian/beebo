attack_timer += 1;
facing = 0;

if(instance_exists(obj_player))
{
    target = obj_player;
}
else
{
    target = obj_player_dead;
}

if(appeared) circlepos += 2;
if(circlepos >= 360) circlepos = 0;

target_x = target.x + lengthdir_x(distancefrom, circlepos);
target_y = target.y + lengthdir_y(distancefrom, circlepos);

x += (target_x - x) / walksp;
y += (target_y - y) / walksp;

//jitter
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

wing_left.image_xscale = -1;
wing_left.x = x - 4;
wing_left.y = y + 2;
wing_right.x = x + 4;
wing_right.y = y + 2;

//wing flappib
if(wing_direction == 1)
{
    wing_left.image_angle += wing_speed;
    wing_right.image_angle -= wing_speed;
    if(wing_left.image_angle >= wing_rotation_end)
    {
        wing_direction = -1;
    }
}
else
{
    wing_left.image_angle -= wing_speed;
    wing_right.image_angle += wing_speed;
    if(wing_left.image_angle <= wing_rotation_start)
    {
        wing_direction = 1;
    }
}

//attackg
attack_timer_cooldn = max(-1, attack_timer_cooldn - 1)
if(attack_timer >= 120)
{
    attack = true;
}
if(attack)
{
    if(attack_counter < 3)
    {
        if(attack_timer_cooldn < 0)
        {
            attack_counter += 1;
            attack_timer_cooldn = 60;

            with(instance_create_depth(x, y, depth - 1, obj_bone))
            {
                proj_thrower = other;
                hsp = lengthdir_x(2, point_direction(x, y, other.target.x, other.target.y));
                vsp = lengthdir_y(3, point_direction(x, y, other.target.x, other.target.y));
            }
        }
    }
    else
    {
        attack = false;
        attack_counter = 0;
        attack_timer_cooldn = 0;
        attack_timer = 0;
    }
}
