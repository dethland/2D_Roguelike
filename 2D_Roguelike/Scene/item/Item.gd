extends Area2D


export var item_name : String
export var item_path:  String   # to find child node(healing_potion)
export var item_fun_path:String # to find what to do function
onready var anim_player:AnimationPlayer = get_node("AnimationPlayer")
var Is_item = true 
func What_to_do() -> void :
	pass
func _on_body_entered(body) -> void:
	anim_player.play("fade_away")
	What_to_do()
	print("111")
