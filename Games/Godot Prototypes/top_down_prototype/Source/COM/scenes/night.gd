extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var shadow_map= get_tree().get_root().get_node("ZA_WARUDO")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shadow_map.set_back()
