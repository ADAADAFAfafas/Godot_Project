#@tool
class_name Player extends CharacterBody2D


###变量声明
var gravity : float = 9.8
@export var speed : float = 200
@export var jump_speed : float = 300
@export var roll_speed : float = 250
@export var slide_speed : float = 200

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

@export var jump_count : int = 2
@export var is_player_2: bool = false

var is_jump : bool = false
var is_crouch : bool = false
var is_wall_slide : bool = false
var is_roll : bool = false
var is_slide : bool = false

func _physics_process(_delta: float) -> void:
	if not is_on_wall_only():
		direction = Input.get_axis("player_1_left","player_1_right") if not is_player_2 else Input.get_axis("player_2_left","player_2_right")
	is_jump = Input.is_action_just_pressed("player_1_jump") if not is_player_2 else Input.is_action_just_pressed("player_2_jump")
	is_roll = Input.is_action_just_pressed("player_1_roll") if not is_player_2 else Input.is_action_just_pressed("player_2_roll")
	is_slide = Input.is_action_just_pressed("player_1_slide") if not is_player_2 else Input.is_action_just_pressed("player_2_slide")
	
	is_crouch = Input.is_action_pressed("player_1_down") if not is_player_2 else Input.is_action_pressed("player_2_down")
	#is_wall_slide = Input.is_action_pressed("player_1_wall_slide") if not is_player_2 else Input.is_action_pressed("player_1_wall_slide")
	
	velocity.y += gravity
	
	move_and_slide()
	
