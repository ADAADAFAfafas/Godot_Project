extends State
###变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

###方法
func enter(): 
	print("玩家进入下落状态")
	animation_player.play("fall")

func update(_delta : float): 
	if player.is_on_floor():
		switch_state.emit("IdleState")
	if player.is_jump and player.jump_count > 0:
		switch_state.emit("DoubleJumpState")	
func physice_update(_delta : float): 
	player.velocity.x = player.direction * player.Speed
	
func exit(): 
	player.velocity.x = 0
