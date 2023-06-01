var _p2 = {x : curvepoint.x, y : curvepoint.y}

if(wind > 0)
{
	_p2.x += ((global.perlin.Get(noise_x, noise_y) - 50) * 0.08) * wind
	_p2.y += ((global.perlin.Get(noise_y, noise_x) - 50) * 0.04) * wind
}

draw_curve_bezier(p0, _p2, p1, col, segments)
