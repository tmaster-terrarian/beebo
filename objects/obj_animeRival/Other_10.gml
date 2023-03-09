if(!place_meeting(x + sign(hsp), y - 4, obj_wall))
{
    for(var i = 0; i < 4; i++)
    {
        y -= 1;
        if(!place_meeting(x + sign(hsp), y, obj_wall))
        {
            x += sign(hsp);
            break;
        }
    }
}
hsp = 0;
