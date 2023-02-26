if(global.rich_presence)
{
    if(global.animemode)
        var image = "image2";
    else
        var image = "image"

    if(instance_exists(oGameManager))
    {
        if(oGameManager.current_st != -1)
            np_setpresence("in-game", "Stage: " + string(oGameManager.current_st), image, "");
        else
            np_setpresence("menu", "", image, "");
    }
    else
    {
        np_setpresence("menu", "", image, "");
    }
}
else
{
    if(np_clearpresence() == true)
        instance_destroy()
}

alarm[1] = 60;
