extends RigidBody2D

func _ready():
	# 随机颜色
	var random_color = Color(randf(), randf(), randf())
	$BallSprite.modulate = random_color
	
	# 设置圆形碰撞形状
	var shape = CircleShape2D.new()
	shape.radius = 20
	$BallCollision.shape = shape
	
	# 启用碰撞检测
	contact_monitor = true
	max_contacts_reported = 1
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	print("Ball collided with: ", body.name)
