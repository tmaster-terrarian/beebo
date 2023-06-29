audio_stop_sound(throwsound);
with(MakeExplosion(x, y, size, size, (2 / 3), sn_explosion2))
{
	_team = other._team
    dmg = other.damage
    parent = other.parent
    proc = other.proc

    with(oCrate) if(place_meeting(x, y, other)) hp -= other.dmg;
    with(obj_stone) if(place_meeting(x, y, other)) hp -= other.dmg;

    with(par_enemy) if(place_meeting(x, y, other) && (other._team == team.neutral || (other._team == team.player && !playerally))) {damage_event(other.parent, id, proctype.onhit, other.dmg, other.proc); }

    with(obj_boss) if(place_meeting(x, y, other) && (other._team == team.neutral || other._team == team.player)) {damage_event(other.parent, id, proctype.onhit, other.dmg, other.proc); }

    with(obj_player)
    {
		if(place_meeting(x, y, other) && (other._team == team.neutral || other._team == team.enemy))
        {
			damage_event(other.parent, id, proctype.onhit, other.dmg, other.proc)
            
        }
        other.hspeed = ((state == "grind") * -7)
    }
}
ScreenShake(4, 40);
done = true;
scr_particle_explode_violent();
instance_destroy()
