last_node_x = clamp(round(x / node_dist), 0, round(room_width / node_dist))
last_node_y = clamp(round(y / node_dist), 0, round(room_height / node_dist))

event_inherited();

node_x = clamp(round(x / node_dist), 0, round(room_width / node_dist))
node_y = clamp(round(y / node_dist), 0, round(room_height / node_dist))
