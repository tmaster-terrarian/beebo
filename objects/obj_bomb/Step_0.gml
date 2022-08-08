if(done == false)
{
    vsp += grv;

    if (place_meeting(x + hsp, y, oWall))
    {
        hsp = -hsp;
    }
    x += hsp;

    colV = function(obj)
    {
        if (place_meeting(x, y + vsp, obj))
        {
            while (!place_meeting(x, y + sign(vsp), obj))
            {
                y += sign(vsp);
            }
            vsp = 0;
            audio_stop_sound(throwsound);
            with(MakeExplosion(x, y, size, size, (2 / 3), sn_explosion2))
            {
                dmg = other.damage;
                with(oRobo) if(place_meeting(x, y, other)) hp -= other.dmg;
                with(oCrate) if(place_meeting(x, y, other)) hp -= other.dmg;
                with(o_nectar) if(place_meeting(x, y, other)) hp -= other.dmg;
            }
            ScreenShake(4, 40);
            done = true;
            scr_particle_explode();
        }
    }
    colV(oWall);
    colV(oCrate);
    colV(oRobo);
    colV(o_nectar);
    y += vsp;
}
