extends Node2D

var is_able : bool = false

var statemachine : Node2D
var player : KinematicBody2D
var animator : AnimationPlayer

func _ready():
	statemachine = get_parent()
	player = get_parent().get_parent()
	animator = player.get_node("AnimationPlayer");

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
