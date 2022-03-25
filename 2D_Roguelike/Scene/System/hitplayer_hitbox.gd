extends Area2D

export var damage = 10
export var animation_name : String
export var is_able : bool = true

var in_range_object = []
var hit_once : bool = true
	

func hurt():
	for target in in_range_object:
		target.get_hit(self, damage)


func _process(delta):
	if is_able:
		if Input.is_action_just_released("ui_down"):
			hit_once = true
		if hit_once:
			hit_once = false
			hurt()


func _on_Area2D_body_entered(body):
	if body.get("mob_type") != null:
		in_range_object.append(body)



func _on_Area2D_body_exited(body):
	if in_range_object.has(body):
		in_range_object.erase(body)
