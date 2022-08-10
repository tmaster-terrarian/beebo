var offsetx = 4;
var offsety = 4;

if(instance_exists(oPlayer))
{
    var player_health = oPlayer.hp;
    var xpos = camera_get_view_x(cam);
    var ypos = camera_get_view_y(cam);

    draw_sprite(spr_hp_icon, 0, xpos + offsetx, ypos + offsety);
    draw_sprite(spr_hp_bar_start, 0, xpos + offsetx + 16, ypos + offsety);
    for(var i = 0; i < global.playermaxhealth; i++)
    {
        if(i > player_health - 1) draw_sprite(spr_hp_bar, 1, xpos + offsetx + (i * 12) + 16, ypos + offsety);
        else draw_sprite(spr_hp_bar, 0, xpos + offsetx + (i * 12) + 16, ypos + offsety);
    }
    draw_sprite(spr_hp_bar_end, 0, xpos + offsetx + (6 * 12) + 16, ypos + offsety);
}
else if(instance_exists(obj_player_dead))
{
    var xpos = camera_get_view_x(cam);
    var ypos = camera_get_view_y(cam);

    draw_sprite(spr_hp_icon, 0, xpos + offsetx, ypos + offsety);
    draw_sprite(spr_hp_bar_start, 0, xpos + offsetx + 16, ypos + offsety);
    for(var i = 0; i < global.playermaxhealth; i++)
    {
        draw_sprite(spr_hp_bar, 1, xpos + offsetx + (i * 12) + 16, ypos + offsety);
    }
    draw_sprite(spr_hp_bar_end, 0, xpos + offsetx + (6 * 12) + 16, ypos + offsety);
}
