event_inherited();
triggered = 1;

with (obj_player)
{
    if(hascontrol)
    {
        hascontrol = false;
    }
}
with (gm)
{
    gm_room_transition_goto(other.target_st, other.target_rm, other.target_x, other.target_y);
}
