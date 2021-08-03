extends KinematicBody2D

onready var ani=$AnimatedSprite
onready var ray=$RayCast2D
onready var lazer=$lazer
onready var time=0
onready var amp=5
onready var spd=5

# Called when the node enters the scene tree for the first time.
func _ready():
#	var c:int =25
#	print(str(25/10))
	ani.play("0")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ani.play(str(int(ray.is_colliding())))
	lazer.emitting=ray.is_colliding()
	time+=delta
	ani.offset.y=amp*sin(spd*time)
	if time>=2*PI:
		time=time-2*PI
