if(!place_meeting(x + sign(hsp), y - 4, oWall))
{
    for(var i = 0; i < 4; i++)
    {
        y -= 1;
        if(!place_meeting(x + sign(hsp), y, oWall))
        {
            x += sign(hsp);
            break;
        }
    }
}
else hsp = 0;
