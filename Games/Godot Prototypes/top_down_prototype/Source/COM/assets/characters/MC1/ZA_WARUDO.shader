shader_type canvas_item;

uniform sampler2D map;

render_mode blend_mul;

void fragment() {
	vec4 st = COLOR;
	float m = texture(map,vec2((SCREEN_UV.x),-(SCREEN_UV.y))).a;
	COLOR=st+m*0.5*vec4(1.0,1.0,1.0,1.0);
}