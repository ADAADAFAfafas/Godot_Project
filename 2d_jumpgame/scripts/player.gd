#@tool
class_name Player extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var Speed : float
@export var jump_speed : float
@export var direction : int:
	set(v):
		direction = v
		if last_direction != direction and direction != 0:
			last_direction = direction
@export var last_direction : float:
	set(v):
		last_direction = v
		if last_direction == -1:
			rotation = 0
			scale = Vector2(-1,1)
		elif last_direction == 1:
			rotation = 0
			scale = Vector2(1,1)
@export var is_jump : bool = false
@export var jump_count : int = 2
@export var is_player_2: bool = false

func _physics_process(delta: float) -> void:
	direction = Input.get_axis("player_1_left","player_1_right") if not is_player_2 else Input.get_axis("player_2_left","player_2_right")
	is_jump = Input.is_action_just_pressed("player_1_jump") if not is_player_2 else Input.is_action_just_pressed("player_2_jump")
	
	if is_jump:
		if jump_count > 1:
			jump_count -= 1
			velocity.y = -jump_speed
	if is_on_floor():
		jump_count = 2
	else:
		velocity.y += 9.8
	velocity.x = direction * Speed
	move_and_slide()
	
		
func _process(delta: float) -> void:
	if velocity.y < 0:
		animation_player.play("jump")
	elif velocity.y > 0:
		animation_player.play("fall")
	elif velocity.x !=0:
		animation_player.play("run")
	else:
		animation_player.play("idle")
	

		
