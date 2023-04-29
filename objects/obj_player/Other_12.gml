/// @description damage
if(invuln <= 0)
{
    invuln = 30;
    state = "stunned"
    timer0 = 0
    flash = 5;
    audio_play_sound(sn_player_hit, 0, false);
    hsp = -1 * facing
    vsp = -1
}
