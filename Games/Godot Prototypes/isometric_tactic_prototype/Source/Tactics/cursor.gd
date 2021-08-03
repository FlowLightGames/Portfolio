extends YSort


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var back
var front
var back_offset
var front_offset
var Board
var curr_pos : Vector2
var kiel
export var kiel_pos=0


# Called when the node enters the scene tree for the first time.
func _ready():
	back=$back
	front=$front
	kiel=get_node("front/Kiel")
	
	back_offset=back.offset
	front_offset=front.offset
	
	Board=get_parent()
	
	position = (Board.usedCells[0]).x*Vector2(16,8)+(Board.usedCells[0]).y*Vector2(-16,8)
	curr_pos=Board.get_Board_pos(global_position)
	
	back.offset=back_offset+Vector2(0,-8)*Board.get_Board_height(curr_pos)
	front.offset=front_offset+Vector2(0,-8)*Board.get_Board_height(curr_pos)
	kiel.position.y=kiel_pos+Board.get_Board_height(curr_pos)*-8

func _update_new_pos():
	curr_pos=Board.get_Board_pos(global_position)
	
	back.offset=back_offset+Vector2(0,-8)*Board.get_Board_height(curr_pos)
	front.offset=front_offset+Vector2(0,-8)*Board.get_Board_height(curr_pos)
	kiel.position.y=kiel_pos+Board.get_Board_height(curr_pos)*-8


func _inputHandle():
	var vec = Vector2(0,0)
	vec= int (Input.is_action_just_pressed("ui_up"))*Vector2(16,-8) + int (Input.is_action_just_pressed("ui_down"))*Vector2(-16,8) + int (Input.is_action_just_pressed("ui_left"))*Vector2(-16,-8) + int (Input.is_action_just_pressed("ui_right"))*Vector2(16,8)	
	#check potential new pos
	var pot_pos=position+vec
	var pot_coor=Board.get_Board_pos(pot_pos)
	if(pot_coor.x>=0&&pot_coor.x<Board.size_x&&pot_coor.y>=0&&pot_coor.y<Board.size_y):
		position+=vec
	
	_update_new_pos()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_inputHandle()
