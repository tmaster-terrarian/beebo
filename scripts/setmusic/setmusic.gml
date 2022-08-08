function SetMusic(sound_id)
{
    with(oGameManager)
    {
        audio_stop_sound(current_bgm);
        current_bgm = audio_play_sound(sound_id, 10, true);
    }
}
function StopMusic()
{
    with(oGameManager)
    {
        audio_stop_sound(current_bgm);
    }
}
