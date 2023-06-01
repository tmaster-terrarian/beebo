MakeExplosion(x, y, 1.25, 1.25, 1)
ScreenShake(6, 60)
audio_play_sound(sn_ow, 1, false)
audio_play_sound(sn_ow, 1, false, 0.5)

instance_destroy(_rope)
