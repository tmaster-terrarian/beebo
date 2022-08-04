with (oPlayer)
{
    if(hascontrol)
    {
        hascontrol = false;
        SlideTransition(TRANS_MODE.GOTO, other.target);
    }
}
