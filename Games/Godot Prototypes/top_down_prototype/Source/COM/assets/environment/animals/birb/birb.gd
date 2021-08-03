extends Area2D

var type:int
var rng =RandomNumberGenerator.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	type=rng.randi()%6
	$Sprite.region_rect.position.y=28*type
	$AnimationPlayer.play("fly")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
