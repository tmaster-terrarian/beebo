alarm[1] = -1
if(lowpasseffect.cutoff < 20000)
{
	bgm_bus.effects[0].bypass = 0
	lowpasseffect.cutoff = min(lowpasseffect.cutoff * 1.15, 20000)
	alarm[0] = 2
}
else bgm_bus.effects[0].bypass = 1
