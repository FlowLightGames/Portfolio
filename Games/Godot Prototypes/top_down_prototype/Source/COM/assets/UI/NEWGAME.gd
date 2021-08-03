extends TextureButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var part1=$Particles2D
onready var part2=$Particles2D2
# Called when the node enters the scene tree for the first time.
func _ready():
	part1.emitting=false
	part2.emitting=false

	 # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_mouse_entered():
	part1.emitting=true
	part2.emitting=true


func _on_TextureButton_mouse_exited():
	part1.emitting=false
	part2.emitting=false


func _on_TextureButton_button_up():
	get_tree().change_scene("res://scenes/LEVEL1.tscn")
