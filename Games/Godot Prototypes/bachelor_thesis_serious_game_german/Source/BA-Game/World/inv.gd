extends Node2D

var icon=preload("res://PC/Sprites/16x512.png")

onready var items=$Panel/ItemList
onready var food=$Panel/Food
#ausgewaehlter array
onready var currPyr=[0,0,0,0,0,0,0]
#optimaler array
onready var optPyr=[6,5,3,5,1,1,0]

export(Color, RGB) var col_fruit
export(Color, RGB) var col_sugar
export(Color, RGB) var col_fat
export(Color, RGB) var col_milk
export(Color, RGB) var col_meats
export(Color, RGB) var col_wheat

#referenzen

onready var fruit=[get_node("Pyramide/VBoxContainer/GemueseObst/0"),get_node("Pyramide/VBoxContainer/GemueseObst/1"),
get_node("Pyramide/VBoxContainer/GemueseObst/2"),get_node("Pyramide/VBoxContainer/GemueseObst/3"),
get_node("Pyramide/VBoxContainer/GemueseObst/4"),get_node("Pyramide/VBoxContainer/GemueseObst/5")]

onready var sugar=[get_node("Pyramide/VBoxContainer/Suess/0")]

onready var fat = [get_node("Pyramide/VBoxContainer/Fett/0")]

onready var milk =[get_node("Pyramide/VBoxContainer/Milch/0"),get_node("Pyramide/VBoxContainer/Milch/1"),get_node("Pyramide/VBoxContainer/Milch/2")]

onready var meats=[get_node("Pyramide/VBoxContainer/FischFleischEi/0"),get_node("Pyramide/VBoxContainer/FischFleischEi/1"),
get_node("Pyramide/VBoxContainer/FischFleischEi/2"),get_node("Pyramide/VBoxContainer/FischFleischEi/3"),
get_node("Pyramide/VBoxContainer/FischFleischEi/4")]

onready var wheat=[get_node("Pyramide/VBoxContainer/Getreide/0"),get_node("Pyramide/VBoxContainer/Getreide/1"),
get_node("Pyramide/VBoxContainer/Getreide/2"),get_node("Pyramide/VBoxContainer/Getreide/3"),
get_node("Pyramide/VBoxContainer/Getreide/4")]

#Auswahlmoeglichkeiten

var itemnames=["Salat","Himbeere","Kuerbis","Kohl","Banane","Kirschen",
"Kartoffel","Apfel","Karotte","Orange","Melone","Erdbeere","Keks","Joghurt","Pilz",
"Gurke","Trauben","Fleisch","Fisch","Speck","Eis","Reis","Brot","Kuchen","Kaese",
"Ei","Milch","Wasser","Flusskrebs","Pizza","Tee","Tomate"]

#InhaltsstoffeVektor 

var inhalt={"Salat":[1,0,0,0,0,0,0],"Himbeere":[1,0,0,0,0,0,0],"Kuerbis":[1,0,0,0,0,0,0],
"Kohl":[1,0,0,0,0,0,0],"Banane":[1,0,0,0,0,0,0],"Kirschen":[1,0,0,0,0,0,0],
"Kartoffel":[0,1,0,0,0,0,0],"Apfel":[1,0,0,0,0,0,0],"Karotte":[1,0,0,0,0,0,0],
"Orange":[1,0,0,0,0,0,0],"Melone":[1,0,0,0,0,0,0],"Erdbeere":[1,0,0,0,0,0,0],
"Keks":[0,1,0,0,0,1,0],"Joghurt":[0,0,1,0,0,0,0],"Pilz":[1,0,0,0,0,0,0],
"Gurke":[1,0,0,0,0,0,0],"Trauben":[1,0,0,0,0,0,0],"Fleisch":[0,0,0,1,0,0,0],"Fisch":[0,0,0,1,0,0,0],
"Speck":[0,0,0,1,1,0,0],"Eis":[0,0,1,0,0,1,0],
"Reis":[0,1,0,0,0,0,0],"Brot":[0,1,0,0,0,0,0],"Kuchen":[0,1,0,0,0,1,0],"Kaese":[0,0,1,0,0,0,0],
"Ei":[0,0,0,1,0,0,0],"Milch":[0,0,1,0,0,0,0],"Wasser":[0,0,0,0,0,0,1],"Flusskrebs":[0,0,0,1,0,0,0],
"Pizza":[0,1,1,0,1,0,0],"Tee":[0,0,0,0,0,0,1],"Tomate":[1,0,0,0,0,0,0]}

