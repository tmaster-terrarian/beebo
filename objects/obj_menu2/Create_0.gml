m_w = 256;
m_h = 144;
m_x = x;
m_y = y;

m_padding = 8;
m_size = 12;

m_pos = 0;

m_options =
[
    [string_loc("options.screen_size") + ":", string_loc("options.sound_volume") + ":", string_loc("options.music_volume") + ":", string_loc("options.dont"), string_loc("options.timer"), string_loc("options.discord_rpc"), string_loc("options.vfx_culling_bias") + ":", string_loc("options.language") + "... >", string_loc("options.delete_save"), string_loc("options.back") + " >"],
    ["do not", string_loc("options.back") + " >"],
    [string_loc("options.language") + ":", string_loc("options.back") + " >"],
    ["Option:", "Slider:", "Checkbox:", string_loc("options.back") + " >"]
]

language_names = ["< English (US) >", "< Spanish (AR) >"]
languages = ["en", "es"]
language_selection = 0
ini_open("save.ini")
language_selection = array_find_index_by_value(languages, ini_read_string("settings", "lang", "en"))
ini_close()

m_options_length = 0;
m_submenu = 0;

pressedmemebutton = false;
test_slider = 1;
test_checkbox = 0;

reload_names = function()
{
    m_options =
    [
        [string_loc("options.screen_size") + ":", string_loc("options.sound_volume") + ":", string_loc("options.music_volume") + ":", string_loc("options.dont"), string_loc("options.timer"), string_loc("options.discord_rpc"), string_loc("options.vfx_culling_bias") + ":", string_loc("options.language") + "... >", string_loc("options.delete_save"), string_loc("options.back") + " >"],
        ["do not", string_loc("options.back") + " >"],
        [string_loc("options.language") + ":", string_loc("options.back") + " >"],
        ["Option:", "Slider:", "Checkbox:", string_loc("options.back") + " >"]
    ]
}
