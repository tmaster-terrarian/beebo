event_inherited();
_team = team.player
playerally = 1

depth = 320;

x = xstart + 8;
y = ystart + 8;

state = "normal";
active = 0;
target = obj_player

sprite_index = spr_anime;
image_speed = 0;
image_index = 0;
timer0 = 0;
landTimer = 0;
wallslideTimer = 0;
run = 0;
duck = 0
lookup = 0

single_wall = 0;
single_wall_timer = 0;

can_attack = 1;
can_jump = 1;
can_dodge = 1;

facing = 1;
input_dir = 0;

grv = 0.2;
vsp_max = 20;
hsp_max = 20;

stats =
{
    hp_max : 50,
    regen_rate : 0.0133333,
    spd : 2,
    jumpspd : -3.7,
    firerate : 4,
    accuracy : 4,
    damage : 1,
    crit_chance : 0,
    ground_accel : 0.12,
    ground_fric : 0.08,
    air_accel : 0.07,
    air_fric : 0.02
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

damage = stats.damage
crit_chance = stats.crit_chance

invuln = 0;
hitfrom = 0;
flash = 0;

alarm[0] = 30;

flip_counter = 0;
flip_max = 3;

encounter1 = false;

INPUT_MOVE = 0
INPUT_JUMP = 0
INPUT_DODGE = 0
INPUT_DUCK = 0
INPUT_LOOKUP = 0

TIMER_WALLJUMP = 0

var c1 = make_color_rgb(37, 89, 137)
var c2 = make_color_rgb(32, 64, 105)
var c3 = make_color_rgb(64, 119, 163)
hair1_colors = [c1,c1,c2,c2,c1,c1,c1,c3,c2]
hair1_points_count = 9
hair1_segment_len = []
hair1_points = []
for(var a = 0; a < hair1_points_count; a++)
{
    hair1_points[a] = [0, 0]
    hair1_segment_len[a] = 1
}

hair2_colors = [c1,c1,c2,c2,c1,c1,c1,c3,c2]
hair2_points_count = 9
hair2_segment_len = []
hair2_points = []
for(var a = 0; a < hair2_points_count; a++)
{
    hair2_points[a] = [0, 0]
    hair2_segment_len[a] = 1
}

hair_visible = 1

buffs = {}
initbuffs(id)

items = []

node_dist = 16
node_x = clamp(round(x / node_dist), 0, round(room_width / node_dist))
node_y = clamp(round(y / node_dist), 0, round(room_height / node_dist))

node_grid = array_create(round(room_width / node_dist), array_create(round(room_height / node_dist), 0))

alarm[2] = 1
