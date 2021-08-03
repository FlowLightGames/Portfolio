extends HBoxContainer


#setzt die 2 Icons fuer das Farm UI

onready var doing=$doing
onready var planting= $planting

onready var core=get_parent().get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 



func _process(delta):
	var tmp="res://PC/Sprites/"+ str(core.curr_pla) +".png"
	var tmd="res://PC/Sprites/d_"+ str(core.curr_do) +".png"
	planting.texture=load(tmp)
	doing.texture=load(tmd)

