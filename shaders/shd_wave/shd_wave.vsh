attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// i still dont know glsl's naming convention
// lowercase_underscoreWithCamelCaseUpper? What the helly

uniform float u_time;
uniform float u_speed;
uniform float u_frequency;
uniform float u_amplitude;

void main()
{
	vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0 );
	
	float wave = sin((u_time * u_speed) + (in_TextureCoord.x * u_frequency)) * u_amplitude;
	
	// apply ze wave to the y position
	object_space_pos.y += wave;
	
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
	
	v_vColour = in_Colour;
	v_vTexcoord = in_TextureCoord;
}
