m_w = 256;
m_h = 144;
m_x = x;
m_y = y;

m_padding = 8;
m_size = 12;

m_pos = 0;

m_options =
[
    ["Screen Size:", "Sound Volume:", "Music Volume:", "dont.", "Show Timer", "Rich Presence", "VFX Culling Bias:", "Language... >", "Delete Savedata", "Back >"],
    ["do not", "Back >"],
    ["Language:", "Back >"],
    ["Option:", "Slider:", "Checkbox:", "Back >"]
];

language_names = ["< English (US) >", "< Spanish (AR) >"]
languages = ["en", "es"]
language_selection = 0
ini_open("save.ini")
switch(ini_read_string("settings", "lang", "en"))
{
    case "en": default:
    {
        language_selection = 0
        break
    }
    case "es":
    {
        language_selection = 1
        break
    }
    // case "ja":
    // {
    //     language_selection = 2
    //     break
    // }
}

m_options_length = 0;
m_submenu = 0;

pressedmemebutton = false;
test_slider = 1;
test_checkbox = 0;
