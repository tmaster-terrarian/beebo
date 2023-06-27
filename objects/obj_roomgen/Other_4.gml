switch(mode)
{
    case "tiled":
    {
        var roomx = 0
        for(var i = 0; i < room_count_max; i++)
        {
            _rooms[i] = {width:256,nodes:[]}

            if(file_exists(working_directory + "tiled/lvl" + levelid + "_" + string(i) + ".json"))
            {
                var json = ""

                var file = file_text_open_read(working_directory + "tiled/lvl" + levelid + "_" + string(i) + ".json")

                while(!file_text_eof(file))
                {
                    json += file_text_readln(file)
                }
                file_text_close(file)

                data = json_parse(json)

                _rooms[i].width = data.width * data.tilewidth

                var r = irandom(array_length(data.layers) - 1)
                for(var j = 0; j < array_length(data.layers[r].objects); j++)
                {
                    var jn = data.layers[r].objects[j]
                    var n = new node(jn.x, jn.y, ((asset_get_index(jn.name) != -1) ? asset_get_index(jn.name) : obj_empty), (variable_struct_exists(jn, "properties") ? jn.properties : []))
                    n.width = jn.width / data.tilewidth
                    n.height = jn.height / data.tileheight
                    n.angle = jn.rotation
                    _rooms[i].nodes[j] = n
                }
            }

            rooms[i] = new _room(roomx, _rooms[i].width, _rooms[i].nodes)
            for(var j = 0; j < array_length(rooms[i].nodes); j++)
            {
                rooms[i].nodes[j].create(rooms[i].nodes[j], roomx)
            }
            roomx += rooms[i].width
        }
        break
    }
    case "v2":
    {
        var roomx = 0
        var dir = working_directory + "leveldata/lvl" + levelid + ".beebo"

        if(file_exists(dir))
        {
            var json = ""

            var file = file_text_open_read(dir)

            while(!file_text_eof(file))
            {
                json += file_text_readln(file)
            }
            file_text_close(file)

            data = json_parse(json)

            for(var i = 0; i < array_length(data.rooms); i++)
            {
                var r = irandom(array_length(data.rooms[i].variants) - 1)

                _rooms[i] = {width:256,nodes:[]}
                _rooms[i].width = data.rooms[i].metadata.width

                for(var j = 0; j < array_length(data.rooms[i].variants[r].entities); j++)
                {
                    var jn = data.rooms[i].variants[r].entities[j]
                    var n = new node(jn.x, jn.y, ((asset_get_index(jn.id) != -1) ? asset_get_index(jn.id) : obj_empty), jn.data)
                    n.width = jn.width
                    n.height = jn.height
                    _rooms[i].nodes[j] = n
                }

                rooms[i] = new _room(roomx, _rooms[i].width, _rooms[i].nodes)
                for(var j = 0; j < array_length(rooms[i].nodes); j++)
                {
                    rooms[i].nodes[j].createV2(rooms[i].nodes[j], roomx)
                }
                roomx += rooms[i].width
            }

            delete data
        }

        instance_create_depth(roomx + 64, 208, 399, prop_sign_1)
        break
    }
}
