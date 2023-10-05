if(draw_ui)
{
    var drawbuffs = 0

    if(instance_exists(obj_player) || instance_exists(obj_player_dead))
    {
        draw_sprite(spr_hpbar2_back, 0, 0, -1)

        var p = obj_player
        var dtxt = ""
        if(instance_exists(p))
        {
            draw_sprite_ext(spr_hpbar2_fill2, 0, 19, 3, ceil((hp_change / p.hp_max) * (74 * p.stats.curse)), 1, 0, c_white, 1)
            draw_sprite_ext(spr_hpbar2_fill, 0, 19, 3, ceil((p.hp / p.hp_max) * (74 * p.stats.curse)), 1, 0, c_white, 1)
            if(ceil(hp_change) < ceil(p.hp))
            {
                draw_sprite_ext(spr_hpbar2_fill3, 0, 19 + ceil((p.hp / p.hp_max) * (74 * p.stats.curse)), 3, ceil(-(p.hp - hp_change)), 1, 0, c_white, 1)
            }

            playerlasthpmax = ceil(p.hp_max)
            playerlasthp = ceil(p.hp)
            playercurse = p.stats.curse
            dtxt = string(ceil(p.hp)) + "/" + string(ceil(p.hp_max))
        }
        else
        {
            draw_sprite_ext(spr_hpbar2_fill2, 0, 19, 3, ceil((hp_change / playerlasthpmax) * (74 * playercurse)), 1, 0, c_white, 1)

            dtxt = string(playerlasthp) + "/" + string(playerlasthpmax)
        }
        drawbuffs = 1

        if(playercurse < 1)
            draw_sprite_ext(spr_curseoverlay, 0, 94, 2, ceil(playercurse * 76)/76, 1, 0, c_white, 1)

        draw_sprite(spr_hpbar2_front, 0, 0, -1)

        draw_set_font(hudfont)
        draw_set_halign(fa_center)
        draw_set_valign(fa_top)

        var c = c_black
        draw_text_color(56, 4, dtxt, c,c,c,c,1)
        var c = c_white
        draw_text_color(56, 3, dtxt, c,c,c,c,1)
    }

    if(instance_exists(oGun))
    {
        var bomb_timer_max = oGun.bomb_timer_max;
        var bomb_timer = -oGun.firingdelaybomb + bomb_timer_max;
        if(bomb_timer > bomb_timer_max) bomb_timer = bomb_timer_max;

        draw_sprite(spr_hud_bombtimer, (bomb_timer * (1/bomb_timer_max)) * 10, 10, 8);
    }
    else if(instance_exists(obj_player_dead))
    {
        draw_sprite(spr_hud_bombtimer, 0, 10, 9);
    }

    if(drawbuffs)
    {
        with(obj_player)
        {
            buffoffsi = 0
            foreach(buffs as (buff, name, i)
            {
                var buffsx = 24
                var buffsy = 18
                if(instance_exists(oGun))
                {
                    buffsx = 29
                    buffsy = 26
                }
                if(buff.stacks > 0)
                {
                    var spr = asset_get_index("spr_" + buff.name)
                    draw_sprite((spr != -1) ? spr : spr_buff_missing, 0, buffsx + (10 * (i + buffoffsi)), buffsy)
                }
                else buffoffsi--
            })
        }
    }

    with(obj_player)
    {
        draw_sprite(spr_inventory, 0, 0, 144 + round(other.invpos))

        for(var i = 0; i < array_length(items); i++)
        {
            var _spr = asset_get_index("spr_item_" + items[i].item_id)
            draw_sprite_outlined_ext((_spr != -1) ? _spr : spr_item_placeholder, 0, 11 + 18 * (i % 14), 144 - 9 + 18 * floor(i / 14) + round(other.invpos), 1, 1, 0, c_white, getraritycol(items[i]), 1, 1, 0)
        }
        for(var i = 0; i < array_length(items); i++) //separate loop so that stack numbers are always on top of the items
        {
            if(items[i].stacks > 1)
            {
                draw_set_halign(fa_right); draw_set_valign(fa_bottom); draw_set_font(other.hudfontstacks)
                draw_text(20 + 18 * (i % 14), 144 - 1 + 18 * floor(i / 14) + round(other.invpos), string(items[i].stacks))
            }
        }

        if(keyboard_check(vk_tab) || other.controller_show_inventory)
        {
            var mx = mouse_x - other._x
            var my = mouse_y - other._y
            var _ix = floor((mx - 2)/18)
            var _iy = floor((my - (23 + (round(other.invpos) + 104)))/18)
            var index = _ix + 14 * _iy // 14 columns

            if(index < array_length(items) && index >= 0)
            {
                var item = items[index].item_id
                var nametext = scribble($"[fnt_basic]{global.itemdefs[$ item].displayname}").starting_format("fnt_basic", c_white).padding(1, -2, 1, 0)
                var desctext = scribble($"[fnt_itemdesc]{global.itemdefs[$ item].shortdesc}").starting_format("fnt_itemdesc", c_ltgray).wrap(128).padding(1, 2, 1, 0)

                var namecol = "d#" + string(itemdata.rarity_colors[global.itemdefs[$ item].rarity])

                var w = 128 + 4
                var xx = 0
                if(mx + w > 256)
                {
                    w = -w
                    xx = w + 1
                }

                mx = round(mx)
                my = round(my)

                draw_set_color(c_black); draw_set_alpha(0.5)
                draw_rectangle(mx, my, mx + w, my + 10 + desctext.get_height() - 1, false)
                draw_set_color(c_white); draw_set_alpha(1)

                draw_set_color(merge_color(itemdata.rarity_colors[global.itemdefs[$ item].rarity], c_black, 0.2))
                draw_rectangle(mx, my, mx + w, my + 10, false)

                nametext.flash(c_black, 1).draw(mx + xx + 1, my + 1)
                nametext.flash(c_black, 0).draw(mx + xx, my)

                desctext.flash(c_black, 1).draw(mx + xx + 1, my + 10 + 1)
                desctext.flash(c_black, 0).draw(mx + xx, my + 10)
            }
        }
    }

    if(gm.drawbossbar)
    {
        var c = c_black
        draw_rectangle_color(34, 131, 249, 138, c, c, c, c, false)

        var b = gm.currentboss
        if(instance_exists(b) && b.hp)
        {
            draw_sprite_ext(spr_bossbar_fill, 0, 34, 131, (b.hp / b.hpmax) * 216, 1, 0, c_white, 1)
        }

        draw_sprite(spr_bossbar_frame, 0, 0, 131)
    }
}
