extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var type
var light
var ani
var rng =RandomNumberGenerator.new()
onready var vel =Vector2.ZERO
onready var speed =60
#onready var shadow_map= get_tree().get_root().get_node("ZA_WARUDO")
#onready var shadow_mask=$shadow_mask
#onready var realpos = global_position

func _ready():
	rng.randomize()
	type=rng.randi()%5
	light=$Sprite
	light.region_rect=Rect2(type*16,0,16,16)
	ani=$AnimatedSprite
	ani.play(str(type))

func _process(delta):
	translate(vel*delta)
#	realpos+=vel*delta
#	global_position.x=int(realpos.x)
#	global_position.y=int(realpos.y)
#	shadow_map.add_sprite(shadow_mask)

func _on_Timer_timeout():
	vel=Vector2(pow(-1,randi())*randi(),pow(-1,randi())*randi()).normalized()
	vel=vel*speed
