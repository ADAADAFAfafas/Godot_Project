extends State
###变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


###方法
func enter():
	print("玩家进入翻滚状态")
	animation_player.play("roll")
	player.velocity.x = player.roll_speed * player.last_direction
	
func update(_delta : float):
	pass
		
func physice_update(_delta : float): 
	pass
	
func exit(): 
	player.velocity.x = 0
	
