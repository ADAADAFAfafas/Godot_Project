extends Node2D


func _ready():
	#var arr = [1,2,3,4,5,6,7,8,9,10]
	#if Input.is_action_just_pressed("ui_accept"):
	var dict = {"oreo":1,"zhang":50,"long":51}
	print(dict["oreo"])
	for username in dict:		
		print(username + ": " + str(dict[username])) 
			#arr.append("rewdoakdoaw")
			#arr.remove_at(2)
			#
			#print(arr[2])
			#
			#for arrs in arr:
				#print(arrs)

func _on_button_pressed() -> void:
	pass # Replace with function body.
	print(123)
var health := 100:
	set(value):
		health
		
