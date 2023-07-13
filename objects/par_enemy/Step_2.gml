event_inherited();
if(lasthp != hp) {alarm[11] = 5}
if(hp > hp_max) hp = hp_max

t++

if autoaggro
{
    if(!instance_exists(target))
        target = get_nearest_notme(x, y, _target)
    if(collision_line(x, y, target.x, (target.bbox_bottom + target.bbox_top)/2, obj_wall, 0, 1) && !seethruwalls)
    {
        if(aggrotimer < 180)
            aggrotimer++
        if(aggrotimer >= 180)
        {
            agpos.x = x
            agpos.y = y
            agpos.cy = (bbox_bottom + bbox_top)/2
            target = noone
        }
    }
    else
    {
        aggrotimer = 0
        agpos.x = target.x
        agpos.y = target.y
        agpos.cy = (target.bbox_bottom + target.bbox_top)/2
    }
}
