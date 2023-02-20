room_speed = 60

switch(room)
{
    default:
        current_st = -1
    break

    case rMenu: case rm_settings:
        SetMusic(bgm_placeholder)
        current_st = -1
    break

    case loading:
        with(obj_loading)
        {
            loading_rm = global.loading_rm
            txt_string = global.loading_txt
        }
        current_st = -1
    break

    case lvl1_0:
        SetMusic(amb_birds)
        current_st = 0
    break

    case lvl1_1: case lvl1_2: case lvl1_3: case lvl1_4:
        SetMusic(bgm_placeholder)
        current_st = 1
        save_st()
    break
}

// activation/deactivation
instance_deactivate_object(obj_enemy);
