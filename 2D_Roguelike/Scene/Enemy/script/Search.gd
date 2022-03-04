extends "res://Scene/Enemy/script/enemy_script_template.gd"

var detect : Area2D
var objs_in_area : Array
var velocity = Vector2.ZERO
var speed = 70
var max_distance = 10

func _ready():
  detect = get_parent().get_parent().get_node("Search_range")

func _process(delta):
  objs_in_area = detect.get_overlapping_bodies()

func _physics_process(delta):
	if check_able():
		if objs_in_area.size() > 1:
			for obj in objs_in_area:
				if obj.get("is_player"):
					velocity = (obj.position-enemy.position).normalized() * speed
				else:
					velocity = Vector2.ZERO
	else:
		velocity = Vector2.ZERO
	
	velocity.y = 0
	velocity = enemy.move_and_slide(velocity, Vector2.UP)
	
