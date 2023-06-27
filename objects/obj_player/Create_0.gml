event_inherited();

depth = 300;

state = "normal";

ded = 0
sprite_index = spr_player;
image_speed = 0;
image_index = 0;
timer0 = 0;
landTimer = 0;
wallslideTimer = 0;
running = 0;
run = 0;
shake = 0

_target = noone

lastSafeX = x
lastSafeY = y

up = 0

duck = 0;
lookup = 0;

can_attack = 1;
can_jump = 1;
can_walljump = 1;
can_dodge = 1;

grv = 0.2;
facing = 1;
attack = 0;

stats =
{
    hp_max : 50,
    regen_rate : 0.0133333,
    spd : 2,
    jumpspd : -3.7,
    ground_accel : 0.12,
    ground_fric : 0.08,
    air_accel : 0.07,
    air_fric : 0.02,
    firerate : 4,
    accuracy : 4
}

hp_max = stats.hp_max
hp = hp_max
lasthp = hp
regen_rate = stats.regen_rate
regen = 1

walksp = stats.spd
jump_speed = stats.jumpspd
ground_accel = stats.ground_accel
ground_fric = stats.ground_fric
air_accel = stats.air_accel
air_fric = stats.air_fric
accel = 0
fric = 0

lasthsp = 0
lastvsp = 0

vsp_max = 20;

jump_buffer = 0;
jump_buffer2 = 0;

hascontrol = true;

invuln = 0;
hitfrom = 0;
flash = 0;

fxtrail = 0;
trailTimer = 0;

dashtimer = 0

upixelH = shader_get_uniform(shWhite, "pixelH");
upixelW = shader_get_uniform(shWhite, "pixelW");
texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0));
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0));

anim_state = 0; //0: default, 1: no_gun, 2: animemode
gun_offs_x = 0;
gun_offs_y = 0;

enemy_enabler_counter = 0;

//controller
ch_frame = 0;
ch_frame_max = 2;
ch_animate = 0;
ch_alpha = 0;

gamepad_set_axis_deadzone(0, 0.2);

//use anim state
use_anim_state = function(anim_id, state)
{
    switch(anim_id)
    {
        case 1:
            switch(state)
            {
                case 0: default: sprite_index = spr_player_run; break;
                case 2: sprite_index = spr_anime_run; break;
            }
        break;
        case 2: default:
            switch(state)
            {
                case 0: default: sprite_index = spr_player; break;
                case 2: sprite_index = spr_anime; break;
            }
        break;
        case 3:
            switch(state)
            {
                case 0: default: sprite_index = spr_player_run_rev; break;
                case 2: sprite_index = spr_anime_run_rev; break;
            }
        break;
        case 4:
            switch(state)
            {
                case 0: default: sprite_index = spr_player_lookup; break;
                case 2: sprite_index = spr_anime; break;
            }
        break;
    }
}

var c1 = make_color_rgb(52, 28, 39)
var c2 = make_color_rgb(96, 44, 44)
ponytail_colors = [c1,c2,c1,c2,c1,c2,c1]
ponytail_points_count = 7
ponytail_segment_len = []
ponytail_points = []
ponytail_visible = 1
for(var a = 0; a < ponytail_points_count; a++)
{
    ponytail_points[a] = [0, 0]
    if a % 2 == 0
        ponytail_segment_len[a] = 1
    else
        ponytail_segment_len[a] = 2
}

_team = team.player

buffs = {}
initbuffs(id)

items = []
