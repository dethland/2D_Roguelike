extends Area2D

class_name Item
export var item_name : String
export var item_path:  String   # to find child node(healing_potion)
export var wtd_path:   String
export var img_path:   String
onready var anim_player:AnimationPlayer = get_node("AnimationPlayer")
onready var player = global_tool.get_player()
func _ready():
	get_node("UnknownItem").texture = load(img_path)
	
var Is_item = true 
	
func update_storage():
	var package =player.get_node("Package")
	var new_item = load(item_path)
	var new_in = new_item.instance()
	#new_in.get_node("CollisionShape2D").disabled=true
	package.storage.append(new_item)
	
func _on_body_entered(body) -> void:
	if body.get("mob_type") == "Player":
		update_storage()
		print(item_name)
		anim_player.play("fade_away")
	
		
		


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
