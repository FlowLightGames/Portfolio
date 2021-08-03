extends TextureRect

var inv


func set_inv(arg1:int)->void:
	if(arg1==1):
		inv=ITEMS.invMC1
	else:
		inv=ITEMS.invMC2
		
func set_icons()->void:
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
