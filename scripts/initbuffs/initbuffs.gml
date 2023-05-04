function initbuffs(target)
{
	with(statmanager)
	{
		target.buffs =
		{
			slow : new _slow(),
			bleed : new _bleed(),
			fast : new _fast()
		}
	}
}
