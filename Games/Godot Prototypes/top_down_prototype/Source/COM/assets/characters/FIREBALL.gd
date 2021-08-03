extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const Speed=240
var direction=Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	direction.x*= Speed
	direction.y*= Speed
	$AnimatedSprite.play("shoot")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	translate(direction*delta)
	


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		body._DMG()
		queue_free()
	
