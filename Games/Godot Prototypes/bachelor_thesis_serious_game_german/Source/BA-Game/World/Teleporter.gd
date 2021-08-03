extends Area2D


onready var pos0=get_node("0").global_position
onready var pos1=get_node("1").global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Teleporter_body_entered(body):
	if((body.global_position-pos0).length() > (body.global_position-pos1).length()) :
		body.global_position=pos0
	else:
		body.global_position=pos1
