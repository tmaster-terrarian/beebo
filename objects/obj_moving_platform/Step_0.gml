if place_meeting(x, y - 1, obj_player) && !moved
{
    moved = 1
    move = 1
}

//animation/visuals
if move
{
    smallcog_index = approach(smallcog_index, 4, 0.2 * path_sp)
    if(smallcog_index == 4) smallcog_index = 0

    cog_rotl = wrap(cog_rotl + (cog_rotsp * -path_sp), 0, 360)
    cog_rotr = wrap(cog_rotr + (cog_rotsp * path_sp), 0, 360)

    if(timer % 12 == 0)
    {
        with(instance_create_depth(bbox_left, y + 4 + irandom_range(-2, 2), depth - 2, fx_dust))
        {
            sprite_index = spr_fx_dust
            vx = -random(1)
            vy = -random(0.75) - 1 + other.vsp * 0.2
            vz = abs(vz)
            fade = 0
            life = 4
            fric = 0.02
        }
        with(instance_create_depth(bbox_right, y + 4 + irandom_range(-2, 2), depth - 2, fx_dust))
        {
            sprite_index = spr_fx_dust
            vx = random(1)
            vy = -random(0.75) - 1 + other.vsp * 0.2
            vz = -abs(vz)
            fade = 0
            life = 4
            fric = 0.02
        }

        if(instance_exists(obj_player))
        {
            var snd_distance = 128
            audio_play_sound(sn_steam, 0, false, ((-clamp(distance_to_point(obj_player.x, obj_player.y), 32, snd_distance)) + snd_distance) * (1/snd_distance) * 0.75)
        }
    }

    timer += path_sp
}
else
{
    timer = 0
    smallcog_index = 0
    cog_rotl = 0
    cog_rotr = 0
}

player_step_yoffs = place_meeting(x, y - 1, obj_moveable)
