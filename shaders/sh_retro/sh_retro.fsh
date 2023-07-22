//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	//mat4 ditherTable = mat4(
	//	-4.0, 0.0, -3.0, 1.0,
	//	2.0, -2.0, 3.0, -1.0,
	//	-3.0, 1.0, -4.0, 0.0,
	//	3.0, -1.0, 2.0, -2.0
	//);
	float COLOR_FACTOR = 8.0;   // Higher num - higher colors quality

	vec4 col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );

	//col.rgb += 0.001 * ditherTable[int( v_vTexcoord.x ) % 4][int( v_vTexcoord.y ) % 4];
	col.rgb = floor(col.rgb / COLOR_FACTOR) * COLOR_FACTOR;
	gl_FragColor = col;
}
