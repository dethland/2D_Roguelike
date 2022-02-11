extends "res://Scene/Enemy/script/enemy_script_template.gd"

var detect : Area2D
var objs_in_area : Array
var wait_time = 10

func _ready():
  detect = get_parent().get_parent().get_node("attack_detection")
  attack()

func _process(delta):
  objs_in_area = detect.get_overlapping_bodies()

func attack():
  if objs_in_area.size() > 1 && is_able:
	  for obj in objs_in_area:
		  if obj.is_player:
			  obj.get_node("Statemachine").get_node("Hurt").hurt()
			print("hi")
  
  yield(get_tree().create_timer(wait_time), "timeout")
  attack()

