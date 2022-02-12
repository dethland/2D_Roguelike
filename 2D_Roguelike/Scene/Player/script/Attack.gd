extends "res://Scene/Player/script/player_script_template.gd"


func turn_on():
	.turn_on()
	animator.play("melee")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "melee":
		statemachine.change_state_to("Idle")
