extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var zoomed=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_CheckButton_toggled(button_pressed):
	zoomed=!zoomed
	if(zoomed):
		zoom=Vector2(0.25,0.25)
	else:
		zoom=Vector2(0.5,0.5)



