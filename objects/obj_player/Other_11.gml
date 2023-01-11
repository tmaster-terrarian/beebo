if (state == "normal")
{
    landTimer = 8
    sprite_index = spr_player_jump
    image_index = 0
}
if (vsp > 0.2)
    audio_play_sound(sn_player_land, 0, false)
vsp = 0;
