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
    var c = instance_place(x, y, oWall)
    if c
    {
        if(c.x > x)
            x--
        if(c.x < x)
            x++
        if(c.x == x || c.y > y)
            y--
        if(c.y <= y)
            y++
    }

    if(!place_meeting(x + 1, y, oWall)) && (!place_meeting(x - 1, y, oWall))
    {
        var rand = choose(-1, 1)
        var c = instance_place(x, y, obj_hpup)
        if c
        {
            if(c.x > x)
                x--
            if(c.x < x)
                x++
            if(c.x == x && !place_meeting(x + rand, y, oWall))
                c.x += rand
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
    if instance_exists(obj_player)
    {
        with(obj_player)
        {
            other.x += sign(x - other.x) * 2;
            other.y += sign(y - (other.y + 8)) * 2;
        }
    }
    else
    {
        follow_player = false
        done = false
    }
}
