extends RichTextLabel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var Text =[
"[center]They left the forest[/center]",
"[center]They had to make decisions[/center]",
"[center]It got dark... \n did they [color=#f41444]REST[/color]?[/center]",
"[center]On their way they could have [color=#f41444]SAVED[/color] a little rat entangled in vines \n Did they do it?[/center]",
"[center]Their path splits \n Did they take the [color=#f41444]LEFT[/color] path?[/center]",
"[center]They found some strange looking footsteps \n Did they [color=#f41444]FOLLOW[/color] them?[/center]",
"[center]It got dark again...\n did they make a [color=#f41444]FIRE[/color]?[/center]",
"[center]Let's see...[/center]"
]
var newidx
var oldidx
var NTXT ="[center]I am in no position to force you \n Farewell[/center]"
var NO
var YES
var nom 
var NOPRESSED
var timnode 
var wait
var soundplayer
var FADE
var decider
var tim

func _ready():
	decider=0
	soundplayer=get_node("sound")
	#newidx=0
	#oldidx=-1
	NOPRESSED=false
	NO=get_parent().get_node("NO")
	YES=get_parent().get_node("YES")
	#FADE=get_parent().get_node("Screenfade")
	wait=false
	nom=0
	set_visible_characters(0) 
	set_bbcode(Text[nom])
	set_process_input(true)
	timnode =get_node("Timer")
	tim=get_node("Fade")
	
	
	

func _input(event):
	if(event is InputEventMouseButton && event.is_pressed()&&!wait):
		if(get_visible_characters()> get_total_character_count()#&&!wait
		):
			if(nom<Text.size()-1):
				nom+=1
				if(nom>1):
					timnode.set_wait_time(0.2)
				set_bbcode(Text[nom])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())
			#if(nom==3||nom==4||nom==5):
				#wait=true
				#YES.draw()
				#YES.disabled=false
				#NO.draw()
				#NO.disabled=false

func _process(delta):
	
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	#newidx=get_visible_characters()
	##if(NOPRESSED||nom==6):
	##	if(get_visible_characters()>=get_total_character_count()):
	##		FADE.play()
	#else:
		
	if((nom==2||nom==3||nom==4||nom==5||nom==6)&&get_visible_characters()>=get_total_character_count()):
		if(nom==6):
			tim.start()
		wait=true
		YES.show()
		YES.disabled=false
		NO.show()
		NO.disabled=false
	
		#if(decider>0):
		#	get_tree().change_scene("res://scenes/LEVEL2.tscn")
		#else:
		#	get_tree().change_scene("res://scenes/LEVEL3.tscn")
		
	

func _on_Timer_timeout():
	if(get_visible_characters()<=get_total_character_count()):
		set_visible_characters(get_visible_characters()+1)
		soundplayer.playa()
	


func _on_YES_pressed():
	nom+=1
	set_bbcode(Text[nom])
	set_visible_characters(0)
	wait=false
	YES.hide()
	NO.hide()
	NO.disabled=true
	YES.disabled=true
	decider+=1
	


func _on_NO_pressed():
	nom+=1
	set_bbcode(Text[nom])
	set_visible_characters(0)
	wait=false
	YES.hide()
	NO.hide()
	NO.disabled=true
	YES.disabled=true
	decider+=-1
#func playsound():
	#if(newidx!=oldidx):
	#	soundplayer.stop()
		#soundplayer.play(0.0)
		#oldidx+=1
	

func _on_Fade_timeout():
	if(decider>0):
		get_tree().change_scene("res://scenes/LEVEL2.tscn")
	else:
		get_tree().change_scene("res://scenes/LEVEL3.tscn")
	
