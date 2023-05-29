//
// Simple passthrough fragment shader
//

void main()
{
    gl_FragColor = vec4(1.0, 1.0, 1.0, ceil(gl_FragColor.a));
}
