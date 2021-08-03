extends KinematicBody2D


onready var timer=$Timer
onready var ani=$AnimatedSprite
var rando
func _ready():
	ani.play("idle_RD")
	# 0 IS RESERVED FOR STANDART BEHAVIOR
	
	rando=0
	timer.start()
func _physics_process(delta):
	#time+=delta
	#rando=randi()%10
	if(rando==1):
		timer.stop()
		ani.play("jump_RD")
		if(ani.frames.get_frame_count("jump_RD")-1==ani.get_frame()):
				rando=0
				timer.start()
	else:
		ani.play("idle_RD")
	


func _on_Timer_timeout():
	rando=randi()%4
