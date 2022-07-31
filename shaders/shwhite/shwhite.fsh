//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixelH;
uniform float pixelW;

//uniform vec4 outlineColor;

void main()
{
    vec2 offsetx;
    offsetx.x = pixelW;
    vec2 offsety;
    offsety.y = pixelH;

    //float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
    //alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetx ).a);
    //alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetx ).a);
    //alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsety ).a);
    //alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsety ).a);

    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );

    gl_FragColor = vec4(1.0, 1.0, 1.0, gl_FragColor.a);
    //gl_FragColor = vec4(outlineColor.r, outlineColor.g, outlineColor.b, alpha - texture2D( gm_BaseTexture, v_vTexcoord ).a);
}
