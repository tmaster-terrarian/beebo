/// @description hp change thingy
if(instance_exists(obj_player))
{
    hp_change = (obj_player.hp + hp_change) / 2
    alarm[0] = 2
}
else
{
    hp_change = hp_change / 2
    alarm[0] = 2
}
