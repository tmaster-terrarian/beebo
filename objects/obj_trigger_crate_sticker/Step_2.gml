if(platformTarget)
{
    hsp = platformTarget.hsp
    vsp = platformTarget.vsp
    x = xstart - platformTarget.xstart + platformTarget.x
    y = ystart - platformTarget.ystart + platformTarget.y

    hc += hsp
    vc += vsp
    var h = round(hc)
    var v = round(vc)
    hc -= h
    vc -= v
    repeat(abs(v))
    {
        if abs(vsp) < 0.01
            break
        with(oCrate)
        {
            if(place_meeting(x, y, other))
            {
                y += sign(v)
            }
        }
    }
    repeat(abs(h))
    {
        if abs(hsp) < 0.01
            break
        with(oCrate)
        {
            if(place_meeting(x, y, other))
            {
                x += sign(h)
            }
        }
    }
}
