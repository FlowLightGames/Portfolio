shader_type canvas_item;
render_mode blend_mix;
void fragment(){
	COLOR=vec4(UV.x,0.0,UV.y,1.0);
}