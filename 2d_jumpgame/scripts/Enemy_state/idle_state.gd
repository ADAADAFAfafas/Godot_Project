extends State
@onready var enemy: Enemy = $"../.."
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


func enter():
	print("敌人进入待机状态")
	animation_player.play("idle")
	get_tree().create_timer(2.0).timeout.connect(
		func():
			switch_state.emit("RoamState")
	)
func update(_delta : float):
	pass
		
func physice_update(_delta : float): 
	pass
	
func exit(): 
	pass
