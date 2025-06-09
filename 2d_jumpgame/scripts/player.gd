class_name Player extends CharacterBody2D

@export var Speed : float
var direction : float

func _physics_process(delta: float) -> void:
	velocity.y += 98
	move_and_slide()
