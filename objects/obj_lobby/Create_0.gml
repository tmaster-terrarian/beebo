_startgame = function()
{
    global.t = 0;
    global.g = true;
    global.hasgun = true;
    global.introcutscene = false;
    ScreenShake(12, 60);
    gm_room_transition_direct(lvl_random, TRANS_TYPE.SLOW_HORIZONTAL);
    global.player = instance_create_depth(128, 0, 300, obj_player)
    statmanager.run_initialize()
    caninput = 0
}
_apply_difficulty = function(value)
{
    statmanager.difficulty_mult = value
}

function button(_n, _x, _y, _w, _h, _s = noone, _func = function() {}, _c = c_white) constructor
{
    name = _n
    x = _x
    y = _y
    w = _w
    h = _h
    sprite = _s
    on_press = _func
    text_color = _c
}
function slider(_x, _y, _w, _h, __min = 0, _range = 10, _func = function() {}) constructor
{
    on_press = function() {}
    x = _x
    y = _y
    w = _w
    h = _h
    _min = __min
    range = _range
    value = 1
    on_input = _func
}
function num_range(_x, _y, _w, _h, __min = 0, _range = 10, _func = function() {}) constructor
{
    on_press = function() {}
    x = _x
    y = _y
    w = _w
    h = _h
    _min = __min
    range = _range
    value = 1
    on_input = _func

    arrow_move = 0
}

m_pos = 0
m_options =
[
    new button("<START>", 99, 114, 66, 25, spr_ui_greenbutton, _startgame),
    new button("button1", 107, 24, 50, 25, spr_ui_greenbutton),
    new button("button2", 107, 49, 50, 25, spr_ui_greenbutton),
    new num_range(116, 94, 32, 14, 1, 5, _apply_difficulty)
]

s_x = m_options[0].x
s_y = m_options[0].y
s_w = m_options[0].w
s_h = m_options[0].h
s_sp = 3

caninput = 1

t = 0
hold_countdown = 0
