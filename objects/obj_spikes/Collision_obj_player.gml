if t
    t--
with (other)
{
    if(!other.t)
    {
        other.t = 30
        hp -= other.damage
        state = "stunned"
        timer0 = 0
        flash = 5;
        audio_play_sound(sn_player_hit, 0, false);
    }
}
