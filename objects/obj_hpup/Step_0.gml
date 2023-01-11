if(y > room_height - 4) scr_particle_explode();

if(!done) && (!follow_player)
{
    vsp += grv;

    if (place_meeting(x + hsp, y, oWall))
    {
        if(bounce_counter < max_bounces)
        {
            hsp = -(hsp * 0.75);
            bounce_counter += 1;
            audio_play_sound(sn_heart_bounce, 0, false);
        }
        else
        {
            hsp = 0;
        }
    }
    x += hsp;

    if (place_meeting(x, y + vsp, oWall)) || ((place_meeting(x, y + vsp, oPlatform)) && vsp > 0)
    {
        if(bounce_counter < max_bounces)
        {
            vsp = -(vsp * 0.5);
            hsp -= decel_rate * sign(hsp);
            bounce_counter += 1;
            audio_play_sound(sn_heart_bounce, 0, false);
        }
        else
        {
            for(var i = 0; i < 20; i++)
            {
                if(!place_meeting(x, y + sign(vsp), oWall))
                {
                    y += sign(vsp);
                }
                else
                {
                    vsp = 0;
                    done = true;
                    break;
                }
            }
        }
    }
    y += vsp;
}
else if(!place_meeting(x, y + 1, oWall))
{
    done = false;
    bounce_counter = 0;
}

if(!follow_player)
{
    with(oWall) if(place_meeting(x, y, other)) { other.x += sign(other.x - x); other.y += sign(other.y - y); }

    if(!place_meeting(x + 1, y, oWall)) && (!place_meeting(x - 1, y, oWall))
    {
        with(obj_hpup) if(place_meeting(x, y, other))
        {
            x += sign(x - other.x);
            depth = 300 - x - other.x;
        }
    }
}

with(obj_player)
{
    if(distance_to_point(other.x, other.y) < 12)
    {
        other.follow_player = true;
    }
}

if(follow_player)
{
    with(obj_player)
    {
        other.x += sign(x - other.x) * 2;
        other.y += sign(y - other.y) * 2;
    }
}
