switch(state)
{
	case "start":
    {
        ypos = lerp(ypos, 12, 0.1 * global.dt)
        if(t >= min(60, floor(length/3)))
        {
            state = "mid"
        }
        break
    }
	case "mid":
    {
        if(t >= length - min(60, floor(length/3)))
        {
            state = "end"
        }
        break
    }
	case "end":
    {
        ypos = lerp(ypos, -1, 0.1 * global.dt)
        if(t >= length)
        {
            instance_destroy()
        }
        break
    }
}

t += global.dt
