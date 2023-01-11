if global.hitStop
    return;
jumpsp = -3
grv = 0.13
image_speed = 0
var input_dir = 0
var fxtrail = 0
var canAtk = canAttack
var canJmp = canJump
var canDdg = canDodge
var canDJ = canDoubleJump
if (inputJump < 5)
    inputJump++
if (inputPunch < 5)
    inputPunch++
if (inputDodge < 5)
    inputDodge++
if (inputDash < 5)
    inputDash++
if (!on_ground)
    duck = 0
S_RUN_ACCEL = 0.1
walksp = 2
if (duck && state != "slide")
{
    walksp = 1
    if (abs(hsp) > 1)
        hsp = approach(hsp, (1 * input_dir), 0.25)
}
if (abs(hsp) > 1.5 && on_ground)
    hsp = approach(hsp, (1.5 * input_dir), 0.01)
if gml_Script_input_check("right")
    input_dir += 1
if gml_Script_input_check("left")
    input_dir -= 1
if on_ground
{
    accel = S_RUN_ACCEL
    fric = S_RUN_FRIC
}
else
{
    accel = S_AIR_ACCEL
    fric = S_AIR_FRIC
}
switch state
{
    case "stunned":
        sprite_index = spr_player_hurt
        image_index++
        canAtk = -1
        canDdg = -1
        canJmp = -1
        break
    case "normal":
        canAttack = 1
        canJump = 1
        if (duck > 1)
            mask_index = mask_player_2
        else
            mask_index = mask_player
        if (input_dir == 1)
        {
            if (hsp < 0)
            {
                hsp = approach(hsp, 0, fric)
                if (on_ground && duck == 0)
                    sprite_index = spr_player_skid
            }
            else if (on_ground && vsp >= 0)
            {
                if (duck == 0 && (!landTimer))
                    sprite_index = spr_player_run
                else if duck
                    sprite_index = spr_player_crawl
            }
            if run
                run = 7
            if (hsp < walksp)
                hsp = approach(hsp, walksp, accel)
            if on_ground
                facing = 1
            else
                facing = approach(facing, 1, 0.2)
        }
        else if (input_dir == -1)
        {
            if (hsp > 0)
            {
                hsp = approach(hsp, 0, fric)
                if (on_ground && duck == 0)
                    sprite_index = spr_player_skid
            }
            else if (on_ground && vsp >= 0)
            {
                if (duck == 0 && (!landTimer))
                    sprite_index = spr_player_run
                else if duck
                    sprite_index = spr_player_crawl
            }
            if (hsp > (-walksp))
                hsp = approach(hsp, (-walksp), accel)
            if run
                run = 7
            if on_ground
                facing = -1
            else
                facing = approach(facing, -1, 0.2)
        }
        else
        {
            hsp = approach(hsp, 0, (fric * 2))
            if (abs(hsp) < 2)
            {
                if run
                    run--
            }
            if (abs(hsp) < 0.5 && on_ground && (!landTimer))
            {
                sprite_index = spr_player_stand
                image_index = 0
                if duck
                {
                    sprite_index = spr_player_duck
                    image_index = duck
                }
                else if gml_Script_input_check("up")
                {
                    sprite_index = spr_player_lookup
                    image_index = 0
                }
            }
        }
        if (gml_Script_input_check("down") && on_ground)
            duck = approach(duck, 4, 1)
        else if (!(place_meeting(x, (y - 8), oWall)))
            duck = approach(duck, 0, 1)
        if (!on_ground)
        {
            if (vsp >= -0.5)
            {
                if place_meeting((x + (2 * input_dir)), y, oWall)
                    wallslideTimer++
            }
            else
                wallslideTimer = 0
            if (wallslideTimer >= 5)
                state = "wallslide"
            sprite_index = spr_player_jump
            if (vsp >= 0.1)
                vsp = approach(vsp, vsp_max, grv)
            if (vsp < 0)
                vsp = approach(vsp, vsp_max, grv)
            else if (vsp < 2)
                vsp = approach(vsp, vsp_max, (grv * 0.25))
            if ((keyboard_check_released(ord("A")) || gamepad_button_check_released(0, gp_face2) || gamepad_button_check_released(1, gp_face2)) && (!vsp))
                vsp /= 2
            if (vsp < 0)
                image_index = approach(image_index, 1, 0.2)
            else if (vsp >= 0.5)
                image_index = approach(image_index, 5, 0.5)
            else
                image_index = 3
        }
        else
            wallslideTimer = 0
        if (sprite_index == spr_player_run)
            image_index += (hsp / 6)
        landTimer = approach(landTimer, 0, 1)
        break
    case "backflip":
        canJump = 0
        if (timer0 == 0)
        {
            sprite_index = spr_player_flip
            hsp = 0
            vsp = 0
            vsp = -2
            hsp = (-2 * sign(facing))
            invuln = 20
            timer0++
            audio_play_sound(sn_flip, 0, false)
            audio_play_sound(sn_walljump, 0, false)
        }
        fxtrail = 1
        vsp = approach(vsp, vsp_max, grv)
        image_index -= 0.25
        if instance_exists(obj_playerfist)
            image_index -= 0.75
        break
    case "dodge":
        canJmp = 0
        canDdg = 0
        if (timer0 == 0)
        {
            sprite_index = spr_player_roll
            image_index = 0
        }
        if (sprite_index == spr_player_flip)
        {
            image_index++
            if (!on_ground)
            {
                if (input_dir != facing && input_dir != 0)
                    hsp = approach(hsp, input_dir, accel)
            }
            else if (input_dir != 0)
            {
                facing = (1 * input_dir)
                hsp = approach(hsp, (2 * input_dir), 0.5)
            }
        }
        if (!on_ground)
            vsp = approach(vsp, vsp_max, (grv * 0.8))
        else
        {
            if (sign(input_dir) != sign(hsp))
                hsp = approach(hsp, 0, 0.07)
            else if (input_dir != 0)
                hsp = approach(hsp, (input_dir * 2), 1)
            if (image_index >= 10)
            {
                canJmp = 1
                canDdg = 1
            }
        }
        if (timer0 < 5)
            timer0++
        fxtrail = 1
        if (timer0 == 4)
        {
            vsp = -1.3
            audio_play_sound(sn_walljump, 0, false)
            hsp = (2 * sign(facing))
            timer = 15
        }
        if (timer0 == 5)
        {
            if (!on_ground)
            {
                if (sprite_index == spr_player_roll)
                {
                    if (image_index < 6)
                        image_index += 0.5
                    if (image_index > 6)
                        image_index = 5
                }
            }
            else
            {
                timer0 = 6
                image_index = 6
                sprite_index = spr_player_roll
            }
        }
        if (timer0 == 6)
        {
            if (image_index < 16)
                image_index += 0.5
            else
                state = "normal"
        }
        break
    case "hard_land":
        timer0++
        hsp = approach(hsp, 0, 0.2)
        if (timer0 >= 8 || (!on_ground))
        {
            state = "normal"
            timer0 = 0
        }
        break
    case "slide":
        mask_index = mask_player_2
        canAtk = 0
        if (!instance_exists(obj_playerfist))
        {
            with (instance_create_depth(x, y, (depth - 1), obj_playerfist))
            {
                knockback = 2
                knockdown = -0.5
                damage = 0.5
            }
        }
        fxtrail = 1
        if slideTimer
        {
            if (slideTimer > 10)
                image_index = 1
            else if on_ground
                hsp = approach(hsp, 0, S_RUN_FRIC)
            if on_ground
                slideTimer--
        }
        else if on_ground
        {
            state = "hard_land"
            timer0 = 0
            sprite_index = spr_player_duck
            hsp /= 2
        }
        else
            state = "normal"
        if (!on_ground)
            vsp = approach(vsp, vsp_max, grv)
        break
    case "wallslide":
        if (vsp < 0)
            vsp = approach(vsp, vsp_max, 0.5)
        else
            vsp = approach(vsp, (vsp_max / 3), (grv / 3))
        if (!(place_meeting((x + (input_dir * 2)), y, oWall)))
        {
            state = "normal"
            wallslideTimer = 0
        }
        sprite_index = spr_player_wallslide
        var n = choose(0, 1, 0)
        if n
            instance_create_depth((x + (4 * sign(facing))), random_range((bbox_bottom - 12), (bbox_bottom - 2)), (depth - 1), fx_dust)
        if (input_dir == 0 || on_ground)
        {
            state = "normal"
            wallslideTimer = 0
        }
        if (sign(input_dir) == (-sign(facing)))
        {
            state = "normal"
            wallslideTimer = 0
            facing = sign(input_dir)
        }
        vsp = clamp(vsp, -99, 2)
        break
    case "attack":
        image_speed = 0.3
        canJump = 0
        canAttack = 0
        if (sprite_index == spr_player_jump)
            state = "normal"
        if (sprite_index == spr_player_punch_1 || sprite_index == spr_player_punch_2)
        {
            canAttack = 1
            canJump = 1
            if (keyboard_check_released(ord("A")) || gamepad_button_check_released(0, gp_face1))
            {
                if (!vsp)
                    vsp /= 2
            }
            if (gml_Script_input_check("down") && (hsp > 1 || hsp < -1))
            {
                state = "slide"
                slideTimer = 30
                sprite_index = spr_player_slide
            }
        }
        if (sprite_index == spr_player_flip)
        {
            if (input_dir != 0)
                hsp = approach(hsp, (input_dir * walksp), (accel / 2))
            canAttack = 1
            canJump = 1
            fxtrail = 1
        }
        if on_ground
            hsp = approach(hsp, 0, fric)
        if (!on_ground)
            vsp = approach(vsp, vsp_max, grv)
        break
    case "dragon":
        canJmp = 0
        facing = sign(facing)
        if instance_exists(obj_playerfist)
        {
            if (obj_playerfist.image_index >= 6)
                obj_playerfist.knockdown = -8
        }
        if (timer0 < 4)
        {
            vsp = approach(vsp, 0, 0.5)
            hsp = approach(hsp, 0, 0.5)
            sprite_index = spr_player_dragon
            image_index = 0
        }
        timer0++
        if (timer0 > 12 && (!on_ground))
            vsp = approach(vsp, vsp_max, (grv * 1.3))
        if (timer0 == 4)
        {
            image_index++
            vsp = -2.5
            hsp = ((facing / 2) + (input_dir / 2))
            with (instance_create_depth(x, y, depth, obj_playerfist))
            {
                knockback = 0.5
                knockdown = -4.5
                sprite_index = spr_player_fist_dragon
                multihit = 1
                damage = 0.5
                audio_play_sound(sn_flip, 0, false)
            }
        }
        if (timer0 < 4 && input_dir != 0)
            facing = input_dir
        if (timer0 == 8)
            image_index++
        if (timer0 == 12)
            image_index++
        if (timer0 == 22)
        {
            image_index++
            vsp /= 2
        }
        if (timer0 == 26)
            image_index++
        if (timer0 == 28)
            image_index++
        if (timer0 == 30)
            image_index++
        if (timer0 == 32)
            image_index++
        if (timer0 == 34)
            image_index++
        if (timer0 == 36)
        {
            state = "normal"
            sprite_index = spr_player_jump
            image_index = 4
        }
        if (timer0 < 15)
        {
            canDdg = 0
            canAtk = 0
        }
        break
    case "falcon":
        if (vsp == 0 && input_dir != 0)
            facing = sign(input_dir)
        if (sprite_index == spr_player_flip)
            image_index++
        fxtrail = 1
        canAttack = -1
        canJump = 0
        if (timer0 == 6)
        {
            hsp = (4 * sign(facing))
            vsp = 3
            sprite_index = spr_player_downkick
            image_index = 0
            facing = sign(facing)
            audio_play_sound(sn_flip, 1, false)
        }
        timer0++
        if (!instance_exists(obj_playerfist))
        {
            with (instance_create_depth(x, y, (depth - 1), obj_playerfist))
            {
                sprite_index = spr_player_fist_3
                size = 1.2
                multihit = 1
                knockback = 3
            }
        }
        break
    case "upper":
        if (timer0 <= 1)
        {
            if ((!gml_Script_input_check("punch")) || (!on_ground))
                timer0++
            hsp = approach(hsp, 0, 0.2)
            image_index = approach(image_index, 1.75, 0.25)
            if (input_dir != 0)
                facing = input_dir
        }
        else
        {
            if on_ground
                hsp = approach(hsp, 0, 0.2)
            else
                vsp = approach(vsp, 55, grv)
            image_index += 0.25
            timer0 += 1
            if (timer0 >= 30)
                state = "normal"
        }
        canAtk = 0
        canJmp = 0
        if (image_index >= 4)
        {
            canAtk = 0
            canJmp = 1
        }
        if (timer0 == 3)
        {
            if on_ground
                hsp = (2 * facing)
            with (instance_create_depth(x, y, depth, obj_playerfist))
            {
                sprite_index = spr_player_fist_upper
                knockdown = -8
                knockback = 2
            }
        }
        break
    case "spike":
        if (timer0 <= 1)
        {
            if ((!gml_Script_input_check("punch")) || on_ground)
                timer0++
            if (input_dir != 0)
                facing = input_dir
            image_index = approach(image_index, 1.75, 0.25)
        }
        else
        {
            timer0 += 1
            if (timer0 >= 30)
                state = "normal"
            image_index += 0.25
        }
        canAtk = 1
        canJmp = 1
        if on_ground
            hsp = approach(hsp, 0, 0.2)
        else
            vsp = approach(vsp, 55, grv)
        if (timer0 == 3)
        {
            if on_ground
                hsp = (2 * facing)
            with (instance_create_depth(x, y, depth, obj_playerfist))
            {
                sprite_index = spr_player_fist_spike
                knockdown = 8
                knockback = 6
            }
        }
        break
    case "dash":
        break
    case "ladder":
        canDJ = 1
        canDodge = 1
        canDdg = 1
        hsp = 0
        vsp = 0
        var r = collision_line(x, (y + 2), x, (y - 9), obj_ladder, true, true)
        if r
            x = approach(x, r.x, 1)
        else
        {
            state = "normal"
            ladderhop = 20
        }
        if gml_Script_input_check("up")
            y--
        if gml_Script_input_check("down")
            y++
        if gml_Script_input_check_pressed("jump")
        {
            vsp = (jumpsp * 0.75)
            ladderhop = 20
            hsp = input_dir
        }
        if (input_dir != 0)
            facing = input_dir
        sprite_index = spr_player_lookup
        break
    case "cutscene":
        canDdg = 0
        canAtk = 0
        canDJ = 0
        canJmp = 0
        if (!on_ground)
            vsp = approach(vsp, vsp_max, (grv * 0.25))
        break
    case "hit":
    case "dead":
        if (!on_ground)
            vsp = approach(vsp, vsp_max, grv)
        canJump = 0
        canDodge = 0
        canMove = 0
        canDoubleJump = 0
        canAttack = 0
        hsp = approach(hsp, 0, fric)
        instance_destroy(obj_playerfist, false)
        alarm[0] = -1
        alarm[1] = -1
        image_speed = 1
        if (myHP == 0)
            scr_screenshake(3, 3)
        timer0--
        if ((!timer0) && myHP)
            state = "normal"
        if ((timer0 % 2) == 0)
        {
            if global.coins
                global.coins--
            drawHearts = 60
        }
        break
}

