// lrp : lerp point (0 to 1)
// p0 : start point {x, y}
// p1 : curve point {x, y}
// p2 : end point {x, y}

function bezier_get_point(lrp, p0, p1, p2)
{
	var lerp0 = _lerp_vec(p0, p1, lrp)
	var lerp1 = _lerp_vec(p1, p2, lrp)

	return _lerp_vec(lerp0, lerp1, lrp)
}

function _lerp_vec(v0, v1, t)
{
    return {x : lerp(v0.x, v1.x, t), y : lerp(v0.y, v1.y, t)}
}

function draw_curve_bezier(p0, p1, p2, col, segments)
{
	for(var i = 0; i < segments; i++)
	{
		var bezier = bezier_get_point(i/segments, p0, p1, p2)
		var bezier2 = bezier_get_point((i + 1)/segments, p0, p1, p2)

		draw_line_color(bezier.x, bezier.y, bezier2.x, bezier2.y, col, col)
	}
}

function draw_curve_bezier_nostructs(px0, py0, px1, py1, px2, py2, col, segments)
{
	for(var i = 0; i < segments; i++)
	{
		var p0 = {x: px0,y: py0}
		var p1 = {x: px1,y: py1}
		var p2 = {x: px2,y: py2}

		var bezier = bezier_get_point(i/segments, p0, p1, p2)
		var bezier2 = bezier_get_point((i + 1)/segments, p0, p1, p2)

		draw_line_color(bezier.x, bezier.y, bezier2.x, bezier2.y, col, col)
	}
}
