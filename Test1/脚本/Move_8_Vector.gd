extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var move_timer: Timer = $MoveTimer

# 配置参数
const GRID_SIZE = 32            # 网格尺寸（像素）
const MOVE_SPEED = 600          # 移动速度（像素/秒）
const INITIAL_DELAY = 0.1       # 长按首次重复延迟（秒）
const REPEAT_INTERVAL = 0.1     # 长按重复间隔（秒）
const DIRECTION_LOCK_THRESHOLD = 0.6

var is_moving := false          # 是否正在移动
var target_position := Vector2.ZERO
var queued_direction := Vector2.ZERO  # 排队的方向输入
var last_direction := Vector2.DOWN

func _ready():
	target_position = position
	move_timer.wait_time = INITIAL_DELAY
	move_timer.one_shot = true

func _physics_process(delta: float) -> void:
	# 处理输入队列
	if not is_moving and queued_direction != Vector2.ZERO:
		_start_move(queued_direction)
		queued_direction = Vector2.ZERO

	# 插值移动
	if is_moving:
		position = position.move_toward(target_position, MOVE_SPEED * delta)
		if position == target_position:
			is_moving = false
			animated_sprite.play("idle_" + _get_direction_suffix(last_direction))

func _input(event: InputEvent) -> void:
	var raw_input = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	var direction = _get_4way_input(raw_input)
	
	# 处理按键按下
	if direction != Vector2.ZERO:
		if event.is_action_pressed("ui_left") or event.is_action_pressed("ui_right") or event.is_action_pressed("ui_up") or event.is_action_pressed("ui_down"):
			if not is_moving:
				_start_move(direction)
			else:
				queued_direction = direction  # 排队等待下一个移动
			move_timer.start(INITIAL_DELAY)
	
	# 处理按键释放
	if event.is_action_released("ui_left") or event.is_action_released("ui_right") or event.is_action_released("ui_up") or event.is_action_released("ui_down"):
		move_timer.stop()

func _start_move(direction: Vector2) -> void:
	if is_moving: return
	
	last_direction = direction
	target_position = position + direction * GRID_SIZE
	is_moving = true
	animated_sprite.play("run_" + _get_direction_suffix(direction))

func _on_move_timer_timeout():
	# 长按重复移动
	var current_input = _get_4way_input(Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	))
	
	if current_input != Vector2.ZERO:
		queued_direction = current_input
		move_timer.wait_time = REPEAT_INTERVAL
		move_timer.start()

func _get_4way_input(raw_input: Vector2) -> Vector2:
	if raw_input.length() == 0: return Vector2.ZERO
	var normalized_input = raw_input.normalized()
	
	if abs(normalized_input.x) >= DIRECTION_LOCK_THRESHOLD:
		return Vector2(sign(normalized_input.x), 0)
	elif abs(normalized_input.y) >= DIRECTION_LOCK_THRESHOLD:
		return Vector2(0, sign(normalized_input.y))
	
	return Vector2.ZERO

func _get_direction_suffix(dir: Vector2) -> String:
	if dir.y > 0: return "Down"
	if dir.y < 0: return "Up"
	if dir.x > 0: return "Right"
	return "Left"
