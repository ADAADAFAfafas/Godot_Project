extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var change_wasd = 1 #方向变量，用来监测最后输入的是哪个方向
func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1 
	elif Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	elif Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	elif Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_just_pressed("ui_accept"):
		print("Hello!")
	velocity = input_vector * 300
	move_and_slide()
	
	if input_vector != Vector2.ZERO:
		if Input.is_action_just_pressed("ui_down"):
			animated_sprite.play("run_Down") # 播放名为 "run" 的动画
			change_wasd = 1  # 改变方向变量为1
		if Input.is_action_just_pressed("ui_up"):
			animated_sprite.play("run_Up")
			change_wasd = 2 # 改变方向变量为2
		if Input.is_action_just_pressed("ui_right"):
			animated_sprite.play("run_Right")
			change_wasd = 3 # 改变方向变量为3
		if Input.is_action_just_pressed("ui_left"):
			animated_sprite.play("run_Left")
			change_wasd = 4 # 改变方向变量为4
	else:
		if change_wasd == 1:
			animated_sprite.play("idle")  # 播放名为 "idle" 的静止动画
			animated_sprite.frame = 0     # 直接覆盖当前帧
			animated_sprite.pause()
		if change_wasd == 2:
			animated_sprite.play("idle")  # 播放名为 "idle" 的静止动画,等画好后加进去
			animated_sprite.frame = 1     # 直接覆盖当前帧
			animated_sprite.pause()
		if change_wasd == 3:
			animated_sprite.play("idle")  # 播放名为 "idle" 的静止动画,等画好后加进去
			animated_sprite.frame = 2     # 直接覆盖当前帧
			animated_sprite.pause()
		if change_wasd == 4:
			animated_sprite.play("idle")  # 播放名为 "idle" 的静止动画,等画好后加进去
			animated_sprite.frame = 3     # 直接覆盖当前帧
			animated_sprite.pause()
	
