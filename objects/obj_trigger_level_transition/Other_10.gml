event_inherited();
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
    gm_room_transition_goto(other.target_st, other.target_rm, TRANS_TYPE.BOX);
}
