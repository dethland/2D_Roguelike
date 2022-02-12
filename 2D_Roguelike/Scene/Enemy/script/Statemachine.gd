extends Node2D


func _ready():
	turn_off_all()
	change_state_to("Idle")


func turn_off_all() -> void:
	# trun off all state
	for child in get_children():
		if not child.get("is_able") == null:
			child.is_able = false

func show_active_state() -> String:
	# return the name of active state
	var string_value : String
	for child in get_children():
		if not child.get("is_able") == null:
			if child.is_able:
				string_value = child.name
	return string_value


func change_state_to(state_name) -> void:
	# change the active state to 
	turn_off_all()
	for child in get_children():
		if child.name == state_name:
			child.turn_on()
			