if (gml_Script_input_check_pressed("punch") || gamepad_button_check_pressed(1, gp_face3) || gamepad_button_check_pressed(0, gp_face3))
    inputPunch = 0
if (canAtk && inputPunch < 5)
{
    event_user(13)
    inputPunch = 5
}
var no = 1
if (gml_Script_input_check_pressed("dodge") && no)
    inputDodge = 0
if (inputDodge < 5 && canDdg)
{
    inputDodge = 5
    instance_destroy(obj_playerfist)
    if (input_dir == sign(facing))
    {
        state = "dodge"
        timer0 = 0
        canDodge = 0
    }
    else if (input_dir == (-sign(facing)) || input_dir == 0)
    {
        state = "backflip"
        timer0 = 0
        canDodge = 0
        image_index = 0
    }
}
if gml_Script_input_check_pressed("jump")
    inputJump = 0
if (inputJump < 5 && canJmp)
{
    inputJump = 5
    if (state != "dragon" && state != "slide")
        state = "normal"
    if on_ground
    {
        if ((!duck) || state == "slide")
        {
            state = "normal"
            image_index = 0
            sprite_index = spr_player_jump
            var c = collision_point(x, (y + 2), obj_floor, 1, 1)
            if c
            {
                hsp += c.hsp
                if (c.vsp < 0)
                    vsp = c.vsp
            }
            vsp += jumpsp
            audio_play_sound(sn_playerJump, 0, false)
        }
        else if place_meeting(x, (y + 2), obj_jumpthru)
        {
            sprite_index = spr_player_jump
            y += 2
            image_index = 2
            platformTarget = 0
        }
        else
        {
            c = collision_point(x, (y + 2), obj_floor, 1, 1)
            if c
            {
                hsp += c.hsp
                if (c.vsp < 0)
                    vsp = c.vsp
            }
            vsp += jumpsp
            audio_play_sound(sn_playerJump, 0, false)
        }
    }
    else
    {
        if place_meeting((x + 2), y, oWall)
        {
            state = "normal"
            hsp = -2
            vsp = -2.5
            facing = -1
            audio_play_sound(sn_walljump, 0, false)
        }
        if place_meeting((x - 2), y, oWall)
        {
            state = "normal"
            hsp = 2
            vsp = -2.5
            facing = 1
            audio_play_sound(sn_walljump, 0, false)
        }
    }
}
if fxtrail
    trailTimer++