# Called when the node enters the scene tree for the first time.
func _ready():
	items.set_max_columns(9)
	items.set_fixed_icon_size(Vector2(16,16))
	items.set_icon_mode(ItemList.ICON_MODE_TOP)
	items.set_select_mode(ItemList.SELECT_SINGLE)
	items.set_same_column_width(true)
	
	for type in range(0,32):
		var tmp=icon.get_data().get_rect(Rect2(type*16,0,16,16))
		var itex = ImageTexture.new()
		itex.create_from_image(tmp)
		items.add_item(itemnames[type],itex,true)

func add_pyrm(arg:int):
	var inh=inhalt.get(itemnames[arg])
	currPyr[0]+=inh[0]
	currPyr[1]+=inh[1]
	currPyr[2]+=inh[2]
	currPyr[3]+=inh[3]
	currPyr[4]+=inh[4]
	currPyr[5]+=inh[5]
	currPyr[6]+=inh[6]
	
	if(currPyr[0]!=0&&fruit.size()>=currPyr[0]):
		fruit[(currPyr[0]-1)].self_modulate=col_fruit
	if(currPyr[1]!=0&&wheat.size()>=currPyr[1]):
		wheat[(currPyr[1]-1)].self_modulate=col_wheat
	if(currPyr[2]!=0&&milk.size()>=currPyr[2]):
		milk[(currPyr[2]-1)].self_modulate=col_milk
	if(currPyr[3]!=0&&meats.size()>=currPyr[3]):
		meats[(currPyr[3]-1)].self_modulate=col_meats
	if(currPyr[4]!=0&&fat.size()>=currPyr[4]):
		fat[(currPyr[4]-1)].self_modulate=col_fat
	if(currPyr[5]!=0&&sugar.size()>=currPyr[5]):
		sugar[(currPyr[5]-1)].self_modulate=col_sugar
	if(currPyr[6]!=0):
		pass
	


func _on_Hinzufuegen_pressed():
	var selected=items.get_selected_items()
	
	if(!selected.empty()&&food.get_item_count()<14):
		var tmp=icon.get_data().get_rect(Rect2(selected[0]*16,0,16,16))
		tmp.resize(32,32,0)
		var itex = ImageTexture.new()
		itex.create_from_image(tmp)
		food.add_icon_item(itex,true)
		
		add_pyrm(selected[0])



func _on_Leeren_pressed():
	for item in fruit:
		item.self_modulate=Color(0,0,0,1)
	for item in sugar:
		item.self_modulate=Color(0,0,0,1)
	for item in fat:
		item.self_modulate=Color(0,0,0,1)
	for item in milk:
		item.self_modulate=Color(0,0,0,1)
	for item in meats:
		item.self_modulate=Color(0,0,0,1)
	for item in wheat:
		item.self_modulate=Color(0,0,0,1)
	food.clear()
	currPyr=[0,0,0,0,0,0,0]


func _on_Fertig_pressed():
	GLOBALS.energy=min(currPyr[1]*20,100)
	GLOBALS.ToAcc=-food.get_item_count()*100
	if currPyr[0]==optPyr[0]:
		GLOBALS.ToAcc+=300
	if currPyr[2]==optPyr[2]:
		GLOBALS.ToAcc+=300
	if currPyr[4]<=optPyr[4]:
		GLOBALS.ToAcc+=200
	if currPyr[5]<=optPyr[5]:
		GLOBALS.ToAcc+=200
	get_tree().change_scene("res://World/world.tscn")
