with (other)
{
    if(iframes <= 0)
    {
        iframes = 60;

        hp--;
        flash = 3;
        hitfrom = point_direction(other.x, other.y, x, y);

	    vsp = lengthdir_y(1, hitfrom) - 1;
		hsp = lengthdir_x(1, hitfrom);
    }
}
