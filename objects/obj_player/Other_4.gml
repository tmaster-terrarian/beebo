if(instance_exists(obj_playernode))
{
    x = obj_playernode.x
    y = obj_playernode.y
    state = obj_playernode.startstate
}
else
{
    x = 0
    y = 0
    state = "donothing"
}
global.gamestarted = true;
