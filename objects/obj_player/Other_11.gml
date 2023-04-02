var input_dir = 0
input_dir = sign
(
    gamepad_axis_value(0, gp_axislh)
    + (gamepad_button_check(0, gp_padr) - gamepad_button_check(0, gp_padl))
    + (keyboard_check(ord("D")) - keyboard_check(ord("A")))
)
if (state == "normal")
{
    landTimer = 8
    sprite_index = spr_player_jump
    image_index = 0
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
            vx = other.hsp + (other.state == "grind") * -7
            vz = 0
        }
    }
}
vsp = 0
