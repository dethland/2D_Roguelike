tool
extends Area2D

export var hitbox : PoolVector2Array

var count = 0

var mouse = InputEventMouseButton.new()

func _process(delta):
	
	if Engine.editor_hint:
		if count == 0:
			mouse.button_index = 1
			InputMap.add_action("mouse_left_click")
			count += 1
		InputMap.action_add_event("mouse_left_click", mouse)
		
		if Input.is_action_just_released("mouse_left_click"):
			print('ha')
			hitbox.append(get_global_mouse_position())
			print(hitbox)
		

