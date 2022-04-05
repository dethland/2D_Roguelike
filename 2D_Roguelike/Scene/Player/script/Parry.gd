extends "res://Scene/Player/script/player_script_template.gd"

var parry_success = false

var invincible = false

func _ready():
	pass

func turn_on():
	.turn_on();
	animator._play("parry");

func _physics_process(delta):
	if is_able:
		if animator.current_animation == "parry":
			var current_frame = get_parent().get_parent().get_node("AnimGroup").get_node("parry").get_frame()
			if (current_frame == 6):
				invincible = true
			else:
				invincible = false

func reset_to_idle():
	parry_success = false
	statemachine.change_state_to("Idle")

func success():
	parry_success = true
	reset_to_idle()

func _on_AnimationPlayer_animation_finished(anim_name):
	if (anim_name == "parry"):
		reset_to_idle()
