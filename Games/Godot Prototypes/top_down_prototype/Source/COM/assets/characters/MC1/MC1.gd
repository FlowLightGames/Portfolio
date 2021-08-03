extends KinematicBody2D


onready var movspd : int =120
onready var velocity=Vector2.ZERO
onready var viewdir=2
onready var moving : bool =false
#const fireball= preload("res://scenes/FIREBALL.tscn")
const plants =preload("res://assets/environment/plant/plant.tscn")
onready var cool : bool =false
#onready var HP=get_node("CanvasLayer").get_child(0).get_child(0)
#onready var MP=get_node("CanvasLayer").get_child(0).get_child(1)
#onready var fireball_cost=5
onready var inter=$interacter
onready var ani=$AnimationPlayer

onready var grid=get_parent().get_node("farm").get_node("farm_grid")
onready var world=get_parent()

onready var lab=$Label
onready var debug=$debug

func control_loop():
	velocity.x=0
	velocity.y=0
	moving= false
	
	if Input.is_action_pressed('mov_down'):
		velocity.y += movspd
		moving=true
	if Input.is_action_pressed('mov_up'):
		velocity.y += -movspd
		moving=true
	if Input.is_action_pressed('mov_left'):
		velocity.x += -movspd
		moving=true
	if Input.is_action_pressed('mov_right'):
		velocity.x += movspd
		moving=true
	
	if velocity.y>0:
		viewdir=2
	if velocity.y<0:
		viewdir=0
	if velocity.x>0:
		viewdir=1
	if velocity.x<0:
		viewdir=3 

func move_loop():
	move_and_slide(velocity)
	
func plant(arg : int) -> void:
	var gridpos=grid.world_to_map(inter.global_position)
	if Input.is_action_just_pressed('use'):
		var seeds=plants.instance()
		seeds.position=gridpos*grid.cell_size.x
		seeds.set_type(arg)
		grid.set_cellv(gridpos,0)
		world.add_child(seeds)
		
		grid.add(gridpos,seeds.get_path())
		
func harvest() ->void:
	var gridpos=grid.world_to_map(inter.global_position)
	if Input.is_action_just_pressed("interact")&&(grid.get_cellv(gridpos)==0):
		var tmp=grid.remove(gridpos)


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func animation_loop():
	var tmp="_"
	var tmp2= str(viewdir)
	tmp="idle"+tmp+tmp2
	ani.play(tmp)
	
#	if velocity.x==0 and velocity.y==0:
#		moving=false
#	if moving==true:
#		match pos:
#			0:
#				sprite.play("run_up")
#			1:
#				sprite.play("run_right")
#			2:
#				sprite.play("run_down")
#			3:
#				sprite.play("run_left")
#	else:
#		match pos:
#			0:
#				sprite.play("idle_up")
#			1:
#				sprite.play("idle_right")
#			2:
#				sprite.play("idle_down")
#			3:
#				sprite.play("idle_left")

#func shoot_loop():
#	if Input.is_action_pressed('shoot'):
#		if (cool):
#			pass
#		else:
#
#			var ball=fireball.instance()
#			match pos:
#				0:
#					ball.direction=Vector2(0,-1)
#					ball.rotate(PI)
#				1:
#					ball.direction=Vector2(1,0)
#					ball.rotate(-0.5*PI)
#				2:
#					ball.direction=Vector2(0,1)
#				3:
#					ball.direction=Vector2(-1,0)
#					ball.rotate(0.5*PI)
#			if(MP.value>=fireball_cost):
#				ball.position=position2D.global_position
#				get_parent().add_child(ball)
#				MP.value-=fireball_cost
#			elif(HP.value>=fireball_cost):
#				ball.position=position2D.global_position
#				get_parent().add_child(ball)
#				HP.value-=fireball_cost
#			cool=true
#
#	if Input.is_action_just_released('shoot'):
#		cool=false

func _physics_process(delta):
	debug.global_position=grid.world_to_map(inter.global_position)*grid.cell_size.x
	#lab.text=str(get_tree().get_root().get_child(0).name)
	plant(randi()%5)
	harvest()
	control_loop()
	move_loop()
	animation_loop()
	#shoot_loop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
