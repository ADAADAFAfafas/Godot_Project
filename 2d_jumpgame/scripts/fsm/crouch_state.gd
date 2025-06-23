extends State
###变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


###方法
func enter(): 
	print("玩家进入下蹲状态")
	animation_player.play("crouch")

func update(_delta : float): 
	if not player.is_crouch and player.is_on_floor_only():
		switch_state.emit("IdleState")
	if player.direction != 0:
		switch_state.emit("CrouchWalkState")

func physice_update(_delta : float): 
	pass
	
func exit(): 
	player.velocity.x = 0
