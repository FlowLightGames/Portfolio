extends Node

#dieser GLOBALS node ueberall im Spiel erreichbar

#energie zum Arbeiten
onready var energy=0
#ToAcc fuer Geld transaktionen
onready var ToAcc=0
#movement Speed multiplier für spaetere Boni
onready var mov_spd_mul=1
#heatday 1 fuer normal 2 fuer Hitzewelle
onready var heatDay=1
#derzeitige missionen
onready var current_missions=[]


func reset():
	heatDay=1
	current_missions=[]
	energy=0
	mov_spd_mul=1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
