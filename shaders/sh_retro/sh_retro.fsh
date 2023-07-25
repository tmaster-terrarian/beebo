//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const mat4 ditherTable = mat4(
	-4.0, 0.0, -3.0, 1.0,
	2.0, -2.0, 3.0, -1.0,
	-3.0, 1.0, -4.0, 0.0,
	3.0, -1.0, 2.0, -2.0
);

const float COLOR_FACTOR = 16.0;   // Higher num - higher colors quality

void main()
{
	vec3 end_color = vec3((v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )).rgb);

	float xx = mod(v_vTexcoord.x, 4.0);
	float yy = mod(v_vTexcoord.y, 4.0);

	end_color += ditherTable[int(xx)][int(yy)] * 0.01;

	end_color = floor((end_color * COLOR_FACTOR) + 0.5) / COLOR_FACTOR;

	gl_FragColor = vec4(end_color, 1);
}
