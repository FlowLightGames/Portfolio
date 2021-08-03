extends Node2D

#gespiecherte Spielerdaten

onready var money=0
onready var daycount=0
onready var label=get_parent().get_node("HUD/Label")
onready var day=get_parent().get_node("HUD/Day")

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Saveable")

func get_day(arg1:int):
	var tmp=arg1%7
	var output=""
	match tmp:
		0:
			output="Montag"
		1:
			output="Dienstag"
		2:
			output="Mittwoch"
		3:
			output="Donnerstag"
		4:
			output="Freitag"
		5:
			output="Samstag"
		6:
			output="Sonntag"
	
	return output


func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
		"money" : money,
		"daycount" : daycount
	}
	return save_dict

func load_it():
	daycount+=1
#	money=money+GLOBALS.ToAcc
#	GLOBALS.ToAcc=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(GLOBALS.ToAcc!=0):
		money=money+GLOBALS.ToAcc
		GLOBALS.ToAcc=0
	day.text="Tag: "+ str(daycount)+" Wochentag: "+get_day(daycount)
	label.text="Geld: "+str(money)
