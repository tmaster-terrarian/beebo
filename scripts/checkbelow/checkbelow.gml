function checkBelow() //gml_Script_checkBelow
{
    return (place_meeting(x, (y + 1), oWall) || (place_meeting(x, (y + 1), oPlatform) && (!(place_meeting(x, y, oPlatform)))));
}
