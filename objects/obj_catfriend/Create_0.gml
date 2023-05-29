stats =
{
    hp_max : 1,
    spd : 2.5,
	firerate : 1,
	damage : 10
}
event_inherited()
depth = 310
image_speed = 0
state = "normal"
target = noone
var xx = x;
x -= 10000;
var inst = instance_nearest(xx, y, _target);
if inst && inst.object_index != obj_catfriend
{
    target = inst
}
x += 10000;
t = 0
r = 0
