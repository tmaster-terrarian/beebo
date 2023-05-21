with(obj_player)
{
    foreach(buffs as (buff)
    {
        buff.step()
        buff.tick(obj_player)
    })

    for(var i = 0; i < array_length(items); i++)
    {
        items[i].step(obj_player)
    }

    statsmult = 
    {
        hp_max : 1,
        regen_rate : 1,
        spd : 1,
        jumpspd : 1,
        firerate : 1,
        accuracy : 1,
        damage : 1
    }

    var spdadd = 1
    spdadd += (variable_struct_exists(buffs, "buff_fast")) ? buffs.buff_fast.calc() : 0

    var spdsub = 1
    spdsub += (variable_struct_exists(buffs, "debuff_slow")) ? buffs.debuff_slow.calc() : 0

    statsmult.spd = spdadd / spdsub

    if ((hp / hp_max) != (hp / (stats.hp_max * statsmult.hp_max)))
    {
        hp *= statsmult.hp_max
        lasthp *= statsmult.hp_max
        oCamera.hp_change *= statsmult.hp_max
    }

    hp_max = stats.hp_max * statsmult.hp_max
    regen_rate = stats.regen_rate * statsmult.regen_rate
    walksp = stats.spd * statsmult.spd
    jump_speed = stats.jumpspd * statsmult.jumpspd

    ground_accel = stats.ground_accel * (walksp / stats.spd)
    ground_fric = stats.ground_fric * (walksp / stats.spd)
    air_accel = stats.air_accel * (walksp / stats.spd)
    air_fric = stats.air_fric * (walksp / stats.spd)

    statsmult.accuracy = max(statsmult.accuracy - _calcitem("beeswax", self), 0)

    with(oGun)
    {
        firerate = other.stats.firerate * other.statsmult.firerate
        accuracy = other.stats.accuracy * other.statsmult.accuracy
    }
}

with(par_enemy)
{
    foreach(buffs as (buff)
    {
        buff.step()
        buff.tick(id)
    })

    statsmult =
    {
        hp_max : 1,
        spd : 1,
        firerate : 1,
        damage : 1
    }

    var spdadd = 1
    spdadd += (variable_struct_exists(buffs, "buff_fast")) ? buffs.buff_fast.calc() : 0

    var spdsub = 1
    spdsub += (variable_struct_exists(buffs, "debuff_slow")) ? buffs.debuff_slow.calc() : 0

    statsmult.spd = spdadd / spdsub

    hp_max = stats.hp_max * statsmult.hp_max
    spd = stats.spd * statsmult.spd
    firerate = stats.firerate * statsmult.firerate
    damage = stats.damage * statsmult.damage
}
