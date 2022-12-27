active = 0;

switch state
{
    case "idle": default:
    {
        break;
    }
    case "dinder":
    {
        var chance = random_range(0, 8);
        if(chance > 5) sprite_index = spr_anime_dinder;
        else sprite_index = spr_anime;
        break;
    }
    case "active":
    {
        active = 1;
        break;
    }
}

if(active)
{
    
}
