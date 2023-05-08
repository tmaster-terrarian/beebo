function initbuffs(target)
{
	with(statmanager)
	{
		target.buffs =
		{
			debuff_slow : new _slow(),
			debuff_bleed : new _bleed(),
			buff_fast : new _fast()
		}
	}
}
