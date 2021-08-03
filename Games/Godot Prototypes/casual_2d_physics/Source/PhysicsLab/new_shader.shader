shader_type canvas_item;
render_mode blend_mix;

uniform sampler2D palett : hint_white ;

void fragment(){
	vec4 tex=texture(TEXTURE,UV);
	COLOR=vec4(texture(palett,vec2(tex.r,0.5)).rgb,tex.a);
}