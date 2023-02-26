event_inherited();

depth = 300;

state = "normal";

sprite_index = spr_player;
image_speed = 0;
image_index = 0;
timer0 = 0;
landTimer = 0;
wallslideTimer = 0;
running = 0;
run = 0;

up = 0

duck = 0;
lookup = 0;

can_attack = 1;
can_jump = 1;
can_dodge = 1;

hp = 4;
hp_max = 4;

if(global.playerhealth == 0) global.playerhealth = hp_max;
hp = global.playerhealth;
global.playermaxhealth = hp_max;

if(global.hasgun) instance_create_depth(x, y, 300, oGun);

grv = 0.2;
walksp = 2.5;
facing = 1;
attack = 0;

ground_accel = 0.12;
ground_fric = 0.08;
air_accel = 0.07;
air_fric = 0.02;
accel = 0;
fric = 0;

lasthsp = 0
lastvsp = 0

hsp_max = 200;
vsp_max = 200;

jump_speed = -3.7;
jump_buffer = 0;
jump_buffer2 = 0;

hascontrol = true;

invuln = 0;
hitfrom = 0;
flash = 0;

fxtrail = 0;
trailTimer = 0;

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

y = ystart + 8;

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
