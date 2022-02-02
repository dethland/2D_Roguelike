extends Node2D

# How fast the player moves in meters per second.
export var speed = 14

var is_able = false

var velocity = Vector2.ZERO


func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1

	velocity.x = direction.x * speed
	# gravity dont need for now 
	if is_able:
		velocity = get_parent().get_parent().move_and_slide(velocity, Vector2.UP)
