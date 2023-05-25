with instance_create_depth(x, y, 290, fx_cut)
{
    if(instance_exists(other.target))
    {
        x = (other.target.bbox_left + other.target.bbox_right) / 2
        y = (other.target.bbox_top + other.target.bbox_bottom) / 2
    }
}
