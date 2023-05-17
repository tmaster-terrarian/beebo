if(instance_exists(obj_playernode))
{
    x = obj_playernode.x
    y = obj_playernode.y
    state = obj_playernode.startstate
}
global.gamestarted = true;
if(global.hasgun) instance_create_depth(x, y, 300, oGun);

with(oCamera)
{
    event_perform(ev_step, ev_step_begin)
    x = xTo
    y = yTo
}
