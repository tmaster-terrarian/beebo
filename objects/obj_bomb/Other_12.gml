audio_stop_sound(throwsound);
with(MakeExplosion(x, y, size * 1.3, size * 1.3, 0.5, sn_explosion2))
{
    image_index += 1
	_team = other._team
    dmg = other.damage
    parent = other.parent
    proc = other.proc
    crit = 1
    size = other.size

    with(oCrate) if(place_meeting(x, y, other)) hp -= other.dmg;
    with(obj_stone) if(place_meeting(x, y, other)) hp -= other.dmg;

    with(par_enemy) if(place_meeting(x, y, other) && (other._team == team.neutral || (other._team == team.player && !playerally))) {damage_event(other.parent, id, proctype.onhit, other.dmg, other.proc, 1, other.crit); }

    with(obj_boss) if(place_meeting(x, y, other) && (other._team == team.neutral || other._team == team.player)) {damage_event(other.parent, id, proctype.onhit, other.dmg, other.proc, 1, other.crit); }

    with(obj_player)
    {
		if(place_meeting(x, y, other))
        {
            if(other._team != _team)
			    damage_event(other.parent, id, proctype.onhit, other.dmg, other.proc, 1, other.crit)
            else
            {
                if(abs(hsp) < 3.5 * (spd / 2))
                    hsp = lengthdir_x(5 * (spd / 2) * other.size, point_direction(other.x, other.y, x, y-8))
                else
                    hsp += lengthdir_x(2 * (spd / 2) * other.size, point_direction(other.x, other.y, x, y-8))

                if(abs(vsp) < 3.5 * (spd / 2))
                    vsp = lengthdir_y(5 * (spd / 2) * other.size, point_direction(other.x, other.y, x, y-8))
                else
                    vsp += lengthdir_y(2 * (spd / 2) * other.size, point_direction(other.x, other.y, x, y-8))
            }
        }
        other.hspeed = ((state == "grind") * -7)
    }
}
ScreenShake(6 + (size - 1)*1.5, 60);
done = true;
scr_particle_explode_violent()
scr_particle_explode_violent()
instance_destroy()
