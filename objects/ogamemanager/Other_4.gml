room_speed = 60

switch(room)
{
    default:
        SetMusic(amb_spookland)
        current_st = -1
    break

    case rMenu: case rm_settings:
        SetMusic(bgm_placeholder)
        current_st = -1
    break

    case loading:
        StopMusic()
        with(obj_loading)
        {
            loading_rm = global.loading_rm
            txt_string = global.loading_txt
        }
        current_st = -1
    break

    case lvl_random:
        SetMusic(bgm_wavedashppt)
        current_st = 1
    break

    case lvl1_0:
        SetMusic(amb_birds)
        current_st = 0
    break

    case lvl1_1: case lvl1_2: case lvl1_3: case lvl1_4:
        SetMusic(bgm_placeholder)
        current_st = 1
    break

    case lvl2_0:
        SetMusic(bgm_project2)
        current_st = 2
    break

    case lvl3_0:
        SetMusic(bgm_placeholder3)
        current_st = 3
    break
}

with(oCamera)
{
    with(obj_player)
    {
        other.hp_change = hp
    }
}

// activation/deactivation
instance_deactivate_object(obj_enemy);
instance_deactivate_object(par_enemy)
