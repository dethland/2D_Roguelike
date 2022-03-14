extends "res://Scene/Enemy/script/enemy_script_template.gd"

var detect : Area2D
var objs_in_area : Array

func _ready():
  detect = get_parent().get_parent().get_node("Battle_range")

func _process(delta):
	objs_in_area = detect.get_overlapping_bodies()
	if objs_in_area.size() > 1:
		for obj in objs_in_area:
			if obj.get("is_player"):
				not_able()
				yield(get_tree().create_timer(3.0), "timeout")
				print("enemy: attack")
				pass
	else:
		is_able()
