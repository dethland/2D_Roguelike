extends "res://Scene/Player/script/player_script_template.gd"

# How fast the player moves in meters per second.
export var speed = 14

var velocity = Vector2.ZERO

func _physics_process(delta):
	var direction = Vector2.ZERO

	direction.x = get_horizental_input()

	velocity.x = direction.x * speed
	# gravity dont need for now 

	velocity = get_parent().get_parent().move_and_slide(velocity, Vector2.UP)
