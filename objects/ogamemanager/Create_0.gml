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

//player control
controltimer = 0;

//global
global.screenSize = 1;

global.playerhealth = 0;
global.playermaxhealth = 0;

global.cutscene = false;

//music
current_bgm = noone;

//custom level order, to avoid the template room showing up in-game
current_rm = -1;

stages =
[
    [lvl1_0, lvl1_1, lvl1_2] //stage 1
];
stage_names = ["THE BEGIN"];

rm_list = [];
rm_index = 0;
for(var i = 0; i < array_length_1d(stages); i++)
{
    for(var j = 0; j < array_length_1d(stages[i]); j++)
    {
        rm_list[rm_index] = stages[i][j];
        rm_index++;
    }
}

//screen size
ini_open("save.ini");
if(ini_key_exists("screeb", "res"))
{
    global.screenSize = round(ini_read_real("screeb", "res", 1));
    if(global.screenSize < 9)
    {
        window_set_fullscreen(false);
        window_set_size((256 * global.screenSize), (144 * global.screenSize));
    }
    else
    {
        window_set_fullscreen(true);
    }
}
else
{
    window_set_fullscreen(false);
    global.screenSize = 2;
    ini_write_real("screeb", "res", global.screenSize);
    window_set_size((256 * global.screenSize), (144 * global.screenSize));
}
ini_close();
