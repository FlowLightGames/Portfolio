extends KinematicBody2D

onready var movspd : int =120
onready var velocity=Vector2.ZERO

#viewdir: 0:Norden 1:Osten 2:Sueden 3:Westen
onready var viewdir=2
#viewvec wichtig fuer positionsabfrage des Stoepsels beim Fischen
onready var viewvec=Vector2(0,1)
onready var blocked=false
#fish_var fuer fischen
onready var fish_var=-1
#Tageszeit 6-24
onready var DayTime=6

#derzeitig ausgewaehle Aktion im Farm UI
onready var curr_do=0
onready var curr_pla=0
#relevante referenzen von Knoten im Szenenbaum
onready var inter=$Interacter
onready var pos=$Position2D
onready var ani=$AnimatedSprite
onready var shdow=$AnimatedSprite/Sprite
onready var timer=$Timer
onready var fishtimer=$fishtimer
onready var DayTimer=$HUD/Time
onready var energy=$HUD/Energie/EnergieA
onready var water=$HUD/Water/WaterA
onready var night=$Night/ColorRect
onready var getsprite=$Get_sprite

onready var Doing=$HUD/HBoxContainer/doing
onready var Planting=$HUD/HBoxContainer/planting

#playerstate der State machiene
onready var state="idle"

#refernez der Pflanzen szene
const plants =preload("res://World/plant.tscn")
#refernz der Welt szene
onready var world=get_parent()
#referenzen der einzelenen Tilemaps fuer abfragen
onready var watertest=get_node("../Tilemap/watered")
onready var plowtest=get_node("../Tilemap/plowed")
onready var plantlist=get_node("../check/plantlist")
onready var fishtest=get_node("../check/water")
onready var fieldtest=$"../check/field"

#array von farben fur shader uebergang zur nacht
var night_dict = {
		16 : "f6eefb",
		17 : "dad6e7",
		18 : "b2abc7",
		19 : "8d83aa",
		20 : "716693"
	}


func _ready():
	water.value=100
	DayTimer.text="Uhrzeit: "+str(DayTime)+":00"
	
	#print(str(energy.value))
	energy.value=GLOBALS.energy
	#print(str(energy.value))
	
	get(27)

#funktion fur darstllung von erhalt eines gegenstands mit dazugehoerigem sprite
func get(arg) ->void:
	set_get(arg)
	state="idle"
	blocked=true
	ani.play("get")
	getsprite.visible=true
	
	var t = Timer.new()
	t.set_wait_time(0.7)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
	getsprite.visible=false
	blocked=false
	
	t.queue_free()

#trink funktion
func drink():
	get(27)
	water.value+=10

#input control loop. strings fuer tastendruecke in projectsettings eingestellt
func control_loop(delta):
	if Input.is_action_just_pressed("ui_up"):
		curr_do=posmod((curr_do+1),5)
	if Input.is_action_just_pressed("ui_down"):
		curr_do=posmod((curr_do-1),5)
	if Input.is_action_just_pressed("ui_left"):
		curr_pla=posmod((curr_pla+1),4)
	if Input.is_action_just_pressed("ui_right"):
		curr_pla=posmod((curr_pla-1),4)

	
	if Input.is_action_pressed('m_down'):
		velocity.y += movspd
		state="run"
		#moving=true
	if Input.is_action_pressed('m_up'):
		velocity.y += -movspd
		state="run"
		#moving=true
	if Input.is_action_pressed('m_left'):
		velocity.x += -movspd
		state="run"
		#moving=true
	if Input.is_action_pressed('m_right'):
		velocity.x += movspd
		state="run"
		#moving=true
	
	if velocity.x>0:
		viewdir=1
		viewvec=Vector2(1,0)
	if velocity.x<0:
		viewdir=3 
		viewvec=Vector2(-1,0)
	if velocity.y>0:
		viewdir=2
		viewvec=Vector2(0,1)
	if velocity.y<0:
		viewdir=0
		viewvec=Vector2(0,-1)
	
	#inter fuer abfrage von wasser tiles beim fischen
	inter.position=pos.position+viewvec*24

#funktion vom Pfanzen. checkt zuerst ob boden unter avatar gepfluegt und genug energie
func plant(arg : int) -> void:
	var gridpos=fieldtest.world_to_map(pos.global_position)
	if (plowtest.get_cellv(gridpos)!=-1&&plantlist.get_cellv(gridpos)!=0):
		var seeds=plants.instance()
		seeds.position=gridpos*fieldtest.cell_size.x
		seeds.set_type(arg)
		plantlist.set_cellv(gridpos,0)
		plantlist.add_child(seeds)
		
#		grid.add(gridpos,seeds.get_path())
	state="idle"


#funktion vom Pfluegen. checkt zuerst ob boden unter avatar ist und genug energie
func plow() ->void:
	var gridpos=fieldtest.world_to_map(pos.global_position)
	if (fieldtest.get_cellv(gridpos)!=-1&&energy.value>=2):
		state="idle"
		blocked=true
		ani.play("plow")
		var t = Timer.new()
		t.set_wait_time(0.5)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		
		plowtest.set_cellv(gridpos,6)
		plowtest.update_bitmask_area(gridpos)
		energy.value+=-2
		
#		ani.play(str(viewdir)+"idle")
		t.queue_free()
		
	state="idle"

