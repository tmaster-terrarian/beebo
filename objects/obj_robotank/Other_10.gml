//h
if abs(hsp) > 0.5
{
    if(place_meeting(x + hsp, y, obj_tnt))
    {
        instance_place(x + hsp, y, obj_tnt).flash = 1
    }
    else if(place_meeting(x + hsp, y, oCrate))
    {
        instance_place(x + hsp, y, oCrate).hp = 0
        audio_play_sound(sn_woodHit, 0, false)
    }
    else
    {
        hp = 0
        hsp = 0
    }
}
else
    hsp = 0
