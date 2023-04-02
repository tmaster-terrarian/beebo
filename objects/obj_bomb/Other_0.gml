var g = 0
with(obj_player)
{
    g = (state == "grind") && other.y <= room_height
}
if !g
{
    audio_stop_sound(throwsound)
    MakeExplosion(x, y, size, size, (2 / 3), sn_explosion2)
    ScreenShake(4, 40)
    done = true
    scr_particle_explode()
}
