event_inherited();
y = ystart + 8;

timer0 = 0;
if(global.bonehive_started)
{
    state = "normal";
    obj_player.x = 496;
    obj_player.y = 120;
    instance_destroy(obj_animeRival);
    timer0 = -1;
}
else state = "preintro";

nodes =
[
    node_create(x, y, node_type.boss, "bonehive0"), //center
    node_create(x - 16 * 6, 32, node_type.boss, "bonehive1"), //top left
    node_create(x + 16 * 6, 32, node_type.boss, "bonehive2"), //top right
    node_create(x - 16 * 6, 96, node_type.boss, "bonehive3"), //bottom left
    node_create(x + 16 * 6, 96, node_type.boss, "bonehive4") //bottom right
]

target_node = nodes[0];
target_x = xstart;
target_y = ystart;
target_sp = 0;
use_target = 0;

_lwall = instance_create_depth(x - 16 * 9, 0, 300, obj_wall_invis);
_rwall = instance_create_depth(x + 16 * 8, 0, 300, obj_wall_invis);

introsound = noone;

shake = 2;
shaking = 0;
