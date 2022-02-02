extends Node

func get_player():
	return get_tree().get_nodes_in_group("Player")[0]
	

