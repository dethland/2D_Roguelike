extends "res://Scene/Player/script/player_script_template.gd"

func turn_on()->void:
	.turn_on()
	animator.play("hurt");


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "hurt":
		statemachine.change_state_to("Idle");
