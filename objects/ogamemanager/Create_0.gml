// screen transition stuff
w = display_get_gui_width();
h = display_get_gui_height();
h_half = h * 0.5;
w_half = w * 0.5;
enum TRANS_MODE
{
    OFF,
    NEXT,
    GOTO,
    DIRECT,
    RESTART,
    ACTIVE,
    ACTIVE2
};
enum TRANS_TYPE
{
    BOX,
    SLOW_HORIZONTAL
};
mode = TRANS_MODE.ACTIVE;
transtype = TRANS_TYPE.BOX;
percent = 1;
trans_speed = 5; //INVERSE!! LOWER IS FASTER!!!! DUHH APE BRAIN
target = room;

// player control
controltimer = 0;

// global variables
global.snd_volume = 1;
global.bgm_volume = 1;
global.speedrun_mode = false;
global.t = 0;
global.hasgun = false;

global.cutscene = false;
global.introsequence = false;
global.gamestarted = false;
global.pausetimer = false;
global.gunlesspercent = false;

global.playerhealth = 0;
global.playermaxhealth = 0;
global.animemode = false;

// music
current_bgm = noone;

// custom level order
current_st = -1;
current_rm = -1;
target_st = 0;
target_rm = 0;

stages = //create 2d array of stages/rooms
[
    [lvl1_0], // tutoriel
    [lvl1_1, lvl1_2, lvl1_3, lvl1_4] // stage 1
];
stage_names = //unimportant rn
[
    "THE BEGIN", // tutoriel
    "THE BEGIN" // stage 1
];

rm_list = []; //create list from 2d array
rm_index = 0;
for(var i = 0; i < array_length(stages); i++)
{
    for(var j = 0; j < array_length(stages[i]); j++)
    {
        rm_list[rm_index] = stages[i][j];
        rm_index++;
    }
}

// save data
ini_open("save.ini");

// settings
global.snd_volume = ini_read_real("settings", "sound_volume", 0.5);
global.bgm_volume = ini_read_real("settings", "music_volume", 0.8);
audio_group_set_gain(audiogroup_default, global.snd_volume, 0);
audio_group_set_gain(audiogroup_bgm, global.bgm_volume, 0);

global.speedrun_mode = ini_read_real("settings", "speedrun_mode", 0);

global.t = ini_read_real("savedata", "time_in_centiseconds", 0);
global.hasgun = ini_read_real("savedata", "g", 0);

ini_close();

// commands
global.console = false;
input_str = "";
last_input_str = "";
log_str = "";
log_pos = 0;
cursor_timer = 0;

// start up discord rich presence
instance_create_depth(x, y, depth, objNekoPresenceDemo);
