// music
switch(current_rm)
{
    case -1: SetMusic(bgm_placeholder); break; //title screen

    case 0: StopMusic(); break;
    case 1: SetMusic(bgm_placeholder); break;
    case 2: SetMusic(bgm_placeholder); break;
}

// activation/deactivation
instance_deactivate_object(obj_enemy);
