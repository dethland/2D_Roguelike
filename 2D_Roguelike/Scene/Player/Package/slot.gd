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
		texturerect.texture=container[0].instance().get_node("UnknownItem").texture#???

		
func _input(event):	
	if Input.is_key_pressed(KEY_U) and container!=null:
		print("!!")
		print(container.wtd_path)
		container.get_node(container.wtd_path).what_to_do()
		container.queue_free()
		container=null
		#get_parent().texture=container.get_node("UnknownItem").texture
		get_parent().texture= load("res://Asset/Image/slot.png");
		print("current health:")
		print(package.get_parent().health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

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
