extends TileMap

var Brick=preload("res://Stages/Brick.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "tex

func spawn(): 
	var cells=get_used_cells()
	var Bricks=YSort.new()
	
	for i in cells:
		var tmp=Brick.instance()
		Bricks.add_child(tmp)
		tmp.position=Vector2(i.x*16,i.y*16)
	get_parent().add_child(Bricks)
	queue_free()
# Called when the node enters the scene tree for the first time.
func _ready():
	 call_deferred("spawn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
