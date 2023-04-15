// draw segments
for(var i = 0; i < seg_count; i++)
{
    if(outln)
    {
        if(i == 0)
        {
            draw_line_width_color(x, y, segments[i]._x, segments[i]._y, 3, outln_c, outln_c)
        }
        else
        {
            draw_line_width_color(segments[i - 1]._x, segments[i - 1]._y, segments[i]._x, segments[i]._y, 3, outln_c, outln_c)
            if(segments[i].en)
                draw_line_width_color(segments[i - 1]._x, segments[i - 1]._y, segments[i]._x + lengthdir_x(1, segments[i].angle), segments[i]._y + lengthdir_y(1, segments[i].angle), 1, outln_c, outln_c)
        }
    }

    if (i != 0)
        draw_line_color(segments[i - 1]._x, segments[i - 1]._y, segments[i]._x, segments[i]._y, segments[i].color, segments[i].color)
}
