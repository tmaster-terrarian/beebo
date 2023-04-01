vsp += grv

if(place_meeting(x + hsp, y, obj_wall) && collide) || (place_meeting(x + hsp, y, obj_moveable) && !place_meeting(x, y, obj_moveable))
{
    if(bounces < bounce_max)
    {
        bounces++
        hsp = -hsp * 0.8
    }
    else
        instance_destroy()
}
x += hsp

if((place_meeting(x, y + vsp, obj_wall) || (place_meeting(x, y + vsp, obj_platform) && !place_meeting(x, y, obj_platform)) || (place_meeting(x, y + vsp, obj_moveable) && !place_meeting(x, y, obj_moveable))) && collide)
{
    if(bounces < bounce_max)
    {
        bounces++
        vsp = -vsp * 0.5
    }
    else
        instance_destroy()
}
y += vsp

image_angle = point_direction(0, 0, hsp, vsp)
image_xscale = floor(point_distance(0, 0, hsp, vsp)) + 2
