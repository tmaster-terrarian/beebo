function normalize(_x, _y)
{
    var _result = [0, 0];
    if(_x != 0) || (_y != 0)
    {
        var _factor = 1/sqrt((_x * _x) + (_y * _y));
        _x = _factor * _x;
        _y = _factor * _y;
        _result[0] = _x;
        _result[1] = _y;
    }
    return _result;
}
