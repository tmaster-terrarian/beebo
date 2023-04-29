if(draw_ui)
{
    if(instance_exists(obj_player) || instance_exists(obj_player_dead))
    {
        draw_sprite(spr_hpbar2_back, 0, 0, 0)

        var p = obj_player
        if(instance_exists(p) && p.hp)
        {
            draw_sprite_ext(spr_hpbar2_fill, 0, 19, 4, (p.hp / p.hp_max) * 74, 1, 0, c_white, 1)
        }

        draw_sprite(spr_hpbar2_front, 0, 0, 0)
    }

    if(instance_exists(oGun))
    {

        var bomb_timer_max = oGun.bomb_timer_max;
        var bomb_timer = -oGun.firingdelaybomb + bomb_timer_max;
        if(bomb_timer > bomb_timer_max) bomb_timer = bomb_timer_max;

        draw_sprite(spr_hud_bombtimer, (bomb_timer * (1/bomb_timer_max)) * 10, 13, 10);
    }
    else if(instance_exists(obj_player_dead))
    {
        draw_sprite(spr_hud_bombtimer, 0, 13, 10);
    }

    if(oGameManager.drawbossbar)
    {
        var c = c_black
        draw_rectangle_color(34, 131, 249, 138, c, c, c, c, false)

        var b = oGameManager.currentboss
        if(instance_exists(b) && b.hp)
        {
            draw_sprite_ext(spr_bossbar_fill, 0, 34, 131, (b.hp / b.hpmax) * 216, 1, 0, c_white, 1)
        }

        draw_sprite(spr_bossbar_frame, 0, 0, 131)
    }
}
