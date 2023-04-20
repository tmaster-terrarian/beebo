draw_self()

// var px = lengthdir_x(sin(a * p) * dis, dir - 90)
// var py = lengthdir_y(sin(a * p) * dis, dir - 90)

// var px2 = lengthdir_x(sin(a * (p + s)) * dis, dir - 90)
// var py2 = lengthdir_y(sin(a * (p + s)) * dis, dir - 90)
// var r = point_direction(px, py, lengthdir_x(s, dir) + px2, lengthdir_y(s, dir) + py2)

// draw_sprite_ext
// (
//     sprite_index,
//     image_index,
//     x + px, y + py,
//     image_xscale, image_yscale,
//     r,
//     image_blend,
//     image_alpha
// )
// if (f % 4 == 1)
// {
//     with (instance_create_depth(x + px, y + py, (depth + 101), fx_aura))
//     {
//         visible = true
//         image_speed = 0
//         sprite_index = other.sprite_index
//         image_index = other.image_index
//         image_angle = r
//         if(obj_player.state == "grind")
//         {
//             hspeed = -6
//         }
//     }
// }

// px = lengthdir_x(-sin(a * p) * dis, dir - 90)
// py = lengthdir_y(-sin(a * p) * dis, dir - 90)

// var px2 = lengthdir_x(-sin(a * (p + s)) * dis, dir - 90)
// var py2 = lengthdir_y(-sin(a * (p + s)) * dis, dir - 90)
// var r = point_direction(px, py, lengthdir_x(s, dir) + px2, lengthdir_y(s, dir) + py2)

// draw_sprite_ext
// (
//     sprite_index,
//     image_index + 1,
//     x + px, y + py,
//     image_xscale, image_yscale,
//     r,
//     image_blend,
//     image_alpha
// )
// if (f % 4 == 1)
// {
//     with (instance_create_depth(x + px, y + py, (depth + 101), fx_aura))
//     {
//         visible = true
//         image_speed = 0
//         sprite_index = other.sprite_index
//         image_index = other.image_index + 1
//         image_angle = r
//         if(obj_player.state == "grind")
//         {
//             hspeed = -6
//         }
//     }
// }
