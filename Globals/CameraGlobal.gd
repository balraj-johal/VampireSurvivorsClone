extends Node


func get_game_camera():
	var camera = get_tree().get_nodes_in_group("camera")[0]
	if (!camera):
		push_error("No camera node found.")

	
func get_game_camera_shake():
	var camera = get_tree().get_nodes_in_group("camera")[0]
	if (!camera):
		push_error("No camera node found.")
	return camera.get_node("Shake")
