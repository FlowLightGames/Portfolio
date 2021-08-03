extends KinematicBody2D


onready var movspd : int =0
onready var velocity=Vector2(0,1)
onready var viewdir=2
onready var dashcd:bool=false

enum STATE{run,dash,attack,idle}

onready var prevstate=STATE.idle
onready var state=STATE.idle
onready var run=$"States/run"
onready var dash=$"States/dash"
onready var attack=$"States/attack"
onready var idle=$"States/idle"

onready var inter=$interacter
onready var ani=$AnimationPlayer
onready var menu=$"HUD/inventory"

func _ready():
	pass

func control_loop(delta):
	if prevstate!=state:
		match state:
			STATE.idle:
				idle.on_change()
			STATE.run:
				run.on_change()
			STATE.dash:
				dash.on_change()
			STATE.attack:
				attack.on_change()
	
	match state:
		STATE.idle:
			idle.handle_input(delta)
		STATE.run:
			run.handle_input(delta)
		STATE.dash:
			dash.handle_input(delta)
		STATE.attack:
			attack.handle_input(delta)
	
	if velocity.y>0:
		viewdir=2
	if velocity.y<0:
		viewdir=0
	if velocity.x>0:
		viewdir=1
	if velocity.x<0:
		viewdir=3 

func move_loop():
	move_and_slide(velocity*movspd)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
#	print(STATE.keys()[state]+': '+STATE.keys()[prevstate])
	if Input.is_action_just_pressed("menu"):
		menu.visible=!menu.visible
	control_loop(delta)
	move_loop()
#	pass


func _on_cooldown_timeout():
	dashcd=false
