extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
# 	pass
	
func _input(event):
	if Input.is_action_just_released("pause"):
		visible = !visible
		get_tree().paused = !get_tree().paused
