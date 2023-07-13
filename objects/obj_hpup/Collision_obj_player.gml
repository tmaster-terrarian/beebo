with(other)
{
    heal_event(id, hp_max * 0.1)
}
audio_play_sound(sn_player_heal, 0, false);
instance_destroy();
