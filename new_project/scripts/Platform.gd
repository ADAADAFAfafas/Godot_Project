extends StaticBody2D

func _ready():
	# 设置平台为蓝色
	$PlatformSprite.modulate = Color(0.2, 0.4, 0.8)
	
	# 设置平台碰撞形状为矩形
	var shape = RectangleShape2D.new()
	shape.size = Vector2(400, 20)
	$PlatformCollision.shape = shape
