extends YSort


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var topoMap : Array 
var usedCells : Array
var size_x
var size_y

func get_Board_pos(input : Vector2 ):
	var Map = get_node("TileMap")
	return Map.world_to_map(input)
	
func get_Board_height(input : Vector2 ):
	var Map = get_node("TileMap")
	return Map.get_height(input)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
