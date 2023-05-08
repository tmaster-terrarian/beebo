var gun = instance_create_depth(obj_player.x, obj_player.y, 200, oGun);
gun.sprite_index = sGunR;
gun.image_index = 4;
global.hasgun = true;
scr_particle_explode();
