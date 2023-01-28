instance_destroy(obj_playerfist)
facing = sign(facing)
if (state != "dodge" && state != "spike")
    state = "attack"
image_speed = 0.5
image_index = 0
var canTurn = 0
var input_dir = 0
if gml_Script_input_check("right")
    input_dir += 1
if gml_Script_input_check("left")
    input_dir -= 1
var no = 1
if (gml_Script_input_check("up") && canUpper)
{
    hspd = 0
    vspd = 0
    state = "dragon"
    timer0 = 0
    image_index = 0
    image_speed = 0
    canUpper = 0
    if (input_dir != 0)
        facing = input_dir
}
else if (gml_Script_input_check("down") && (!on_ground))
{
    timer0 = 0
    hspd = (0 * facing)
    vspd = 0
    state = "falcon"
    sprite_index = spr_player_flip
    audio_play_sound(sn_flip, 0, false)
    image_index = 0
    image_speed = 0.2
    canUpper = 0
}
else if (sprite_index == spr_player_roll || sprite_index == spr_player_flip)
{
    if (!on_ground)
    {
        sprite_index = spr_player_flip
        with (instance_create_depth(x, y, (depth - 2), obj_playerfist))
        {
            sprite_index = spr_player_flip
            size = 1.25
            knockback = 10
            visible = true
            image_speed = 0.5
        }
        audio_play_sound(sn_flip, 0, false)
    }
    else
    {
        sprite_index = spr_player_punch_1
        with (instance_create_depth(x, y, (depth + 2), obj_playerfist))
        {
            knockdown = -1
            knockback = 1
        }
        state = "attack"
    }
}
else if (duck == 0)
{
    if (sprite_index != spr_player_punch_1)
    {
        with (instance_create_depth(x, y, (depth + 2), obj_playerfist))
        {
            knockdown = -1
            knockback = 1
        }
        sprite_index = spr_player_punch_1
    }
    else
    {
        sprite_index = spr_player_punch_2
        with (instance_create_depth(x, y, (depth + 2), obj_playerfist))
        {
            knockdown = -1
            knockback = 1
        }
    }
}
else if (hspd > 1 || hspd < -1)
{
    state = "slide"
    slideTimer = 30
    sprite_index = spr_player_slide
}
else
{
    with (instance_create_depth(x, y, (depth + 2), obj_playerfist))
    {
        knockdown = -1
        knockback = 0.5
    }
    sprite_index = spr_player_duckPunch
}
image_index = 0
if (sprite_index == spr_player_punch_1 || sprite_index == spr_player_punch_2)
{
    canTurn = 1
    audio_play_sound(choose(70, 71, 71), 1, false)
}
if canTurn
{
    if (abs(hspd) < 1)
    {
        if gml_Script_input_check("right")
        {
            facing = 1
            if on_ground
                hspd = approach(hspd, (facing * 1), 1)
        }
        if gml_Script_input_check("left")
        {
            facing = -1
            if on_ground
                hspd = approach(hspd, (facing * 1), 1)
        }
    }
}
