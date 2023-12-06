extends Node


func get_player() -> Node2D:
	var player = get_tree().get_nodes_in_group("player")[0]
	if (!player):
		push_error("No player node found.")
	return player

