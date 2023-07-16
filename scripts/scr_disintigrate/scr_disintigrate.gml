function scr_disintigrate() //gml_Script_scr_disintigrate
{
    var myX = (x - sprite_get_xoffset(sprite_index))
    var myY = (y - sprite_get_yoffset(sprite_index))
    for (var i = 0; i < sprite_width; i += 2)
    {
        for (var j = 0; j < sprite_height; j += 2)
        {
            if collision_point((myX + i), (myY + j), object_index, 1, 0)
            {
                var n = instance_create_depth((myX + i), (myY + j), -1000, obj_pixel)
                n.drawColor = draw_getpixel((((myX + i) - __view_get((0 << 0), 0)) * global.sc), (((myY + j) - __view_get((1 << 0), 0)) * global.sc))
            }
        }
    }
    instance_destroy()
    return;
}
function scr_disintigrate_nodestroy()
{
    var myX = (x - sprite_get_xoffset(sprite_index))
    var myY = (y - sprite_get_yoffset(sprite_index))
    for (var i = 0; i < sprite_width; i += 2)
    {
        for (var j = 0; j < sprite_height; j += 2)
        {
            if collision_point((myX + i), (myY + j), object_index, 1, 0)
            {
                var n = instance_create_depth((myX + i), (myY + j), -1000, obj_pixel)
                n.drawColor = draw_getpixel((((myX + i) - __view_get((0 << 0), 0)) * global.sc), (((myY + j) - __view_get((1 << 0), 0)) * global.sc))
            }
        }
    }
    return;
}
