function scr_particle_explode_violent() //gml_Script_scr_particle_explode
{
    porpX = (__view_get((13 << 0), 0) / 260)
    porpY = (__view_get((14 << 0), 0) / 140)
    var myX = (x - sprite_get_xoffset(sprite_index))
    var myY = (y - sprite_get_yoffset(sprite_index))
    if (image_xscale >= 0)
    {
        for (var i = 0; i < sprite_width; i += 2)
        {
            for (var j = 0; j < sprite_height; j += 2)
            {
                if collision_point((myX + i), (myY + j), object_index, 1, 0) && random(1) > global.fx_bias
                {
                    var n = instance_create_depth((myX + i), (myY + j), 302, obj_pixel)
                    n.drawColor = draw_getpixel((((myX + i) - __view_get((0 << 0), 0)) * global.sc), (((myY + j) - __view_get((1 << 0), 0)) * global.sc))
                    n.active = 1
                    n.hspeed = random_range(-4, 4) + hsp / 2
                    n.vspeed = random_range(-4, 4) + vsp / 2
                    n.alarm[0] = 1
                }
            }
        }
    }
    if (image_xscale < 1)
    {
        for (i = 0; i > sprite_width; i -= 2)
        {
            for (j = 0; j < sprite_height; j += 2)
            {
                if collision_point((myX - i), (myY + j), object_index, 1, 0) && random(1) > global.fx_bias
                {
                    n = instance_create_depth((myX - i), (myY + j), 302, obj_pixel)
                    n.drawColor = draw_getpixel((((myX - i) - __view_get((0 << 0), 0)) * global.sc), (((myY + j) - __view_get((1 << 0), 0)) * global.sc))
                    n.active = 1
                    n.hspeed = random_range(-4, 4) + hsp / 2
                    n.vspeed = random_range(-4, 4) + vsp / 2
                    n.alarm[0] = 1
                }
            }
        }
    }
    return;
}

