// recompute path to target
alarm[2] = 10

for(var i = 0; i < array_length(node_grid); i++) // i: x, j: y
{
    for(var j = 0; j < array_length(node_grid[i]); j++)
    {
        node_grid[i, j] = position_meeting(i * node_dist + node_dist / 2, j * node_dist + node_dist / 2, obj_wall)
    }
}
