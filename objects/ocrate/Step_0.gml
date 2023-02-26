if(place_meeting(x, y - 1, obj_player))
{
    move_parent = 1
}

var t = instance_place(x, y, obj_trigger_crate_sticker)
if t
{
    if t.platformTarget
    {
        if !t.platformTarget.move
            t.platformTarget.move = move_parent
    }
}
