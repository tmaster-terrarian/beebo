if(!triggered)
{
    if(sft)
    {
        if(player_lastcollide == 0) && (place_meeting(x, y, obj_player))
        {
            event_perform(ev_other, ev_user0) //on trigger enter
        }

        if(player_lastcollide == 1) && (!place_meeting(x, y, obj_player))
        {
            event_perform(ev_other, ev_user1) //on trigger exit
        }

        if(place_meeting(x, y, obj_player))
        {
            event_perform(ev_other, ev_user2) //while in trigger
        }
    }
}
