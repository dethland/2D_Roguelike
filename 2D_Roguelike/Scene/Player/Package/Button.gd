extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var slot = get_parent().get_parent()
# Called when the node enters the scene tree for the first time.

	
func _on_Button_pressed():
	print("1111")
	var container =  slot.container
	if container[0]!=null:
		print(container[0].instance().wtd_path)
		container[0].instance().get_node(container[0].instance().wtd_path).what_to_do()
		slot.container[1]= slot.container[1]-1
		if slot.container[1] <= 0 :
			slot.container[0].instance().queue_free()
			slot.container[0]=null
			slot.container[1] =0
			get_parent().texture= load("res://Asset/Image/slot.png");
		#get_parent().texture=container.get_node("UnknownItem").texture
		


func _on_slot_mouse_entered():
	visible=true


func _on_slot_mouse_exited():
	visible=false
