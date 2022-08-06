with (oPlayer)
{
    if(hascontrol)
    {
        hascontrol = false;
        SlideTransition(TRANS_MODE.GOTO, TRANS_TYPE.BOX, other.target);
    }
}
