if skip
	skip--
if duration
	duration--

if(duration <= 0) || (skip <= 0 && ((keyboard_check_pressed(vk_enter)) || (keyboard_check_pressed(vk_space)) || (gamepad_button_check_pressed(0, gp_face1)) || (gamepad_button_check_pressed(0, gp_start))))
{
	audio_stop_sound(snd)
	gm_room_transition_direct(loading_rm)
}
