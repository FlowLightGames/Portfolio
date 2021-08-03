extends TileMap

class plant_instance:
	var pos : Vector2
	var ref : String
	
	func _init(arg1 : Vector2, arg2 : String):
		self.pos=arg1
		self.ref=arg2

var plants : Array



func add(arg1 : Vector2, arg2 : String)->void:
	var tmp=plant_instance.new(arg1,arg2)
	plants.append(tmp)
	#print(tmp.ref)

func remove(arg1 : Vector2)-> String:
	for x in plants:
		if x.pos==arg1:
			plants.erase(x)
			get_node(x.ref).queue_free()
			set_cellv(x.pos,1)
			return x.ref
	return " "

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
