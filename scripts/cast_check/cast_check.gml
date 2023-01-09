function cast_check(_start_x, _start_y, _add_x, _add_y, _obj, _iterations, _return_i = false)
{
    var _result = 0;
    for(var i = 0; i < abs(_iterations); i++)
    {
        if(place_meeting(_start_x + (_add_x * i), _start_y + (_add_y * i), _obj))
        {
			if(_return_i) _result = i;
			else _result = 1;
            break;
        }
        else continue;
    }
    return _result;
}

function cast_check_a(_start_x, _start_y, _add_x, _add_y, _obj, _iterations, _return_i = false)
{
    var _result = 0;
    for(var i = 0; i < abs(_iterations); i++)
    {
        if(!place_meeting(_start_x + (_add_x * i), _start_y + (_add_y * i), _obj))
        {
			if(_return_i) _result = i;
			else _result = 1;
            break;
        }
        else continue;
    }
    return _result;
}
