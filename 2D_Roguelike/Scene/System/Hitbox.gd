extends Area2D

export var damage = 10
export(String, "Enemy", "Player") var target
export var is_able : bool = true


func _on_Hitbox_body_entered(body):
	if body.type == target:
		body.get_hit(self, damage)
