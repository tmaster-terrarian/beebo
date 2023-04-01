alarm[0] = interval
with(instance_create_depth(x, y, 300, particle))
{
    if(other.override)
    {
        if(other.fric != "")
            fric = other.fric
        if(other.hsp != "")
            hsp = other.hsp + random_range(-1, 1)
        if(other.vsp != "")
            vsp = other.vsp + random_range(-1, 1)
        if(other.grv != "")
            grv = other.grv
        if(other.collide != "")
            collide = other.collide
        if(other.bounce_max != "")
            bounce_max = other.bounce_max
        if(other.life != "")
            life = other.life
        if(other.fade != "")
            fade = other.fade
    }
    if(other.particle = fx_aura)
    {
        visible = true
        image_speed = 0
        image_index = other.image_index
        sprite_index = other.sprite_index
        image_xscale = other.image_xscale
        image_yscale = other.image_yscale
    }
}
