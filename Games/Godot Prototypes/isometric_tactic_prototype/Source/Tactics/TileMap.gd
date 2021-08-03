extends TileMap
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var TopoMap : Array 
var UsedCells : Array
var size_x 
var size_y 
var pos : Vector2

func make_Topo():
	size_x=get_used_rect().size.x
	size_y=get_used_rect().size.y
	pos=get_used_rect().position
	for i in range(size_y*size_x) :
		TopoMap.append(-1)
	var tmp_tiles=get_used_cells() 
	
	UsedCells=tmp_tiles
	
	for t in tmp_tiles:
		var t_name=tile_set.tile_get_name(get_cellv(t)).left(2)
		TopoMap[(t.y-pos.y)*size_x+(t.x-pos.x)]=int(t_name)
	
	get_parent().topoMap=TopoMap
	get_parent().usedCells=UsedCells
	get_parent().size_x=size_x
	get_parent().size_y=size_y
	
	print (TopoMap)
	print (get_used_rect())
	print (get_used_rect().position)

func make_Used():
	var tmp_tiles=get_used_cells() 
	UsedCells=tmp_tiles

func get_height(input : Vector2):
	return TopoMap[(input.y-pos.y)*size_x+(input.x-pos.x)]

func _ready():
	make_Topo()
	#print(String(map_to_world(Vector2(0,0))))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
