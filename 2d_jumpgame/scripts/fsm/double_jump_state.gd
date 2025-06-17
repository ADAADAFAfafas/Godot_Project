extends State
###变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

###方法
func enter(): 
	print("玩家进入二段跳状态")
	animation_player.play("jump")
	player.velocity.y = - player.jump_speed
	player.jump_count -= 2
func update(_delta : float): 
	if player.velocity.y > 0:
		switch_state.emit("FallState")
		
func physice_update(_delta : float): 
	player.velocity.x = player.direction * player.Speed
	
func exit(): 
	player.velocity.x = 0
