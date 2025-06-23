extends State
###变量
@onready var player: Player = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

###方法
func enter(): 
	print("玩家进入蹬墙跳状态")
	animation_player.play("jump")
	slide_jump()
	player.is_jump = false

func update(_delta : float): 
	if player.is_on_wall_only():
		switch_state.emit("WallSlideState")
	#if player.is_jump and player.jump_count > 0:
		#switch_state.emit("DoubleJumpState")
	if player.velocity.y > 0:
		switch_state.emit("FallState")
	

func physice_update(_delta : float): 
	pass
	#player.velocity.x = playder.direction * player.Speed
	
func exit(): 
	player.velocity.x = 0

func slide_jump():
	#player.last_direction = player.get_wall_normal().x
	player.velocity = Vector2(-player.last_direction * player.Speed , -player.jump_speed)
	player.direction = -player.last_direction
