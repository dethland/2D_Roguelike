extends "res://Scene/player/script/player_script_template.gd"

var fall_gravity : float

func turn_on()->void:
	.turn_on()
	animator._play("idle");

func _physics_process(delta):
	# make the player face the correct direction (pozdnm)
	face_direction();

	if is_able:
		if get_horizental_input() != 0:
			statemachine.change_state_to("Run")
		if Input.is_action_just_pressed("ui_up"):
			statemachine.change_state_to("Jump")
			reset_gravity()
		if Input.is_action_just_pressed("skill_use"):
			statemachine.change_state_to("ChargeSkill")
		if Input.is_action_just_pressed("melee"):
			statemachine.change_state_to("Attack")
		if Input.is_action_just_pressed("parry"):
			if statemachine.get_node("Parry").can_parry():
				statemachine.change_state_to("Parry")
			
		apply_gravity(fall_gravity, delta)
			
#		if not player.is_on_floor():
#			statemachine.change_state_to("Jump")
#			statemachine.get_node("Jump").leave_floor = true
			
		player.move_and_slide(Vector2.ZERO, Vector2.UP)

var last_scale = Vector2.ONE

func face_direction():
	var dir = get_horizental_input();
	if (dir < 0): 	 last_scale = Vector2(-1,1);
	elif (dir > 0):  last_scale = Vector2( 1,1);
	player.scale = last_scale
	# undo the artifacts of scaling (pozdnm)
	player.global_rotation = 0;
