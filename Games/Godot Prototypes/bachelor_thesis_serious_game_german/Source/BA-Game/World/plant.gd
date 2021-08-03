extends Area2D


#referenzen

onready var grown=0
onready var plantlist=get_parent()
onready var watered=get_parent().get_parent().get_parent().get_node("Tilemap/watered")
onready var growlist=[5,6,5,5]
var type : int

func _ready():
	add_to_group("Saveable")
	add_to_group("Plant")
#	timer.start()

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
		"type" : type,
		"grown" : grown
	}
	return save_dict

func load_it():
	set_type(type)
	set_growth(grown)
	var gridpos=plantlist.world_to_map(global_position)
	plantlist.set_cellv(gridpos,0)

#setzte pflanzen typ
func set_type(arg : int)->void:
	var sprite=$Sprite
	var shd=$Sprite/Sprite
	type=arg
	sprite.set_region_rect(Rect2(0,arg*32,16,32))
	shd.set_region_rect(Rect2(0,arg*32,16,32))

#setze pflanzen wachstumsstadium
func set_growth(arg: int)->void:
	var sprite=$Sprite
	var shd=$Sprite/Sprite
	sprite.set_region_rect(Rect2(arg*16,type*32,16,32))
	shd.set_region_rect(Rect2(arg*16,type*32,16,32))
	

func day_lap():
	var gridpos=plantlist.world_to_map(global_position)
	if watered.get_cellv(gridpos)!=-1:
		if(grown<(growlist[type])):
			grown+=1
		set_growth(grown)

func _process(delta):
	if(plantlist.get_cellv(plantlist.world_to_map(global_position))!=0):
		if grown==growlist[type]:
			GLOBALS.ToAcc+=400
			queue_free()
		else :
			plantlist.set_cellv(plantlist.world_to_map(global_position),0)
#		queue_free()



