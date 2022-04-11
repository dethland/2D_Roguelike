extends "res://Scene/Player/script/player_script_template.gd"

func turn_on()->void:
	.turn_on()
	animator._play("hurt");


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "hurt":
		statemachine.change_state_to("Idle");

func play_hurt_sound():
	var rng = RandomNumberGenerator.new();
	rng.randomize();
	if ($HurtSound.playing): $HurtSound.stop();
	$HurtSound.pitch_scale = rng.randf_range(0.5,1.5);
	$HurtSound.play();

func hurt():
	pass
