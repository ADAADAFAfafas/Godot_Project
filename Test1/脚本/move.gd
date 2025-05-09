extends CharacterBody2D
@export var move_speed: float = 400
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var change_wasd = 1 #方向变量，用来监测最后输入的是哪个方向

func _physics_process(delta: float) -> void:
	
	var input_vector = Vector2.ZERO
	var moveing = false
	if Input.is_action_pressed("ui_down"):
		change_wasd = 1  # 改变方向变量为1
		input_vector.y += 1
		moveing = true
	elif Input.is_action_pressed("ui_up"):
		change_wasd = 2 # 改变方向变量为2
		input_vector.y -= 1
		moveing = true
	elif Input.is_action_pressed("ui_right"):
		change_wasd = 3 # 改变方向变量为3
		input_vector.x += 1
		moveing = true
	elif Input.is_action_pressed("ui_left"):
		change_wasd = 4 # 改变方向变量为4
		input_vector.x -= 1
	velocity = input_vector.limit_length(1.0) * move_speed
	#velocity = input_vector * 100
	move_and_slide()
		
	if input_vector != Vector2.ZERO:
		if change_wasd == 1:
			animated_sprite.play("run_Down") # 播放名为 "run" 的动画
		if change_wasd == 2:
			animated_sprite.play("run_Up")
		if change_wasd == 3:
			animated_sprite.play("run_Right")
		if change_wasd == 4:
			animated_sprite.play("run_Left")
			
	else:
		if change_wasd == 1:
			animated_sprite.play("idle_Down")#的静止动画
		if change_wasd == 2:
			animated_sprite.play("idle_Up")  # 播放名为 "idle" 的静止动画,等画好后加进去
		if change_wasd == 3:
			animated_sprite.play("idle_Right")  # 播放名为 "idle" 的静止动画,等画好后加进去
		if change_wasd == 4:
			animated_sprite.play("idle_Left")  # 播放名为 "idle" 的静止动画,等画好后加进去
