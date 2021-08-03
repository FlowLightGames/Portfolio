extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bal=preload("res://Ballon.tscn")
onready var timer=$Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	var pos_x=(randi()%81)-40
	var pos_y=(randi()%81)-40
	var tmp = bal.instance()

	add_child(tmp)
	tmp.global_position=global_position+Vector2(pos_x,pos_y)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	var pos_x=(randi()%9)-4
	var pos_y=(randi()%9)-4
	var tmp = bal.instance()

	add_child(tmp)
	tmp.global_position=global_position+Vector2(pos_x,pos_y)
	timer.start(7+randi()%7)
