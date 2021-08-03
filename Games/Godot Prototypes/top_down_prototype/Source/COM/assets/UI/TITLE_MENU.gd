extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_settings_button_up():
	get_tree().quit()


func _on_new_game_button_up():
	get_tree().change_scene("res://scenes/ZA_WARUDO.tscn")


func _on_continue_button_up():
	pass # Replace with function body.
