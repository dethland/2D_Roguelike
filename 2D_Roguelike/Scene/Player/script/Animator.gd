extends AnimationPlayer

onready var group = null;

func _ready():
	pass
	
func get_group():
	if (group != null): return
	for child in get_parent().get_children():
		if (child.name == "AnimGroup"):
			group = child

func hide_all():
	for child in group.get_children():
		child.visible = false;

func hide_all_except(name:String):
	for child in group.get_children():
		# everything that is not requested name is set to invisible (pozdnm)
		child.visible = child.name == name

func _play(name:String):
	get_group()
	hide_all()
	.play(name);
	print(name)
	

