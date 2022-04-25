extends GridContainer


func switch_slot(slot_a, slot_b):
	var tmp_container = [null,0]
	var tmp_text = null
	var slot_A = get_node(slot_a)
	var slot_B = get_node(slot_b)
	tmp_container = slot_A.container 
	slot_A.container = slot_B.container
	slot_B.container = tmp_container
	tmp_text = slot_A.get_node("TextureRect").texture
	slot_A.get_node("TextureRect").texture = slot_B.get_node("TextureRect")
	slot_B.get_node("TextureRect").texture = tmp_text


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
