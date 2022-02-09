extends "res://Scene/player/script/player_script_template.gd"

export var jump_height : float = 300
export var jump_time_to_peak : float = 0.5
export var jump_time_to_descent : float = 0.4
export var horizental_speed = 200

onready var jump_velocity : float = (2.0 * jump_height) / jump_time_to_peak
onready var jump_gravity : float = (-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)
onready var fall_gravity : float = (-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)

var leave_groud : bool = false

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

func _ready():
	print(jump_velocity)
	print(jump_gravity)
	print(fall_gravity)

func _physics_process(delta):
	if is_able:
		direction = get_horizental_input()
		
		velocity.x = direction * horizental_speed
		if Input.is_action_just_pressed("ui_up") and not leave_groud:
			velocity.y = -jump_velocity
			animator.play("jump")
			leave_groud = true
			
		elif not player.is_on_floor():
			if velocity.y < 0:
				velocity.y -= jump_gravity * delta
			elif velocity.y >= 0:
				velocity.y -= fall_gravity * delta
			
		elif player.is_on_floor() and leave_groud:
			statemachine.change_state_to("Idle")
			leave_groud = false
			velocity.y = 0
			
		player.move_and_slide(velocity, Vector2.UP)
