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

if(instance_exists(oGun))
{
    var xpos = camera_get_view_x(cam);
    var ypos = camera_get_view_y(cam);

    var bomb_timer_max = oGun.bomb_timer_max;
    var bomb_timer = -oGun.firingdelaybomb + bomb_timer_max;
    if(bomb_timer > bomb_timer_max) bomb_timer = bomb_timer_max;

    draw_sprite(spr_hud_bombtimer, (bomb_timer * (1/bomb_timer_max)) * 10, xpos + offsetx + 13, ypos + offsety + 9);
}
else if(instance_exists(obj_player_dead))
{
    var xpos = camera_get_view_x(cam);
    var ypos = camera_get_view_y(cam);
    draw_sprite(spr_hud_bombtimer, 0, xpos + offsetx + 13, ypos + offsety + 9);
}
