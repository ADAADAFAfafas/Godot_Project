extends State
###变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"



###方法
func enter():
	print("玩家进入滑铲状态")
	animation_player.play("slide")
	player.velocity.x = player.slide_speed * player.last_direction

func update(_delta : float):
	pass	

func physice_update(_delta : float): 
	pass

func exit(): 
	player.velocity.x = 0
	
