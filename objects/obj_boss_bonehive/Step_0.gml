switch(state)
{
    case "preintro":
    {
        if(x - obj_player.x < 100)
        {
            timer0 = 0;
            state = "test";
        }
        break;
    }
    case "intro":
    {
        if(timer0 == 0)
        {
            if(x - obj_player.x < 100)
            {
                _lwall.y = 0;
                _rwall.y = 0;
                _lwall.image_yscale = 16;
                _rwall.image_yscale = 16;
                timer0 = 1;
            }
            y = ystart - 72;
        }
        if(timer0 < 600) && (timer0 > 0) // 10 seconds
        {
            timer0++;
        }
        break;
    }
    case "test":
    {
        break;
    }
}
