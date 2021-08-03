extends Node2D


var particlesystem 
var sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	#Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
#	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
#	Input.set_custom_mouse_cursor(load("res://assets/UI/empty.png"))
	particlesystem=get_child(0).get_child(0)
	particlesystem.show()
	sprite=get_node("cursor")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position=get_viewport().get_mouse_position()
#	if (get_viewport().get_mouse_position().x>=get_viewport().size.x):
#		Input.warp_mouse_position(Vector2(get_viewport().get_rect().size.x,get_viewport().get_mouse_position().y))
#	if (get_viewport().get_mouse_position().x<=0):
#		Input.warp_mouse_position(Vector2(0,get_viewport().get_mouse_position().y))

