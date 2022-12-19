if(done == false)
{
    done = true;
    bg.x = camera_get_view_x(cam) - 8;
    bg.y = camera_get_view_y(cam) - 8;
    audio_play_sound(sn_antic_gyui, 1, false);
}
