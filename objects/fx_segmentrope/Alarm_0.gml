switch(ropetype)
{
    case "beebo":
    {
        var c1 = make_color_rgb(52, 28, 39)
        var c2 = make_color_rgb(96, 44, 44)
        seg_length = 1
        seg_count = 10
        seg_colors = [c1,c2,c2,c1,c2,c2,c1,c2,c2,c1]
        seg_weight = 1
        break
    }
}

// create segments
for(var i = 0; i < seg_count; i++)
{
    var seg = new segment(seg_length, 0)

    if(i == seg_count - 1)
    {
        seg.en = 1
    }

    if(array_length(seg_colors) == seg_count)
    {
        seg.color = seg_colors[i]
    }

    segments[i] = seg
}
