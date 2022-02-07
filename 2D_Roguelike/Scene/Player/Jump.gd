extends "res://Scene/player/script/player_script_template.gd"

export var max_height : float = 300
export var time_to_max_height : float = 2
export var gravity : float = 10

var initial_vertical_velocity = (max_height - time_to_max_height*time_to_max_height*gravity)/time_to_max_height

func turn_on()->void:
	.turn_on()
	animator.play("jump");

func _ready():
	print(initial_vertical_velocity)
