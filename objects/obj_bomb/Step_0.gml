explode = function()
{
    audio_stop_sound(throwsound);
    with(MakeExplosion(x, y, size, size, (2 / 3), sn_explosion2))
    {
        dmg = other.damage;
        with(obj_enemy) if(place_meeting(x, y, other)) hp -= other.dmg;
        with(oCrate) if(place_meeting(x, y, other)) hp -= other.dmg;
    }
    ScreenShake(4, 40);
    done = true;
    scr_particle_explode();
}

if(done == false)
{
    vsp += grv;

    if (place_meeting(x + hsp, y, oCrate))
    {
        explode();
    }
    if (place_meeting(x + hsp, y, oWall))
    {
        hsp = -(hsp * 0.75);
        bounce_counter += 1;
    }
    x += hsp;

    if (place_meeting(x, y + vsp, oCrate)) || (place_meeting(x, y + vsp, obj_enemy))
    {
        explode();
    }
    if (place_meeting(x, y + vsp, oWall)) || ((place_meeting(x, y + vsp, oPlatform)) && vsp > 0)
    {
        if(bounce_counter >= max_bounces)
        {
            vsp = 0;
            explode();
        }
        vsp = -(vsp * 0.75);
        bounce_counter += 1;
    }
    y += vsp;
}
