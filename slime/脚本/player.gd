extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
var gravity = 980
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var ray_cast_up: RayCast2D = $RayCastUp
var is_climbing = false

func _physics_process(delta: float) -> void:
	var on_left_wall = ray_cast_left.is_colliding()
	var on_right_wall = ray_cast_right.is_colliding()
	var on_up_wall = ray_cast_up.is_colliding()
	
	var wall_detected = on_left_wall or on_right_wall or on_up_wall
	if not is_climbing:
		handle_normal_movement(delta)
		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	if wall_detected:
		handle_climbing()
	move_and_slide()
	
	
func handle_climbing():
	# 获取垂直输入（上/下）
	var vertical_input = Input.get_axis("ui_up", "ui_down")
	velocity.y = vertical_input * SPEED
	
func handle_normal_movement(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	# 正常重力应用
