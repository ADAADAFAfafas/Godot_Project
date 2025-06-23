extends State
###变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

###方法
func enter():
	print("玩家进入跑步状态")
	animation_player.play("run")

func update(_delta : float): 
	if player.is_crouch:
		switch_state.emit("CrouchState")
	if player.is_jump and player.jump_count > 0:
		switch_state.emit("JumpState")
	if player.direction == 0 and player.velocity.x == 0:
		switch_state.emit("IdleState")
	if player.velocity.y > 0:
		switch_state.emit("FallState")
		
func physice_update(_delta : float): 
	player.velocity.x = player.direction * player.Speed
	
func exit(): 
	player.velocity.x = 0
