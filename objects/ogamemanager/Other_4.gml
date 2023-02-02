// music
switch(current_rm)
{
    case -1: SetMusic(bgm_placeholder); break; //title screen

    case 0: SetMusic(amb_birds); break;
    case 1: SetMusic(bgm_placeholder); break;
    case 2: SetMusic(bgm_placeholder); break;
}

// if(room = lvl1_1)
// {
//     if(!global.hasgun)
//     {
//         global.gunlesspercent = true;
//         instance_create_depth(160, 192, 300, obj_gun_pickup);
//     }
// }

// if(global.checkpointx > -1) || (global.checkpointy > -1)
// {
//     with(obj_player)
//     {
//         x = global.checkpointx;
//         y = global.checkpointy;
//     }
// }

// activation/deactivation
instance_deactivate_object(obj_enemy);
