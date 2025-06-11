class_name PlayerCamera extends Camera2D

var players : Array
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	players = get_tree().get_nodes_in_group("Player")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for player in players:
		if player is not Player:
			players.erase(player)
	if players.size() == 1:
		global_position = players[0].global_position
	elif players.size() == 2:
		global_position = (players[0].global_position + players[1].global_position) / 2
		
	if players[0].global_position.distance_to(players[1].global_position) > 300:
		zoom = lerp(zoom , Vector2.ONE * 2.5 , 0.05)
	else:
		zoom = lerp(zoom , Vector2.ONE * 4 , 0.05)
