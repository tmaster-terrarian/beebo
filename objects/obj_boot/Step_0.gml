if(audio_group_is_loaded(audiogroup_bgm)) && (started == 0)
{
    // room_goto(rMenu);
    boot_sound = audio_play_sound(sn_dos_disc_boot_combined, 10, false);
    started = 1;
}

if(started == 1)
{
    anim_timer = min(1883, anim_timer + 1);

    if(keyboard_check_pressed(vk_enter)) || (keyboard_check_pressed(vk_space))
    {
        audio_stop_sound(boot_sound);
        room_goto(rMenu);
    }
    if(anim_timer == 1883)
    {
        audio_stop_sound(boot_sound);
        room_goto(rMenu);
    }
}
