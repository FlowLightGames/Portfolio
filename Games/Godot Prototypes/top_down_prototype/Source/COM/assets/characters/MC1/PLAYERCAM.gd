extends Camera2D

var shaking :bool
var amp :float
var timer

func _ready():
	make_current()
	timer=$Timer
	#start_shake(7.0, 0.07)

func start_shake(arg1 :float,arg2 :float):
	amp=arg1
	timer.start(arg2)
	shaking=true

func stop_shake():
	timer.stop()
	amp=0
	shaking=false
	offset=Vector2.ZERO

#func shake(amp):
#	var rand=Vector2.ZERO
#	rand.x=rand_range(-amp,amp)
#	rand.y=rand_range(-amp,amp)
#	offset=rand

func _process(delta):
	pass


func _on_Timer_timeout():
	var rand=Vector2.ZERO
	rand.x=rand_range(-amp,amp)
	rand.y=rand_range(-amp,amp)
	offset=rand
