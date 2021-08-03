extends Node

class item:
	var namae:String
	var is_edible:bool
	var is_tool:bool
	var amount:int
	var sell:int
	var hpmp:Vector2
	
	func _init(arg1:String,arg2:bool,arg3:bool,arg4:int,arg5:int,arg6:Vector2):
		namae=arg1
		is_edible=arg2
		is_tool=arg3
		amount=arg4
		sell=arg5
		hpmp=arg6

var invMC1=[]
var invMC2=[]

func _ready():
	invMC1.append(item.new("emp",false,false,0,0,Vector2.ZERO))
	invMC1.resize(40)
	invMC2.append(item.new("emp",false,false,0,0,Vector2.ZERO))
	invMC2.resize(40)

