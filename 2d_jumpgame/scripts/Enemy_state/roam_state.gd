extends State
@onready var enemy: Enemy = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


func enter():
	print("敌人进入游荡状态")
	animation_player.play("walk")
	var range_int : int = randi_range(0 , 100)
	enemy.direction = -1 if range_int <= 50 else 1
	get_tree().create_timer(2.0).timeout.connect(
		func():
			switch_state.emit("IdleState")
	)
	
func update(_delta : float):
	if enemy.is_on_wall():
		enemy.direction = enemy.get_wall_normal().x
		
func physice_update(_delta : float): 
	enemy.velocity.x = enemy.direction * enemy.speed
	
func exit(): 
	enemy.velocity.x = 0
