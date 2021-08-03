extends Area2D

export var arr : Array
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var particle =$Particles2D
onready var timer=$Timer
onready var sprite=$Sprite



# Called when the node enters the scene tree for the first time.
func _ready():
	var rng =RandomNumberGenerator.new()
	rng.randomize()
	var p=rng.randi()
	print(p)
	print((p%4))
	sprite.material.set_shader_param ( "palett", arr[p%4] )


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Node2D_body_entered(body):
	sprite.visible=false
	particle.visible=true
	particle.emitting=true
	timer.start()


func _on_Timer_timeout():
	queue_free()
