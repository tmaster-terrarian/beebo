stats =
{
    hp_max : 1,
    spd : 2.5,
	firerate : 1,
	damage : 4
}
event_inherited()
depth = 310
image_speed = 0
state = "normal"
target = noone
var inst, xx;
xx = x;
x -= 10000;
inst = instance_nearest(xx, y, par_enemy);
if inst != id
{
    target = inst
}
x += 10000;
playerally = 1
t = 0
r = 0
