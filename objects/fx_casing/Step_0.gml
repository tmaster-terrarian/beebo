if y > room_height
    instance_destroy()

if(!done)
{
    vsp = approach(vsp, 20, grv)
    hsp = approach(hsp, 0, 0.01)

    rot_sp = approach(rot_sp, rot_sp_max, rot_sp_accel)

    if(place_meeting(x + hsp, y, obj_wall))
    {
        rot_sp = 0
        dir = -dir
        hsp = -hsp * 0.9
    }

    if(place_meeting(x, y + vsp, obj_wall) && vsp > 0)
    {
        rot_sp = 0
        if(bounces < bounces_max)
        {
            bounces++
            vsp = -vsp * bounce_height_loss
            hsp *= 0.75
        }
        else
        {
            done = 1
            final_angle = round(image_angle / 180) * 180
        }
    }

    x += hsp
    y += vsp

    angle += rot_sp * dir
    image_angle = round(angle / 8) * 8;
}
else
{
    if(!place_meeting(x, y + 2, obj_wall))
    {
        done = 0
        image_alpha = 5
        dir = choose(-1, 1)
        return;
    }
    image_angle = approach(image_angle, final_angle, 20)
    vsp = 0
    hsp = approach(hsp, 0, 0.1)

    image_alpha = approach(image_alpha, 0, 0.2)
    if image_alpha == 0
        instance_destroy()
}
