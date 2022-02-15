extends Area2D

onready var anim_player:AnimationPlayer = get_node("AnimationPlayer")
export var Item_name :String
var Is_item = true 
func What_to_do() -> void :
	pass
func _on_body_entered(body) -> void:
	anim_player.play("fade_away")
	What_to_do()
