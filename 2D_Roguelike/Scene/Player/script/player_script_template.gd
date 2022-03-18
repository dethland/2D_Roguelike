extends Node2D

var is_able : bool = false
var gravity_velocity = Vector2.ZERO

var statemachine : Node2D
var player : KinematicBody2D
var animator : AnimationPlayer
var ground_detect : Area2D

var is_on_ground : bool = false

func _ready():
	statemachine = get_parent()
	player = get_parent().get_parent()
	animator = player.get_node("AnimationPlayer");
	ground_detect = player.get_node("Detection/Area2D")
	ground_detect.connect("body_entered", self, "ground_body_in")
	ground_detect.connect("body_exited", self, "ground_body_out")
	
func ground_body_in(body):
	if not body is KinematicBody2D:
		print(body)
		is_on_ground = true
	
func ground_body_out(body):
	if not body is KinematicBody2D:
		is_on_ground = false
	
	

func turn_on() -> void:
	# turn on the state script
	is_able = true
	
func turn_off() -> void:
	# turn off the state script
	is_able = false
	
func get_horizental_input() -> int:
	# get horizental input return 1, -1 or 0
	var direction : int = 0
	
	if Input.is_action_pressed("ui_right"):
		direction += 1
	if Input.is_action_pressed("ui_left"):
		direction -= 1
		
	return direction

func apply_gravity(gravity, delta_value) -> void:
	if not is_on_ground:
#		print(gravity_velocity)
		gravity_velocity.y -= gravity * delta_value
	else:
		gravity_velocity.y = 0
	player.move_and_slide(gravity_velocity, Vector2.UP)
	
func reset_gravity() -> void:
	gravity_velocity = Vector2.ZERO
