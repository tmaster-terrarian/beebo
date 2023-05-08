event_inherited();
_team = team.player
damage = 5
done = false;
hsp *= obj_player.facing;
vsp = 0
hsp0 = 0
grv = 0.1
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
    event_perform(ev_other, ev_user1)
}
bla = 1
