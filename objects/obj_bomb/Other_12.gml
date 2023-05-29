audio_stop_sound(throwsound);
with(MakeExplosion(x, y, size * 1.3, size * 1.3, (1 / 2), sn_explosion2))
{
	_team = other._team
    dmg = other.damage * 2
    parent = other.parent
    proc = other.proc

    with(oCrate) if(place_meeting(x, y, other)) hp -= other.dmg;
    with(obj_stone) if(place_meeting(x, y, other)) hp -= other.dmg;

    with(par_enemy) if(place_meeting(x, y, other) && (other._team == team.neutral || (other._team == team.player && !playerally))) {var _event = new damage_event(other.parent, id, proctype.onhit, other.dmg, other.proc)}

    with(obj_boss) if(place_meeting(x, y, other) && (other._team == team.neutral || other._team == team.player)) {var _event = new damage_event(other.parent, id, proctype.onhit, other.dmg, other.proc)}

    with(obj_player)
    {
		if(place_meeting(x, y, other) && (other._team == team.neutral || other._team == team.enemy))
			var _event = new damage_event(other.parent, id, proctype.onhit, other.dmg, other.proc)
        other.hspeed = ((state == "grind") * -7)
    }

    if(place_meeting(x, y, obj_player) && (_team == team.player))
    {
        if(abs(obj_player.hsp) < 3.5)
            obj_player.hsp = lengthdir_x(5, point_direction(x, y, obj_player.x, obj_player.y-8))
        else
            obj_player.hsp += lengthdir_x(2, point_direction(x, y, obj_player.x, obj_player.y-8))

        if(abs(obj_player.vsp) < 3.5)
            obj_player.vsp = lengthdir_y(5, point_direction(x, y, obj_player.x, obj_player.y-8))
        else
            obj_player.vsp += lengthdir_y(2, point_direction(x, y, obj_player.x, obj_player.y-8))
    }
}
ScreenShake(6, 60);
done = true;
scr_particle_explode_violent()
scr_particle_explode_violent()
instance_destroy()
