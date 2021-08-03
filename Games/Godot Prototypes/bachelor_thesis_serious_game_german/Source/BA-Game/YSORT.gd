extends Position2D


var sprite



func _ready():
	sprite=get_parent()
	 



func _process(delta):
	#setzt jeden frame den z wert auf die y Koordinate im screen space
	
	var screen_coord = get_viewport_transform() * (  global_position )
	
	if(screen_coord.y>2000 or screen_coord.y<-2000):
		sprite.z_index=0
	
	else:
		sprite.z_index=screen_coord.y


