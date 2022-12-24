triggered = 1;

with (oPlayer)
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
