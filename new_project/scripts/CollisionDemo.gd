extends Node2D

# 预加载球体场景
@export var ball_scene: PackedScene

func _ready():
	# 如果没有手动设置ball_scene，尝试加载默认场景
	if ball_scene == null:
		ball_scene = preload("res://Ball.tscn")

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			# 创建新球体实例
			var new_ball = ball_scene.instantiate()
			add_child(new_ball)
			
			# 设置球体位置为鼠标点击位置
			new_ball.global_position = get_global_mouse_position()
			
			# 接受输入事件，防止继续传播
			get_viewport().set_input_as_handled()