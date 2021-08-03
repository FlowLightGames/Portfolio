shader_type canvas_item;

void fragment(){
	vec2 pixel_size = 1.0 / vec2(textureSize(TEXTURE, 0));
	
	vec4 curr =texture(TEXTURE,UV);
	
	vec2 uv_top=UV-vec2(0,pixel_size.y);
	vec2 uv_down=UV+vec2(0,pixel_size.y);
	vec2 uv_left=UV-vec2(pixel_size.x,0);
	vec2 uv_right=UV+vec2(pixel_size.x,0);
	if(uv_top.y<0.0||uv_left.x<0.0||uv_down.y>1.0||uv_right.x>1.0){
		COLOR = vec4(0.0, 0.0, 0.0, curr.a);
	}
	else{
		float top=texture(TEXTURE,(uv_top)).a;
		float down=texture(TEXTURE,(uv_down)).a;
		float left=texture(TEXTURE,(uv_left)).a;
		float right=texture(TEXTURE,(uv_right)).a;
		float result=floor((top+down+left+right)/4.0);
		COLOR=(texture(TEXTURE,UV))-((1.0-result)*vec4(1.0,1.0,1.0,0.0));
	}
	
	
}
