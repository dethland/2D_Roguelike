extends Node

func get_player():
	if get_tree().get_nodes_in_group("Player")[0]:
		return get_tree().get_nodes_in_group("Player")[0]
	else:
		return null
	

