global.dt = (delta_time / 1000000) * 60 * global.timescale
global.sc = window_get_width() / 256

audio_sound_pitch(current_bgm, global.timescale)
