p0 = {x:p0x+x, y:p0y+y}
p1 = {x:p1x+x, y:p1y+y}

curvepoint = {x:x+curvepointx,y:y+curvepointy}

if(curvepointx == 0 && curvepointy == 0)
{
	curvepoint = _lerp_vec(p0, p1, 0.5)
	curvepoint.y += 8 * (point_distance(p0.x, p0.y, p1.x, p1.y) / 32)
}

segments = 16

noise_x = irandom(255)
noise_y = irandom(255)
