//triple backflip menouver
timer0 = 0
image_index = 0
state = "backflip_start"

alarm[1] = 35;
flip_counter++;

if(flip_counter >= flip_max)
{
    alarm[1] = -1;
    can_dodge = 1;
}
