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

function node(_x = 0, _y = 0, _instance = obj_empty, _chance = 1) constructor
{
    x = _x
    y = _y
    chance = _chance
    instance = _instance
    width = 1
    height = 1
    angle = 0

    static create = function(_node, _x)
    {
        randomize()
        if(random(1) <= _node.chance)
        {
            var inst = instance_create_depth(_node.x + _x, _node.y, 0, _node.instance)
            inst.image_xscale = _node.width
            inst.image_yscale = _node.height
            inst.image_angle = _node.angle
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

    static build_room = function(__room = self)
    {
        for(var i = 0; i < array_length(__room.nodes); i++)
        {
            __room.nodes[i].create(__room.nodes[i])
        }
    }

    draw = function()
    {
        draw_rectangle_color(x + 1, 1, width - 1, 143, c_white, c_white, c_white, c_white, true)
    }
}

rooms = []

available_rooms = []

// lvl1a_0a lvl1a_0b lvl1a_0c
// lvl1a_1a lvl1a_1b lvl1a_1c
// lvl1a_2a lvl1a_2b lvl1a_2c

if(file_exists(working_directory + "tiled/lvl1a_0a.json"))
{
    var json = ""

    var file = file_text_open_read(working_directory + "tiled/lvl1a_0a.json")

    while(!file_text_eof(file))
    {
        json += file_text_readln(file)
    }
    file_text_close(file)

    var data = json_parse(json)

    available_rooms[0] = {width:0,nodes:[]}
    available_rooms[0].width = data.width * 8
    for(var j = 0; j < array_length(data.layers[0].objects); j++)
    {
        var jn = data.layers[0].objects[j]
        var n = new node(jn.x, jn.y, ((asset_get_index(jn.name) != -1) ? asset_get_index(jn.name) : obj_empty), ((variable_struct_exists(jn, "properties")) ? jn.properties[0].value : 1))
        n.width = jn.width / 8
        n.height = jn.height / 8
        n.angle = jn.rotation
        // if(variable_struct_exists(jn, "properties"))
        // {
        //     for(var k = 0; k < array_length(jn.properties))
        //     {
        //         if(jn.properties[k]).name == "chest"
        //         {
        //             var val = jn.properties[k].value
        //             switch(val)
        //             {
        //                 case 0: default:
        //                 {
        //                     n.item = obj_item
        //                 }
        //             }
        //             break
        //         }
        //     }
        // }
        available_rooms[0].nodes[j] = n
    }
    show_debug_message(string(data))
}

var roomx = 4
for(var i = 0; i < room_count_max; i++)
{
    var rand = irandom(array_length(available_rooms) - 1)
    rooms[i] = new _room(roomx, available_rooms[rand].width, available_rooms[rand].nodes)
    for(var j = 0; j < array_length(rooms[i].nodes); j++)
    {
        rooms[i].nodes[j].create(rooms[i].nodes[j], roomx)
    }
    roomx += rooms[i].width
}
