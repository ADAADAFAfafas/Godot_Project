extends State
###变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


###方法
func enter(): 
	print("玩家进入待机状态")
	animation_player.play("idle")
	player.jump_count = 2

func update(_delta : float): 
	if player.is_jump and player.jump_count > 0:
		switch_state.emit("JumpState")
	if player.direction != 0 and player.is_on_floor():
		switch_state.emit("RunState")
	if player.velocity.y > 0:
		switch_state.emit("FallState")
	if player.is_crouch:
		switch_state.emit("CrouchState")
	if player.is_roll:
		switch_state.emit("RollState")
	if player.is_slide:
		switch_state.emit("SlideState")
func physice_update(_delta : float): 
	pass
	
func exit(): 
	pass
