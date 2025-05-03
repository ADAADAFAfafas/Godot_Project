extends CharacterBody2D

var input_dir
const tile_size = 16
var moving = false
var move_lastVector = 0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	input_dir = Vector2.ZERO
	
	if Input.is_action_pressed("ui_down"):
		input_dir = Vector2.DOWN
		move_lastVector = 0
		move()
	elif Input.is_action_pressed("ui_up"):
		input_dir = Vector2.UP
		move_lastVector = 1
		move()
	elif Input.is_action_pressed("ui_left"):
		input_dir = Vector2.LEFT
		move_lastVector = 2
		move()
	elif Input.is_action_pressed("ui_right"):
		input_dir = Vector2.RIGHT
		move_lastVector = 3
		move()
		
func move():
	if input_dir:
		if moving == false:
			moving = true
			var tween = create_tween()
			play_walk_animation()
			tween.tween_property(self, "position", position + input_dir*tile_size, 0.5)
			tween.tween_callback(move_false)
			
func move_false():
	moving = false
	play_idle_animation()
	
func play_walk_animation() -> void:
	match move_lastVector:
		0: animated_sprite.play("run_Down")
		1: animated_sprite.play("run_Up")
		2: animated_sprite.play("run_Left")
		3: animated_sprite.play("run_Right")

func play_idle_animation() -> void:
	match move_lastVector:
		0: animated_sprite.play("idle_Down")
		1: animated_sprite.play("idle_Up")
		2: animated_sprite.play("idle_Left")
		3: animated_sprite.play("idle_Right")
