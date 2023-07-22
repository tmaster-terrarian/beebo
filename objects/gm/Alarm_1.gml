alarm[0] = -1
if(lowpasseffect.cutoff > 400)
{
	bgm_bus.effects[0].bypass = 0
	lowpasseffect.cutoff = max(lowpasseffect.cutoff / 1.15, 400)
	alarm[1] = 2
}
