extends Node2D
#class_name Healing_potion
onready var player = global_tool.get_player()

func what_to_do():
	global_tool.get_player().health += 10
#	player.health+=10
	
	
