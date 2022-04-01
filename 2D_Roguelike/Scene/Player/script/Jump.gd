extends "res://Scene/player/script/player_script_template.gd"

export var jump_height : float = 300
export var jump_time_to_peak : float = 0.5
export var jump_time_to_descent : float = 0.4
export var horizental_speed = 200

onready var jump_velocity : float = (2.0 * jump_height) / jump_time_to_peak
onready var jump_gravity : float = (-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)
onready var fall_gravity : float = (-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)

var fall_play_switch : bool = true

var leave_floor : bool = false

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

func _ready():
	statemachine.get_node("Run").fall_gravity = fall_gravity
	statemachine.get_node("Idle").fall_gravity = fall_gravity

func turn_on():
	.turn_on();
	animator._play("jump")

func _physics_process(delta):
	if is_able:
		direction = get_horizental_input()
		velocity.x = direction * horizental_speed

		# get jump input and make sure player is not in the air
		if Input.is_action_just_pressed("ui_up") and not leave_floor:
			velocity.y = -jump_velocity
			leave_floor = true

		# player is in the air
		elif not player.is_on_floor():
			# go up with jump_gravity
			if velocity.y < 0:
				velocity.y -= jump_gravity * delta

			# go donw with fall_gravity
			elif velocity.y >= 0:
				# fall or land animation detection
				if $LandDetector.is_colliding():
					animator._play("land")
				else:
					animator._play("fall")
				velocity.y -= fall_gravity * delta

		# reset the leave_floor, velocity, and states when player landed
		elif player.is_on_floor() and leave_floor:
			leave_floor = false
			velocity.y = 0

		player.move_and_slide(velocity, Vector2.UP)


func _on_AnimationPlayer_animation_finished(anim_name):
	if (anim_name == "land"):
		leave_floor = false
		velocity.y = 0
		statemachine.change_state_to("Idle")
