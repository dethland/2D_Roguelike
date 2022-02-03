extends Node2D

var is_able : bool = false

var statemachine : Node2D
var player : KinematicBody2D

func _ready():
	statemachine = get_parent()
	player = get_parent().get_parent()

func turn_on() -> void:
	# turn on the state script
	is_able = true
	
func turn_off() -> void:
	# turn off the state script
	is_able = false
