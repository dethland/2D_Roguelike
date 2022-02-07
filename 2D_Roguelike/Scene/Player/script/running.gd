extends "res://Scene/Player/script/player_script_template.gd"

# How fast the player moves in meters per second.
export var speed = 14

var velocity = Vector2.ZERO
var last_scale = Vector2.ONE

func _physics_process(delta):
	$Anim.visible = is_able;
	if is_able:
		var direction = Vector2.ZERO

		direction.x = get_horizental_input()
		# should be replaced with changing scale.x the top root (Player) to -1 (pozdnm)
		if (direction.x < 0): 	 last_scale = Vector2(-1,1);
		elif (direction.x > 0):  last_scale = Vector2( 1,1);
		player.scale = last_scale
		# undo the artifacts of scaling (pozdnm)
		player.global_rotation = 0;
		
		
		velocity.x = direction.x * speed
		# gravity dont need for now 
		
		if Input.is_action_just_released("ui_left"):
			statemachine.change_state_to("Idle")
		if Input.is_action_just_released("ui_right"):
			statemachine.change_state_to("Idle")
		if Input.is_action_just_pressed("ui_up"):
			statemachine.change_state_to("Jump")
		if Input.is_action_just_pressed("skill_use"):
			statemachine.change_state_to("ChargeSkill")
		
		velocity = player.move_and_slide(velocity, Vector2.UP)
