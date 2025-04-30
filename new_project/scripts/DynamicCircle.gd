extends RigidBody2D

func _ready():
	# Connect collision signal
	contact_monitor = true
	max_contacts_reported = 1
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	print("Dynamic circle collided with: ", body.name)
	# Change color on collision
	$DynamicSprite.modulate = Color(randf(), randf(), randf())
