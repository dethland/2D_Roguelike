extends Node2D

export (Array) var storage
onready var max_cu = 6
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if storage.size() != 0 :
		print(storage.size())
		var item_sc = storage.pop_front()
		print(storage.size())
		var r:String = search_slot(item_sc.instance().item_name)
		print("1,"+r)
		if r != "" :
			var slot = get_node("NinePatchRect" + "/"+r)
			#slot.add_in()
			#slot.container[1] +=1
			slot.update_c1_add_one() 
		else :
			r = search_empty_slot()
			print("2,"+r)
			var slot = get_node("NinePatchRect" + "/"+r)
			print_all_slot()
			slot.add_in(item_sc,1) 
			#= item_sc
			#slot.container[1] = 1 
			print_all_slot()
	pass

func search_slot( name)-> String:
	var x: int = 1
	var result: String = ""
	while x <= max_cu:
		var slot_no :String = "slot"+String(x)
		var slot = get_node("NinePatchRect" + "/"+slot_no)
		if slot.get_name() == name :
			result = slot_no
			return result
		x = x +1
	return ""
	
func search_empty_slot()->String:
	var x: int = 1
	var result: String = ""
	while x <= max_cu:
		var slot_no :String = "slot"+String(x)
		var slot = get_node("NinePatchRect" + "/"+slot_no)
		if slot.is_empty() == true :
			result = slot_no
			return result
		x = x +1
	return ""
	
func print_all_slot():
	var x: int = 1
	while x <= max_cu:
		var slot_no :String = "slot"+String(x)
		var slot = get_node("NinePatchRect" + "/"+slot_no)
		print(slot.container)
		x+=1
	
func _input(event):
	if Input.is_key_pressed(KEY_B):
		visible = !visible
		
		
		
		
		
		
		
