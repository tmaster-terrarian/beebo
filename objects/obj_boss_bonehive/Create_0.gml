depth = 290;
y = ystart + 8;

hp = 100;

state = "preintro";
timer0 = 0;

nodes =
[
    node_create(x, y, node_type.boss, "bonehive0"), //center
    node_create(x - 96, y - 40, node_type.boss, "bonehive1"), //top left
    node_create(x + 96, y - 40, node_type.boss, "bonehive2"), //top right
    node_create(x - 96, y + 40, node_type.boss, "bonehive3"), //bottom left
    node_create(x + 96, y + 40, node_type.boss, "bonehive4") //bottom right
]

target_node = nodes[0];
target_x = xstart;
target_y = ystart;

_lwall = instance_create_depth(x - 144, y - 72, 300, oWall);
_rwall = instance_create_depth(x + 128, y - 72, 300, oWall);
