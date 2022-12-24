with (oPlayer)
{
    if(hascontrol)
    {
        hascontrol = false;
        SlideTransition(TRANS_MODE.GOTO_OLD, TRANS_TYPE.BOX, other.target);
    }
}
