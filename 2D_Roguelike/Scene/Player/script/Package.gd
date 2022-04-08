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
		var item_sc = storage.pop_front()	
		var r:String = search_slot(item_sc.instance().item_name)
		if r != "" :
			var slot = get_node("NinePatchRect" + "/"+r)
			slot.update_c1_add_one() 
		else :
			r = search_empty_slot()
			var slot = get_node("NinePatchRect" + "/"+r)
			slot.add_in(item_sc,1) 
	

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
		x+=1
	
func _input(event):
	if Input.is_key_pressed(KEY_B):
		visible = !visible
		
		
		
		
		
		
		
