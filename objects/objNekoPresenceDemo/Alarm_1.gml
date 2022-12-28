if(global.animemode)
var image = "image2";
else
var image = "image"

if(oGameManager.current_st != -1)
{
    np_setpresence("in-game", "Stage: " + string(oGameManager.current_st + 1), image, "");
}
else
{
    np_setpresence("menu", "", image, "");
}

alarm[1] = 60;
