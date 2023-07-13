_team = team.enemy
event_inherited()
_target = obj_player
target = _target
autoaggro = 0

grv = 0

aim_dir = 0
aim_sp = 4
bulletproof = 1

cooldn = 0

x -= 4 * facing
y -= 12

_rope = instance_create_depth(x, y, depth + 1, fx_rope, {p0x: -10, p0y: -3, p1x: -3 * facing, p1y: 9, col: $202E37})
_rope.p1.x = -3 * facing
_rope.p1.y = 9

recoil = 0

image_speed = 0
sprite_index = spr_turret_head

barrelpos_x = lengthdir_x(point_distance(0, 0, 3 * facing, 6), point_direction(0, 0, 3 * facing, 6))
barrelpos_y = lengthdir_y(point_distance(0, 0, 3 * facing, 6), point_direction(0, 0, 3 * facing, 6))
