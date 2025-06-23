extends State
###变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


###方法
func enter(): 
	print("玩家进入滑墙状态")
	animation_player.play("wall_slide")
	player.velocity.y = 0
	#player.direction = player.get_wall_normal().x

func update(_delta : float): 
	
	if player.is_jump:
		switch_state.emit("SlideJumpState")
	if player.is_crouch:
		switch_state.emit("FallState")
	#if player.is_on_floor():
		#switch_state.emit("IdleState")
	#if player.last_direction == player.get_wall_normal().x:
		#switch_state.emit("IdleState")
func physice_update(_delta : float):
	player.velocity.y -= 9.8

func exit(): 
	pass
