varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float sigma;  // Parametr kontrolujący szerokość wygładzania
uniform float radius; // Parametr kontrolujący rozmiar intensywnego obszaru światła

void main()
{
    vec2 center = vec2(0.5, 0.5);
    float dist = length(v_vTexcoord - center);
    
    // Zastosowanie funkcji wygładzającej z kontrolą rozmiaru centralnego obszaru
    float factor = exp(-dist * dist / (2.0 * sigma * sigma)) * (dist < radius ? 1.0 : 0.0);
    //może factor zamykamy do 0.75
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord) * factor;
}
