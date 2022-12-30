// music
switch(current_rm)
{
    case -1: SetMusic(bgm_placeholder); break; //title screen

    case 0: SetMusic(amb_birds); break;
    case 1: SetMusic(bgm_placeholder); break;
    case 2: SetMusic(bgm_placeholder); break;
}

if(room = lvl1_1)
{
    if(!global.hasgun)
    {
        global.gunlesspercent = true;
        instance_create_depth(160, 192, 300, obj_gun_pickup);
    }
}

// activation/deactivation
instance_deactivate_object(obj_enemy);
