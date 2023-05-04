function _inflict(target, buff, stacks = 1, add = 0)
{
	target.buffs[$ buff.name] = buff
    if(add)
        target.buffs[$ buff.name].add_stacks(stacks)
    else
        target.buffs[$ buff.name].set_stacks(stacks)
}
