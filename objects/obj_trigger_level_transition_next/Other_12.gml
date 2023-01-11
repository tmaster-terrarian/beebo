triggered = 1;

with (obj_player)
{
    if(hascontrol)
    {
        hascontrol = false;
    }
}
with (oGameManager)
{
    gm_room_transition_next();
}
