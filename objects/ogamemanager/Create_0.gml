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
    RESPAWN,
    RESTART,
    INTRO
};
enum TRANS_TYPE
{
    BOX,
    SLOW_HORIZONTAL
};
mode = TRANS_MODE.INTRO;
transtype = TRANS_TYPE.BOX;
percent = 1;
trans_speed = 5; //INVERSE!! LOWER IS FASTER!!!! DUHH APE BRAIN
target = room;

// player control
controltimer = 0;

// global
global.screenSize = 1;
global.snd_volume = 1;
global.bgm_volume = 1;

global.playerhealth = 0;
global.playermaxhealth = 0;

global.cutscene = false;
global.introsequence = false;

// music
current_bgm = noone;

// custom level order, to avoid the template room showing up in-game
current_rm = -1;

stages =
[
    [lvl1_0], // tutoriel
    [lvl1_1, lvl1_2] // stage 1
];
stage_names = ["THE BEGIN"];

rm_list = [];
rm_index = 0;
for(var i = 0; i < array_length(stages); i++)
{
    for(var j = 0; j < array_length(stages[i]); j++)
    {
        rm_list[rm_index] = stages[i][j];
        rm_index++;
    }
}

// save data stuff
ini_open("save.ini");

// screen size
global.screenSize = floor(ini_read_real("screeb", "res", 2));
if(global.screenSize < 9)
{
    window_set_fullscreen(false);
    window_set_size((256 * global.screenSize), (144 * global.screenSize));
}
else
{
    window_set_fullscreen(true);
}

// settings
global.snd_volume = ini_read_real("settings", "sound volume", 1);
global.bgm_volume = ini_read_real("settings", "music volume", 1);
audio_group_set_gain(audiogroup_default, global.snd_volume, 0);
audio_group_set_gain(audiogroup_bgm, global.bgm_volume, 0);

ini_close();
