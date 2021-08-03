extends Position2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sprite
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite=get_parent()
	 # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var screen_coord = get_viewport_transform() * (  global_position )
	#sprite.z_index=global_position.y
	if(screen_coord.y>2000 or screen_coord.y<-2000):
		sprite.z_index=0
	
	else:
		sprite.z_index=screen_coord.y
