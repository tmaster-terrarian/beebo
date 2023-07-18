global_level = ((global.t / 100) / 60) * difficulty_rate + 1

// player
with(obj_player)
{
    statsmult = 
    {
        hp_max : 1,
        regen_rate : 1,
        spd : 1,
        jumpspd : 1,
        firerate : 1,
        spread : 1,
        damage : 1,
        crit_chance : 0
    }

    foreach(buffs as (buff)
    {
        buff.step(id)
        buff.tick(id)
    })

    for(var i = 0; i < array_length(items); i++)
    {
        global.itemdefs[$ items[i].item_id].step(id, items[i].stacks)
    }

    var spdadd = 1
    spdadd += (variable_struct_exists(buffs, "buff_fast")) ? buffs.buff_fast.calc() : 0

    var spdsub = 1
    spdsub += (variable_struct_exists(buffs, "debuff_slow")) ? buffs.debuff_slow.calc() : 0

    statsmult.spd = spdadd / spdsub

    statsmult.hp_max *= power(0.5, modifier_get_stacks("reckless"))

    if ((hp / hp_max) != (hp / ((stats.hp_max + stats_per_level.hp_max * (level - 1)) * statsmult.hp_max)))
    {
        hp *= statsmult.hp_max
        lasthp *= statsmult.hp_max
        oCamera.hp_change *= statsmult.hp_max
    }
    hp_max = (stats.hp_max + stats_per_level.hp_max * (level - 1)) * statsmult.hp_max

    var regenFac = 1 + 0.2 * (level - 1)
    regenFac -= ((other.difficulty_mult - 1) * 0.125)

    regen_rate = stats.regen_rate * regenFac

    jump_speed = stats.jumpspd * statsmult.jumpspd

    spd = stats.spd * statsmult.spd
    ground_accel = stats.ground_accel * (spd / stats.spd)
    ground_fric = stats.ground_fric * (spd / stats.spd)
    air_accel = stats.air_accel * (spd / stats.spd)
    air_fric = stats.air_fric * (spd / stats.spd)

    base_damage = (stats.damage + stats_per_level.damage * (level - 1))

    statsmult.damage *= power(2, modifier_get_stacks("reckless"))

    damage = base_damage * statsmult.damage

    crit_chance = clamp(statsmult.crit_chance, 0, 1)
    if(crit_chance == 0) crit_chance += 0.01

    statsmult.spread -= 0.1 * item_get_stacks("beeswax", id)
    if(statsmult.spread < 0) statsmult.spread = 0

    with(oGun)
    {
        firerate = other.stats.firerate * other.statsmult.firerate
        spread = other.stats.spread * other.statsmult.spread
    }
}

// enemies
with(par_enemy)
{
    statsmult =
    {
        hp_max : 1,
        regen_rate : 1,
        spd : 1,
        firerate : 1,
        damage : 1,
        crit_chance : 0
    }

    var _lastlevel = level
    var _level = floor(other.global_level)

    if(_level != _lastlevel)
    {
        level = _level

        hp *= statsmult.hp_max
        lasthp *= statsmult.hp_max
        hp_change *= statsmult.hp_max
    }

    foreach(buffs as (buff)
    {
        buff.step(id)
        buff.tick(id)
    })

    for(var i = 0; i < array_length(items); i++)
    {
        global.itemdefs[$ items[i].item_id].step(id, items[i].stacks)
    }

    var spdadd = 1
    spdadd += (variable_struct_exists(buffs, "buff_fast")) ? buffs.buff_fast.calc() : 0

    var spdsub = 1
    spdsub += (variable_struct_exists(buffs, "debuff_slow")) ? buffs.debuff_slow.calc() : 0

    statsmult.spd = spdadd / spdsub

    hp_max = (stats.hp_max + stats_per_level.hp_max * (level - 1)) * statsmult.hp_max

    spd = stats.spd * statsmult.spd
    ground_accel =  0.12 * (spd / stats.spd)
    ground_fric =   0.08 * (spd / stats.spd)
    air_accel =     0.07 * (spd / stats.spd)
    air_fric =      0.02 * (spd / stats.spd)

    base_damage = (stats.damage + stats_per_level.damage * (level - 1))
    damage = base_damage * statsmult.damage

    firerate = stats.firerate * statsmult.firerate

    crit_chance = clamp(statsmult.crit_chance, 0, 1)
}
