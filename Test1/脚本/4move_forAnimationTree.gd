extends CharacterBody2D
@export var move_speed: float = 100
@onready var animation_tree: AnimationTree = $AnimationTree

var direction : Vector2 = Vector2.ZERO
func _ready():
	animation_tree.active = true

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down").normalized()
	# 计算各轴绝对值
	var abs_x = abs(direction.x)
	var abs_y = abs(direction.y)
	
	# 确定主导方向
	if abs_x > abs_y:
		direction = Vector2(sign(direction.x), 0)
	elif abs_y > abs_x:
		direction = Vector2(0, sign(direction.y))
	
	if direction:
		velocity = direction * move_speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	update_animation_tree()

func update_animation_tree():
	if velocity == Vector2.ZERO:
		animation_tree["parameters/conditions/is_idle"] = false
		animation_tree["parameters/conditions/is_run"] = true
	else:
		animation_tree["parameters/conditions/is_idle"] = true
		animation_tree["parameters/conditions/is_run"] = false

	if direction !=Vector2.ZERO:	
		animation_tree["parameters/idle/blend_position"] = direction
		animation_tree["parameters/run/blend_position"] = direction
