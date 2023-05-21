scr_particle_explode2()
var snd = choose(sn_hitmetal_1, sn_hitmetal_2, sn_hitmetal_3)
audio_play_sound(snd, 0, false)
with(MakeExplosion(x, y + image_yscale * 8, image_xscale * 1.5, image_yscale * 1.5))
{
	image_angle = random_range(0, 360)
    damage = 1
    with(obj_robo) if(place_meeting(x, y, other)) hp -= other.damage * 4
    with(oCrate) if(place_meeting(x, y, other)) hp -= other.damage * 4
    with(obj_tnt) if(place_meeting(x, y, other)) flash = 10
    with(obj_player) if(place_meeting(x, y, other)) event_perform(ev_other, ev_user2)
}
ScreenShake(4, 40)
instance_destroy()
