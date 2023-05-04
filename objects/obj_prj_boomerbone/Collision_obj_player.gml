with other
{
	oCamera.alarm[0] = 10
	hp -= other.damage
	state = "stunned"
	timer0 = 0
	flash = 5;
	audio_play_sound(sn_player_hit, 0, false);
}
audio_play_sound(snHurt, 0, false);
scr_particle_explode();
