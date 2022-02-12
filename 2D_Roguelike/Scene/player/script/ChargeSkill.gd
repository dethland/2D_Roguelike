extends "res://Scene/player/script/player_script_template.gd"

func turn_on() -> void:
	.turn_on(); # fires the player_script_template's turn on function (pozdnm)
	animator.play("skill_charge");

func turn_off() -> void:
	.turn_off();

func _physics_process(delta):
	if is_able:
		if Input.is_action_just_released("skill_use"):
			player.get_node("AnimationPlayer").play("skill_use");


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "skill_use":
		print("ha")
		statemachine.change_state_to("Idle");
