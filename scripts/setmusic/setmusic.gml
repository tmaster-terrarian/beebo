function SetMusic(sound_id)
{
    with(oGameManager)
    {
        if(audio_get_name(sound_id) != audio_get_name(current_bgm))
        {
            audio_stop_sound(current_bgm);
            current_bgm = audio_play_sound(sound_id, 10, true);
            audio_sound_gain(current_bgm, global.bgm_volume, 0);
            return;
        }
        else return;
    }
}
function StopMusic()
{
    with(oGameManager)
    {
        audio_stop_sound(current_bgm);
        return;
    }
}
