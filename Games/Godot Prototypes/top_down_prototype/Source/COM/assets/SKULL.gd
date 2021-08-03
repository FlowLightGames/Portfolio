extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var acti=1
onready var ani = get_node("AnimatedSprite")
onready var hp =2
var dude

# Called when the node enters the scene tree for the first time.
func _DMG():
	hp+=-1
	if(hp<=0):
		queue_free()
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ani.play(str(acti))
	if(acti==2):
		var velocity=Vector2(dude.global_position.x-global_position.x,dude.global_position.y-global_position.y).normalized()
		global_position+=velocity*delta*45
#	pass



func _on_Area2D_body_entered(body):
	
	if "Player" in body.name:
		acti=2
		dude=body



func _on_Area2D2_body_entered(body):
	if "Player" in body.name:
		body.HP.value=0

	
