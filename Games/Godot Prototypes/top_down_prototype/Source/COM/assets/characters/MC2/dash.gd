extends Node

onready var plr=get_parent().get_parent()
onready var world=get_parent().get_parent().get_parent()
onready var plrsprite=plr.get_node("Sprite")
var part=preload("res://assets/characters/MC2/particles/Particles2D.tscn")
var ghost=preload("res://assets/characters/MC2/particles/ghost.tscn")
onready var timer=$Timer
onready var ghost_timer=$ghost_timer
onready var cool=$cooldown
onready var finished=false
onready var dash_time=0.3
onready var dash_cooldown=0.2

func on_change()->void:
	plr.prevstate=plr.state
	plr.movspd=600
	finished=false
	
	plr.ani.play("dash_"+str(plr.viewdir))
	var tmp=part.instance()
	tmp.emitting=true
	tmp.global_position=plr.global_position
	world.add_child(tmp)
	plr.dashcd=true
	timer.start(dash_time)
	ghost_timer.start(0.05)
	cool.start(dash_time+dash_cooldown)
	plrsprite.visible=false

func handle_input(_delta)->void:
	if(finished):
		plr.prevstate=plr.STATE.dash
		plr.state=plr.STATE.idle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Timer_timeout():
	ghost_timer.stop()
	plrsprite.visible=true
	finished=true


func _on_ghost_timer_timeout():
	var ghs=ghost.instance()
	ghs.global_position=plr.global_position
	ghs.texture=plrsprite.texture
	world.add_child(ghs)
