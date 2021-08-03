extends TextureRect





# setzt zufaellig mit 1/4 wahrscheinlichkein den Tag auf eine Hitzewelle
func _ready():
	var tmp=randi()%4
	if (tmp==0):
		GLOBALS.heatDay=2
		visible=true


