if(instance_exists(follow))
{
    if(follow == oPlayer)
    {
        xTo = follow.x + (sign(follow.image_xscale) * 16);
        yTo = follow.y + (sign(follow.vsp) * 8);
    }
    else
    {
        xTo = follow.x;
        yTo = follow.y;
    }
}

x += (xTo - x) / smooth_factor; // LERP MY BELOVED
y += (yTo - y) / smooth_factor;

x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y, view_h_half, room_height - view_h_half);

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);
