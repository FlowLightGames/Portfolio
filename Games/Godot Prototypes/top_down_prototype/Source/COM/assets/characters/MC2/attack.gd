extends Node

onready var plr=get_parent().get_parent()
onready var finished=false

onready var atkcounter=0

func on_change()->void:
	plr.prevstate=plr.state
	plr.movspd=0
	
	finished=false
	atkcounter=0
	
	plr.ani.play("attack_0")

func handle_input(_delta)->void:
	if(finished):
		plr.state=plr.STATE.idle
		plr.prevstate=plr.STATE.attack
	else:
		if Input.is_action_just_pressed('use') && atkcounter < 2:
			atkcounter+=1
			plr.ani.play("attack_%s" % str(atkcounter))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	if("attack" in anim_name):
		finished=true
