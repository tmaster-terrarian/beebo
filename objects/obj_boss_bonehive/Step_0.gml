switch(state)
{
    case "preintro":
    {
        if(instance_exists(obj_player))
        {
            if(x - obj_player.x < 100)
            {
                global.bonehive_started = 1;
                timer0 = 0;
                with(oGameManager) audio_sound_gain(current_bgm, 0, 1000);
                introsound = audio_play_sound(sn_bonehive_intro, 0, false);
                state = "intro";
            }
        }
        break;
    }

    case "intro":
    {
        if(timer0 == 0)
        {
            _lwall.y = 0;
            _rwall.y = 0;
            _lwall.image_yscale = 16;
            _rwall.image_yscale = 16;
            timer0 = 1;
            y = ystart - 72;
        }
        if(timer0 < 60 * 14) && (timer0 > 0) // 20 seconds
        {
            timer0++;
        }
        if(timer0 == 60)
        {
            ScreenShake(2, 6 * 60, false);
        }
        if(timer0 == 60 * 6)
        {
            audio_sound_gain(introsound, 0, 1000);
            use_target = 1;
            target_sp = 10;
        }
        if(timer0 == 60 * 7)
        {
            target_sp = 3;
            audio_play_sound(sn_bonehive_roar, 0, false);
            ScreenShake(4, 7 * 60, false);
        }
        if(timer0 >= 60 * 14)
        {
            target_node = choose(nodes[1], nodes[2], nodes[3], nodes[4]);
            audio_play_sound(sn_tp, 0, false);
            SetMusic(bgm_project3);
            with(oGameManager) audio_sound_gain(current_bgm, 1, 0);
            state = "normal";
            timer0 = 0;
            timer1 = 0;
        }

        if(use_target)
        {
            x += (target_x - x) / target_sp;
            y += (target_y - y) / target_sp;
        }
        break;
    }

    case "normal":
    {
        if(timer0 == -1)
        {
            target_sp = 3;
            use_target = true;
            _lwall.y = 0;
            _rwall.y = 0;
            _lwall.image_yscale = 16;
            _rwall.image_yscale = 16;
            SetMusic(bgm_project3);
            with(oGameManager) audio_sound_gain(current_bgm, 1, 0);
            timer0 = 90;
            timer1 = 0;
        }

        target_x = target_node.x;
        target_y = target_node.y;
        if(use_target)
        {
            x += (target_x - x) / target_sp;
            y += (target_y - y) / target_sp;
        }

        shaking = 1;

        if(timer0 < 180)
        {
            timer0++;
        }
        if(timer0 == 30) && (instance_exists(obj_player))
        {
            var _choice = irandom_range(1, 6);

            if(_choice == 1) || (_choice == 2)
            {
                with(instance_create_depth(x, y, 300, obj_prj_bigbone))
                {
                    dir = point_direction(xstart, ystart, obj_player.x, obj_player.y - 8);
                    parriable = 1;
                }
                with(instance_create_depth(x, y, 300, obj_prj_bigbone))
                {
                    dir = point_direction(xstart, ystart, obj_player.x, obj_player.y - 8) + 30;
                }
                with(instance_create_depth(x, y, 300, obj_prj_bigbone))
                {
                    dir = point_direction(xstart, ystart, obj_player.x, obj_player.y - 8) - 30;
                }
            }

            else if(_choice == 3) || (_choice == 4) || (_choice == 5)
            {
                with(instance_create_depth(x, y, 300, obj_prj_boomerbone))
                {
                    target = obj_player;
                    proj_thrower = other;
                }
            }

            else
            {
                audio_play_sound(sn_throw, 0, false);
                with(instance_create_depth(x, y, 300, o_nectar))
                {
                    hasheart = 1;
                }
            }
        }
        if(timer0 == 180)
        {
            timer0 = 0;

            //obtain a random node that is not the current one and is not node 0 (center)
            not_this = function(e, i)
            {
                return (e != target_node) && (e != nodes[0]);
            }
            var _nodes = array_filter(nodes, not_this);
            var _node_next = irandom_range(0, array_length(nodes) - 3);

            target_node = _nodes[_node_next];
            audio_play_sound(sn_tp, 0, false);
        }
        break;
    }
}
