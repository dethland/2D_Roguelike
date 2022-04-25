extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var no: String
var container = [null,0] 

onready var package = get_parent().get_parent()
onready var texturerect = get_node("TextureRect")



func _physics_process(delta):
	if container[0] != null :
		container[0].instance()._ready()
		texturerect.texture=load(container[0].instance().img_path)#???

		
func _input(event):	
	if Input.is_key_pressed(KEY_U) and container!=null:
		container.get_node(container.wtd_path).what_to_do()
		container.queue_free()
		container = null
		get_parent().texture= load("res://Asset/Image/slot.png");


func get_name() ->String:
	if container[0] !=null:
		return container[0].instance().item_name
	else:
		return ""

func get_num()->int:
	return container[1]
	
	
func is_empty()->bool:
	if container[0]==null and container[1] ==0:
		return true
	else:
		return false
		
func add_in(a,b):
	container[0] = a 
	container[1] = b
func update_c0(a):
	container[0] = a
func update_c1_add_one():
	container[1] += 1 


func _on_slot_mouse_entered():
	get_node("use").visible = true


func _on_slot_mouse_exited():
	get_node("use").visible = false

func get_drag_data(position):
	var data = {}
	data["original_slot_no"] = no
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = get_node("TextureRect").texture
	print(drag_texture.texture)
	drag_texture.rect_size = Vector2(100,100)
	set_drag_preview(drag_texture)
	return data
	
func can_drop_data(position, data):
	return true
	
func drop_data(position, data):
	#texture = data["original_texture"]
	get_parent().switch_slot(no,data["original_slot_no"] )
	get_parent().get_parent().print_all_slot()



