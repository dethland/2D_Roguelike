extends KinematicBody2D

export var health = 100

var is_player = true

func get_hit(from_object, damage):
	if get_node("Statemachine").show_active_state() == "Parry":
		pass
	
	
