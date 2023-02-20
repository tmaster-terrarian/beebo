event_inherited()

timer0 = 0
state = ""

hpmax = 300
hp = hpmax

nodes =
[
    node_create(x, y, node_type.boss, "bonehive0"), //center
    node_create(x - 16 * 5, 32, node_type.boss, "bonehive1"), //top left
    node_create(x + 16 * 5, 32, node_type.boss, "bonehive2"), //top right
    node_create(x - 16 * 5, 96, node_type.boss, "bonehive3"), //bottom left
    node_create(x + 16 * 5, 96, node_type.boss, "bonehive4") //bottom right
]
y = ystart - 72

target_node = nodes[0]
target_x = xstart
target_y = ystart
target_sp = 0
use_target = 0

shake = 1
shaking = 0

bits = 1
par_wing_x = 6
par_wing_y = -6
par_wing_rot = 0
par_head_x = 0
par_head_y = -12
par_jawboned_x = 0
par_jawboned_y = -12

par_wingr = instance_create_depth(x + par_wing_x, y + par_wing_y, depth + 1, obj_empty)
with(par_wingr)
{
    sprite_index = spr_boss_bonehive_wing
    image_xscale = 1
}

par_wingl = instance_create_depth(x - par_wing_x, y + par_wing_y, depth + 1, obj_empty)
with(par_wingl)
{
    sprite_index = spr_boss_bonehive_wing
    image_xscale = -1
}

par_jawboned = instance_create_depth(x + par_jawboned_x, y + par_jawboned_y, depth - 1, obj_empty)
with(par_jawboned)
{
    sprite_index = spr_boss_bonehive_jawboned
    image_xscale = 1
}

par_head = instance_create_depth(x + par_head_x, y + par_head_y, depth - 2, obj_enemy_extension)
with(par_head)
{
    sprite_index = spr_boss_bonehive_head
    image_xscale = 1
    owner = other
    dmg_mod = 1.5
}

wingw = 1
