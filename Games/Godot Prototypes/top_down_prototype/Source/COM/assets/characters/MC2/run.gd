extends Node

onready var plr=get_parent().get_parent()
#
func on_change()->void:
	plr.prevstate=plr.state
	plr.movspd=120

func handle_input(_delta)->void:
	var tmpvel=Vector2.ZERO
	tmpvel.y += int(Input.is_action_pressed('mov_down'))
	tmpvel.y += -int(Input.is_action_pressed('mov_up'))
	tmpvel.x += -int(Input.is_action_pressed('mov_left'))
	tmpvel.x += int(Input.is_action_pressed('mov_right'))
	if(tmpvel.length()>0):
		plr.velocity=tmpvel
	else:
		plr.prevstate=plr.STATE.run
		plr.state=plr.STATE.idle
	if Input.is_action_pressed('use'):
		plr.prevstate=plr.STATE.run
		plr.state=plr.STATE.attack
	if Input.is_action_pressed('dash')&&!plr.dashcd:
		plr.prevstate=plr.STATE.run
		plr.state=plr.STATE.dash
	
	plr.ani.play("run_"+str(plr.viewdir))
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
