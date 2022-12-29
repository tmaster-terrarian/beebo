audio_play_sound(sn_gun_pickup, 1, false);
var gun = instance_create_depth(oPlayer.x, oPlayer.y, 200, oGun);
gun.sprite_index = sGunR;
global.hasgun = true;
ini_open("save.ini");
ini_write_real("savedata", "g", global.hasgun);
ini_close();
scr_particle_explode();
