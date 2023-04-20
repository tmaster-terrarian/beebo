//vertical collide

if (state == "normal")
{
    landTimer = 8
    sprite_index = spr_anime_jump
    image_index = 0
    can_jump = 1;
}
if (vsp > 0.2)
    audio_play_sound(sn_player_land, 0, false)
if (vsp >= 0)
{
    for (var i = 0; i < 4; i++)
    {
        with (instance_create_depth((bbox_left + random(8)), random_range(bbox_bottom, bbox_bottom), (depth - 1), fx_dust))
        {
            sprite_index = spr_fx_dust2
            vx = other.hsp
            vz = 0
        }
    }
}
if (state == "backflip")
{
    state = "backflip_end";
    timer0 = 0;
    sprite_index = spr_anime_backflip_c;
    image_index = 0;
}
vsp = 0;
