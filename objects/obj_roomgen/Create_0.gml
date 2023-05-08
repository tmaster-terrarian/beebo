gridwidth = 8
gridheight = 8

room_count = 0
room_count_max = 2

function vec2(_x, _y) constructor
{
    x = _x
    y = _y

    static zero = function()
    {
        return new vec2(0, 0)
    }
}

// function transform(_pos = new vec2(0, 0), _scale = new vec2(1, 1), _rot = 0)
// {
//     pos = _pos
//     scale = _scale
//     angle = _rot
// }

function node(_x = 0, _y = 0, _chance = 1) constructor
{
    x = _x
    y = _y
    chance = _chance
    instance = obj_empty

    static create = function(_node, _x)
    {
        randomize()
        if(random(1) < _node.chance) return instance_create_depth(_node.x + _x, _node.y, 0, _node.instance)
        else return noone
    }
}

function enemy_node(_x, _y, _enemy, _chance = 1) : node() constructor
{
    x = _x
    y = _y
    instance = _enemy
    chance = _chance
}

function tile(_x, _y, _instance = obj_wall, _solid = 1, _chance = 1) : node() constructor
{
    x = _x
    y = _y
    instance = _instance
    solid = _solid
    chance = _chance

    static create = function(_node, _x)
    {
        randomize()
        if((random(1) < _node.chance) && _node.solid) return instance_create_depth(_node.x + _x, _node.y, 0, _node.instance)
        else return noone
    }
}

function _room(_x, _w, _n) constructor
{
    x = _x
    width = _w
    nodes = _n

    static build_room = function(__room = self)
    {
        for(var i = 0; i < array_length(__room.nodes); i++)
        {
            __room.nodes[i].create(__room.nodes[i])
        }
    }
}

rooms = []

available_rooms =
[
    {
        width : 112,
        nodes : [new tile(0, 72),new tile(16, 72),new tile(32, 72),new tile(48, 72),new tile(64, 72),new tile(80, 72),new tile(76, 72),new tile(96, 72)]
    },
    {
        width : 112,
        nodes :
        [
            new tile(0, 128,obj_wall2),
            new tile(8, 128,obj_wall2),
            new tile(16,128,obj_wall2),
            new tile(24,128,obj_wall2),
            new tile(32,128,obj_wall2),
            new tile(40,128,obj_wall2),
            new tile(48,128,obj_wall2),
            new tile(56,128,obj_wall2),
            new enemy_node(64,120,obj_enemy)
        ]
    }
]

var roomx = 0
for(var i = 0; i < room_count_max; i++)
{
    var rand = irandom(array_length(available_rooms) - 1)
    rooms[i] = new _room(roomx, available_rooms[rand].width, available_rooms[rand].nodes)
    roomx += rooms[i].width
    for(var j = 0; j < array_length(rooms[i].nodes); j++)
    {
        rooms[i].nodes[j].create(rooms[i].nodes[j], roomx)
    }
}
