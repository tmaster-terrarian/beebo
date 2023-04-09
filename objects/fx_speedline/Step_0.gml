image_angle = point_direction(0, 0, hsp, vsp)
image_xscale = ceil(point_distance(0, 0, hsp, vsp)) * 4

x += hsp
y += vsp

if(!place_meeting(x, y, oCamera))
{
    instance_destroy()
}
