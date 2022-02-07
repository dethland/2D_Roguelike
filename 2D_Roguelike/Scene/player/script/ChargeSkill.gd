extends "res://Scene/Player/script/player_script_template.gd"

func turn_on() -> void:
	.turn_on(); # fires the player_script_template's turn on function (pozdnm)
	$Anim.visible = true;
	$Anim.play("charging");

func turn_off() -> void:
	.turn_off();
	$Anim.visible = false;

func _physics_process(delta):
	if is_able:
		if Input.is_action_just_released("skill_use"):
			$Anim.visible = true;	# sanity check to make sure it is visible (pozdnm)
			$Anim.play("use");


func _on_Anim_animation_finished():
	if $Anim.animation == "use":
		statemachine.change_state_to("Idle");
		$Anim.visible = false;
