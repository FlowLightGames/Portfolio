extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var particlesystem 
#var buttonpressed
var sprite
# Called when the node enters the scene tree for the first time.

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	#buttonpressed=false
	particlesystem=get_child(0).get_child(0)
	
	#particlesystem.hide()
	particlesystem.show()
	
	sprite=get_node("cursor")
	
	
	#sprite.hide()
	sprite.show()

func _process(delta):
	#sprite.show()
	#particlesystem.show()
	
	#if(buttonpressed):
	#	particlesystem.emitting=false
	#if(blocked==false):
	position=get_viewport().get_mouse_position()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_mouse_entered():
	particlesystem.emitting=false
	# Replace with function body.


func _on_TextureButton_mouse_exited():
	particlesystem.emitting=true
	 # Replace with function body.
