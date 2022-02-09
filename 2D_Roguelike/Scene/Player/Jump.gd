extends "res://Scene/player/script/player_script_template.gd"

export var max_height : float = 300
export var time_to_max_height : float = 2
export var gravity : float = 10
export var horizental_speed = 200

var leave_groud : bool = false

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

var initial_vertical_velocity = (max_height - time_to_max_height*time_to_max_height*gravity)/time_to_max_height

func turn_on()->void:
	.turn_on()
	animator.play("jump");

func _ready():
	print(initial_vertical_velocity)
	
func _physics_process(delta):
	if is_able:
		direction = get_horizental_input()
		
		velocity.x = direction * horizental_speed
		if Input.is_action_just_pressed("ui_up") and not leave_groud:
			velocity.y = -initial_vertical_velocity
			leave_groud = true
			
		elif not player.is_on_floor():
			velocity.y += gravity
			
		elif player.is_on_floor() and leave_groud:
			print('ha')
			statemachine.change_state_to("Idle")
			leave_groud = false
			velocity.y = 0
			
		player.move_and_slide(velocity, Vector2.UP)
