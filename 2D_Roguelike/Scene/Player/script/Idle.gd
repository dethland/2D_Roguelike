extends "res://Scene/Player/script/player_script_template.gd"


func _physics_process(delta):
	if is_able:
		if get_horizental_input() != 0:
			statemachine.change_state_to("Run")
		if Input.is_action_just_pressed("ui_up"):
			statemachine.change_state_to("Jump")
		
