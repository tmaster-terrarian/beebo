switch state
{
    case RIVAL_STATE.IDLE: default:
    {
        break;
    }
    case RIVAL_STATE.DINDER:
    {
        var chance = random_range(0, 8);

        if(chance > 5)
        {
            sprite_index = spr_anime_dinder;
        }
        else
        {
            sprite_index = spr_anime;
        }

        break;
    }
}
