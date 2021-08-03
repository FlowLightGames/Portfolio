extends Node2D

#script zum speichern der gepfluegten felder

onready var arr=[0]
onready var save_arr=[0]
onready var type=0
onready var grown=0

func _ready():
	add_to_group("Saveable")

func save():
	arr=get_parent().get_used_cells()

	if(!(arr.empty())):
		save_arr.clear()
		for i in arr:
			save_arr.append(i.x)
			save_arr.append(i.y)
	
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
#		"type" : type,
#		"grown" : grown
		"save_arr" : save_arr
	}
	return save_dict

func load_it():
#	pass
	if(save_arr.size()>1):
		arr.clear()
		var i=0
		while(i<save_arr.size()):
			arr.append(Vector2(save_arr[i],save_arr[i+1]))
			i+=2
	if(arr.size()>1):
		for q in arr:
			get_parent().set_cellv(q,6)
			get_parent().update_bitmask_area(q)

