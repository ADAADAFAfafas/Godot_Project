class_name Player extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var Speed : float
@export var direction : float:
	set(v):
		direction = v
		if last_direction != direction and direction != 0:
			last_direction = direction
@export var last_direction : float
@export var is_player_2: bool = false
func _physics_process(delta: float) -> void:
	velocity.y += 9.8
	velocity.x = direction * Speed
	move_and_slide()
	
func _process(delta: float) -> void:
	direction = Input.get_axis("player_1_left","player_1_right") if not is_player_2 else Input.get_axis("player_2_left","player_2_right")
	
	if velocity.x !=0:
		animation_player.play("run")
	elif  velocity.x == 0:
		animation_player.play("idle")
	
	if direction == -1:
		rotation = 0
		scale = Vector2(-1,1)
	elif direction == 1:
		rotation = 0
		scale = Vector2(1,1)
