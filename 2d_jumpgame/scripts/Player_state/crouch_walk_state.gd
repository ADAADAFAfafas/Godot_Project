extends State
###变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


###方法
func enter(): 
	print("玩家进入下蹲移动状态")
	animation_player.play("crouch_walk")

func update(_delta : float): 
	if not player.is_crouch and player.velocity.x != 0:
		switch_state.emit("RunState")
	if player.direction == 0:
		switch_state.emit("CrouchState")
	if player.is_roll:
		switch_state.emit("RollState")
	
func physice_update(_delta : float): 
	player.velocity.x = player.direction * (player.speed / 2)
	
func exit(): 
	player.velocity.x = 0
