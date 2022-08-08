function GetRoom(_room)
{
    with(oGameManager)
    {
        var rm_i = 0;
        for(i = 0; i < array_length_1d(stages); i++)
        {
            for(j = 0; j < array_length_1d(stages[i]); j++)
            {
                if(rm_list[rm_i] == _room)
                {
                    return rm_list[rm_i];
                    break;
                }
                else rm_i++;
            }
        }
    }
}
function GetStage(_room)
{
    with(oGameManager)
    {
        var rm_i = 0;
        for(var i = 0; i < array_length_1d(stages); i++)
        {
            for(var j = 0; j < array_length_1d(stages[i]); j++)
            {
                if(rm_list[rm_i] == _room)
                {
                    return i;
                    break;
                }
                else rm_i++;
            }
        }
    }
}
