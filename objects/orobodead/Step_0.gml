if !done
{
    vsp += grv;

    //move and collisions
    //horizontal
    if (place_meeting(x + hsp, y, obj_wall))
    {
        while (!place_meeting(x + sign(hsp), y, obj_wall))
        {
            x += sign(hsp);
        }
        hsp = 0;
    }
    x += hsp;

    //vertical
    if (place_meeting(x, y + vsp, obj_wall))
    {
        if (vsp > 0)
        {
            done = 1;
            image_index = 1;
        }
        while (!place_meeting(x, y + sign(vsp), obj_wall))
        {
            y += sign(vsp);
        }
        vsp = 0;
    }
    y += vsp;

    x = round(x);
    y = round(y);
}
else {scr_particle_explode_violent(); scr_particle_explode2(); scr_particle_explode()}
