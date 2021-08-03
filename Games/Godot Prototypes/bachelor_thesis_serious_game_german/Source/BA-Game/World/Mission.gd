extends VBoxContainer


onready var cur_mis=[]

#referenzen
onready var Mis_one=$"1/Text"
onready var Mis_two=$"2/Text"
onready var Mis_three=$"3/Text"

onready var Missionlist=["Iss die empfohlene Portionen Obst und Gemuese","Halte dich an max. 1 Suessigkeit pro Tag",
"Halte dich an max. 1 Portion Fett pro Tag","Iss die empfohlene Portionen an Milchprodukte","Iss min 3 Portionen Getreideprodukte/Kartoffel"]

#funktion waehlt zufaellig 3 missionen aus Pool aus
func get_new_missions():
	var tmp = []
	var one=randi()%(Missionlist.size()-1)
	tmp.append(one)
	var two=one
	while(two==one):
		two=randi()%(Missionlist.size()-1)
	tmp.append(two)
	var three=one
	while(three==one||three==two):
		three=randi()%(Missionlist.size()-1)
	tmp.append(three)
	#print(str(one)+str(two)+str(three))
	cur_mis=tmp

func set_missions():
	Mis_one.text=Missionlist[cur_mis[0]]
	Mis_two.text=Missionlist[cur_mis[1]]
	Mis_three.text=Missionlist[cur_mis[2]]
	GLOBALS.current_missions=cur_mis


func _ready():
	get_new_missions()
	set_missions()


func _on_TextureButton_pressed():
	get_tree().change_scene("res://World/items.tscn")
