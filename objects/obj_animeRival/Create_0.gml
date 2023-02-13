event_inherited();

depth = 320;

x = xstart + 8;
y = ystart + 8;

state = "normal";
active = 0;

sprite_index = spr_anime;
image_speed = 0;
image_index = 0;
timer0 = 0;
landTimer = 0;
wallslideTimer = 0;
run = 0;

single_wall = 0;
single_wall_timer = 0;

can_attack = 1;
can_jump = 1;
can_dodge = 1;

facing = 1;
input_dir = 0;

grv = 0.13;
walksp = 2;
jumpsp = -3;
vsp_max = 20;
hsp_max = 20;

ground_accel = 0.1;
ground_fric = 0.1;
air_accel = 0.06;
air_fric = 0.04;

accel = 0;
fric = 0;

invuln = 0;
hitfrom = 0;
flash = 0;

damage = 1;

alarm[0] = 30;

flip_counter = 0;
flip_max = 3;

encounter1 = false;

INPUT_MOVE = 0
INPUT_JUMP = 0
INPUT_DODGE = 0
