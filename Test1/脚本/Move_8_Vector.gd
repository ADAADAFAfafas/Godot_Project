extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# 方向阈值（用于斜向移动时选择主方向）
const DIRECTION_THRESHOLD = 0.5
var last_direction: Vector2 = Vector2.DOWN  # 默认初始方向

func _physics_process(delta: float) -> void:
	# 获取输入向量（允许同时按多个键）
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()  # 标准化确保斜向移动速度一致
	
	velocity = input_vector * 300
	move_and_slide()
	
	# 根据输入向量方向更新动画
	if input_vector != Vector2.ZERO:
		# 记录最后方向用于静止状态
		last_direction = input_vector
		# 根据方向选择动画
		_update_movement_animation(input_vector)
	else:
		# 静止时播放对应方向的 idle 帧
		_update_idle_animation(last_direction)

# 根据移动方向播放动画
func _update_movement_animation(dir: Vector2) -> void:
	# 优先判断斜向移动（若需要）
	if abs(dir.x) > DIRECTION_THRESHOLD and abs(dir.y) > DIRECTION_THRESHOLD:
		# 斜向处理（例如：右上、左下等，需额外动画）
		# 这里简化为取更接近的主方向
		if abs(dir.x) > abs(dir.y):
			dir = Vector2(dir.x, 0).normalized()
		else:
			dir = Vector2(0, dir.y).normalized()
	
	# 主方向判断
	if dir.y > 0.5:
		animated_sprite.play("run_Down")
	elif dir.y < -0.5:
		animated_sprite.play("run_Up")
	elif dir.x > 0:
		animated_sprite.play("run_Right")
	elif dir.x < 0:
		animated_sprite.play("run_Left")

# 静止时保持最后方向对应的帧
func _update_idle_animation(last_dir: Vector2) -> void:
	animated_sprite.play("idle")
	# 根据最后方向设置帧（假设 idle 动画有 4 帧：0=下,1=上,2=右,3=左）
	if last_dir.y > 0.5:
		animated_sprite.frame = 0
	elif last_dir.y < -0.5:
		animated_sprite.frame = 1
	elif last_dir.x > 0:
		animated_sprite.frame = 2
	elif last_dir.x < 0:
		animated_sprite.frame = 3
	animated_sprite.pause()
