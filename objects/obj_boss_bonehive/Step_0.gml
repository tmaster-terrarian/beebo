switch(state)
{
    case "intro":
    {
        if(bits)
        {
            par_wingr.x = x + par_wing_x
            par_wingr.y = y + par_wing_y
            par_wingl.x = x - par_wing_x
            par_wingl.y = y + par_wing_y
            par_jawboned.x = x + par_jawboned_x
            par_jawboned.y = y + par_jawboned_y
            par_head.x = x + par_head_x
            par_head.y = y + par_head_y
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
            target_sp = 3
            use_target = true
            timer0 = 90
            timer1 = 0
        }

        target_x = target_node.x;
        target_y = target_node.y;

        if(use_target)
        {
            x += (target_x - x) / target_sp;
            y += (target_y - y) / target_sp;
        }

        shaking = 1

        if(wingw == 1)
            par_wing_rot = approach(par_wing_rot, 15, 45)
        else
            par_wing_rot = approach(par_wing_rot, -45, 45)
        if(par_wing_rot == 15)
            wingw = -1
        if(par_wing_rot == -45)
            wingw = 1

        par_wingr.image_angle = par_wing_rot
        par_wingl.image_angle = -par_wing_rot

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
                with(instance_create_depth(x, y, 300, obj_nectar))
                {
                    hasheart = 1;
                }
            }
        }
        if(timer0 >= 180)
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
        break
    }
}
