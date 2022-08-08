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
