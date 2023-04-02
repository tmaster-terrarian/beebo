if(done) return;

vsp += grv;

//h
var c = noone
if (place_meeting(x + hsp, y, oCrate)) || (place_meeting(x + hsp, y, obj_stone))
{
    explode();
}
else var c = collision_point(x + hsp, y, obj_wall, 1, 1)
if c
{
    if(bounce_counter >= max_bounces)
    {
        hsp = 0;
        explode();
    }
    if(sign(c.hsp) != sign(hsp))
        hsp = -(hsp * 0.75) + c.hsp
    else
        hsp = -(hsp * 0.75)
    bounce_counter += 1
    audio_play_sound(sn_walljump, 0, false)
}
x += hsp;

//v
var c = noone
if (place_meeting(x, y + vsp, oCrate)) || (place_meeting(x, y + vsp, obj_stone)) || (place_meeting(x, y + vsp, obj_enemy)) || (place_meeting(x, y + vsp, par_enemy)) || (place_meeting(x, y + vsp, obj_boss))
{
    explode();
}
else var c = collision_point(x, y + vsp, obj_wall, 1, 1)
if (c && vsp > 0)
{
    if(bounce_counter >= max_bounces)
    {
        vsp = 0;
        explode();
    }
    vsp = -(vsp * 0.75) - 0.75 + c.vsp * 0.5;
    hsp -= decel_rate * sign(hsp) + c.hsp * 0.1;
    bounce_counter += 1;
    audio_play_sound(sn_walljump, 0, false)
}

if ((place_meeting(x, y + vsp, obj_platform) && !place_meeting(x, y - 1, obj_platform)) && vsp > 0)
{
    if(bounce_counter >= max_bounces)
    {
        vsp = 0;
        explode();
    }
    vsp = -(vsp * 0.75) - 0.75;
    hsp -= decel_rate * sign(hsp);
    bounce_counter += 1;
    audio_play_sound(sn_walljump, 0, false)
}
y += vsp;

if(obj_player.state == "grind")
{
    if y > room_height
    {
        event_perform(ev_other, ev_outside)
    }
    if (obj_player.trailTimer % 4 == 1)
    {
        with (instance_create_depth(x, y, depth, fx_aura))
        {
            visible = true
            image_speed = 0
            image_index = other.image_index
            sprite_index = other.sprite_index
            image_xscale = other.image_xscale
            image_yscale = other.image_yscale
            image_angle = other.image_angle
            hspeed = -6
        }
    }
}
