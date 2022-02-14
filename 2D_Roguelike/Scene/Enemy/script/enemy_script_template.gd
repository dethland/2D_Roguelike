extends Node2D

var is_able : bool = false

var statemachine : Node2D
var enemy : KinematicBody2D
var left_edge_detection : RayCast2D
var right_edge_detection : RayCast2D

var gravity_velocity = Vector2.ZERO

func _ready():
	statemachine = get_parent()
	enemy = get_parent().get_parent()
	left_edge_detection = enemy.get_node("Detection/RayCast2DLeft")
	right_edge_detection = enemy.get_node("Detection/RayCast2DRIght")

func turn_on() -> void:
	# turn on the state script
	is_able = true
	
func turn_off() -> void:
	# turn off the state script
	is_able = false
	
func apply_gravity(gravity, delta_value) -> void:
	if not enemy.is_on_floor():
		gravity_velocity.y -= gravity * delta_value
		enemy.move_and_slide(gravity_velocity, Vector2.UP)
	else:
		gravity_velocity.y = 0


