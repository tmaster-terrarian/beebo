if(audio_group_is_loaded(audiogroup_bgm)) && (started == 0)
{
    boot_sound = audio_play_sound(sn_dos_disc_boot_combined, 10, false)
    started = 1;
}

if(started == 1)
{
    anim_timer = min(1883, anim_timer + 1);

    if(anim_timer == 205)
        audio_play_sound(sn_EMF_TAPE_RECORDING_01, 10, false, 1, 3.4)

    if(keyboard_check_pressed(vk_enter)) || (keyboard_check_pressed(vk_space)) || (gamepad_button_check_pressed(0, gp_face1)) || (gamepad_button_check_pressed(0, gp_start))
    {
        audio_stop_sound(boot_sound);
        audio_stop_sound(sn_EMF_TAPE_RECORDING_01);
        room_goto(rMenu);
    }
    if(anim_timer == 1883)
    {
        audio_stop_sound(boot_sound);
        audio_stop_sound(sn_EMF_TAPE_RECORDING_01);
        room_goto(rMenu);
    }
}
