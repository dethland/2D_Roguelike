extends "res://Scene/Player/script/player_script_template.gd"


func _physics_process(delta):
	$Anim.visible = is_able; # only play idle anim if idling (pozdnm)
	if is_able:
		$Anim.play();
		if get_horizental_input() != 0:
			statemachine.change_state_to("Run")
		if Input.is_action_just_pressed("ui_up"):
			statemachine.change_state_to("Jump")
		if Input.is_action_just_pressed("skill_use"):
			statemachine.change_state_to("ChargeSkill")
		
