if t
    t--

var buff = new statmanager._slow()
buff.duration = 120
_inflict(other, buff)
with (other)
{
    if(!other.t)
    {
        oCamera.alarm[0] = 10
        other.t = 30
        hp -= other.damage
        state = "stunned"
        timer0 = 0
        flash = 5;
        audio_play_sound(sn_player_hit, 0, false);
    }
}