else
    trailTimer = 0
if ((trailTimer % 3) == 1)
{
    with (instance_create_depth(x, y, (depth + 1), fx_aura))
    {
        visible = true
        color = 16776960
        image_speed = 0
        image_index = other.image_index
        sprite_index = other.sprite_index
        image_xscale = other.image_xscale
    }
}
if place_meeting(x, (y + 2), obj_floor)
{
    var floortype = instance_place(x, (y + 2), obj_floor).type
    var _temp_local_var_11 = floortype
    var footsound = choose(100, 99, 98)
    if (sprite_index == spr_player_run && (ceil(image_index) == 7 || ceil(image_index) == 3))
    {
        if (!audio_is_playing(footsound))
            audio_play_sound(footsound, 8, false)
        if (run && abs(hsp) >= 2)
        {
            with (instance_create_depth(x, bbox_bottom, (depth - 10), obj_hitspark_2))
            {
                sprite_index = spr_footDust
                image_speed = 0.4
            }
        }
    }
}
if invuln
    invuln--
ladderhop--
if (keyboard_check(vk_space) || gml_Script_input_check("start"))
{
    if ded
    {
        room_restart()
        audio_stop_all()
        myHP = maxHP
        ded = 0
        state = "normal"
        drawHP = 1
        image_angle = 0
        hsp = 0
        vsp = 0
        global.hitStop = 60
        obj_player.hsp = 0
        var N = instance_create_depth(x, y, (depth - 9999999999999), fx_roomfade)
        N.timer = 28
        N.nextX = global.saveX
        N.nextY = global.saveY
        N.nextRoom = global.saveRoom
        N.fadeType = "start"
    }
}
while place_meeting(x, y, obj_barrier)
{
    wall = instance_place(x, y, obj_barrier)
    x -= sign((wall.x - x))
}
