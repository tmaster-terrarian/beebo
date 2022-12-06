audio_group_load(audiogroup_bgm);

started = 0;
anim_timer = 0; //200 frames is 3.33 seconds, right when the dos boots in the sound that plays. the entire sound is 1882.2 frames long
boot_sound = noone;

t_scale = (1/3);
t_pad_x = 1 + 36;
t_pad_y = 1;
t_line_size = 7;

global.screenSize = 1;

ini_open("save.ini");

global.screenSize = floor(ini_read_real("screeb", "res", 2));
if(global.screenSize < 9)
{
    window_set_fullscreen(false);
    window_set_size((256 * global.screenSize), (144 * global.screenSize));
}
else
{
    window_set_fullscreen(true);
}

ini_close();
