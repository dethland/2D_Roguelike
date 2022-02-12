extends Area2D

export var damage = 10
export(String, "Enemy", "Player") var target
export var is_able : bool = true

var in_range_object = []

func _on_Hitbox_body_entered(body):
	if body.get("mob_type") != null:
		if body.mob_type == target:
			in_range_object.append(body)
			print(in_range_object)
				
func _on_Hitbox_body_exited(body):
	if in_range_object.has(body):
		in_range_object.erase(body)
	
func _process(delta):
	pass
