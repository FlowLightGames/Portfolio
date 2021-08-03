shader_type canvas_item;

void fragment() {
	vec4 tmp=texture(SCREEN_TEXTURE,SCREEN_UV);
	COLOR= tmp;//
}