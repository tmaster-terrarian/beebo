function scr_disintigrate_hold() //gml_Script_scr_disintigrate_hold
{
    porpX = (__view_get((13 << 0), 0) / 260)
    porpY = (__view_get((14 << 0), 0) / 140)
    var myX = (x - sprite_get_xoffset(sprite_index))
    var myY = (y - sprite_get_yoffset(sprite_index))
    if (image_xscale >= 0)
    {
        for (var i = 0; i < sprite_width; i += 1)
        {
            for (var j = 0; j < sprite_height; j += 1)
            {
                if collision_point((myX + i), (myY + j), object_index, 1, 0)
                {
                    var n = instance_create_depth((myX + i), (myY + j), 302, obj_pixel_hold)
                    n.drawColor = draw_getpixel((((myX + i) - __view_get((0 << 0), 0)) * global.screenSize), (((myY + j) - __view_get((1 << 0), 0)) * global.screenSize))
                    n.active = 0
                    n.alarm[0] = (((j * i) / 10) + 300)
                }
            }
        }
    }
    if (image_xscale < 1)
    {
        for (i = 0; i > sprite_width; i -= 1)
        {
            for (j = 0; j < sprite_height; j += 1)
            {
                if collision_point((myX - i), (myY + j), object_index, 1, 0)
                {
                    n = instance_create_depth((myX - i), (myY + j), 302, obj_pixel_hold)
                    n.drawColor = draw_getpixel((((myX - i) - __view_get((0 << 0), 0)) * global.screenSize), (((myY + j) - __view_get((1 << 0), 0)) * global.screenSize))
                    n.active = 0
                    n.alarm[0] = (((j * i) / 10) + 300)
                }
            }
        }
    }
    instance_destroy()
    return;
}

