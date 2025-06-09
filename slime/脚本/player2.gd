extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
const CLIMB_SPEED = 150.0
var gravity = 980

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_top: RayCast2D = $RayCastUp
@onready var ray_cast_bottom: RayCast2D = $RayCastDown

# 爬墙状态管理
enum ClimbState {NONE, WALL, CEILING}
var climb_state = ClimbState.NONE
var wall_normal = 0  # 1=右墙, -1=左墙
var last_contact_time = 0.0  # 记录上次接触墙的时间
const CONTACT_BUFFER_TIME = 0.2  # 墙检测缓冲时间(秒)

func _physics_process(delta: float) -> void:
	# 更新接触缓冲计时器
	last_contact_time -= delta
	
	# 检测接触面
	var on_left_wall = ray_cast_left.is_colliding()
	var on_right_wall = ray_cast_right.is_colliding()
	var on_top_wall = ray_cast_top.is_colliding()
	
	# 当检测到接触面时更新缓冲时间
	if on_left_wall or on_right_wall or on_top_wall:
		last_contact_time = CONTACT_BUFFER_TIME
	
	# 进入爬墙/天花板状态的条件
	if (on_left_wall or on_right_wall or on_top_wall or last_contact_time > 0) and climb_state == ClimbState.NONE:
		enter_climb_state(on_left_wall, on_right_wall, on_top_wall)
	
	# 处理跳跃输入
	if Input.is_action_just_pressed("ui_accept"):
		if climb_state != ClimbState.NONE:
			# 蹬墙/天花板跳
			handle_wall_jump()
		elif is_on_floor():
			velocity.y = JUMP_VELOCITY
	
	# 根据当前状态处理移动
	if climb_state != ClimbState.NONE:
		handle_climbing()
	else:
		handle_normal_movement(delta)
	
	move_and_slide()
	
	# 如果爬行时离开所有接触面且不在缓冲时间内，退出爬行状态
	if climb_state != ClimbState.NONE and last_contact_time <= 0 and not (on_left_wall or on_right_wall or on_top_wall):
		climb_state = ClimbState.NONE
		velocity.y = 0  # 防止立即下落

# 进入爬行状态
func enter_climb_state(on_left: bool, on_right: bool, on_top: bool):
	# 优先处理天花板接触
	if on_top:
		climb_state = ClimbState.CEILING
		velocity = Vector2.ZERO
	# 其次处理左右墙接触
	elif on_left or on_right:
		climb_state = ClimbState.WALL
		velocity.y = 0  # 重置垂直速度
		
		# 确定墙面方向
		if on_left:
			wall_normal = -1  # 左墙
		if on_right:
			wall_normal = 1   # 右墙

# 蹬墙/天花板跳
func handle_wall_jump():
	match climb_state:
		ClimbState.WALL:
			# 蹬墙跳
			velocity.y = JUMP_VELOCITY * 0.8
			velocity.x = wall_normal * SPEED * 1.5  # 向墙反方向跳
		ClimbState.CEILING:
			# 天花板跳 - 向下跳
			velocity.y = -JUMP_VELOCITY * 0.6  # 负值表示向下
			velocity.x = 0  # 可以选择添加水平方向
	
	climb_state = ClimbState.NONE

# 爬行移动处理
func handle_climbing():
	# 获取输入
	var vertical_input = Input.get_axis("ui_up", "ui_down")
	var horizontal_input = Input.get_axis("ui_left", "ui_right")
	
	match climb_state:
		ClimbState.WALL:
			# 墙面爬行
			velocity.y = vertical_input * CLIMB_SPEED
			velocity.x = wall_normal * 10  # 小推力确保紧贴墙壁
			
			# 防止爬出屏幕顶部
			if position.y < 0:
				velocity.y = max(velocity.y, 0)
				
		ClimbState.CEILING:
			# 天花板爬行 - 左右移动
			velocity.x = horizontal_input * SPEED
			
			# 天花板向下移动处理（可以"落下"但不会脱离）
			if vertical_input > 0:  # 按下方向键
				velocity.y = vertical_input * CLIMB_SPEED
			else:
				velocity.y = 0
			
			# 防止向上穿过天花板
			if vertical_input < 0:
				velocity.y = 0

# 正常移动处理
func handle_normal_movement(delta: float):
	# 应用重力
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# 获取水平输入
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
