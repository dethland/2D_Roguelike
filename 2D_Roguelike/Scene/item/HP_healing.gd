extends Node2D
#class_name Healing_potion
onready var player = global_tool.get_player()
func what_to_do():
	global_tool.get_player().health += 10
#	player.health+=10
	



#	var a = package.storage[0].item_name
#	package.storage[0].instance().get_node("HP_healing").what_to_do() # find what to do
#	print(package.storage[0].instance().item_name)    #!!!!!!find item name
	
	