#funktion vom Pfluegen. checkt zuerst ob boden unter avatar gepfluegt ist und genug energie
func water() ->void:
	var gridpos=fieldtest.world_to_map(pos.global_position)
	if (plowtest.get_cellv(gridpos)!=-1&&energy.value>=2):
		state="idle"
		blocked=true
		ani.play("water")
		var t = Timer.new()
		t.set_wait_time(0.5)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		
		watertest.set_cellv(gridpos,7)
		watertest.update_bitmask_area(gridpos)
		energy.value+=-2
		
#		ani.play(str(viewdir)+"idle")
		t.queue_free()
	state="idle"

#funktion vom Ernten. checkt pflanzenliste und position und loescht diese
func harvest() ->void:
	var gridpos=fieldtest.world_to_map(pos.global_position)
	if (plantlist.get_cellv(gridpos)==0):
#		var tmp=grid.remove(gridpos)
		plantlist.set_cell(gridpos.x,gridpos.y,-1)
		
	state="idle"
		

#funktion vom Fischen. checkt ob vor dem spieler wasser ist
func fish()->void:
	var gridpos=fieldtest.world_to_map(inter.global_position)
	if ((fishtest.get_cellv(gridpos)==0)):
		blocked=true
		inter.get_child(0).play("default")
		inter.get_child(0).visible=true
		ani.play(str(viewdir)+"cast")
		state="fishmini"
		fishtimer.start(0.0)

func reset():
	state="idle"
	velocity.x=0
	velocity.y=0

# shake funktionen lassen avatar sprite zittern (Fisch am Haken)
func stop_shake():
	timer.stop()
	shdow.offset=Vector2.ZERO
	ani.offset=Vector2.ZERO

func start_shake():
	timer.start()

func move_loop():
	move_and_slide(velocity*GLOBALS.mov_spd_mul)

#animationloop. baut sich den string aus statemachine zusammen um korrekte animation zu spielen
func animation_loop():
	var tmp=""
	tmp+=str(viewdir)
	if(state!="fish"):
		tmp+=state
	else:
		tmp+="idle"
	ani.play(tmp)

#finktion für fisch minispiel 
func fishmini():
	if Input.is_action_just_pressed('fish'):
		fish_var=-1
		inter.get_child(0).visible=false
		fishtimer.stop()
		stop_shake()
		if "bite" in ani.animation:
			get(28) 
			GLOBALS.ToAcc=+400
		state="idle"
		blocked=false
		
#inoputhandeler etscheidet nach dem Farm UI was beim betaetigen der do-taste getan wird
func inputhandle():
	if Input.is_action_just_pressed("do")&&curr_do==1:
		state='water'
	if Input.is_action_just_pressed("do")&&curr_do==0:
		state='plow'
	if Input.is_action_just_pressed("do")&&curr_do==3:
		state='harvest'
	if Input.is_action_just_pressed("do")&&curr_do==4:
		state='plant'
	if Input.is_action_just_pressed('fish'):
		state='fish'
		
	match state:
		'water':
			water()
		'plow':
			plow()
		'harvest':
			harvest()
		'plant':
			plant(curr_pla)
		'fish':
			fish()
	
#_physics_process wird jeden physik schritt ausgefuehrt _process jeden frame
func _physics_process(delta):
	if(state=="fishmini"):
		fishmini()
	
	else:
		inputhandle()

	if(!blocked):
		control_loop(delta)
		move_loop()
		animation_loop()
		if Input.is_action_pressed('do')&&curr_do==2:
			drink()
		reset()
#hilffuntionen
func set_get(arg : int)->void:
	var sprite=$Get_sprite
	sprite.set_region_rect(Rect2(arg*16,0,16,16))
#hilffuntionen
func _on_Timer_timeout():
	shdow.offset.x=(randi()%3)-1
	shdow.offset.y=(randi()%3)-1
	ani.offset.x=shdow.offset.x
	ani.offset.y=shdow.offset.y

#hilffuntionen
func _on_AnimatedSprite_animation_finished():
	if(ani.animation=="plow"||ani.animation=="water"):
		blocked=false

#hilffuntionen
func _on_fishtimer_timeout():
	fish_var=randi()%4
	if (fish_var==0):
		ani.play(str(viewdir)+"bite")
		inter.get_child(0).play("catch")
		start_shake()
	else:
		stop_shake()
		ani.play(str(viewdir)+"cast")
		inter.get_child(0).play("default")

# funktion handelt alles was von der Ingame Zeit abhaengig ist
func _on_Daytimer_timeout():
	if(DayTime<23):
		#Zeitanzeige
		DayTime+=1
		#wasserleiste
		water.value-=10*GLOBALS.heatDay
		if(water.value<=0):
			state="idle"
			blocked=true
			ani.play("KO")
			var t = Timer.new()
			t.set_wait_time(2.5)
			t.set_one_shot(true)
			self.add_child(t)
			t.start()
			yield(t, "timeout")
			t.queue_free()
			
			var plants = get_tree().get_nodes_in_group("Plant")
			for i in plants:
				i.day_lap()
			get_parent().save_game()
			GLOBALS.reset()
			get_tree().change_scene("res://World/Mission.tscn")
			
		DayTimer.text="Uhrzeit: "+str(DayTime)+":00"
		match DayTime:
			#nachtshader
			16,17,18,19,20:
				night.color=Color(night_dict[DayTime])
			# _ ist default
			_:
				pass
