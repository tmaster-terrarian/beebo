last_node_x = clamp(round(x / node_dist), 0, round(room_width / node_dist))
last_node_y = clamp(round(y / node_dist), 0, round(room_height / node_dist))

event_inherited();

node_x = clamp(round(x / node_dist), 0, round(room_width / node_dist))
node_y = clamp(round(y / node_dist), 0, round(room_height / node_dist))

if(instance_exists(_target))
{
    if(!collision_line(x, y, _target.x, (_target.bbox_bottom + _target.bbox_top)/2, obj_wall, 0, 1))
    {
        target.x = _target.x
        target.y = (_target.bbox_bottom + _target.bbox_top)/2
    }
}
