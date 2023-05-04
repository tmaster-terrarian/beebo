with (other)
{
    hp--;
    flash = 3;
    hitfrom = other.direction;

    if((hitfrom > 90) && (hitfrom < 270))
    {
        hitfrom_as_digit = -1;
    }
    else hitfrom_as_digit = 1;

    //x += lengthdir_x(2, hitfrom);
    x += sign(hitfrom_as_digit) * 2;
    audio_play_sound(sn_hit, 5, false)
}
instance_destroy()
