function approach(value, target, rate)
{
    if (value < target)
        return min((value + rate), target);
    else
        return max((value - rate), target);
}
