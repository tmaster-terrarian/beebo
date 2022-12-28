/// @description Initialize Discord.

#macro DISCORD_APP_ID "1057535554864038028"

ready = false;

alarm[0] = room_speed * 5;

if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
	show_error("NekoPresence init fail.", true);
}

alarm[1] = 30;
