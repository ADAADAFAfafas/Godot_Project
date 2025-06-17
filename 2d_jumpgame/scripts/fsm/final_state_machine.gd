class_name FSM extends Node

@export var init_state : State
var states : Dictionary = {}
var current_state : State
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_upper()] = child
			child.switch_state.connect(_on_state_switch)
	if init_state:
		init_state.enter()
	current_state = init_state

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if current_state:
		current_state.update(_delta)
	
func _physics_process(_delta: float) -> void:
	if current_state:
		current_state.physice_update(_delta)



func _on_state_switch(state_name : String) -> void:
	if current_state.name == state_name:
		return
	var new_state : State = states[state_name.to_upper()]
		
	if current_state:
		current_state.exit()
	new_state.enter()	
	current_state = new_state
	
