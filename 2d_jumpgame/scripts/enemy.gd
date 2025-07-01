class_name Enemy extends CharacterBody2D

var gravity : float = 9.8

@export var speed : float
@export var direction : int :
	set(v):
		direction = v
		if direction == -1:
			rotation = 0
			scale = Vector2(-1.0,1.0)
		elif direction == 1:
			rotation = 0
			scale = Vector2(1.0,1.0)


func _physics_process(delta: float) -> void:
	velocity.y += gravity
	move_and_slide()
