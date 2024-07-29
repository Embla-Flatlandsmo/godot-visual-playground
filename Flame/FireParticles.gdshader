shader_type canvas_item;

uniform sampler2D noise_tex;
uniform float offset_speed_multiplier: hint_range(0.0, 1.0) = 0.2f;
uniform float horizontal_scaling: hint_range(0.001, 1.0) = 0.4f;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 max_texcoord = vec2(1.0);
	// Called for every pixel the material is visible on.
	// Pan over the texture as time passes
	vec2 tex_coord = SCREEN_UV + vec2(0.0, offset_speed_multiplier*TIME);
	// Scale the horizontal of the texture to make it look better
	// Note: Why do we scale the y-coordinates by less than 1? I guess the UVs are s.t. V aligns with y-axis
	tex_coord = tex_coord * vec2(1.0, horizontal_scaling);
	// Modulate the output so the texture read doesn't go out of range
	tex_coord = modf(tex_coord, max_texcoord);

	COLOR = texture(noise_tex, tex_coord, 0.0);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
