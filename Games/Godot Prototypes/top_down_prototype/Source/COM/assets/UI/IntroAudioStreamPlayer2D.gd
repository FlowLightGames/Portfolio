extends AudioStreamPlayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var bb
var tmp
var txtnode
var timer
func _ready():
	bb=" "
	tmp=" "
	txtnode=get_parent()
	volume_db=-100
	#timer=get_parent().get_node("Timer")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func suckdickbbcode(a):
	var input= String(a)
	var output=""
	var tag=0
	var tmp
	var idx=0
	while(idx<input.length()):
		tmp=input[idx]
		if(tmp=="["):
			tag+=1
		elif(tmp=="]"):
			tag=tag-1
		elif(tmp=='\n'):
			pass
		elif(tag==0):
			output=output+tmp
		idx+=1
	return output



func playa():
	volume_db=-20
	bb=suckdickbbcode(txtnode.get_bbcode())
	if(txtnode.get_visible_characters()<=txtnode.get_total_character_count()):
		
		tmp=bb[txtnode.get_visible_characters()-1]
		if(!(" " in tmp)):
			stop()
			
			play(0.0)
			#
		else:
			
			stop()
			#txtnode.playsound()
		
