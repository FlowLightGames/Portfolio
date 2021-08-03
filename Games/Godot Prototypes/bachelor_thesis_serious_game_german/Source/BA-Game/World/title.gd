extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_NewGame_pressed():
	var dir = Directory.new()
	dir.remove("user://savegame.save")
	get_tree().change_scene("res://World/Mission.tscn")


func _on_Continue_pressed():
	get_tree().change_scene("res://World/Mission.tscn")
