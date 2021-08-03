extends RigidBody2D


# Declare member variables here. Examples:
var st_click : Vector2
var nd_click : Vector2

var amp=1


# Called when the node enters the scene tree for the first time.
func _ready():
	apply_impulse(Vector2(0,0),Vector2(100,-100))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		st_click=get_viewport().get_mouse_position()
	if Input.is_action_just_released("click"):
		nd_click=get_viewport().get_mouse_position()
		apply_impulse(Vector2(0,0),amp*(st_click-nd_click))
	
