if(mode == "tiled")
{
    tilemap = layer_tilemap_create(layer_create(700), 0, 0, ts, floor(room_width / ts_size), floor(room_height / ts_size))

    var tiles = []
    for(var yy = 0; yy < floor(room_height / ts_size) + 1; yy++)
    {
        for(var xx = 0; xx < floor(room_width / ts_size) + 1; xx++)
        {
            tiles[yy][xx] = position_meeting(xx * ts_size, yy * ts_size, obj_walltiled)
        }
    }

    for(var yy = 0; yy < floor(room_height / ts_size); yy++)
    {
        for(var xx = 0; xx < floor(room_width / ts_size); xx++)
        {
            if(tiles[yy][xx])
            {
                var _n = tiles[max(yy - 1, 0)][xx] || ((yy - 1) * ts_size) < 0
                var _w = tiles[yy][max(xx - 1, 0)] || ((xx - 1) * ts_size) < 0
                var _e = tiles[yy][xx + 1] || ((xx + 1) * ts_size) > room_width
                var _s = tiles[yy + 1][xx] || ((yy + 1) * ts_size) > room_height

                var _mask = 1*_n + 2*_w + 4*_e + 8*_s + 1
                var _ti = _mask
                if(_mask == 16) _ti = choose(17, 17, 17, 17, 18, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16)
                tilemap_set(tilemap, _ti, xx, yy)
            }
        }
    }
}
