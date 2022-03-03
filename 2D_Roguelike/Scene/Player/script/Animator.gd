extends AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func hide_all_except(name:String):
	for child in get_children():
		# everything that is not requested name is set to invisible (pozdnm)
		child.visible = child.name == name

func _play(name:String):
	hide_all_except(name)
	.play(name);
