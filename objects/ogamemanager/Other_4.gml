//music
switch(current_rm)
{
    case -1: SetMusic(bgm_placeholder); break; //title screen

    case 0: StopMusic(); break;
    case 1: SetMusic(bgm_placeholder); break;
}

//activation/deactivation
instance_deactivate_all(true);
instance_activate_object(oPlayer);
instance_activate_object(oMenu);
instance_activate_object(oCamera);
instance_activate_object(oTriggerLevelEnd);
instance_activate_object(oBullet);
instance_activate_object(obj_bomb);
instance_activate_object(obj_explosion);
