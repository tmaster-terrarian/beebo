//vertical collide

if (state == "normal")
{
    landTimer = 8
    sprite_index = spr_anime_jump
    image_index = 0
    can_jump = 1;
}
if (vsp > 0.2)
    audio_play_sound(sn_player_land, 0, false)
if (state == "backflip")
{
    state = "backflip_end";
    timer0 = 0;
    sprite_index = spr_anime_backflip_c;
    image_index = 0;
}
vsp = 0;
