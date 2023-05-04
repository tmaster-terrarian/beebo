done = false;
hsp *= obj_player.facing;
vsp = 0
hsp0 = 0
throwsound = audio_play_sound(sn_throw_bomb, 1, false);
bounce_counter = 0;
max_bounces = 1;
decel_rate = 0.01;
if(obj_player.state == "grind")
{
    hsp0 = -7
    decel_rate = 0.5
}

explode = function()
{
    audio_stop_sound(throwsound);
    with(MakeExplosion(x, y, size, size, (2 / 3), sn_explosion2))
    {
        dmg = other.damage;

        with(oCrate) if(place_meeting(x, y, other)) hp -= other.dmg;

        with(obj_stone) if(place_meeting(x, y, other)) hp -= other.dmg;

        with(obj_enemy) if(place_meeting(x, y, other)) hp -= other.dmg;
        with(par_enemy) if(place_meeting(x, y, other) && !playerally) hp -= other.dmg;
        with(obj_boss) if(place_meeting(x, y, other)) {hp -= other.dmg; flash = 3}

        with(obj_player)
        {
            other.hspeed = ((state == "grind") * -7)
        }
    }
    ScreenShake(4, 40);
    done = true;
    scr_particle_explode();
}
bla = 1
