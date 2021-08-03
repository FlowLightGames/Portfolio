extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var TXT
var tex
var idx

# Called when the node enters the scene tree for the first time.
func _ready():
	tex=get_node("Label")
	idx=0
	TXT=["This time do it on your own...",
	"Those bushes look burnable...",
	"Don't overdo it with your magic...",
	"Hmmm..."
	]

func _on_Area2D_body_entered(body):
	if "Player"in body.name:
		tex.text=TXT[idx]


func _on_Area2D_body_exited(body):
	if "Player"in body.name:
		tex.text=" "
		idx=(idx+1)%TXT.size()
