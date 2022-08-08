if (done == 0)
{
    vsp += grv;
	image_angle -= 10;

    //move and collisions
    //horizontal
    if (place_meeting(x + hsp, y, oWall))
    {
        while (!place_meeting(x + sign(hsp), y, oWall))
        {
            x += sign(hsp);
        }
        hsp = 0;
    }
    x += hsp;

    //vertical
    if (place_meeting(x, y + vsp, oWall))
    {
        if (vsp > 0)
        {
            done = 1;
            x = round(x);
            y = round(y);
			//image_angle = clamp(image_angle, 135, 270);
        }
        while (!place_meeting(x, y + sign(vsp), oWall))
        {
            y += sign(vsp);
        }
        vsp = 0;
    }
    y += vsp;
}
