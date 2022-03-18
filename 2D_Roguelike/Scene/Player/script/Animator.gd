extends AnimationPlayer

onready var group = null;
var last_animation : String
var second_last_animation : String

func _ready():
	pass
	
func get_group():
	if (group != null): return
	for child in get_parent().get_children():
		if (child.name == "AnimGroup"):
			group = child

func hide_all():
	# hide all only if there one child is visible
	var visible_count : int
	for child in group.get_children():
		if child.visible == true:
			visible_count += 1
	
	if visible_count > 0:
		for child in group.get_children():
			child.visible = false


func hide_all_except(name:String):
	for child in group.get_children():
		# everything that is not requested name is set to invisible (pozdnm)
		child.visible = child.name == name

func _play(name:String):
	get_group()
	hide_all()
	.play(name);
	second_last_animation = last_animation
	last_animation = name
	
	

	

