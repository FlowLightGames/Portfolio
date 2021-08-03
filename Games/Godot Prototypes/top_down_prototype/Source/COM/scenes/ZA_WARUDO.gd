extends Node2D


var shadow_map :Image 
var reset :Image
var tmp : ImageTexture
onready var night =$"night/night"
onready var night_mat=night.get_material()
# Called when the node enters the scene tree for the first time.
func _ready():
	shadow_map= load("res://assets/UI/window.png").get_data()
	reset= shadow_map.duplicate(false)
	tmp=  ImageTexture.new()
	tmp.create_from_image(shadow_map) 
#	var tmp=get_viewport().size
#	var counter=tmp.x*tmp.y
#	while(counter>1):
#		shadow_map.append(true)
#		counter-=1
#	print(str(shadow_map.size()))
	

#	print(str(reset==shadow_map))

func add_sprite(arg1 : Sprite)->void:
	var img=arg1.texture.get_data()
	img.lock()
	#img.save_png("res://assets/UI/debugsprite.png")
	var width = img.get_size().x
	var height = img.get_size().y
	var it1:int=0
	var it2:int=0
	while(it1<height):
		it2=0
		while(it2<width):
			var screenx =round((get_viewport_transform()*arg1.global_position).x+it2)
			var screeny= round((get_viewport_transform()*arg1.global_position).y+it1)
			if(screenx<get_viewport().size.x && screeny<get_viewport().size.y&&screenx>0&&screeny>0):
				#var sdw=screenidx.x+screenidx.y*width
				shadow_map.lock()
				#print(str(shadow_map.get_pixel( screenidx.x,screenidx.y)))
				shadow_map.set_pixel( screenx,screeny, img.get_pixel(it2,it1)+shadow_map.get_pixel(screenx,screeny) )
			it2+=1
			#print(str(screeny)+" "+str(screenx))
		it1+=1
	#print(str(arg1.global_position)+str(0))
	#shadow_map.save_png("res://assets/UI/debugmap.png")
	#night_mat.set_shader_param("map",shadow_map)
	tmp.set_data(shadow_map)
	night_mat.set_shader_param("map",tmp)

func set_back()->void:
	shadow_map=reset.duplicate(false)

func _process(delta):
	pass


