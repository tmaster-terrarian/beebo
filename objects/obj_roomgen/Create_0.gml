mode = "v2"

function node(_x = 0, _y = 0, _instance = obj_empty, _data) constructor
{
    x = _x
    y = _y
    instance = _instance
    width = 1
    height = 1
    angle = 0

    properties = {}
    for(var i = 0; i < array_length(_data); i++)
    {
        properties[$ _data[i].name] = _data[i].value
    }

    data = _data

    static getProperty = function(_name, _fallback)
    {
        if variable_struct_exists(properties, _name)
        {
            return properties[$ _name]
        }
        else return _fallback
    }
    chance = getProperty("chance", 1)

    static create = function(_node, _x)
    {
        if(random(1) < _node.chance)
        {
            var inst = noone
            if(_node.instance == obj_wall)
                inst = instance_create_depth(_node.x + _x, _node.y, 0, obj_walltiled)
            else
                inst = instance_create_depth(_node.x + _x, _node.y, 0, _node.instance, _node.properties)
            if(_node.instance == oCrate)
                inst.item = asset_get_index(inst.item)
            inst.image_xscale = _node.width
            inst.image_yscale = _node.height
            inst.image_angle = _node.angle
            return inst
        }
        else return noone
    }

    static createV2 = function(_node, _x, _y = 0)
    {
        if(random(1) < _node.data.chance)
        {
            var inst = noone
            inst = instance_create_depth(_node.x + _x, _node.y, 0, _node.instance, _node.data)
            if(_node.instance == obj_wall)
            {
                var inst2 = instance_create_depth(_node.x + _x, _node.y + _y, 0, obj_walltiled)
                inst2.image_xscale = _node.width
                inst2.image_yscale = _node.height
            }
            inst.image_xscale = _node.width
            inst.image_yscale = _node.height
            return inst
        }
        else return noone
    }
}

function _room(_x, _w, _n) constructor
{
    x = _x
    width = _w
    nodes = _n

    static draw = function(__room)
    {
        // draw_rectangle_color(__room.x + 1, 1, __room.width - 1, 256, c_white, c_white, c_white, c_white, true)
    }
}

_rooms = []
rooms = []

levelid = "1a"
tilemap = noone
ts = ts_grass
ts_size = 16
room_count_max = 10

data = {}

alarm[0] = 1
