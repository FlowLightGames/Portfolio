extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var arg = 0
export var vis=true

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.set_region_rect(Rect2(arg*16,0,16,16))
	$Sprite.visible=vis
	var decider =bool(randi()%2)
	if(decider):
		queue_free()




func _on_Node2D_body_entered(body):
	body.get(arg)
	GLOBALS.ToAcc+=300
	queue_free()
