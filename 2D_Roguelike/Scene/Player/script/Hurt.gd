extends "res://Scene/Player/script/Parry.gd"

func turn_on()->void:
	.turn_on()
	animator.play("hurt");


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "hurt":
		statemachine.change_state_to("Idle");


func hurt():
	var parry = test_parry()
	if parry:
		sucessful_parry()
	else:
		unsucessful_parry()
		print("ouch")

