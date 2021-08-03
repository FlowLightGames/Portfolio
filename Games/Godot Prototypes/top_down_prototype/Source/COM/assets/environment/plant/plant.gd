extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var timer=$Timer
onready var grown=0
var type : int
func _ready():
	timer.start()


func set_type(arg : int)->void:
	var sprite=$Sprite
	type=arg
	sprite.set_region_rect(Rect2(0,arg*32,16,32))
	
func set_growth(arg: int)->void:
	var sprite=$Sprite
	sprite.set_region_rect(Rect2(arg*16,type*32,16,32))

#func harvest() -> void:
#	if (overlaps_body(get_tree().get_root().get_child(0).get_node("MC1"))&&Input.is_action_just_pressed('interact')):
#		queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	harvest()
#	pass

func _on_Timer_timeout():
	if(grown<=4):
		grown+=1
	set_growth(grown)
